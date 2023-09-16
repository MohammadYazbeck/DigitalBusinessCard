<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;
use App\Mail\SendCode;
use App\Mail\SendPasswordReset;

class MailController extends Controller
{
    public function sendcode($code, $email)
    {
        return Mail::to($email)->send(new SendCode($code)); #
    }

    public function send_password_reset_code($code, $email)
    {
        return Mail::to($email)->send(new SendPasswordReset($code)); #
    }
}
