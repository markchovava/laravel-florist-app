<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class OrderUser extends Model
{
    use HasFactory;

    public $fillable = [
        'user_id',
        'order_id',
        'name',
        'first_name',
        'last_name',
        'address',
        'city',
        'country',
        'email',
        'phone',
        'created_at',
        'updated_at',
    ];

}
