<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Cart extends Model
{
    use HasFactory;

    public $fillable = [
        'id',
        'user_id',
        'shopping_session',
        'ip_address',
        'product_total',
        'product_quantity',
        'extra_quantity',
        'extra_total',
        'cart_quantity',
        'cart_total',
        'created_at',
        'updated_at',
    ];

 
    public function user(){
        return $this->belongsTo(User::class, 'user_id', 'id');
    }

    public function cartitems(){
        return $this->hasMany(CartItem::class, 'cart_id', 'id');
    }
    
}
