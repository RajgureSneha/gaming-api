<?php

namespace App\Http\Controllers;
use Tymon\JWTAuth\Facades\JWTAuth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Http\Request;

class AuthController extends Controller
{
    public function sendOtp(Request $request)
{
    $request->validate(['phone' => 'required|digits:10']);

    $otp = '1234';
    $expiresAt = now()->addMinutes(1);

    \App\Models\Otp::updateOrCreate(
        ['phone' => $request->phone],
        ['otp' => $otp, 'expires_at' => $expiresAt]
    );

    return response()->json(['success' => true, 'message' => 'OTP sent successfully']);
}


public function register(Request $request)
{
    $request->validate([
        'phone' => 'required|digits:10|unique:users,phone',
        'otp' => 'required',
        'name' => 'required',
        'dob' => 'required|date',
        'email' => 'required|email|unique:users,email',
    ]);

    
    $otp = \App\Models\Otp::where('phone', $request->phone)->first();
    if (!$otp || $otp->otp !== $request->otp || now()->gt($otp->expires_at)) {
        return response()->json(['success' => false, 'message' => 'Invalid or expired OTP']);
    }

   
    $user = \App\Models\User::create([
        'name' => $request->name,
        'phone' => $request->phone,
        'dob' => $request->dob,
        'email' => $request->email,
        'password' => Hash::make('123456')
    ]);

    
    $otp->delete();

   
    $token = JWTAuth::fromUser($user);

    return response()->json(['success' => true, 'token' => $token]);
}


}
