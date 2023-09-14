<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Card;
use App\Models\User;
use App\Models\PhoneNumber;
use App\Models\Link;
use Auth;
use Illuminate\Support\Facades\Validator;
use App\Http\Resources\CardR;
use App\Http\Controllers\Api\LinkController;
use App\Http\Controllers\Api\PhoneNumberController;


class CardController extends Controller
{
    public function update(Request $request)
    {
        if(Auth::check()){

            $validator = Validator::make($request->all(), [
                'profile_image' => 'nullable|image|max:5120',
                'displayname' => 'nullable|string|max:20',
                'job_title' => 'nullable|string|max:100',
                'about' => 'nullable|string|max:255',
                //'email' => 'required|string|email|max:35',
                'address' => 'nullable|string|max:255',
                'phone_num1' => 'nullable|string|max:255',
                'phone_num2' => 'nullable|string|max:255',
                'linkedin' => 'nullable|string|max:255',
                'instagram' => 'nullable|string|max:255',
                'github' => 'nullable|string|max:255',
                'facebook' => 'nullable|string|max:255',
                'template_id'=>'nullable|numeric|digits:1',
                'email' => 'nullable|email|string|max:35'//|unique:cards,card_email'

            ]);
            if ($validator->fails()) {
                return response()->json($validator->errors(), 422);
            }

            $email_card_check = Card::where('card_email','=',$request['email'])->get();
             foreach($email_card_check as $card_to_check){
                 if($card_to_check->user->id != auth()->user()->id){
                    return response()->json(['error' => 'This email is used by a different user.'],301);
                 }
             }


            $email_security_check = User::where('email','=',$request['email'])->first();
            if($email_security_check && $email_security_check->id != auth()->user()->id){
                return response()->json([
                    'error' => 'This email is registerd to another user, if you think this is a mistake please contact support.']
                    ,301);
            }



            $user = auth()->user();
            $card = $user->card;
            if ($request->hasFile('profile_image')) {
                if (!file_exists(public_path('uploaded_images'))) {
                    mkdir(public_path('uploaded_images'), 0700, true);
                }
                $file = $request->file('profile_image');
                $fileName = time() . '_' . $file->getClientOriginalName();
                $file->move('uploaded_images', $fileName);
            }

            $card->profile_image = isset($fileName) ? url('/') . '/uploaded_images/' . $fileName : null;
            $card->save();
            $card->update([
                //'profile_image' => url('/').'/uploaded_images/'.$fileName,
                'displayname' => $request['displayname']??$user->card->displayname,
                'job_title' => $request['job_title']??$user->card->job_title,
                'about' => $request['about']??$user->card->about,
                'address' => $request['address'],
                'card_email' => $request['email']??$user->card->card_email,
                'template_id' => $request['template_id']??$user->card->template_id,

            ]);

            $ph = [$request['phone_num1'], $request['phone_num2']];

            $phonetoedit=PhoneNumber::where('card_id','=',$card->id)->get();
            $i=0;
            foreach($phonetoedit as $phonetodelete){
                $phonetodelete->delete();
            }
            foreach($ph as $phonetoadd){
                if($phonetoadd){
                    PhoneNumberController::add($card->id,$phonetoadd);
                }
                else{
                    PhoneNumberController::add($card->id,"");

                }
            }

            $links =  [$request['facebook'], $request['instagram'], $request['linkedin'], $request['github']];

            $linktoedit=Link::where('card_id','=',$card->id)->get();
            $i=0;

            foreach($linktoedit as $linktodelete){
                    $linktodelete->delete();
            }
            foreach($links as $linktoadd){
                if($linktoadd)
                    LinkController::add($card->id, $linktoadd);
                else{
                    LinkController::add($card->id, "");
                }
            }


            return response()->json([
                'message' => 'The card has been saved successfully',
                'card' => new CardR($card),

            ], 200);
        }
        else
        {
            return response()->json([
                "message" => "log in to continue."
            ],301);
        }
    }

    public function getCard(int $id){

        $card = Card::findOrFail($id);

        //$card = [$card, $card->user->email, $card->phonenumbers[0]->number, $card->phonenumbers[1]->number];
        if($card){
            $gg = new CardR($card);
            return response()->json(['card'=>$gg]);
        }else{
            return response()->json([
                'message'=>'You don\'t have a card',
                'card'=>null]);
        }
        //dd($gg);
    }
    public function onlyCard(){ //only card
        if(Auth::check()){
        $userId = auth()->user()->id;
        if($userId == null){
        return response()->json(['card'=>null]);

        }
        $card = Card::where('user_id','=',$userId)->get()->last();
        if($card){
            $data =new CardR($card);
            return response()->json(['card'=>$data]);
        }
            else{
                return response()->json([
                    'message'=>'You don\'t have a card',
                    'card'=>null]);
            }

        }else{
            return response()->json(['error'=>'login to continue']);}

        }
    }

