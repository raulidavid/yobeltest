<?php

namespace App\Models;

use Illuminate\Notifications\Notifiable;

class Pedidos 
{

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'id',
        'code',
        'client',
    ];

}
