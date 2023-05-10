<?php

namespace App\Http\Controllers;

use App\Models\Moneda;
use App\Models\MonedaImage;
use App\Models\Image;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
class MonedaController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $monedas = Moneda::with(['MonedaImage'])->where('estado', 1)->get();
        $list = [];
        foreach ($monedas as $moneda) {
            $list[] = $moneda;
        }
        return $list;
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $imagen = $request->file('file')->store('public/monedas');
        $url = Storage::url($imagen);

        $file = new Image;
        $file->path =  $url;

        $file->save();
        $moneda = new Moneda;
        $moneda->monto =  $request->valor;

        $moneda->save();
        $monedaImage = new MonedaImage;
        $monedaImage->image_id =  $file->id;
        $monedaImage->moneda_id =  $moneda->id;

        $monedaImage->save();
        return $moneda;
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Moneda  $moneda
     * @return \Illuminate\Http\Response
     */
    public function show(Moneda $moneda)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Moneda  $moneda
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Moneda $moneda)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Moneda  $moneda
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $moneda = Moneda::find($id);
        $moneda->estado = 0;
        $moneda->save();
    }
}
