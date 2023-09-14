<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class CardR extends JsonResource
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
            "id"=>$this->id,
            "profile_image" => $this->profile_image,
            "displayname" => $this->displayname,
            "job_title" => $this->job_title,
            "address" => $this->address,
            "about" => $this->about,
            "user_id" => 4,
            "card_email" => $this->card_email,
             //change this and other resource
            "phone_num1" => $this->phonenumbers[0]->number??null,
            "phone_num2" => $this->phonenumbers[1]->number??null,
            'facebook' => $this->links[0]->link??null,
            'instagram'=>$this->links[1]->link??null,
            'linkedin'=>$this->links[2]->link??null,
            'github'=>$this->links[3]->link??null,
            'template_id'=>$this->template_id

        ];
    }
}
