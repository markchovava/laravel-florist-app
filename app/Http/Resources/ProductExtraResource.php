<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class ProductExtraResource extends JsonResource
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
            'name' => $this->name,
            'slug' => $this->slug,
            'quantity' => $this->quantity,
            'price' => $this->price,
            'created_at' => $this->created_at ? $this->created_at->format('d M Y H:i a') : null,
            'updated_at' => $this->updated_at ? $this->updated_at->format('d M Y H:i a') : null,
            'user' => new UserResource($this->whenLoaded('user')),
        ];
    }
}
