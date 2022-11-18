<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class PedidosController extends Controller
{
    public function getPedidos(){
        $pedidos = [
            [
                'id' => '1',
                'code' => 'EC001',
                'client' => 'raulidavid@gmail.com'
            ],
            [
                'id' => '2',
                'code' => 'EC002',
                'client' => 'eduardocastro@hotmail.com'
            ],
            [
                'id' => '3',
                'code' => 'EC003',
                'client' => 'jonathanchavez@yahoo.com'
            ],
            [
                'id' => '4',
                'code' => 'EC004',
                'client' => 'gabrielaortega@gmail.com'
            ],
            
        ];
        $reponse = json_encode($pedidos);
        return response()->json($pedidos,200);
    }

    public function savePedidos(){
        return response()->json(["message" => "Pedido Guardado Exitosamente"],200);
    }
}
