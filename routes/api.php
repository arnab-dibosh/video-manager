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

Route::get('getCategories', 'API\VideoController@getCategories');



Route::group(['middleware' => 'auth:api'], function(){
    Route::post('details', 'API\UserController@details');
    Route::post('insertCategory', 'API\VideoController@insertCategory');
    Route::post('insertVideo', 'API\VideoController@insertVideo');

   Route::post('getVideoByCategory', 'API\VideoController@getVideoByCategory');
   Route::post('getAllVideo', 'API\VideoController@getAllVideo');
   Route::post('insertVideo', 'API\VideoController@insertVideo');
   Route::post('updateVideo', 'API\VideoController@updateVideo');
   Route::post('deleteVideo', 'API\VideoController@deleteVideo');
});
