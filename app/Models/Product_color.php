<?php
namespace Cart\Models;

use Illuminate\Database\Eloquent\Model;

class Product_color extends Model
{
   protected $fillable = [
       
       'colorId',
       'productId',

   ];
    
}