<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Review extends Model
{
    use HasFactory;
    public $timestamps = false;
    protected $table = 'review';
    protected $fillable = [
        'email',
        'rating_mark',
        'review_content',
        'product_id',
    ];
}