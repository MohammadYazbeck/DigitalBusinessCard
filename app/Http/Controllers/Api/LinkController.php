<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Link;

class LinkController extends Controller
{
    public static function add(int $card_id, $link)
    {
        Link::create([
            'link' => $link,
            'card_id' => $card_id,
        ]);
    }
}
