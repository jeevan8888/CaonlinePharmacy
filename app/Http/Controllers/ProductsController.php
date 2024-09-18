<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Product;
use App\Models\Rate;
use Illuminate\Support\Facades\DB;

class ProductsController extends Controller
{
    public function getProducts(Request $request)
    {
        $products = Product::all();
        return response()->json([$products]);
    }
    public function getTopRatedProducts(){
        $topReview=Rate::orderBy("average_ratingmark","desc")->limit(3)->get();
        $products = [];
        foreach ($topReview as $topReviewProducts){
            $product_menu = Product::find($topReviewProducts->product_id);
            if($product_menu)
                $products[] = $product_menu;
        }
        return response()->json([$topReview, $products]);
    }
    public function getFilterProducts(Request $request){
        try {
            $category = $request->input('category_name');
            $min = (float)$request->input('min_price');
            $max = (float)$request->input('max_price');
            $products = Product::where('category_name', $category)
                                ->where('min_price', '>=', $min)
                                ->where('max_price', '<=', $max)
                                ->get();
            return response()->json($products);
        } catch (\Exception $e) {
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }
    public function viewProducts(Request $request){
        try {
            $itemsPerPage = $request->input('itemsPerPage', 10); // Default items per page is 10
            $page = $request->input('page', 1); // Default page is 1
            $category_name = $request->input('category_name'); // Category name
    
            // Query to fetch products based on category and pagination parameters
            $query = Product::query();
            if ($category_name) {
                $query->where('category_name', $category_name);
            }
            // \Log::info('Received itemsPerPage: ' . $itemsPerPage);
            // \Log::info('Received page: ' . $page);
            // \Log::info('Received category_name: ' . $category_name);

            // Calculate the total number of pages based on the number of products per page and category
            $totalProducts = $query->count();
            $totalPages = ceil($totalProducts / $itemsPerPage);
    
            // Validate if the requested page is within bounds
            if ($page > $totalPages || $page < 1) {
                return response()->json(['error' => 'Invalid page number'], 400);
            }
            // \Log::info('Received itemsPerPage: ' . $itemsPerPage);
            // \Log::info('Received page: ' . $page);
            // \Log::info('Received category_name: ' . $category_name);

            // Adjust the offset based on the current page number
            $offset = ($page - 1) * $itemsPerPage;
    
            // Fetch products based on the category and pagination parameters
            $products = $query->skip($offset)
                              ->take($itemsPerPage)
                              ->get();
    
            return response()->json([
                'category_name' => $category_name,
                'products' => $products,
                'currentPage' => $page,
                'totalPages' => $totalPages,
                'itemsPerPage' => $itemsPerPage
            ]);
        } catch (\Exception $e) {
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }
    public function getrelatedProducts(Request $request)
    {
        try {
            // Retrieve the selected product details from the request query parameters
            $selectedProductID = $request->input('selected_product_id');

            // Retrieve the selected product
            $selectedProduct = Product::where('id', $selectedProductID)->first();

            // Check if the selected product exists
            if (!$selectedProduct) {
                return response()->json(['error' => 'Selected product not found'], 404);
            }
            //\Log::info('Received selectedProductID: ' . $selectedProductID);
            // Get the category ID of the selected product
            $categoryId = $selectedProduct->category_id;

            // Retrieve a random product in the specified category (excluding the selected product)
            $randomProduct = Product::where('category_id', $categoryId)
                ->where('id', '!=', $selectedProductID)
                ->inRandomOrder()
                ->first();

            // Retrieve other products in the same category (excluding the selected product)
            $relatedProducts = Product::where('category_id', $categoryId)
                ->where('id', '!=', $selectedProductID)
                ->take(5)->get();

            return response()->json([
                'selected_product' => $selectedProduct,
                'related_products' => $relatedProducts
            ]);
        } catch (\Exception $e) {
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }
}