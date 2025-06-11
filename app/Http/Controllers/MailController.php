<?php

namespace App\Http\Controllers;

use App\Mail\ContactFormMail;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;

class MailController extends Controller
{
    public function sendContactFormEmail(){
        $toEmail = 'markchovava@gmail.com';
        $mailMessage = 'Testing if its working';
        $subject = 'RIVER RANGE FLORIST AND GIFT SHOP CONTACT FORM';

        $response = Mail::to($toEmail)->send(new ContactFormMail($mailMessage, $subject));

        dd($response);

    }
}
