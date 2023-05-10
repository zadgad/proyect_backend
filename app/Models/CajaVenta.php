<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class CajaVenta extends Model
{
    public function Caja()
    {
        return $this->belongsTo(Caja::class);
    }
}
