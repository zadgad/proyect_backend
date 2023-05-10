<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class VentaInventario extends Model
{
    public function Venta()
    {
        return $this->belongsTo(Venta::class);
    }
    public function Inventario()
    {
        return $this->belongsTo(Inventario::class);
    }
}
