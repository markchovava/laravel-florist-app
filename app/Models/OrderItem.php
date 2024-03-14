<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class OrderItem extends Model
{
    use HasFactory;

    public $fillable = [
        'id',
        'user_id',
        'order_id',
        'product_id',
        'product_name',
        'product_quantity',
        'product_unit_price',
        'product_total',
        'orderitem_quantity',
        'orderitem_total',
        'extra_name',
        'extra_quantity',
        'extra_total',
        'created_at',
        'updated_at',
    ];


    public function user(){
        return $this->belongsTo(User::class, 'user_id', 'id');
    }

    public function product(){
        return $this->belongsTo(Product::class, 'product_id', 'id');
    }
    
    public function order(){
        return $this->belongsTo(Order::class, 'order_id', 'id');
    }


}
