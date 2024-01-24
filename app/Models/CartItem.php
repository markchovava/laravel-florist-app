<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CartItem extends Model
{
    use HasFactory;


    public $fillable = [
        'user_id',
        'cart_id',
        'product_id',
        'name',
        'image',
        'quantity',
        'price',
        'total',
        'grandtotal',
        'created_at',
        'updated_at',
    ];

    public function user(){
        return $this->belongsTo(User::class, 'user_id', 'id');
    }

    public function product(){
        return $this->belongsTo(Product::class, 'product_id', 'id');
    }
    
    public function cart(){
        return $this->belongsTo(User::class, 'cart_id', 'id');
    }

    public function cart_item_option(){
        return $this->hasOne(CartItemOption::class, 'cart_item_id', 'id');
    }

}
