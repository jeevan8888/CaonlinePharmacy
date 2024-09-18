<?php

use App\Http\Controllers\API\Admin\AdminController;

use App\Http\Controllers\API\Organization\AuthController as OrgAuthController;

use App\Http\Controllers\API\AuthController;
use App\Http\Controllers\ProductsController;
use App\Http\Controllers\API\Organization\UserController as OrgUserController;
use App\Http\Controllers\API\Organization\MemberController;
use App\Http\Controllers\ReviewController;
use App\Http\Controllers\CartController;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use Laravel\Sanctum\Http\Middleware\EnsureFrontendRequestsAreStateful;
use App\Http\Controllers\Admin\ProductController;
use App\Http\Controllers\Admin\UserController;
use App\Http\Controllers\HomeController;

Route::middleware('api')->group(function () {
    // Your API routes here
})->middleware([EnsureFrontendRequestsAreStateful::class]);

Route::get('/get-products', [ProductsController::class, 'getProducts']);
Route::post('/submit-review', [ReviewController::class, 'submitReview']);
Route::post('/view-products', [ProductsController::class, 'viewProducts']);
Route::get('/get-top-rated-products',[ProductsController::class, 'getTopRatedProducts']);
Route::post('/get-filter-products',[ProductsController::class, 'getFilterProducts']);

// Route::get('/products/{productId}/related', [ProductController::class, 'getRelatedProducts']);
//Route::get('/products/category/{categoryId}/related', [ProductsController::class, 'randomProductInRandomCategory']);
//Route::get('/products/category/{categoryId}/related', [ProductsController::class, 'productsInSameCategory']);
//Route::get('/products/random/{categoryId}', [ProductsController::class, 'randomProductInRandomCategory']);
Route::post('/products/random', [ProductsController::class, 'getrelatedProducts']);


Route::post('/add-to-cart', [CartController::class, 'addToCart']);
Route::get('/view-cart', [CartController::class, 'viewCart']);

Route::prefix('admin')->group(function () {
    Route::get('/users', [UserController::class, 'index']); // GET /admin/users
    Route::get('/users/{id}', [UserController::class, 'show']); // GET /admin/users/{id}
    Route::post('/users', [UserController::class, 'store']); // POST /admin/users
    Route::put('/users/{user}', [UserController::class, 'update']); // PUT /admin/users/{user}
    Route::delete('/users/{user}', [UserController::class, 'destroy']); // DELETE /admin/users/{user}
});

Route::prefix('admin')->group(function () {
    Route::get('/products', [ProductController::class, 'index']); // GET /admin/products
    Route::get('/products/{id}', [ProductController::class, 'show']); // GET /admin/products/{id}
    Route::post('/products', [ProductController::class, 'store']); // POST /admin/products
    Route::put('/products/{product}', [ProductController::class, 'update']); // PUT /admin/products/{product}
    Route::delete('/products/{product}', [ProductController::class, 'destroy']); // DELETE /admin/products/{product}
});

Route::group(['middleware' => 'guest'], function () {
    Route::post('/register', [AuthController::class, 'registerPost'])->name('register');
    Route::post('/login', [AuthController::class, 'loginPost'])->name('login');
});

// Authenticated routes
Route::group(['middleware' => 'auth'], function () {
    Route::get('/home', [HomeController::class, 'index'])->name('home');
    Route::post('/logout', [AuthController::class, 'logout'])->name('logout'); // Typically POST for logout in APIs
});

// Log viewer route (consider if this should be exposed in an API context)
Route::get('logs', '\Rap2hpoutre\LaravelLogViewer\LogViewerController@index')->middleware('auth:api');