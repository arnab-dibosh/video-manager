<?php
namespace App\Http\Controllers\API;
use Illuminate\Http\Request; 
use App\Http\Controllers\Controller; 
use App\User;
use App\VideoList; 
use Illuminate\Support\Facades\Auth; 
use Validator;

class MyController extends Controller 
{
public $successStatus = 200;

    public function get() 
    { 
        $result = VideoList::get();
        //dd($result);
        return response()->json(['res' => $result]); 
    } 

    public function insert(Request $request) 
    { 
        $validator = Validator::make($request->all(), [ 
            
            'title' => 'required', 
            'link' => 'required', 
        ]);
        
        if ($validator->fails()) { 
                    return response()->json(['error'=>$validator->errors()], 401);            
                }
        $input = $request->all(); 
               $videoList = VideoList::create($input);

               
        return response()->json(['success'=>'insert successfull'], $this-> successStatus); 
    } 
    
}


