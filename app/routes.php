<?php

$app->get('/', ['Cart\Controllers\HomeController','index'])->setName('home');


$app->get('/products/{slug}', ['Cart\Controllers\ProductController','get'])->setName('product.get');

$app->get('/products_color', ['Cart\Controllers\Product_colorController','get'])->setName('product_color.get');

$app->get('/colors', ['Cart\Controllers\ColorController','get'])->setName('color.get');


$app->get('/cart', ['Cart\Controllers\CartController', 'index'])->setName('cart.index');

$app->get('/cart/add/{slug}/{quantity}', ['Cart\Controllers\CartController', 'add'])->setName('cart.add');

$app->post('/cart/update/{slug}', ['Cart\Controllers\CartController', 'update'])->setName('cart.update');


$app->get('/order', ['Cart\Controllers\OrderController', 'index'])->setName('order.index');

$app->get('/order/{hash}', ['Cart\Controllers\OrderController', 'show'])->setName('order.show');

$app->post('/order', ['Cart\Controllers\OrderController', 'create'])->setName('order.create');


$app->get('/braintree/token', ['Cart\Controllers\BraintreeController', 'token'])->setName('braintree.token');


$app->get('/login', ['Cart\Controllers\LoginController', 'index'])->setName('login.index');

$app->get('/atHome', ['Cart\Controllers\AtHomeController', 'index'])->setName('atHome');

$app->get('/work', ['Cart\Controllers\WorkController', 'index'])->setName('work');

$app->get('/car', ['Cart\Controllers\CarController', 'index'])->setName('car');

$app->get('/bicycle', ['Cart\Controllers\BicycleController', 'index'])->setName('bicycle');


$app->get('/contact', ['Cart\Controllers\ContactController', 'index'])->setName('contact.index');

$app->post('/contact', ['Cart\Controllers\ContactController', 'send'])->setName('contact.send');

