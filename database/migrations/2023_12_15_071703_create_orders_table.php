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
            $table->integer('is_agree')->nullable();
            $table->bigInteger('extra_quantity')->nullable();
            $table->bigInteger('extra_total')->nullable();
            $table->longText('message')->nullable();
            $table->string('delivery_name')->nullable();
            $table->integer('delivery_price')->nullable();
            $table->string('delivery_status')->nullable();
            $table->integer('product_quantity')->nullable();
            $table->integer('product_total')->nullable();
            $table->bigInteger('order_quantity')->nullable();
            $table->bigInteger('order_total')->nullable();
            $table->string('payment_method')->nullable();
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
