<?php

namespace Cart\Controllers;

use Slim\Views\Twig;
use Cart\Models\Product;
use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;



class AtHomeController
{
    
    public function index(Request $request, Response $response, Twig $view, Product $product)
    {

        $products = $product->get();
//        mail('michiels89@hotmail.com', 'test', 'mail', '1');

     return $view->render($response,'atHome.twig', [
         'products' => $products
                                                 
          ]);
    }
}