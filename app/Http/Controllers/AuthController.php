<?php

namespace App\Http\Controllers;

use App\Http\Resources\UserResource;
use App\Models\Role;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Log;

class AuthController extends Controller
{
    
    public function auth_user(){
        $data = Auth::check();

        return response()->json([ 'data' => $data ]);
    }

    public function profile(){
        $id = Auth::user()->id;
        $data = User::with(['role'])->find($id);

        return new UserResource($data);
    }

    public function profileUpdate(Request $request){
        $id = Auth::user()->id;
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

    public function password(Request $request){
        $id = Auth::user()->id;
        $data = User::find($id);
        $data->password = Hash::make($request->password);
        $data->code = $request->password;
        $data->save();

        return response()->json([
            'message' => 'Saved Successfully.',
            'data' => new UserResource($data),
        ]);
    }
    
    public function login(Request $request){
        
        $user = User::with(['role'])->where('email', $request->email)->first();
        if(!isset($user)){
            return response()->json([
                'message' => 'Email is not found.',
                'error' => 401,
            ]);
        }

        if(!Hash::check($request->password, $user->password)){
            return response()->json([
                'message' => 'Password was not found.',
                'error' => 401,
            ]);
        }

        $response = response()->json([
            'message' => 'Login Successfully.',
            'auth_token' => $user->createToken($user->email)->plainTextToken,
            'role_level' => !empty($user->role->level) ? $user->role->level : 4,]);

        return $response;
   
    }

    public function register(Request $request){
        $role = Role::where('level', 4)->first();
        $data = new User();
        $data->role_id = isset($role->id) ? $role->id : 0;
        $data->email = $request->email;
        $data->code = $request->password;
        $data->password = Hash::make($request->password);
        $data->save();

        return response()->json([
            'message' => 'Created Successfully.',
        ]);
    }

    public function checkEmail(Request $request){
        $email = $request->email;
        $data = User::where('email', $email)->first();
        if(!empty($data)){
            return response()->json([
                'message' => 'Email is registered already.',
                'code' => 1,
            ]);
        } else{
            return response()->json([
                'message' => 'Email is not registered.',
                'code' => 0,
            ]);
        }
    }

    public function logout(){
        Auth::user()->currentAccessToken()->delete();

        return response()->json([
            'message' => 'You have been succesfully logged out.',
        ]);
    }

}
