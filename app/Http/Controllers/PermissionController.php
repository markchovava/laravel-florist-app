<?php

namespace App\Http\Controllers;

use App\Http\Resources\PermissionResource;
use App\Models\Permission;
use Illuminate\Http\Request;

class PermissionController extends Controller
{
    public function index(Request $request){
        if(!empty($request->search)){
            $data = Permission::with(['user'])
                    ->where('name', 'LIKE', '%' . $request->search . '%')
                    ->paginate(20);
        } else{
            $data = Permission::with(['user'])
                    ->orderBy('level', 'asc')
                    ->paginate(20);
        }
        
        return PermissionResource::collection($data);
    }


    public function show($id){
        $data = Permission::with(['user'])->find($id);
       
        return new PermissionResource($data);
    }

    public function store(Request $request){
        $data = new Permission();
        $data->user_id = $request->user_id;
        $data->name = $request->name;
        $data->level = $request->level;
        $data->description =  $request->description;
        $data->created_at = now();
        $data->updated_at = now();
        $data->save();

        return response()->json([
            'message' => 'Saved Successfully.',
            'data' => new PermissionResource($data)
        ]);
    }

    public function update(Request $request, $id){
        $data = Permission::find($id);
        $data->user_id = $request->user_id;
        $data->name = $request->name;
        $data->level = $request->level;
        $data->description = $request->description;
        $data->updated_at = now();
        $data->save();

        return response()->json([
            'message' => 'Updated Successfully.',
            'data' => new PermissionResource($data)
        ]);
    }

    public function delete($id){
        $data = Permission::find($id);
        $data->delete();

        return response()->json([
            'message' => 'Deleted Sucessfully.'
        ]);
    }
}
