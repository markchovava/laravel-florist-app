<?php

namespace App\Http\Controllers;

use App\Http\Resources\ProductCategoryResource;
use App\Models\ProductCategory;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Log;

class ProductCategoryController extends Controller
{

    public function store(Request $request){
        if($request->product_categories) {
            $product_categories = $request->product_categories;
            foreach ($product_categories as $item) {
                $data = new ProductCategory();
                $data->user_id = Auth::user()->id;
                $data->product_id = $item['product_id'];
                $data->category_id = $item['category_id'];
                $data->created_at = now();
                $data->updated_at = now();
                $data->save();
            } 
        }

        return response()->json([
            'message' => 'Saved Successfully.',
        ]);
    }

    public function delete($id){
        $data = ProductCategory::find($id);
        $data->delete();
        
        return response()->json([
            'message' => 'Deleted Successfully.',
        ]);
    }

    public function show($id){
        $data = ProductCategory::with(['category'])
                ->where('product_id', $id)
                ->get();
    
        return ProductCategoryResource::collection($data);
    }

}
