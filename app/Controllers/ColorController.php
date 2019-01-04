<?php

namespace Cart\Controllers;

use Slim\Views\Twig;
use Cart\Models\Color;
use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;



class ColorController
{
        public function get(Request $request, Response $response, Twig $view, Router $router, Color $color)
    {
        $colors = $color->get();


        return $view->render($response, 'products/product.twig', [
                        'colors' => $colors,
        ]);
    }

}