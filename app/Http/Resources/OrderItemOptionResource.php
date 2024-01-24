<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class OrderItemOptionResource extends JsonResource
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
            'order_item_id' => $this->order_item_id,
            'product_option_id' => $this->product_option_id,
            'name' => $this->name,
            'quantity' => $this->quantity,
            'price' => $this->price,
            'total' => $this->total,
            'created_at' => $this->created_at->format('d M Y H:i a'),
            'updated_at' => $this->updated_at->format('d M Y H:i a'),
            'order' => new OrderResource($this->whenLoaded('order')),
            'user' => new UserResource($this->whenLoaded('user')),
            'product_option' => new ProductOptionResource($this->whenLoaded('product_option')),
        ];
    }
}
