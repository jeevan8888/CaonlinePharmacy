<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Rate extends Model
{
    use HasFactory;
    protected $table = 'rate';
    public $timestamps = false;
    protected $fillable = [
        'product_id',
        'average_ratingmark',
    ];
}