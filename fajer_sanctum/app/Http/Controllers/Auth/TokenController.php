<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Auth\AuthenticationException;
use Illuminate\Http\Request;
use HasFactory,Nottifiable,HasApiToken;

class TokenController extends Controller
{
    public function store(Request $request)
    {
        $this->validate($request, [
            'name' => 'required',
            'password' => 'required',
        ]);

        if (!auth()->attempt($request->only('name' , 'password'))){
            throw new AuthenticationException();
        }
        return [
            'token'=>auth()->user()->createToken('web')->plainTextToken
        ];

    }
}
