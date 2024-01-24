<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class OrderItemOption extends Model
{
    use HasFactory;

    public $fillable = [
        'user_id',
        'order_id',
        'order_item_id',
        'product_option_id',
        'name',
        'price',
        'quantity',
        'total',
        'created_at',
        'updated_at',
    ];

    public function user(){
        return $this->belongsTo(User::class, 'user_id', 'id');
    }

    public function order(){
        return $this->belongsTo(Order::class, 'order_id', 'id');
    }
    public function order_item(){
        return $this->belongsTo(OrderItem::class, 'order_item_id', 'id');
    }

    public function product_option(){
        return $this->belongsTo(ProductOption::class, 'product_option_id', 'id');
    }


    
}
