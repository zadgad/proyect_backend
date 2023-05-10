<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Inventario extends Model
{

    public function Articulo()
    {
        return $this->belongsTo(Articulo::class);
    }
}
