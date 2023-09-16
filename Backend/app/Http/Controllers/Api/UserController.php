<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\User;
use App\Models\Card;
use App\Models\EmailVerification;
use App\Models\PasswordReset;
use App\Http\Controllers\Api\PhoneNumberController;
use App\Http\Controllers\Api\LinkController;
use Illuminate\Support\Facades\Validator;
use Auth;
use App\Http\Controllers\MailController;
use Illuminate\Support\Facades\Hash;

class UserController extends Controller
{
    public function get_user_by_id($id = null)
    {
        if($id == 1)
            return null;
        return $id ? User::find($id) : null;
    }


    public function resetPass(Request $request)
    {
        $data = $request->all();
        $validator = Validator::make($data, [
            "email" => ['required', 'string', 'email', 'max:35']
        ]);
        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        }
        $user = User::where('email', '=', $data['email'])->first();
        if (!$user) {
            return response()->json(["error" => "User not found."], 404);
        }



        $code = PasswordReset::where('user_id', '=', $user['id'])->first();
        if (!$code) {
            $send_me_as_code = rand(10000, 99999);
            PasswordReset::create([
                'user_id' => $user->id,
                'email' => $user['email'],
                'code' => $send_me_as_code,
            ]);
        } else {
            $send_me_as_code = $code['code'];
        }



        //$code = rand(10000, 99999);
        $email = $user['email'];
        // PasswordReset::create([
        //     'email' => $email,
        //     'token' => $code,
        //     'user_id' => $user->id
        // ]);
        $x = new MailController();
        $x->send_password_reset_code($send_me_as_code, $email);
        return response()->json('Check your email for the password reset code.');
    }

    public function changePassword(Request $req)
    {#fix33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333


        $validator = Validator::make($req->only(['email', 'code']), [
            'email' => 'required|email',
            'code' => 'required|numeric|digits:5',]);

        if ($validator->fails()) return response()->json($validator->errors(), 422);
        $validated_info = $validator->validated();
        $password_reset = PasswordReset::where('email','=' ,$validated_info['email'])->first();

        if (!$password_reset) return response()->json(["error" => "Internal server error, contact support."],500);
        if($password_reset->token != $validated_info['code']){
                // return response()->json(["message" =>"The reset code is correct"], 200);
            return response()->json(["error" =>"The reset code is incorrect"], 422);

        }
        else{
            response()->json(["message" =>"The reset code is correct, Please pick a new password: "], 200)->send();
        }

        $data = $req->only(['email', 'new_password', 'new_password_confirmation']);
        $validator = Validator::make($data, [
            #'email' => 'required|email',
            #'code' => 'required|numeric',
            'new_password' => 'required|string|confirmed|min:8',
            'new_password_confirmation' => 'required|string|min:8|same:new_password',
        ]);
        if ($validator->fails()) return response()->json($validator->errors(), 422);

        $user = User::where('email', $data['email'])->first();
        if (!$user) return response()->json(["error" => "User not found"],404);

        $user->password = Hash::make($data['new_password']);
        $user->save();
        PasswordReset::where('email', $user->email)->delete();
        return response()->json(["message" => "Password has been changed successfully"], 200);
    }

    public function resend_code(Request $req)
    {
        $data = $req->all();
        $validator = Validator::make($data, [
            "email" => "string|required|max:35|email",
        ]);
        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        }
        $user = User::where('email', '=', $data['email'])->first();
        if (!$user) {
            return response()->json(["error" => "User not found"], 404);
        }
        if ($user['verified'] == 1) {
            return response()->json(["message" => "User is already verified."], 200);
        }
        $code = EmailVerification::where('user_id', '=', $user['id'])->first();
        if (!$code) {
            $send_me_as_code = rand(10000, 99999);
            EmailVerification::create([
                'user_id' => $user->id,
                'code' => $send_me_as_code,
            ]);
        } else {
            $send_me_as_code = $code['code'];
        }
        $x = new MailController();
        $x->sendcode($send_me_as_code, $user->email);
        return response()->json(["message" => "Success"], 200);
    }
    public function getUser(int $id){
        $user = User::findOrFail($id);
        $user = $user->with('card')->get();
        return response()->json(['user'=>$user]);
    }
    public function create_card(Request $req)
    {
        if (Auth::check()) {
            $validator = Validator::make($req->all(), [
                'profile_image' => 'image|max:5120',
                'displayname' => 'required|string|max:20',
                'job_title' => 'required|string|max:100',
                'about' => 'required|string|max:255',
                'address' => 'nullable|string|max:255',
                'phone_num1' => 'required|string|max:255',
                'phone_num2' => 'nullable|string|max:255',
                'linkedin' => 'nullable|string|max:255',
                'instagram' => 'nullable|string|max:255',
                'github' => 'nullable|string|max:255',
                'facebook' => 'nullable|string|max:255',
                'template_id' => 'required|numeric|digits:1',
                'card_email' => 'required|email|string|max:35|unique:cards,card_email'
// card email updated
            ]);
            $userEmail = auth()->user()->email;
            if ($validator->fails()) {
                return response()->json($validator->errors(), 422);
            }

            //image
            $filename = "";
            if ($req->hasFile('profile_image')) {
                if (!file_exists(public_path('uploaded_images'))) {
                    mkdir(public_path('uploaded_images'), 0777, true);
                }
                $file = $req->file('profile_image');
                $fileName = time() . '_' . $file->getClientOriginalName();
                $file->move('uploaded_images', $fileName);
            }
            $email_checker = User::where('email', '=', $userEmail)->first();
            $user = Auth::user();
            if ($email_checker) {
                #email is in db
                #check owner
                if (!$user->email == $userEmail) {
                    return response()->json(["error" => "This email is owned by a different account."], 422);
                }
            }
            $id = $user['id'];
            if (Card::where('user_id', '=', $id)->count() > 0) {
                return response()->json(["error" => 'User can only have 1 card at a time.'], 300);
            }
            if(strlen($filename) > 237)
            {
                return response()->json([
                    'error' => 'file name too long'
                ], 400);
            }
            $email_security_check = User::where('email','=',$req['email'])->first();
            if($email_security_check && $email_security_check->id != auth()->user()->id()){
                return response()->json([
                    'error' => 'This email is registerd to another user, if you think this is a mistake please contact support.']
                    ,301);
            }
            $card = Card::create([
                'profile_image' => $filename!=""? url('/').'/uploaded_images/'.$filename:null,
                'displayname' => $req['displayname'],
                'job_title' => $req['job_title'],
                'about' => $req['about'],
                'address' => $req['address'],
                'user_id' => $id,
                'template_id' =>$req['template_id'],
                'card_email' =>$req['card_email'],
            ]);
            $id = $card['id'];
            $ph1 = $req['phone_num1'];
            $ph2 = $req['phone_num2'];
            $links = [$req['instagram'], $req['facebook'], $req['linkedin'], $req['github']];
            if ($ph2) {
                PhoneNumberController::add($id, $ph1, $ph2);
            } else {
                PhoneNumberController::add($id, $ph1);
            }
            foreach ($links as $link) {
                if ($link) {
                    LinkController::add($id, $link);
                }
            }
            return response()->json(["message" =>'card created'], 200);
        } else {
            return response()->json(["error" => "Please login to create a card"], 401);
        }
    }
}
