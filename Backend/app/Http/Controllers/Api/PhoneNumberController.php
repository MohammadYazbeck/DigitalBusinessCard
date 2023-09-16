<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\PhoneNumber;

class PhoneNumberController extends Controller
{
    public static function add(int $card_id, $number1, $number2=null)
    {
        PhoneNumber::create([
            'number' => $number1,
            'card_id' => $card_id,
        ]);
        if($number2)
        {
            PhoneNumber::create([
                'number' => $number2,
                'card_id' => $card_id,
            ]);
        }
        return true;
    }
}
