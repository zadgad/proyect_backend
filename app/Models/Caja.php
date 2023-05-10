<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Caja extends Model
{
    public function CajaMovimientos()
    {
        return $this->hasMany(CajaMovimiento::class);
    }
    public function CajaCompras()
    {
        return $this->hasMany(CajaCompra::class);
    }
    public function CajaVentas()
    {
        return $this->hasMany(CajaVenta::class);
    }
    public function User()
    {
        return $this->belongsTo(User::class);
    }
}
