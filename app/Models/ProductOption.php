<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ProductOption extends Model
{
    use HasFactory;

    public $fillable = [
        'user_id',
        'name',
        'description',
        'price',
        'created_at',
        'updated_at',
    ];


    public function user(){
        return $this->belongsTo(User::class, 'user_id', 'id');
    }

    public function cart_item_product_options(){
        return $this->hasMany(CartItemOption::class, 'product_option_id', 'id');
    }

    public function order_item_product_options(){
        return $this->hasMany(OrderItemOption::class, 'product_option_id', 'id');
    }

}
