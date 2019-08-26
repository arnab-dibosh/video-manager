<?php
namespace App\Http\Controllers\API;
use Illuminate\Http\Request; 
use App\Http\Controllers\Controller; 
use App\User;
use App\Category; 
use Illuminate\Support\Facades\Auth; 
use Illuminate\Support\Facades\DB;
use Validator;

class VideoController extends Controller 
{
public $successStatus = 200;
public $errorStatus = 401;

    

    public function insertCategory(Request $request) 
    { 
        $validator = Validator::make($request->all(), [ 
            
            'catName' => 'required',
        ]);
        
        if ($validator->fails()) { 
                    return response()->json(['error'=>$validator->errors()], $this->errorStatus);            
                }
        
         $input = $request->all(); 
        $category = Category::create($input);
               
        return response()->json(['success'=>'insert successfull'], $this-> successStatus); 
    } 

    public function insertVideo(Request $request) 
    { 
        
               
        return response()->json(['success'=>$request->all()], $this-> successStatus); 
    } 

    public function getVideo(Request $request) 
    { 
        $result = VideoList::get();
        //dd($result);
        return response()->json(['res' => $result]); 
    }
}


