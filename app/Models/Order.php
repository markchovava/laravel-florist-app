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
        'delivery_status',
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

    public function order_items(){
        return $this->hasMany(OrderItem::class, 'order_id', 'id');
    }

    public function order_item_options(){
        return $this->hasMany(OrderItemOption::class, 'order_id', 'id');
    }

    public function order_user(){
        return $this->hasOne(OrderUser::class, 'order_id', 'id');
    }
    
}
