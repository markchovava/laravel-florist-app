<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Order extends Model
{
    use HasFactory;

    public $fillable = [
        'user_id',
        'order_no',
        'order_quantity',
        'order_total',
        'delivery_name',
        'delivery_price',
        'delivery_status',
        'extra_total',
        'extra_quantity',
        'is_agree',
        'message',
        'product_quantity',
        'product_total',
        'created_at',
        'updated_at',
    ];


    public function user(){
        return $this->belongsTo(User::class, 'user_id', 'id');
    }

    public function orderitems(){
        return $this->hasMany(OrderItem::class, 'order_id', 'id');
    }

    public function order_user(){
        return $this->hasOne(OrderUser::class, 'order_id', 'id');
    }
    
}
