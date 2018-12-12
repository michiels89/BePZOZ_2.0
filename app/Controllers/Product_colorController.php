<?php

namespace Cart\Controllers;

use Slim\Views\Twig;
use Cart\Models\Product_color;
use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;



class Product_colorController
{
        public function get(Request $request, Response $response, Twig $view, Router $router, Product_color $product_color)
    {
        $products_color = $product_color->get();


        return $view->render($response, 'products/product.twig', [
                        'products_color' => $products_color,
        ]);
    }

}