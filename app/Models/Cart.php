<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Cart extends Model
{
    use HasFactory;

    public $fillable = [
        'user_id',
        'shopping_session',
        'ip_address',
        'product_option_quantity',
        'product_option_total',
        'product_quantity',
        'product_total',
        'grandtotal',
        'created_at',
        'updated_at',
    ];

 
    public function user(){
        return $this->belongsTo(User::class, 'user_id', 'id');
    }

    public function cart_items(){
        return $this->hasMany(CartItem::class, 'cart_id', 'id');
    }
    
}
