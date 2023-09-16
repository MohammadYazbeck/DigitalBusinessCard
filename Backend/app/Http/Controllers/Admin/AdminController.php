<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Cookie;

class AdminController extends Controller
{
    public function __construct()
    {

    }

    public function logout(){

        if(Auth::guard('web')->check()){
            Auth::guard('web')->logout();
            return redirect('/login');
        }
    }

    public function login(Request $req)
    {

        if(! Auth::guard('web')->check()){

            $data = $req->all();


            $validator = Validator::make($data,[
                'email' => 'required|email|string|max:35',
                'password' => 'required|string|min:8',
            ]);

            if ($validator->fails()) {
                return back()->withErrors($validator->errors());
            }
            if (! Auth::guard('web')->attempt(['email' => $req->email, 'password' => $req->password], $req->get('remember'))) {
                return back()->withErrors(['email' =>'Unauthorized']);
            }


            $user = ['user' => Auth::guard('web')->user()];


            if($user['user']['role_id'] == null){
                Auth::guard('web')->logout();
                return back()->withErrors(['email' =>'Unauthorized']);
            }

            if($user['user']['role_id'] != 1 ){
                Auth::guard('web')->logout();
                return back()->withErrors(['email' =>'Unauthorized']);
            }


            return redirect('/dashboard');
        }
        else{
            return back()->withErrors(['email' =>'Already logged in']);
        }


    }
}
