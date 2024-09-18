<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Product;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

class ProductController extends Controller
{
    public function index()
    {
        $products = Product::all();
        return response()->json($products);
    }
    public function show($id)
    {
        $product = Product::find($id);

        if (!$product) {
            return response()->json(['message' => 'Product not found'], 404);
        }

        return response()->json($product);
    }
    public function store(Request $request)
    {
        // $request->validate([
        //     'product_name' => 'required|string|max:255',
        //     'category_name' => 'required|string|max:255',
        //     'min_price' => 'required|numeric',
        //     'max_price' => 'required|numeric',
        //     'description' => 'nullable|string',
        //     'delivery_data' => 'nullable|string',
        //     'amount' => 'required|integer',
        //     'image_url' => 'required|image|mimes:jpeg,png,jpg,gif|max:2048',
        //     'category_id' => 'required|integer',
        // ]);
        if ($request->hasFile('image_url')) {
            $imagePath = $request->file('image_url')->store('images', 'public');
        }
        $product = Product::create($request->all());
        
        return response()->json($product, 201);
    }

    public function update(Request $request, Product $product)
    {
        // $request->validate([
        //     'product_name' => 'required|string|max:255',
        //     'category_name' => 'required|string|max:255',
        //     'min_price' => 'required|numeric',
        //     'max_price' => 'required|numeric',
        //     'description' => 'nullable|string',
        //     'delivery_data' => 'nullable|string',
        //     'amount' => 'required|integer',
        //     'image_url' => $imagePath ?? null,
        //     'category_id' => 'required|integer',
        // ]);

        $product->update($request->all());

        return response()->json($product);
    }

    public function destroy(Product $product)
    {
        $product->delete();
        return response()->json(null, 204);
    }
}