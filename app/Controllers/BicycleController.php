<?php

namespace Cart\Controllers;

use Slim\Views\Twig;
use Cart\Models\Product;
use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;



class BicycleController
{
    
    public function index(Request $request, Response $response, Twig $view, Product $product)
    {

        $products = $product->get();

     return $view->render($response,'bicycle.twig', [
         'products' => $products
                                                 
          ]);
    }
}