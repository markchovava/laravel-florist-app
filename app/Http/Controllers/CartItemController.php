<?php

namespace App\Http\Controllers;

use App\Http\Resources\CartItemResource;
use App\Models\Cart;
use App\Models\CartItem;
use App\Models\CartItemOption;
use Illuminate\Http\Request;

class CartItemController extends Controller
{

    public function indexByCartId(Request $request){
        $cart = Cart::where('shopping_session', $request->shopping_session)->first();
        $data = CartItem::with(['cart_item_option'])->where('cart_id', $cart->id)->get();

        return CartItemResource::collection($data);

    }

    public function delete($id){
        $data = CartItem::find($id);
        CartItemOption::where('cart_item_id', $id)->delete();
        $data->delete();

        return response()->json([
            'message' => 'Deleted Sucessfully.'
        ]);
    }
}
