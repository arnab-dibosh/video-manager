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

    public function getCategories(Request $request) 
    { 
        $cats = Category::get();
                      
        return response()->json(['categories' => $cats]); 
    } 

    public function insertVideo(Request $request) 
    { 
         $validator = Validator::make($request->all(), [ 
            
            'title' => 'required', 
            'link' => 'required', 
        ]);
        
        if ($validator->fails()) { 
            return response()->json(['error'=>$validator->errors()]);            
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
        
        return response()->json(['success'=>'Video Inserted Successfully'], $this-> successStatus); 
    } 

    public function getVideo(Request $request) 
    { 
        $in= $request->input('category'); 
        $in=json_decode($in);        
       
       $videos= DB::select("SELECT distinct v.title, v.link FROM `category_video` cv 
       INNER JOIN `videos` v on v.id = cv. video_id INNER JOIN `categories` c on c.id = cv.category_id 
       WHERE c.catName in ($in)");        
        
        return response()->json(['videos' => $videos]); 
    }

    // public function getVideo(Request $request) 
    // { 
    //     $names= $request->input('category');  
    //     // echo $names;
    //     // exit;      
    //     $names= json_decode($names); 
    //     $cats = Category::whereIn('catName', $names)->get();

    //     $videos=[];
    //     for($i = 0; $i < count($cats); $i++){

    //         $temp=  $cats[$i]->videos()->get();
    //         if(count($temp)) {
    //             for($j = 0; $j < count($temp); $j++){
    //                 array_push($videos, $temp[$j]);
    //             }   
    //         }
          
    //      }
                  
    //     // dd($videos);
    //     // exit;
        
    //     return response()->json(['videos' => $videos]); 
    // }
}


