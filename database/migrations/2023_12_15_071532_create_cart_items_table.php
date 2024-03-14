<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('cart_items', function (Blueprint $table) {
            $table->id();
            $table->bigInteger('user_id')->nullable();
            $table->bigInteger('cart_id')->nullable();
            $table->bigInteger('product_id')->nullable();
            $table->string('product_name')->nullable();
            $table->bigInteger('product_quantity')->nullable();
            $table->bigInteger('product_unit_price')->nullable();
            $table->bigInteger('product_total')->nullable();
            $table->string('extra_name')->nullable();
            $table->bigInteger('extra_quantity')->nullable();
            $table->bigInteger('extra_total')->nullable();
            $table->bigInteger('cartitem_quantity')->nullable();
            $table->bigInteger('cartitem_total')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('cart_items');
    }
};
