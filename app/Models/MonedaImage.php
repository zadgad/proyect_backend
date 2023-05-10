<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class MonedaImage extends Model
{
    public $with = ['Image'];

    public function Image()
    {
        return $this->belongsTo(Image::class);
    }
}
