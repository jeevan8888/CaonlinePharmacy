<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Cart extends Model
{
    use HasFactory;

    protected $fillable = [
        'product_id',
        'quantity',
        'cart_count',
        'per_price',
        'total_price',
        'product_name',
        'image_url',
    ];

    // Define relationships if needed
    public function price()
    {
        return $this->belongsTo(Price::class);
    }
    public function product()
    {
        return $this->belongsTo(Product::class);
    }
}