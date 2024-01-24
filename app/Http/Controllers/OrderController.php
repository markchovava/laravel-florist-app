<?php

namespace App\Http\Controllers;

use App\Http\Resources\OrderResource;
use App\Http\Resources\ProductResource;
use App\Models\Order;
use App\Models\OrderItem;
use App\Models\OrderItemOption;
use App\Models\OrderUser;
use App\Models\Product;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Log;

class OrderController extends Controller
{

    public function index(Request $request){
        if(!empty($request->search)){
            $data = Order::where('order_no', 'LIKE', '%' . $request->search . '%')
                ->paginate(15);
        } else {
            $data = Order::orderBy('updated_at','desc')
                ->orderBy('order_no','asc')
                ->paginate(15);
        }

        return OrderResource::collection($data);
    }


    public function show($id){
        $data = Order::with(['order_user', 'order_items'])->find($id);
        return new OrderResource($data);
    }

    public function searchProductByName(Request $request){
        if(!empty($request->search) && $request->search !== ''){
            $data = Product::with(['user', 'categories'])
                ->where('name', 'LIKE', '%' . $request->search . '%')
                ->get();
        }
        return ProductResource::collection($data);
    }

    public function deliveryUpdate(Request $request, $id){
        $data = Order::find($id);
        $data->delivery_status = $request->delivery_status;
        $data->save();

        return response()->json([
            'message' => 'Saved Successfully.',
            'data' => new OrderResource($data),
        ]);

    }

    public function store(Request $request){
        $code = rand(0, 100000);
        $order = new Order();
        $order->user_id = Auth::user()->id;
        $order->order_no = 'REF' .  date('Ymd') . $code;
        $order->delivery_status = 'Processing';
        $order->product_option_quantity = $request->product_option_quantity;
        $order->product_option_total = $request->product_option_total;
        $order->product_quantity = $request->product_quantity;
        $order->product_total = $request->product_total;
        $order->grandtotal = $request->grandtotal;
        $order->created_at = now();
        $order->updated_at = now();
        $order->save();

        $order_user = $request->user;
        $user = new OrderUser();
        $user->order_id = $order->id;
        $user->user_id = $order_user['id'];
        $user->first_name =  $order_user['first_name'];
        $user->last_name =  $order_user['last_name'];
        $user->name =  $order_user['name'];
        $user->phone =  $order_user['phone'];
        $user->email =  $order_user['email'];
        $user->address = $order_user['address'];
        $user->city =  $order_user['city'];
        $user->country =  $order_user['country'];
        $user->created_at = now();
        $user->updated_at = now();
        $user->save();

        if(!empty($request->items)){
            $items = $request->items;
            for($i = 0; $i < count($request->items); $i++ ){
                $item = new OrderItem();
                $item->order_id = $order->id;
                $item->user_id = Auth::user()->id;
                $item->product_id = $items[$i]['id'];
                $item->name = $items[$i]['name'];
                $item->image = $items[$i]['image'];
                $item->price = $items[$i]['price'];
                $item->quantity = $items[$i]['quantity'];
                $item->total = $items[$i]['total'];
                $item->grandtotal = $items[$i]['grandtotal'];
                $item->created_at = now();
                $item->updated_at = now();
                $item->save();
    
                $option = new OrderItemOption();
                $option->product_option_id = $items[$i]['product_option']['id'];
                $option->user_id = Auth::user()->id;
                $option->order_id = $order->id;
                $option->order_item_id = $item->id;
                $option->name = $items[$i]['product_option']['name'];
                $option->price = $items[$i]['product_option']['price'];
                $option->quantity = $items[$i]['product_option']['quantity'];
                $option->total = $items[$i]['product_option']['total'];
                $option->created_at = now();
                $option->updated_at = now();
                $option->save();
            }
        }

        return response()->json([
            'message' => 'Saved Successfully.',
            'data' => new OrderResource($order),
        ]);

    }

    public function delete($id){
        $order = Order::find($id);
        $order->delete();

        OrderUser::where('order_id', $id)->delete();
        OrderItemOption::where('order_id', $id)->delete();
        OrderItem::where('order_id', $id)->delete();

        return response()->json([
            'message' => 'Deleted Successfully.',
        ]);
        
    }



}
