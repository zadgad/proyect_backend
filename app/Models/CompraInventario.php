<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class CompraInventario extends Model
{
    public function Compra()
    {
        return $this->belongsTo(Compra::class);
    }
    public function Inventario()
    {
        return $this->belongsTo(Inventario::class);
    }
}
