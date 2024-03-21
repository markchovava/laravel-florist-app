<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Category extends Model
{
    use HasFactory;

    protected $fillable = [
        'id',
        'user_id',
        'name',
        'slug',
        'description',
        'priority',
        'created_at',
        'updated_at',
    ];


    public function user(){
        return $this->belongsTo(User::class, 'user_id', 'id');
    }

    public function products(){
        return $this->belongsToMany(Product::class, 'product_categories', 'category_id', 'product_id')
            ->withTimestamps();
    }

    public function productsPaginated(){
        return $this->belongsToMany(Product::class, 'product_categories', 'category_id', 'product_id')
                ->with('product')
                ->paginated(12);
    }
    
}
