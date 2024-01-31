<?php

namespace App\Http\Controllers;

use App\Http\Resources\DeliveryResource;
use App\Models\Delivery;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class DeliveryController extends Controller
{
    
    public function index(Request $request){
        if(!empty($request->search)){
            $data = Delivery::with(['user'])
                    ->where('name', 'LIKE', '%' . $request->search . '%')
                    ->paginate(15);
        } else {
            $data = Delivery::with(['user'])
                    ->orderBy('name','asc')
                    ->paginate(15); 
        
        }

        return DeliveryResource::collection($data);
    }

    public function indexAll(){
        $data = Delivery::get(); 
        return DeliveryResource::collection($data);
    }

 
    public function show($id){
        $data = Delivery::with(['user'])->find($id);
        return new DeliveryResource($data);
    }

    public function store(Request $request){
        $data = new Delivery();
        $data->user_id = Auth::user()->id;
        $data->name = $request->name;
        $data->price =  $request->price;
        $data->created_at = now();
        $data->updated_at = now();
        $data->save();

        return response()->json([
            'message' => 'Saved Successfully.',
            'data' => new DeliveryResource($data)
        ]);
    }

    public function update(Request $request, $id){
        $data = Delivery::find($id);
        $data->user_id = Auth::user()->id;
        $data->name = $request->name;
        $data->price =  $request->price;
        $data->updated_at = now();
        $data->save();

        return response()->json([
            'message' => 'Updated Successfully.',
            'data' => new DeliveryResource($data)
        ]);
    }

    public function delete($id){
        $data = Delivery::find($id);
        $data->delete();

        return response()->json([
            'message' => 'Deleted Sucessfully.'
        ]);
    }

}
