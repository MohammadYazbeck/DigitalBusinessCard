<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use App\Models\User;
use Illuminate\Support\Facades\Validator;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Auth;
use App\Http\Controllers\MailController;
use App\Models\Card;
use App\Models\EmailVerification;
use App\Http\Resources\CardR;
class AuthController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth:api', ['except' => ['login', 'register']]);
    }

    public function login(Request $request)
    {
        if (!Auth::check()) {
            $validator = Validator::make($request->all(), [
                'email' => 'required|string|email|max:35',
                'password' => 'required|string|min:8',
            ]);
            if ($validator->fails()) {
                return response()->json($validator->errors(), 422);
            }
            if (!$token = auth()->attempt($validator->validated())) {
                return response()->json(['error' => 'Unauthorized'], 401);
            }
            $x = new EmailVerificationController();
            if (!$x->check($request->email)) {
                return response()->json(['error' => 'Email is not verified'], 300);
            };
            $token =['token'=> Auth::attempt($request->except('_token'))];
            $card = Card::where('user_id', auth()->user()->id)->first();
            if($card){
                $data = new CardR($card);
                $data = [
                    'authorization' => $token,
                    'user' => Auth::user(),
                    'card' => $data,
                ];
            }
            else{
                $data = [
                    'authorization' => $token,
                    'user' => Auth::user(),
                ];
            }
            if ($data['user']['role_id'] == 1) {
                Auth::logout();
                return response()->json(["error" => "Login not allowed"], 401);
            }
            return response()->json($data);
        } else {
            return response()->json(["error" => "You're already logged in."],300);
        }
    }


    public function register(Request $req)
    {
        $data = $req->all();
        $validator = Validator::make($data, [
            'first_name' => ['required', 'string', 'max:20'],
            'last_name' => ['required', 'string', 'max:20'],
            'email' => ['required', 'string', 'email', 'max:35', 'unique:users'],
            'password' => ['required', 'string', 'min:8', 'confirmed'],
            'password_confirmation' => ['required_with:password', 'string', 'min:8', 'same:password'],
        ]);
        $errors = $validator->errors()->get('email');
        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        }
        $user = User::create([
            'first_name' => $req['first_name'],
            'last_name' => $req['last_name'],
            'email' => $req['email'],
            'password' => Hash::make($req['password']),
            'role_id' => 2,
        ]);
        $code = rand(10000, 99999);
        EmailVerification::create([
            'user_id' => $user->id,
            'code' => $code,
        ]);
        $x = new MailController();
        $x->sendcode($code, $user->email);

        return response()->json([
            'status' => 'success',
            'message' => 'User created successfully, Please check your email for the verification code.',
            'user' => $user,

        ], 200);
    }

    public function logout()
    {
        Auth::logout();
        return response()->json([
            'status' => 'success',
            'message' => 'Successfully logged out',
        ], 200);
    }

    public function refresh()
    {
        return response()->json([
            'status' => 'success',
            'user' => Auth::user(),
            'authorization' => [
                'token' => Auth::refresh(),
                'type' => 'bearer',
            ]
        ], 200);
    }
}
