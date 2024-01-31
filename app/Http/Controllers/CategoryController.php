<?php

namespace App\Http\Controllers;

use App\Http\Resources\CategoryResource;
use App\Http\Resources\ProductResource;
use App\Models\Category;
use App\Models\Product;
use App\Models\ProductCategory;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class CategoryController extends Controller
{
    
    public function index(Request $request){
        if(!empty($request->search)){
            $data = Category::with(['user'])
                    ->where('name', 'LIKE', '%' . $request->search . '%')
                    ->paginate(15);
        } else {
            $data = Category::with(['user'])
                    ->orderBy('priority','asc')
                    ->orderBy('name','asc')
                    ->paginate(15); 
        
        }

        return CategoryResource::collection($data);
    }


    public function indexAll() {
        $data = Category::orderBy('priority','asc')
                ->orderBy('name','asc')
                ->get(); 
        return CategoryResource::collection($data);
    }

    public function indexOne(){
        $data = Category::with(['user', 'products'])
                ->where('priority', 1)
                ->first(); 
    
        return new CategoryResource($data);
    }

    public function indexPriorityTwo(){
        $category = Category::with(['user', 'products'])->where('priority', 2)->first(); 
        $productIds = ProductCategory::where('category_id', $category->id)->pluck('product_id');
        $products = Product::whereIn('id', $productIds)->paginate(8);

        return ProductResource::collection($products);
    }


    public function show($id){
        $data = Category::with(['user', 'products'])->find($id);
        return new CategoryResource($data);
    }

    public function showCategoryProducts($id){
        $productIds = ProductCategory::where('category_id',$id)->pluck('product_id');
        $products = Product::whereIn('id', $productIds)->paginate(12);
        return ProductResource::collection($products);
    }

    public function store(Request $request){
        $data = new Category();
        $data->user_id = Auth::user()->id;
        $data->name = $request->name;
        $data->priority = $request->priority;
        $data->description =  $request->description;
        $data->created_at = now();
        $data->updated_at = now();
        $data->save();

        return response()->json([
            'message' => 'Saved Successfully.',
            'data' => new CategoryResource($data)
        ]);
    }

    public function update(Request $request, $id){
        $data = Category::find($id);
        $data->user_id = Auth::user()->id;
        $data->name = $request->name;
        $data->priority = $request->priority;
        $data->description = $request->description;
        $data->updated_at = now();
        $data->save();

        return response()->json([
            'message' => 'Updated Successfully.',
            'data' => new CategoryResource($data)
        ]);
    }

    public function delete($id){
        $data = Category::find($id);
        $data->delete();

        return response()->json([
            'message' => 'Deleted Sucessfully.'
        ]);
    }
}
