<?php

namespace App\Http\Controllers;

use App\Http\Resources\OrderItemResource;
use App\Models\OrderItem;
use Illuminate\Http\Request;

class OrderItemController extends Controller
{
    public function indexByOrderId($id){
        $data = OrderItem::where('order_id', $id)
                ->paginate(15);

        return OrderItemResource::collection($data);
    }
}
