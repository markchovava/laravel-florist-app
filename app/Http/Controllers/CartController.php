<?php

namespace App\Http\Controllers;

use App\Http\Resources\CartItemResource;
use App\Models\Cart;
use App\Models\CartItem;
use App\Models\CartItemOption;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Http\Resources\CartResource;
use Illuminate\Support\Facades\Log;

class CartController extends Controller
{
    public function randStr(){
        $chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
        $shuffled = str_shuffle($chars);
        return substr($shuffled, 0, 8);
    }

    public function index(Request $request){
        $data = Cart::orderBy('updated_at','desc')
                ->paginate(15);
        

        return CartResource::collection($data);

    }
    

    /* ADD SINGLE ITEM */
    public function store(Request $request){
        $cart = Cart::where('shopping_session', $request->shopping_session)->first();
        if(isset($cart)){
            $cart->product_option_quantity += $request->product_option_quantity;
            $cart->product_option_total += $request->product_option_total;
            $cart->product_quantity += $request->product_quantity;
            $cart->product_total += $request->product_total;
            $cart->grandtotal += $request->grandtotal;
            $cart->updated_at = now();
            $cart->save();
            if(!empty($request->item)) {
                $item = new CartItem();
                $item->cart_id = $cart->id;
                $item->product_id = $request->item['id'];
                $item->name = $request->item['name'];
                $item->image = $request->item['image'];
                $item->price = $request->item['price'];
                $item->quantity = $request->item['quantity'];
                $item->total = $request->item['total'];
                $item->grandtotal = $request->item['grandtotal'];
                $item->created_at = now();
                $item->updated_at = now();
                $item->save();  
            }
            if(!empty($request->product_option)) {
                $option = new CartItemOption();
                $option->product_option_id = $request->product_option['id'];
                $option->cart_id = $cart->id;
                $option->cart_item_id = $item->id;
                $option->name = $request->product_option['name'];
                $option->price = $request->product_option['price'];
                $option->quantity = $request->product_option['quantity'];
                $option->total = $request->product_option['total'];
                $option->created_at = now();
                $option->updated_at = now();
                $option->save();
            }
            return response()->json([
                'message' => 'Saved Successfully.',
                'data' => new CartResource($cart),
            ]);
            
        } 

        $cart = new Cart();
        $cart->shopping_session = $this->randStr();
        $cart->ip_address = $request->ip();
        $cart->product_option_quantity = $request->product_option_quantity;
        $cart->product_option_total = $request->product_option_total;
        $cart->product_quantity = $request->product_quantity;
        $cart->product_total = $request->product_total;
        $cart->grandtotal = $request->grandtotal;
        $cart->created_at = now();
        $cart->updated_at = now();
        $cart->save();
        if(!empty($request->item)) {
            $item = new CartItem();
            $item->cart_id = $cart->id;
            $item->product_id = $request->item['id'];
            $item->name = $request->item['name'];
            $item->image = $request->item['image'];
            $item->price = $request->item['price'];
            $item->quantity = $request->item['quantity'];
            $item->total = $request->item['total'];
            $item->grandtotal = $request->item['grandtotal'];
            $item->created_at = now();
            $item->updated_at = now();
            $item->save();  
        }
        if(!empty($request->product_option)) {
            $option = new CartItemOption();
            $option->product_option_id = $request->product_option['id'];
            $option->cart_id = $cart->id;
            $option->cart_item_id = $item->id;
            $option->name = $request->product_option['name'];
            $option->price = $request->product_option['price'];
            $option->quantity = $request->product_option['quantity'];
            $option->total = $request->product_option['total'];
            $option->created_at = now();
            $option->updated_at = now();
            $option->save();
        } 
        return response()->json([
            'message' => 'Saved Successfully.',
            'data' => new CartResource($cart),
            'shopping_session' => $cart->shopping_session,
        ]);

        
             
    }

    public function storeAll(Request $request){
        $cart = Cart::where('shopping_session', $request->shopping_session)->first();
        if(isset($cart)){
            $cart->product_option_quantity = $request->product_option_quantity;
            $cart->product_option_total = $request->product_option_total;
            $cart->product_quantity = $request->product_quantity;
            $cart->product_total = $request->product_total;
            $cart->grandtotal = $request->grandtotal;
            $cart->updated_at = now();
            $cart->save();

            CartItem::where('cart_id', $cart->id)->delete();
            CartItemOption::where('cart_id', $cart->id)->delete();

            if(!empty($request->items)){
                for($i = 0; $i < count($request->items); $i++){
                    $item = new CartItem();
                    $item->cart_id = $cart->id;
                    $item->product_id = $request->items[$i]['id'];
                    $item->name = $request->items[$i]['name'];
                    $item->image = $request->items[$i]['image'];
                    $item->price = $request->items[$i]['price'];
                    $item->quantity = $request->items[$i]['quantity'];
                    $item->total = $request->items[$i]['price'] * $request->items[$i]['quantity'];
                    $item->grandtotal = $item->total + ($request->items[$i]['cart_item_option']['price'] * 
                                $request->items[$i]['cart_item_option']['quantity']);
                    $item->created_at = now();
                    $item->updated_at = now();
                    $item->save();
                    /* CART ITEM OPTION */
                    $option = new CartItemOption();
                    $option->cart_id = $cart->id;
                    $option->cart_item_id = $item->id;
                    $option->product_option_id = $request->items[$i]['cart_item_option']['id'];
                    $option->name = $request->items[$i]['cart_item_option']['name'];
                    $option->price = $request->items[$i]['cart_item_option']['price'];
                    $option->quantity = $request->items[$i]['cart_item_option']['quantity'];
                    $option->total = $request->items[$i]['cart_item_option']['total'];
                    $option->created_at = now();
                    $option->updated_at = now();
                    $option->save();
                }
            }

            return response()->json([
                'message' => 'Saved Successfully.',
                'data' => new CartResource($cart)
            ]);
        }
    }

    public function cartCheckout(Request $request){
        $cart = Cart::where('shopping_session', $request->shopping_session)->first();
        $cart_items = CartItem::with(['cart_item_option'])->where('cart_id', $cart->id)->get();

        return response()->json([
            'cart' => new CartResource($cart),
            'cart_items' => CartItemResource::collection($cart_items),
        ]);
    }
 
    public function update(Request $request, $id){}
    public function delete($id){}
}
