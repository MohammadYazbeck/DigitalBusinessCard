<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\Validator;
use Auth;


class DashboardController extends Controller
{
    public function index(){

        $users = User::where('role_id', '!=', 1)->paginate(5);


        return view('home', compact('users'));
    }

    public function update(Request $req, $id){


        $email = Validator::make($req->only('email'),
            ['email' => 'max:35|email|string|required']);
        $email = $email->validated();
        $user = User::where('email','=',$email)->first();

        if($user == null){
            $user = User::find($id);
            $validator = Validator::make($req->only(['first_name','last_name','email']),[
                'first_name' => 'required|string|max:20',
                'last_name' => 'required|string|max:20',
                'email' => 'max:35|email|string|unique:users,email'
            ]);
        }
        else{

            $validator = Validator::make($req->only(['first_name','last_name']),[
                'first_name' => 'required|string|max:20',
                'last_name' => 'required|string|max:20',
            ]);

        }
        if ($validator->fails()) {
            return back()->withErrors($validator->errors());
        }
        $data = $validator->validated();
        $user->update($data);

        return redirect()->back();

    }
    public function delete($id){

        $user=User::findOrFail($id);

        $user->delete();

        return redirect()->back();

    }



}
