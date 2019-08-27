<?php
namespace App\Http\Controllers\API;
use Illuminate\Http\Request; 
use App\Http\Controllers\Controller; 
use App\User;
use App\Category; 
use App\Video;
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
         $validator = Validator::make($request->all(), [ 
            
            'title' => 'required', 
            'link' => 'required', 
        ]);
        
        if ($validator->fails()) { 
            return response()->json(['error'=>$validator->errors()], 401);            
        }
        $input = $request->all(); 
        $video = Video::create($input);
        
        $categories= $request->input('category');
        $categories= json_decode($categories);   
        
        for($i = 0; $i < count($categories); $i++){
            
            $cat = DB::table('categories')
                     ->select('id')
                     ->where('catName', '=', $categories[$i])
                     ->get();
                
            // echo count($cat);
            // exit;
            $catId=0;
            if(count($cat)){
                $catId=$cat[0]->id;
            }
            else{
                $value = ['catName' => $categories[$i]];
                $catId=  Category::create($value)->id;
            }
            
            DB::table('category_video')->insert(['category_id' => $catId, 'video_id' => $video->id]);
        }        
        
        return response()->json(['success'=>$request->all()], $this-> successStatus); 
    } 

    public function getVideo(Request $request) 
    { 
        $result = VideoList::get();
        //dd($result);
        return response()->json(['res' => $result]); 
    }
}


