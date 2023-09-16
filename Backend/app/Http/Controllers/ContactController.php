<?php

namespace App\Http\Controllers;

use App\Models\Contact;
use App\Models\Card;

use App\Models\User;
use Illuminate\Http\Request;
use Auth;
use Illuminate\Support\Facades\Validator;
use App\Http\Resources\ContactsResource;

class ContactController extends Controller
{
    public function contacts_list()
    {
        if(Auth::check())
        {
            $userId = auth()->user()->id;
           // dd($userId);
            $contacts = User::mycontactshelper(Auth::User());
            $data =  ContactsResource::collection($contacts);
            // return $data;
            return response()->json([
                'message' => 'success',
                'data' => $data,
            ], 200);
        }else{
            return response()->json(["error" => "Please login to continue"], 401);
        }
    }

    public function add_contact($card_id=null)
    {
        if(Auth::check())
        {
            $validator1 = Validator::make(['id' => $card_id], [
                'id' => 'required',
                ]);
            if ($validator1->fails()) {
                return response()->json($validator1->errors(), 422);
            }

            $contact_id =Card::findOrFail($card_id)->user_id;
            if($contact_id == null)
            {
                return response()->json(['error' => 'id is required'], 400);
            }
            $validator = Validator::make(['id' => $contact_id], [
                'id' => 'required',
                ]);
            if ($validator->fails()) {
                return response()->json($validator->errors(), 422);
            }

            $user = User::find($contact_id);
            if ($user == null)
                return response()->json(['error' => 'there is no user with this id'], 400);

            if (auth()->id() == $contact_id)
                return response()->json(["error" => 'You can\'t add yourself'], 300);

            $contact = Contact::where(['contact_id' => $contact_id, 'user_id' => auth()->id()])->first();
            if ($contact != null)
                return response()->json(['error' => 'You already have this user in your contacts list'], 300);

            $contact = auth()->user()->contacts()->attach($contact_id);

            return response()->json([
                'message' => 'added successfully',

            ], 200);
        }
        else{
            return response()->json(["error" => "Please login to continue"], 401);
        }
    }

    public function destroy($contact_id)
    {
        $contact = Contact::where(['contact_id' => $contact_id, 'user_id' => auth()->id()])->delete();
        return response()->json([
            'message' => 'contact has deleted successfully',
        ], 200);
    }
}
