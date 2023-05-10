<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class CajaCompra extends Model
{
    public function Caja()
    {
        return $this->belongsTo(Caja::class);
    }
    public function Compra()
    {
        return $this->belongsTo(Compra::class);
    }
}
