<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class CartResource extends JsonResource
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
            'shopping_session' => $this->shopping_session,
            'ip_address' => $this->ip_address,
            'product_quantity' => $this->product_quantity,
            'product_total' => $this->product_total,
            'product_option_total' => $this->product_option_total,
            'product_option_quantity' => $this->product_option_quantity,
            'grandtotal' => $this->grandtotal,
            'created_at' => $this->created_at->format('d M Y H:i a'),
            'updated_at' => $this->updated_at->format('d M Y H:i a'),
            'user' => new UserResource($this->whenLoaded('user')),
            'cart_items' => CartItemResource::collection($this->whenLoaded('cart_items')),
        ];
    }
}
