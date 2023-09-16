<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\{UserController, AuthController, CardController, EmailVerificationController};
use App\Http\Controllers\Admin\AdminController;
use App\Http\Controllers\ContactController;

Route::group(['namespace' => 'Api'], function () {
    Route::post('/login', [AuthController::class, 'login']);
    Route::post('/register', [AuthController::class, 'register']);
    Route::post('/resend_code', [UserController::class, 'resend_code']);
    Route::post('/reset-password', [UserController::class, 'resetPass']);#1
    Route::post('/verify', [EmailVerificationController::class, 'verify']);
    Route::post('/change-password', [UserController::class, 'changePassword']);#3
    // Route::post('/refresh', [AuthController::class, 'refresh']);
    Route::post('/update_card', [CardController::class, 'update']);
    Route::get('/add_contact/{user_id?}', [ContactController::class, 'add_contact']);
    Route::get('/contacts', [ContactController::class, 'contacts_list']);
    Route::get('/user/{id}', [UserController::class, 'get_user_by_id']);
    Route::get('/card/{id}', [CardController::class, 'getCard']);//get others card
    Route::get('/card', [CardController::class, 'onlyCard']);//get my card
    Route::delete('/contact/{contact_id}', [ContactController::class, 'destroy']);
});


Route::group([/*'middleware' => 'EmailVerificationMiddleware',*/'namespace' => 'Api'], function () {
    //Route::get('api-test/{id?}', [UserController::class, 'get_user_by_id']);
    Route::post('/logout', [AuthController::class, 'logout']);
    Route::post('/createcard', [UserController::class, 'create_card']); #add gate
});


