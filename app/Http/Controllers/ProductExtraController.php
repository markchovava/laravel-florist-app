<?php

namespace App\Http\Controllers;

use App\Http\Resources\ProductExtraResource;
use App\Models\ProductExtra;
use Illuminate\Http\Request;

class ProductExtraController extends Controller
{
    public function index(Request $request){
        if(!empty($request->search)){
            $data = ProductExtra::where('name', 'LIKE', '%' . $request->search . '%')->paginate(10);
            return ProductExtraResource::collection($data);
        } else{
            $data = ProductExtra::orderBy('updated_at', 'desc')->paginate(10);
            return ProductExtraResource::collection($data);
        }
    }

    public function view($id){
        $data = ProductExtra::find($id);
        return new ProductExtraResource($data);
    }

    public function slugFlower(){
        $data = ProductExtra::where('slug', 'flower')->first();
        return new ProductExtraResource($data);
    }
}
