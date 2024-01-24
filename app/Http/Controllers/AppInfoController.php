<?php

namespace App\Http\Controllers;

use App\Http\Resources\AppInfoResource;
use App\Models\AppInfo;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class AppInfoController extends Controller
{
    public $upload_location = 'storage/img/';
    
    public function index(){
        $data = AppInfo::with(['user'])->first();
        if(!isset($data)){
            return response()->json([
                'message' => 'No data Added yet.',
            ]);
        } 

        return response()->json([
            'message' => 'Our App Info',
            'data' => new AppInfoResource($data)
        ]);

    }

    public function update(Request $request){
        if(!AppInfo::first()){
            $data = new AppInfo();
            $data->user_id = Auth::user()->id;
            $data->name = $request->name;
            $data->address =  $request->address;
            $data->phone = $request->phone;
            $data->email = $request->email;
            $data->website = $request->website;
            if( $request->hasFile('image') ){
                $image = $request->file('image');
                $image_extension = strtolower($image->getClientOriginalExtension());
                $image_name = 'logo_' . date('Ym') . '.' . $image_extension;
                $image->move($this->upload_location, $image_name);
                $data->image = $this->upload_location . $image_name;             
            }
            $data->save(); 
        } else {
            $data = AppInfo::first();
            $data->user_id = Auth::user()->id;
            $data->name = $request->name;
            $data->address =  $request->address;
            $data->phone = $request->phone;
            $data->email = $request->email;
            $data->website = $request->website;
            if( $request->hasFile('image') ){
                $image = $request->file('image');
                $image_extension = strtolower($image->getClientOriginalExtension());
                $image_name = 'logo_' . date('Ymd') . '.' . $image_extension;
                if(!empty($data->image)){
                    if(file_exists(public_path($data->image))){
                        unlink($data->image);
                    }
                    $image->move($this->upload_location, $image_name);
                    $data->image = $this->upload_location . $image_name;                    
                }else{
                    $image->move($this->upload_location, $image_name);
                    $data->image = $this->upload_location . $image_name;
                }              
            }
        $data->save();
        }

        return response()->json([
            'message' => 'Saved Successfully.',
            'data' => new AppInfoResource($data)
        ]);
    }

   

}
