<?php

namespace App\Http\Middleware;

use Illuminate\Foundation\Http\Middleware\VerifyCsrfToken as Middleware;

class VerifyCsrfToken extends Middleware
{
    /**
     * The URIs that should be excluded from CSRF verification.
     *
     * @var array<int, string>
     */
    protected $except = [
        'http://127.0.0.1:8081/login/',
        'http://127.0.0.1:8081/register/',
        'http://127.0.0.1:8081/cart/',
        'http://127.0.0.1:8081/cart/*',
        'http://127.0.0.1:8081/cart/checkout',
        'http://127.0.0.1:8081/check-email',
        'http://127.0.0.1:8081/cart-item/*'
    ];
}
