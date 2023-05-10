<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Moneda extends Model
{
    public function MonedaImage()
    {
        return $this->hasOne(MonedaImage::class);
    }
}
