<?php

namespace App\Http\Controllers;

use App\Http\Resources\OrderItemResource;
use App\Models\OrderItem;
use Illuminate\Http\Request;

class OrderItemController extends Controller
{
    public function indexById($id){
        $data = OrderItem::with(['order_item_option'])
                ->where('order_id', $id)
                ->paginate(15);

        return OrderItemResource::collection($data);
    }
}
