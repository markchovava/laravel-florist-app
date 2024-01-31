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
            'product_option_total' => $this->product_option_total,
            'product_option_quantity' => $this->product_option_quantity,
            'grandtotal' => $this->grandtotal,
            'user' => new UserResource($this->whenLoaded('user')),
            'order_user' => new OrderUserResource($this->whenLoaded('order_user')),
            'order_items' => OrderItemResource::collection($this->whenLoaded('order_items')),
            'order_item_options' => OrderItemOptionResource::collection($this->whenLoaded('order_item_options')),
            'updated_at' => $this->updated_at->format('d M Y H:i a'),
            'created_at' => $this->created_at->format('d M Y H:i a'),
        ];
    }
}
