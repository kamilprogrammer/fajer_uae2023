<?php

use App\Models\Behaviour;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Auth\TokenController;
use TheSeer\Tokenizer\TokenCollection;


/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/
Route::group(['middleware'=>'auth:sanctum'] , function(){
    Route::get('/student', function (Request $request) {
        return $request->user();
    });
    Route::get('/student/bes', function (Request $request) {
        return $request->user()->behaviours;
    });


});

Route::post('/auth/token' , [TokenController::class , 'store']);
