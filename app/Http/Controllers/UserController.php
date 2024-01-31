<?php

namespace App\Http\Controllers;

use App\Http\Resources\UserResource;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;




class UserController extends Controller
{
    
    public function index(Request $request){
        $user_id = Auth::user()->id;
        if(!empty($request->search)){
            $data = User::with(['role'])
                    ->where('id', '!=', $user_id)
                    ->where('name', 'LIKE', '%' . $request->search . '%')
                    ->orderBy('updated_at','asc')
                    ->orderBy('name','asc')
                    ->paginate(15);
        }else{
            $data = User::with(['role'])
                    ->where('id', '!=', $user_id)
                    ->orderBy('updated_at','desc')
                    ->orderBy('name','asc')
                    ->orderBy('updated_at','asc')
                    ->paginate(15);
        }
        
        return UserResource::collection($data);
    }

    public function show($id){
        $data = User::with(['role'])->find($id);
       
        return new UserResource($data);
    }

    public function store(Request $request){
        $code = rand(100000000, 1000000000000);
        $data = new User();
        $data->first_name = $request->first_name;
        $data->last_name = $request->last_name;
        $data->name =  $request->first_name . ' ' . $request->last_name;
        $data->role_id = $request->role_id;
        $data->email = $request->email;
        $data->phone = $request->phone;
        $data->code = $code;
        $data->password = Hash::make($code);
        $data->address =  $request->address;
        $data->city =  $request->city;
        $data->country =  $request->country;
        $data->created_at = now();
        $data->updated_at = now();
        $data->save();

        return response()->json([
            'message' => 'Saved Successfully.',
            'data' => new UserResource($data)
        ]);
    }

    public function update(Request $request, $id){
        $data = User::find($id);
        $data->name =  $request->first_name . ' ' . $request->last_name;
        $data->role_id = $request->role_id;
        $data->first_name = $request->first_name;
        $data->last_name = $request->last_name;
        $data->email = $request->email;
        $data->phone = $request->phone;
        $data->address =  $request->address;
        $data->city =  $request->city;
        $data->country =  $request->country;
        $data->updated_at = now();
        $data->save();

        return response()->json([
            'message' => 'Updated Successfully.',
            'data' => new UserResource($data)
        ]);
    }

    public function delete($id){
        $data = User::find($id);
        $data->delete();

        return response()->json([
            'message' => 'Deleted Sucessfully.'
        ]);
    }
    
}
