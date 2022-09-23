<?php

namespace App\Http\Controllers;

use App\Models\Contact;
use Illuminate\Http\Request;

class UserController extends Controller
{
    public function index() {
    return view('profile');
    }

    public function insertContact(Request $request) {
        try {
            $contact = new Contact();

            $contact->message = $request->get('message');
            $contact->email = $request->get('email');
            if(session()->has('user')) {
                $contact->user_id = session()->get('user')->id;
            }
            $contact->save();
            return response()->json(['message' => 'Thank you for contact us'],200);
        } catch(\PDOException $exception) {
                return response()->json(['message' => 'User could not be deleted'],403);
            //return $exception;
        }
    }
}
