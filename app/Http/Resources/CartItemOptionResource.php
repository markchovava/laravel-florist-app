<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class CartItemOptionResource extends JsonResource
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
            'cart_item_id' => $this->cart_item_id,
            'product_option_id' => $this->product_option_id,
            'name' => $this->name,
            'price' => $this->price,
            'quantity' => $this->quantity,
            'total' => $this->total,
            'created_at' => $this->created_at->format('d M Y H:i a'),
            'updated_at' => $this->updated_at->format('d M Y H:i a'),
        ];
    }
}
