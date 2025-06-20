<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class ProductResource extends JsonResource
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
            'description' => $this->description,
            'price' => $this->price,
            'priority' => $this->priority,
            'image' => $this->image,
            'thumbnail' => $this->thumbnail,
            'categories' => CategoryResource::collection(($this->whenLoaded('categories'))),
            'user' => new UserResource($this->whenLoaded('user')),
            'created_at' => $this->created_at->format('d M Y H:i a'),
            'updated_at' => $this->updated_at->format('d M Y H:i a'),
        ];
    }
}
