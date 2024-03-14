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
        return substr($shuffled, 0, 10);
    }

    public function index(){
        $data = Cart::with(['user_id'])->orderBy('updated_at','desc')
                ->paginate(15);

        return CartResource::collection($data);

    }
    
    public function store(Request $request){
        $cart = Cart::where('shopping_session', $request->shopping_session)->first();
        if(isset($cart)){
            $cart->user_id = Auth::check() ? Auth::user()->id : null;
            $cart->product_quantity += $request->product_quantity;
            $cart->product_total += $request->product_total;
            $cart->extra_quantity += $request->extra_quantity;
            $cart->extra_total += $request->extra_total;
            $cart->cart_quantity += (int)$request->product_quantity + (int)$request->extra_quantity;
            $cart->cart_total += (int)$request->product_total + (int)$request->extra_total;
            $cart->save();
            /*  */
            $cartitem = CartItem::where('product_id', $request->product_id)
                                ->where('cart_id', $cart->id)
                                ->first();
            if(isset($cartitem)){
                $cartitem->product_quantity += $request->product_quantity;
                $cartitem->product_total += $request->product_total;
                $cartitem->extra_quantity += $request->extra_quantity;
                $cartitem->extra_total += $request->extra_total;
                $cartitem->cartitem_quantity += (int)$request->product_quantity + (int)$request->extra_quantity;
                $cartitem->cartitem_total += (int)$request->product_total + (int)$request->extra_total;
                $cartitem->save();
            } else{
                $cartitem = new CartItem();
                $cartitem->user_id = Auth::check() ? Auth::user()->id : null;
                $cartitem->cart_id = $cart->id;
                $cartitem->product_id = $request->product_id;
                $cartitem->product_name =$request->product_name;
                $cartitem->product_unit_price = $request->product_unit_price;
                $cartitem->product_quantity = $request->product_quantity;
                $cartitem->product_total = $request->product_total;
                $cartitem->extra_name = $request->extra_name;
                $cartitem->extra_quantity = $request->extra_quantity;
                $cartitem->extra_total =   $request->extra_total;
                $cartitem->cartitem_quantity = (int)$request->product_quantity + (int)$request->extra_quantity;
                $cartitem->cartitem_total = (int)$request->product_total + (int)$request->extra_total;
                $cartitem->save();
            }
        } else {
            $cart = new Cart();
            $cart->user_id = Auth::check() ? Auth::user()->id : null;
            $cart->shopping_session = $this->randStr();
            $cart->ip_address = $request->ip();
            $cart->product_quantity = $request->product_quantity;
            $cart->product_total = $request->product_total;
            $cart->extra_quantity = $request->extra_quantity;
            $cart->extra_total = $request->extra_total;
            $cart->cart_quantity = (int)$request->product_quantity + (int)$request->extra_quantity;
            $cart->cart_total = (int)$request->product_total + (int)$request->extra_total;
            $cart->save();
            /*  */
            $cartitem = new CartItem();
            $cartitem->user_id = Auth::check() ? Auth::user()->id : null;
            $cartitem->cart_id = $cart->id;
            $cartitem->product_id = $request->product_id;
            $cartitem->product_name =$request->product_name;
            $cartitem->product_quantity = $request->product_quantity;
            $cartitem->product_unit_price = $request->product_unit_price;
            $cartitem->product_total = $request->product_total;
            $cartitem->extra_name = $request->extra_name;
            $cartitem->extra_quantity = $request->extra_quantity;
            $cartitem->extra_total =   $request->extra_total;
            $cartitem->cartitem_quantity = (int)$request->product_quantity + (int)$request->extra_quantity;
            $cartitem->cartitem_total = (int)$request->product_total + (int)$request->extra_total;
            $cartitem->save();
        }

        return response()->json([
            'message' => 'Saved Successfully.',
            'cart' => new CartResource($cart),
            'cartitem' => new CartItemResource($cartitem),
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

            if(!empty($request->items)){
                for($i = 0; $i < count($request->items); $i++){
                    $item = new CartItem();
                    $item->cart_id = $cart->id;
                    $item->product_id = $request->items[$i]['id'];
                    $item->name = $request->items[$i]['name'];
                    $item->image = $request->items[$i]['image'];
                    $item->price = $request->items[$i]['price'];
                    $item->quantity = $request->items[$i]['quantity'];
                   
                    $item->created_at = now();
                    $item->updated_at = now();
                    $item->save();
                   
                }
            }

            return response()->json([
                'message' => 'Saved Successfully.',
                'data' => new CartResource($cart)
            ]);
        }
    }

    public function indexByShoppingSession(Request $request){
        $cart = Cart::where('shopping_session', $request->shopping_session)->first();
        if(isset($cart)){
            $cartitems = CartItem::where('cart_id', $cart->id)->get();
            return response()->json([
                'cart' => new CartResource($cart),
                'cartitems' => CartItemResource::collection($cartitems),
            ]);
        }
        return response()->json([
            'message' => 'Cart is empty.',
        ]);

    }

    public function cartCheckout(Request $request){
        $cart = Cart::where('shopping_session', $request->shopping_session)->first();
        //$cartitems = CartItem::where('cart_id', $cart->id)->get();

        return response()->json([
            'cart' => new CartResource($cart),
            //'cartitems' => CartItemResource::collection($cartitems),
        ]);
    }
 
    

    public function deleteCartItem(Request $request){
        if(!empty($request->id && !empty($request->cart_id))){
            $cartitem = CartItem::where('id', $request->id)
                        ->where('cart_id', $request->cart_id)
                        ->first();
            $cart = Cart::where('id', $request->cart_id)->first();
            $cart->product_quantity -= $cartitem->product_quantity;
            $cart->product_total -= $cartitem->product_total;
            $cart->extra_quantity -= $cartitem->extra_quantity;
            $cart->extra_total -= $cartitem->extra_total;
            $cart->cart_total -= $cartitem->cartitem_total;
            $cart->save();
            CartItem::where('id', $request->id)->delete();

            return response()->json([
                'message' => 'Deleted successfully.',
            ]);
        }
    }
}
