<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class AppInfo extends Model
{
    use HasFactory;

    public $fillable = [
        'user_id',
        'name',
        'description',
        'address',
        'phone',
        'email',
        'website',
        'whatsapp', 
        'facebook', 
        'twitter', 
        'instagram',
        'created_at',
        'updated_at',
    ];

    public function user(){
        return $this->belongsTo(User::class, 'user_id', 'id');
    }
}
