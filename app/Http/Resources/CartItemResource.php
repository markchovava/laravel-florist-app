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
            'product_name' => $this->product_name,
            'product_quantity' => $this->product_quantity,
            'product_unit_price' => $this->product_unit_price,
            'product_total' => $this->product_total,
            'extra_name' => $this->extra_name,
            'extra_quantity' => $this->extra_quantity,
            'extra_total' => $this->extra_total,
            'cartitem_total' => $this->cartitem_total,
            'cartitem_quantity' => $this->cartitem_quantity,
            'created_at' => $this->created_at->format('d M Y H:i a'),
            'updated_at' => $this->updated_at->format('d M Y H:i a'),
            'product' => new ProductResource($this->whenLoaded('product')),
            'cart' => new CartResource($this->whenLoaded('cart')),
            'user' => new UserResource($this->whenLoaded('user')),
        ];
    }
}
