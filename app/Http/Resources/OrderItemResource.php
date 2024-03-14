<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class OrderItemResource extends JsonResource
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
            'order_id' => $this->order_id,
            'product_id' => $this->product_id,
            'product_name' => $this->product_name,
            'product_quantity' => $this->product_quantity,
            'product_unit_price' => $this->product_unit_price,
            'product_total' => $this->product_total,
            'orderitem_total' => $this->orderitem_total,
            'orderitem_quantity' => $this->orderitem_quantity,
            'extra_name' => $this->extra_name,
            'extra_quantity' => $this->extra_quantity,
            'extra_total' => $this->extra_total,
            'created_at' => $this->created_at->format('d M Y H:i a'),
            'updated_at' => $this->updated_at->format('d M Y H:i a'),
            'order' => new OrderResource($this->whenLoaded('order')),
            'user' => new UserResource($this->whenLoaded('user')),
            'product' => new ProductResource($this->whenLoaded('product')),
        ];
        
    }

   
}
