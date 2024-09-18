<?php

namespace App\Http\Controllers;

use App\Models\Review;
use App\Models\Rate;
use App\Models\Product;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class ReviewController extends Controller
{
    public function submitReview(Request $request)
    {
        $validatedData = $request->validate([
            'product_id' => 'required|integer',
            'email' => 'required|email',
            'rating_mark' => 'required|integer|min:1|max:5',
            'review_content' => 'required|string',
        ]);
        try{
            $review=new Review();
            $review->product_id=$validatedData['product_id'];
            $review->email=$validatedData['email'];
            $review->rating_mark=$validatedData['rating_mark'];
            $review->review_content=$validatedData['review_content'];
            $review->save();

            // Update or create the rate record for the product
            $topratedproducts = Review::select('product_id', DB::raw('AVG(rating_mark) as avg_ratingmark'))->groupBy('product_id')->get();
            foreach ($topratedproducts as $rate){
                Rate::updateOrCreate(
                    ['product_id' => $rate->product_id],
                    ['average_ringmark' => $rate->avg_ratingmark],
                );
            }
            return response()->json([$topratedproducts]);
        }catch(\Exception $e){
            return response()->json(['message'=>$e->getMessage()],500);
        }
    }
}