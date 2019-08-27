<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::post('login', 'API\UserController@login');
Route::post('register', 'API\UserController@register');

Route::get('test', 'API\MyController@get');



Route::group(['middleware' => 'auth:api'], function(){
    Route::post('details', 'API\UserController@details');
    Route::post('insertCategory', 'API\VideoController@insertCategory');
    Route::post('insertVideo', 'API\VideoController@insertVideo');

   Route::post('getVideo', 'API\MyController@get');
   Route::post('insertVideoTemp', 'API\MyController@insert');
   Route::post('insertVideo', 'API\VideoController@insertVideo');
});
