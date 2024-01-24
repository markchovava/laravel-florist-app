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
        Schema::create('cart_item_options', function (Blueprint $table) {
            $table->id();
            $table->bigInteger('user_id')->nullable();
            $table->bigInteger('cart_id')->nullable();
            $table->bigInteger('cart_item_id')->nullable();
            $table->bigInteger('product_option_id')->nullable();
            $table->string('name')->nullable();
            $table->integer('price')->nullable();
            $table->integer('quantity')->nullable();
            $table->integer('total')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('cart_item_options');
    }
};
