<?php

namespace App\Http\Controllers;

use App\Http\Resources\CategoryResource;
use App\Http\Resources\ProductResource;
use App\Models\Category;
use App\Models\Product;
use App\Models\ProductCategory;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Log;

class CategoryController extends Controller
{

    public function topSellingProducts(){
        $category = Category::where('slug', 'top-selling')->first();
        $productIds = ProductCategory::where('category_id', $category->id)->pluck('product_id');
        $data = Product::whereIn('id', $productIds)
                    ->orderBy('priority', 'asc')
                    ->paginate(8);
        return ProductResource::collection($data);
    }
    public function topSellingFour(){
        $category = Category::where('slug', 'top-selling')->first();
        $productIds = ProductCategory::where('category_id', $category->id)->pluck('product_id');
        $data = Product::whereIn('id', $productIds)
                    ->orderBy('priority', 'asc')
                    ->paginate(4);
        return ProductResource::collection($data);
    }
    public function featuredProducts(){
        $category = Category::where('slug', 'featured')->first();
        Log::info($category);
        $productIds = ProductCategory::where('category_id', $category->id)
                ->pluck('product_id');
        $data = Product::whereIn('id', $productIds)
                ->orderBy('priority', 'asc')
                ->paginate(8);
        return ProductResource::collection($data);
    }

    public function showCategoryProducts($id){
        $productIds = ProductCategory::where('category_id',$id)->pluck('product_id');
        $products = Product::whereIn('id', $productIds)
                ->orderBy('priority', 'asc')
                ->paginate(12);
        return ProductResource::collection($products);
    }

    public function searchCategoryProducts(Request $request, $id){
        $productIds = ProductCategory::where('category_id',$id)->pluck('product_id');
        $products = Product::whereIn('id', $productIds)
                ->where('name', 'LIKE', '%' . $request->search . '%')
                ->orderBy('priority', 'asc')
                ->paginate(12);
        return ProductResource::collection($products);
    }
    

    
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
                ->orderBy('priority','asc')
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
        $products = Product::whereIn('id', $productIds)->orderBy('priority', 'asc')->paginate(8);

        return ProductResource::collection($products);
    }

    public function show($id){
        $data = Category::with(['user', 'products'])->find($id);
        return new CategoryResource($data);
    }

    public function store(Request $request){
        $data = new Category();
        $data->user_id = Auth::user()->id;
        $data->name = $request->name;
        $data->priority = $request->priority;
        $data->slug = $request->slug;
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
        $data->slug = $request->slug;
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
