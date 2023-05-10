<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Compra extends Model
{
    public function CajaCompra()
    {
        return $this->hasOne(CajaCompra::class);
    }
    public function CompraInventarios()
    {
        return $this->hasMany(CompraInventario::class);
    }
}
