<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Venta extends Model
{


    public function CajaVenta()
    {
        return $this->hasOne(CajaVenta::class);
    }
    public function VentaInventarios()
    {
        return $this->hasMany(VentaInventario::class);
    }
}
