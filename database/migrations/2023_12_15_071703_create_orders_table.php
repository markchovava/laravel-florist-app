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
        Schema::create('orders', function (Blueprint $table) {
            $table->id();
            $table->bigInteger('user_id')->nullable();
            $table->string('order_no')->nullable();
            $table->string('delivery_status')->nullable();
            $table->integer('product_quantity')->nullable();
            $table->integer('product_total')->nullable();
            $table->integer('product_option_quantity')->nullable();
            $table->integer('product_option_total')->nullable();
            $table->integer('grandtotal')->nullable();
            $table->timestamps();
        });
    }



    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('orders');
    }
};
