<?php

namespace App\Http\Resources;

use App\Models\CartItemOption;
use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class CartItemResource extends JsonResource
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
            'cart_id' => $this->cart_id,
            'product_id' => $this->product_id,
            'name' => $this->name,
            'image' => $this->image,
            'quantity' => $this->quantity,
            'price' => $this->price,
            'total' => $this->total,
            'grandtotal' => $this->grandtotal,
            'created_at' => $this->created_at->format('d M Y H:i a'),
            'updated_at' => $this->updated_at->format('d M Y H:i a'),
            'product' => new ProductResource($this->whenLoaded('product')),
            'cart_item_option' => new CartItemOptionResource($this->whenLoaded('cart_item_option')),
        ];
    }
}
