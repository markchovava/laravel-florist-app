<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AppInfoController;
use App\Http\Controllers\CartController;
use App\Http\Controllers\CartItemController;
use App\Http\Controllers\CategoryController;
use App\Http\Controllers\DeliveryController;
use App\Http\Controllers\ProductController;
use App\Http\Controllers\ProductCategoryController;
use App\Http\Controllers\ProductOptionController;
use App\Http\Controllers\RoleController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/', function () {

    return view('welcome');
});


Route::prefix('app-info')->group(function() {
    Route::get('/', [AppInfoController::class, 'index']);
});

Route::prefix('role')->group(function() {
    Route::get('/', [RoleController::class, 'index']);
    Route::get('/{id}', [RoleController::class, 'show']);
});

Route::prefix('product-category')->group(function() {
    Route::post('/', [ProductCategoryController::class, 'store']);
    Route::get('/{id}', [ProductCategoryController::class, 'show']);
});



Route::prefix('category')->group(function() {
    Route::get('/', [CategoryController::class, 'index']);
    Route::get('/one', [CategoryController::class, 'indexOne']);
    Route::get('/two', [CategoryController::class, 'indexTwo']);
    Route::get('/{id}', [CategoryController::class, 'show']);
});

Route::prefix('product')->group(function() {
    Route::get('/', [ProductController::class, 'index']);
    Route::get('/four', [ProductController::class, 'indexFour']);
    Route::get('/{id}', [ProductController::class, 'show']);
});

Route::prefix('cart')->group(function() {
    Route::get('/', [CartController::class, 'index']);
    Route::post('/', [CartController::class, 'store']);
    Route::get('/checkout', [CartController::class, 'cartCheckout']);
    Route::post('/all', [CartController::class, 'storeAll']);
});

Route::prefix('cart-item')->group(function() {
    Route::get('/by-cart-id', [CartItemController::class, 'indexByCartId']);
    Route::delete('/{id}', [CartItemController::class, 'delete']);
});

Route::prefix('delivery')->group(function() {
    Route::get('/', [DeliveryController::class, 'index']);
    Route::delete('/{id}', [DeliveryController::class, 'show']);
});


Route::prefix('product-option')->group(function() {
    Route::get('/', [ProductOptionController::class, 'index']);
    Route::get('/four', [ProductOptionController::class, 'indexFour']);
    Route::get('/all', [ProductOptionController::class, 'indexAll']);
    Route::get('/{id}', [ProductOptionController::class, 'show']);
});
