<?php
namespace Cart\Models;

use Cart\Models\Order;

use Illuminate\Database\Eloquent\Model;

class Login extends Model
{
  protected $fillable = [
      
      'email',
      'name',
      'address',
      'city',
      'phone',
      'password',
  ];
//    public function orders()
//    {
//        return $this->hasMany(Order::class);
//    }

  
}