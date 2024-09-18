<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Product;
use App\Models\Price;
use App\Models\Cart;

class CartController extends Controller
{
    // Add Product to Cart Function
    public function addToCart(Request $request)
    {
        try{
            $productId = $request->input('product_id');
            $quantity = $request->input('quantity');
            $cartCount = $request->input('cart_count');

            // Fetch product details from the products table
            $product = Product::find($productId);
            $price = $this->calculatePrice($product->id, $quantity); // Calculate price based on quantity

            // Add product to the cart table
            Cart::create([
                'product_id' => $productId,
                'quantity' => $quantity,
                'cart_count' => $cartCount,
                'per_price' => $price,
                'total_price' => round($price * $quantity * $cartCount * 1.1 / 11)*11, // Total price with 10% tax
                'image_url' => $product->image_url,
                'product_name' => $product->product_name,
            ]);

            return response()->json(['message' => 'Product added to cart successfully']);
        }catch (\Exception $e) {
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }

    // Calculate Price Function
    public function calculatePrice($productId, $quantity)
    {
        // Implementation goes here
        $price = Price::where('product_id', $productId)->first();
        if (!$price) {
            throw new \Exception("Price not found for product ID: $productId");
        }

        // Determine the appropriate price based on quantity
        if ($quantity >= 180) {
            return $price->per180;
        } elseif ($quantity >= 90) {
            return $price->per90;
        } elseif ($quantity >= 60) {
            return $price->per60;
        } elseif ($quantity >= 30) {
            return $price->per30;
        } elseif ($quantity >= 20) {
            return $price->per20;
        } else {
            return $price->per10;
        }
    }

    // Display Cart Information Function
    public function viewCart()
    {
        // Implementation goes here
        // Fetch cart items
        try{
            $cartItems = Cart::all();

            $totalPrice = 0;
            foreach ($cartItems as $item) {
                $totalPrice += $item->total_price;
            }
            return response()->json(['cartItems' => $cartItems, 'totalPrice' => $totalPrice], 200);
        }catch (\Exception $e) {
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }
}