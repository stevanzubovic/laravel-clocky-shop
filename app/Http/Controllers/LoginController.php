<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;

class LoginController extends Controller
{
    public function index() {
        return view('login', $this->data);
    }

    public function logout() {
        session()->forget('user');
        return redirect()->route('home');
    }

    public function tryLogin(Request $request) {
        $username = $request->get('username');
        $password = $request->get('password');

        $user = User::all()->where('user_name', '=', $username)->first();

        if($user) {
            if (password_verify($password, $user->password)) {
                session()->put('user', $user);
                return redirect()->route('home');
            } else {
                return redirect()->route('login')->with('userOrPassError', 'Username or password incorrect');
            }
        }
        return redirect()->route('login')->with('userOrPassError', 'Username or password incorrect');
    }

}
