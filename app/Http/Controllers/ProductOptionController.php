<?php

namespace App\Http\Controllers;

use App\Http\Resources\ProductOptionResource;
use App\Models\ProductOption;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class ProductOptionController extends Controller
{

    public function index(Request $request){
        if(!empty($request->search)){
            $data = ProductOption::where('name', 'LIKE', '%' . $request->search . '%')
                    ->orderBy('name', 'asc')
                    ->paginate(15);
        } else{
            $data = ProductOption::orderBy('name', 'asc')
                    ->paginate(15);
        }

        return ProductOptionResource::collection($data);
    }


    public function indexAll() {
        $data = ProductOption::orderBy('name', 'asc')->get();
        return ProductOptionResource::collection($data);
    }

   
    public function show($id){
        $data = ProductOption::with(['user'])->find($id);
        return new ProductOptionResource($data);
    }


    public function store(Request $request){
        $data = new ProductOption();
        $data->user_id = Auth::user()->id;
        $data->name = $request->name;
        $data->description = $request->description;
        $data->price = $request->price;
        $data->created_at = now();
        $data->updated_at = now();
        $data->save();

        return response()->json([
            'message' => 'Saved Successfully.',
            'data' => new ProductOptionResource($data)
        ]);
    }


    public function update(Request $request, $id){
        $data = ProductOption::find($id);
        $data->user_id = Auth::user()->id;
        $data->name = $request->name;
        $data->description = $request->description;
        $data->price = $request->price;
        $data->updated_at = now();
        $data->save();

        return response()->json([
            'message' => 'Updated Successfully.',
            'data' => new ProductOptionResource($data)
        ]);
    }


    public function delete($id){
        $data = ProductOption::find($id);
        $data->delete();

        return response()->json([
            'message' => 'Deleted Sucessfully.'
        ]);
    }
}
