<?php
use App\Http\Controllers\ScoreController;
use App\Http\Controllers\AuthController;

Route::post('/send-otp', [AuthController::class, 'sendOtp']);
Route::post('/register', [AuthController::class, 'register']);

Route::middleware(['jwt.auth'])->group(function () {
    Route::post('/save-score', [ScoreController::class, 'store']);
    Route::get('/overall-score', [ScoreController::class, 'overall']);
    Route::get('/weekly-score', [ScoreController::class, 'weekly']);
});
