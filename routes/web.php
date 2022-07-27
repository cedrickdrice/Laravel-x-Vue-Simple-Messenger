<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/
use \App\Http\Controllers;

Auth::routes();

Route::get('/', [Controllers\MessengerController::class, 'viewMessenger']);

Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');

Route::group(['prefix' => 'api'], function () {
    Route::get('get-user', [Controllers\MessengerController::class, 'getUserDetail']);
    Route::get('user/search', [Controllers\MessengerController::class, 'searchUserList']);
    Route::group(['prefix' => 'messages'], function () {
        Route::get('contact/list', [Controllers\MessengerController::class, 'getContactList']);
        Route::post('contact/chat', [Controllers\MessengerController::class, 'getSelectChat']);
        Route::post('send', [Controllers\MessengerController::class, 'sendMessage']);
    });
});


