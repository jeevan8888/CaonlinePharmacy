<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;

class Product extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable;
    protected $table = 'products';
    protected $fillable = [
        'product_name',
        'category_name',
        'min_price',
        'max_price',
        'description',
        'delivery_data',
        'amount',
        'image_url',
        'category_id',
    ];
    public function category()
    {
        return $this->belongsTo(Category::class);
    }
}