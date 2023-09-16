<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Card;
use Illuminate\Http\Request;
use App\Models\EmailVerification;
use App\Models\User;
use Auth;
use Illuminate\Support\Facades\Validator;



class EmailVerificationController extends Controller
{
    public function check($email)
    {
        $user = User::where('email', '=', $email)->first();
        if ($user != null && $user->verified == 1) {
            return true;
        }
        return false;
    }

    public function verify(Request $request)
    {
        $data = $request->all();
        $validator = Validator::make($data, [
            "verification_code" => "required|numeric|digits:5",
            "email" => "required|string|email|max:35",
        ]);
        if ($validator->fails()) {
            return response()->json($validator->errors(), 400);
        }
        $request_code = $data['verification_code'];
        $user = User::where('email', '=', $data['email'])->first();
        if (!$user) {
            return response()->json(["error" => "user not found."], 404);
        }
        if ($user['verified'] == 1) {
            return response()->json(["message" => "already verified."], 200);
        }
        $correctcode = EmailVerification::where('user_id', '=', $user['id'])->first();
        if (!$correctcode) {
            return response()->json(["error" => "Error proccessing code, please request a new verification code."], 500);
        }
        if ($request_code == $correctcode['code']) {
            $user['verified'] = 1;
            $user->save();

            $token = Auth::login($user);
            EmailVerification::find($correctcode['id'])->delete();

            // Card::create([
            //     'user_id' => $user->id
            // ]);
            return response()->json(["meesage" => 'User verified',
                                     "user" => $user,
                                     'authorization' => [
                                        'token' => $token,
                                        'type' => 'bearer',
                                    ]], 200);
        } else {
            return response()->json(["error" => 'Internal server error.'], 500);

        }
    }
}
