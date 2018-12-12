<?php

namespace Cart\Controllers;

use Slim\Views\Twig;
use Cart\Models\Product;
use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;



class ContactController
{
    
    public function index(Request $request, Response $response, Twig $view)
    {
        
     return $view->render($response,'contact/index.twig');
    }
    
    public function send(Request $request, Response $response, Twig $view)
    {
            $to = "michiels89@hotmail.com";
            $from = $request->getParam('email');
            $name = $request->getParam('name');
            $csubject = $request->getParam('subject');
            $number = $request->getParam('number');
            $cmessage = $request->getParam('message');

            $headers = "From: $from";
            $headers = "From: " . $from . "\r\n";
            $headers .= "Reply-To: ". $from . "\r\n";
            $headers .= "MIME-Version: 1.0\r\n";
            $headers .= "Content-Type: text/html; charset=ISO-8859-1\r\n";

            $subject = "You have a message from your Creative Agency.";

            $logo = 'http://wethemez.com/test-html/consultplus/img/logo-black.png';
            $link = '#';

            $body = "<!DOCTYPE html><html lang='en'><head><meta charset='UTF-8'><title>Express Mail</title></head><body>";
            $body .= "<table style='width: 100%;'>";
            $body .= "<thead style='text-align: center;'><tr><td style='border:none;' colspan='2'>";
            $body .= "<a href='{$link}'><img src='{$logo}' alt=''></a><br><br>";
            $body .= "</td></tr></thead><tbody><tr>";
            $body .= "<td style='border:none;'><strong>Name:</strong> {$name}</td>";
            $body .= "<td style='border:none;'><strong>Email:</strong> {$from}</td>";
            $body .= "</tr>";
            $body .= "<tr><td style='border:none;'><strong>Subject:</strong> {$csubject}</td></tr>";
            $body .= "<tr><td></td></tr>";
            $body .= "<tr><td colspan='2' style='border:none;'>{$cmessage}</td></tr>";
            $body .= "</tbody></table>";
            $body .= "</body></html>";
      

            mail($to, $subject, $body, $headers);
        return $view->render($response,'contact/index.twig');
    }
}