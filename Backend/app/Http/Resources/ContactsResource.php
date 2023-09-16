<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;
use App\Models\Card;

class ContactsResource extends JsonResource
{

    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array|\Illuminate\Contracts\Support\Arrayable|\JsonSerializable
     */
    public function toArray($request)
    {

        return [
            'id'=>$this->id,
            'first_name'=>$this->first_name,
            'last_name'=>$this->lastName,
            'email'=>$this->card->card_email,
            "card"=>[
                'profile_image'=>$this->card->profile_image,
                "displayname"=> $this->card->displayname,
                "job_title"=> $this->card->job_title,
                "address"=> $this->card->address,
                "about"=> $this->card->about,
                "phone_num1"=>$this->card->phonenumbers[0]->number??null,
                "phone_num2"=>$this->card->phonenumbers[1]->number??null,
                "facebook"=>$this->card->links[0]->link??null,
                "instagram"=>$this->card->links[1]->link??null,
                "linkedin"=>$this->card->links[2]->link??null,
                "github"=>$this->card->links[3]->link??null,
                'template_id'=>$this->card->template_id



            ]
        ];
    }
}
