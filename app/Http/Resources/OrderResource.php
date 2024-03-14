<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class OrderResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */

    public function toArray(Request $request): array
    {
        return [
            'id' => $this->id,
            'user_id' => $this->user_id,
            'order_no' => $this->order_no,
            'delivery_status' => $this->delivery_status,
            'delivery_name' => $this->delivery_name,
            'delivery_price' => $this->delivery_price,
            'product_quantity' => $this->product_quantity,
            'product_total' => $this->product_total,
            'extra_total' => $this->extra_total,
            'extra_quantity' => $this->extra_quantity,
            'is_agree' => $this->is_agree,
            'message' => $this->message,
            'order_quantity' => $this->order_quantity,
            'order_total' => $this->order_total,
            'user' => new UserResource($this->whenLoaded('user')),
            'order_user' => new OrderUserResource($this->whenLoaded('order_user')),
            'orderitems' => OrderItemResource::collection($this->whenLoaded('orderitems')),
            'updated_at' => $this->updated_at->format('d M Y H:i a'),
            'created_at' => $this->created_at->format('d M Y H:i a'),
        ];
    }
}
