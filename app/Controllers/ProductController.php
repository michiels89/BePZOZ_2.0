<?php

namespace Cart\Controllers;


use Slim\Router;
use Cart\Models\Product;
use Cart\Models\Product_color;
use Cart\Models\Color;
use Slim\Views\Twig;
use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;

class ProductController
{

    public function get($slug, Request $request, Response $response, Twig $view, Router $router, Product $product, Product_color $product_color, Color $color)
    {
        $product = $product->where('slug', $slug)->first();
        $products_color = $product_color->get();
        $colors = $color->get();
        if(!$product){
            return $response->withRedirect($router->pathFor('home'));
        }
        
        return $view->render($response, 'products/product.twig', [
            
            'product' => $product,
            'products_color' => $products_color,
            'colors' => $colors,
        ]);
    }
}