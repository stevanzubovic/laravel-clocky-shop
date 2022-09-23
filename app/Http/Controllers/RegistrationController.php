<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
class RegistrationController extends Controller
{
    public function index() {
        return view('fixed.register', $this->data);
    }

    public function tryRegister(Request $request)
    {
        try {
            $password = $request->get('password');
            $userName = $request->get('username');
            $email = $request->get('email');
            $hashedPassword = password_hash($password, PASSWORD_DEFAULT);
            $RegErrors = [];

            if (User::all()->where('email', '=', $email)->first()) {
                $RegErrors['email'] = 'Given address already exists';
            }
            if (User::all()->where('user_name', '=', $userName)->first()) {
                $RegErrors['userName'] = 'Given user name already exists';
            }

            if (count($RegErrors)) {
                return redirect()->back()->with($RegErrors);
            }

            $user = new User();
            $user->user_name = $userName;
            $user->email = $email;
            $user->password = $hashedPassword;
            $user->roleId = 1;

            $success = $user->save();
            if ($success) {
                return redirect()->route('login');
            }
        } catch(\PDOException $exception) {
           return redirect()->route('error');
        }

        //TO DO
    }
}
