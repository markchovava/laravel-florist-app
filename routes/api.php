<?php

use App\Http\Controllers\AppInfoController;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\CategoryController;
use App\Http\Controllers\DeliveryController;
use App\Http\Controllers\CartController;
use App\Http\Controllers\OrderController;
use App\Http\Controllers\OrderItemController;
use App\Http\Controllers\ProductCategoryController;
use App\Http\Controllers\ProductController;
use App\Http\Controllers\ProductOptionController;
use App\Http\Controllers\RoleController;
use App\Http\Controllers\UserController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

/* Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
}); */

Route::post('/login', [AuthController::class, 'login']);
Route::post('/register', [AuthController::class, 'register']);


Route::prefix('cart')->group(function() {
    Route::get('/', [CartController::class, 'index']);
    Route::post('/', [CartController::class, 'store']);
});

Route::group(['middleware' => ['auth:sanctum']], function() {
    Route::get('/logout', [AuthController::class, 'logout']);
    Route::get('/profile', [AuthController::class, 'profile']);
    Route::post('/profile', [AuthController::class, 'profileUpdate']);
    Route::post('/password', [AuthController::class, 'password']);

    Route::prefix('app-info')->group(function() {
        Route::get('/', [AppInfoController::class, 'index']);
        Route::post('/', [AppInfoController::class, 'update']);
    });

    Route::prefix('user')->group(function() {
        Route::get('/', [UserController::class, 'index']);
        Route::post('/', [UserController::class, 'store']);
        Route::get('/{id}', [UserController::class, 'show']);
        Route::post('/{id}', [UserController::class, 'update']);
        Route::delete('/{id}', [UserController::class, 'delete']);
    });

    Route::prefix('delivery')->group(function() {
        Route::get('/', [DeliveryController::class, 'index']);
        Route::post('/', [DeliveryController::class, 'store']);
        Route::get('/{id}', [DeliveryController::class, 'show']);
        Route::post('/{id}', [DeliveryController::class, 'update']);
        Route::delete('/{id}', [DeliveryController::class, 'delete']);
    });

    Route::prefix('role')->group(function() {
        Route::get('/', [RoleController::class, 'index']);
        Route::post('/', [RoleController::class, 'store']);
        Route::get('/{id}', [RoleController::class, 'show']);
        Route::post('/{id}', [RoleController::class, 'update']);
        Route::delete('/{id}', [RoleController::class, 'delete']);
    });

    Route::prefix('product')->group(function() {
        Route::get('/', [ProductController::class, 'index']);
        Route::post('/', [ProductController::class, 'store']);
        Route::get('/{id}', [ProductController::class, 'show']);
        Route::put('/{id}', [ProductController::class, 'update']);
        Route::post('/{id}', [ProductController::class, 'update']);
        Route::delete('/{id}', [ProductController::class, 'delete']);
    });

    Route::prefix('product-option')->group(function() {
        Route::get('/', [ProductOptionController::class, 'index']);
        Route::get('/all', [ProductOptionController::class, 'indexAll']);
        Route::post('/', [ProductOptionController::class, 'store']);
        Route::get('/{id}', [ProductOptionController::class, 'show']);
        Route::put('/{id}', [ProductOptionController::class, 'update']);
        Route::post('/{id}', [ProductOptionController::class, 'update']);
        Route::delete('/{id}', [ProductOptionController::class, 'delete']);
    });

    Route::prefix('product-category')->group(function() {
        Route::post('/', [ProductCategoryController::class, 'store']);
        Route::get('/{id}', [ProductCategoryController::class, 'show']);
        Route::delete('/{id}', [ProductCategoryController::class, 'delete']);
    });

    Route::prefix('category')->group(function() {
        Route::get('/', [CategoryController::class, 'index']);
        Route::post('/', [CategoryController::class, 'store']);
        Route::get('/{id}', [CategoryController::class, 'show']);
        Route::put('/{id}', [CategoryController::class, 'update']);
        Route::delete('/{id}', [CategoryController::class, 'delete']);
    });

    Route::prefix('order')->group(function() {
        Route::get('/', [OrderController::class, 'index']);
        Route::get('/by-user', [OrderController::class, 'showByUserId']);
        Route::post('/', [OrderController::class, 'store']);
        Route::post('/all', [OrderController::class, 'storeAll']);
        Route::get('/product', [OrderController::class, 'searchProductByName']);
        Route::get('/{id}', [OrderController::class, 'show']);
        Route::post('/delivery/{id}', [OrderController::class, 'deliveryUpdate']);
        Route::delete('/{id}', [OrderController::class, 'delete']);
    });


    Route::prefix('order-item')->group(function() {
        Route::get('/items/{id}', [OrderItemController::class, 'indexById']);
    });


});







