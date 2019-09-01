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

    public function getCategories() 
    { 
        $cats = DB::select("SELECT DISTINCT  categories.id, categories.catName from categories INNER JOIN category_video on category_video.category_id=categories.id"); 
                      
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

        DB::beginTransaction();
        try{

            $input = $request->all(); 
            $video = Video::create($input);
            
            $categories= $request->input('category');
            $categories= json_decode($categories);   
            
            for($i = 0; $i < count($categories); $i++){
                
                $catId=$this->insertCategoryIfNotExist($categories[$i]) ;
                DB::table('category_video')->insert(['category_id' => $catId, 'video_id' => $video->id]);
            }    
            DB::commit();
            return response()->json(['success'=>'Video Inserted Successfully'], $this-> successStatus); 

        } catch (\Exception $e) {
        
            DB::rollback();
            return response()->json(['error'=>$e]); 
        }
    }
       

    function insertCategoryIfNotExist($category){

        DB::beginTransaction();
        try{
            $cat = DB::table('categories')
                     ->select('id')
                     ->where('catName', '=', $category)
                     ->get();
                
            $catId=0;
            if(count($cat)){
                $catId=$cat[0]->id;
            }
            else{
                $value = ['catName' => $category];
                $catId=  Category::create($value)->id;
            }
            DB::commit();
            return $catId;
         } catch (\Exception $e) {
        
            DB::rollback();
            return response()->json(['error'=>$e]); 
        }
    }

    public function updateVideo(Request $request){ 
    
         $validator = Validator::make($request->all(), [ 
            
            'title' => 'required', 
            'link' => 'required', 
        ]);
        
        if ($validator->fails()) { 
            return response()->json(['error'=>$validator->errors()]);            
        }

        $video= new Video();
        $video->id= $request->input('id');
        $video->title= $request->input('title');
        $video->link= $request->input('link');

        DB::beginTransaction();
        try{
            $output=DB::table('videos')
                ->where('id', $video->id)
                ->update(['title' => $video->title, 'link' => $video->link]);
        
            $categories= $request->input('category');
            $categories= json_decode($categories);   
            DB::table('category_video')->where('video_id', '=', $video->id)->delete();

            for($i = 0; $i < count($categories); $i++){
                        
                $catId= $this->insertCategoryIfNotExist($categories[$i]);
                DB::table('category_video')->insert(['category_id' => $catId, 'video_id' => $video->id]);
            }        
            DB::commit();
            return response()->json(['success'=>'Video updated Successfully'], $this-> successStatus); 

        } catch (\Exception $e) {
        
            DB::rollback();
            return response()->json(['error'=>$e]); 
        }
    } 

    public function getVideoByCategory(Request $request) 
    { 
        $in= $request->input('category'); 
        $in=json_decode($in);        
       
       $videos= DB::select("SELECT distinct v.title, v.link FROM `category_video` cv 
       INNER JOIN `videos` v on v.id = cv. video_id INNER JOIN `categories` c on c.id = cv.category_id 
       WHERE c.catName in ($in)");        
        
        return response()->json(['videos' => $videos]); 
    }

    public function getAllVideo() 
    { 
        $videos=Video::with('categories')->get();   
        return response()->json(['videos' => $videos]); 
    }

    public function deleteVideo(Request $request) 
    { 
        DB::beginTransaction();
        try{
            
            $id= $request->input('id');
            $id=json_decode($id);
            DB::table('videos')->where('id', '=', $id)->delete(); 
            DB::table('category_video')->where('video_id', '=', $id)->delete();
            DB::commit();
            return response()->json(['success' => 'Deleted Successfully']); 
         } catch (\Exception $e) {
        
            DB::rollback();
            return response()->json(['error'=>$e]); 
        }
    }

}


