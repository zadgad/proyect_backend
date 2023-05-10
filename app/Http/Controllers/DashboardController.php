<?php

namespace App\Http\Controllers;
use App\Models\CajaCompra;
use App\Models\CajaVenta;
use App\Models\CajaMovimiento;
use Illuminate\Http\Request;

class DashboardController extends Controller
{
    public function index()
    {
        $ingresos = CajaMovimiento::where('tipo', 1)->where('estado',1)->sum('monto');
        $egresos = CajaMovimiento::where('tipo', 2)->where('estado',1)->sum('monto');
        $monto_ventas = CajaVenta::where('estado',1)->sum('monto');
        $monto_compras = CajaCompra::where('estado',1)->sum('monto');
        return [
            'ingresos' => $ingresos,
            'egresos' => $egresos,
            'monto_ventas' => $monto_ventas,
            'monto_compras' => $monto_compras,

        ];
    }
}
