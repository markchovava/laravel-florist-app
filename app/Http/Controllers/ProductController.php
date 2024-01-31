<?php

namespace App\Http\Controllers;

use App\Http\Resources\ProductResource;
use App\Models\Product;
use App\Models\ProductCategory;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Log;

class ProductController extends Controller
{

    public $upload_location = 'storage/img/products/';

    public function index(Request $request){
        if(!empty($request->search)){
            $data = Product::with(['user', 'categories'])
                ->where('name', 'LIKE', '%' . $request->search . '%')
                ->paginate(12);
        } else {
            $data = Product::with(['user', 'categories'])
                ->orderBy('updated_at','desc')
                ->orderBy('name','asc')
                ->paginate(12);
        }

        return ProductResource::collection($data);
    }

    public function indexFour(){
        $data = Product::with(['user', 'categories'])
                ->orderBy('updated_at','desc')
                ->orderBy('name','asc')
                ->paginate(4);
       

        return ProductResource::collection($data);
    }


    public function show($id, Request $request){
        $data = Product::with(['user', 'categories'])->find($id);
        return new ProductResource($data);
    }


    public function store(Request $request){
        $data = new Product();
        $data->user_id = Auth::user()->id;
        $data->name = $request->name;
        $data->description = $request->description;
        $data->price = (int)$request->price;
        $data->created_at = now();
        $data->updated_at = now();
        if( $request->hasFile('image') ) {
            $image = $request->file('image');
            $image_extension = strtolower($image->getClientOriginalExtension());
            $image_name = 'image_' . date('YmdH'). rand(0, 1000) . '.' . $image_extension;
            $image->move($this->upload_location, $image_name);
            $data->image = $this->upload_location . $image_name;                        
        }
        if( $request->hasFile('thumbnail') ) {
            $thumbnail = $request->file('thumbnail');
            $thumbnail_extension = strtolower($thumbnail->getClientOriginalExtension());
            $thumbnail_name = 'thumbnail_' . date('YmH'). rand(0, 1000) . '.' . $thumbnail_extension;
            $thumbnail->move($this->upload_location, $thumbnail_name);
            $data->thumbnail = $this->upload_location . $thumbnail_name;                        
        }

        $data->save();

    
        return response()->json([
            'message' => 'Saved Successfully.',
            'data' => new ProductResource($data)
        ]);
    }



    public function update(Request $request, $id){
        $data = Product::find($id);
        $data->name = $request->name;
        $data->user_id = Auth::user()->id;
        $data->description = $request->description;
        $data->price = $request->price;
        $data->updated_at = now();
        if( $request->hasFile('image') ){
            $image = $request->file('image');
            $image_extension = strtolower($image->getClientOriginalExtension());
            $image_name = 'image_' . date('YmdH') . rand(0, 1000) . '.' . $image_extension;
            if(!empty($data->image)){
                if(file_exists(public_path( $data->image))){
                    unlink($data->image);
                }
                $image->move($this->upload_location, $image_name);
                $data->image = $this->upload_location . $image_name;                    
            }else{
                $image->move($this->upload_location, $image_name);
                $data->image = $this->upload_location . $image_name;
            }              
        }
        if( $request->file('thumbnail') ){
            $thumbnail = $request->file('thumbnail');
            $thumbnail_extension = strtolower($thumbnail->getClientOriginalExtension());
            $thumbnail_name = 'thumbnail_' . date('YmdH') . rand(0, 1000) . '.' . $thumbnail_extension;
            if(!empty($data->thumbnail)){
                if(file_exists(public_path($data->thumbnail))){
                    unlink($data->thumbnail);
                }
                $thumbnail->move($this->upload_location, $thumbnail_name);
                $data->thumbnail = $this->upload_location . $thumbnail_name;                    
            }else{
                $thumbnail->move($this->upload_location, $thumbnail_name);
                $data->thumbnail = $this->upload_location . $thumbnail_name;
            }              
        }

        $data->save();
    
        return response()->json([
            'message' => 'Saved Successfully.',
            'data' => new ProductResource($data)
        ]);
    }
    

    public function delete($id){
        ProductCategory::where('product_id', $id)->delete();
        $data = Product::find($id);
        if(!empty($data->image)){
            if(file_exists(public_path($data->image))){
                unlink($data->image);
            }
        }
        if(!empty($data->thumbnail)){
            if(file_exists(public_path($data->thumbnail))){
                unlink($data->thumbnail);
            }
        }
        $data->delete();

        return response()->json([
            'message' => 'Deleted Sucessfully.'
        ]);       
    }
}
