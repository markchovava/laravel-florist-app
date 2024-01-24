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
        Schema::create('carts', function (Blueprint $table) {
            $table->id();
            $table->bigInteger('user_id')->nullable();
            $table->longText('shopping_session')->nullable();
            $table->string('ip_address')->nullable();
            $table->integer('product_option_quantity')->nullable();
            $table->bigInteger('product_option_total')->nullable();
            $table->integer('product_quantity')->nullable();
            $table->integer('product_total')->nullable();
            $table->bigInteger('grandtotal')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('carts');
    }
};
