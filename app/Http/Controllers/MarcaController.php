<?php

namespace App\Http\Controllers;

use App\Models\Marca;
use Illuminate\Http\Request;

class MarcaController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return Marca::where('estado', 1)->get();
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $Marca = new Marca();
        $Marca->nombre = $request->nombre;

        $Marca->save();
        return $Marca;
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Marca  $Marca
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $Marca = Marca::find($id);
        return $Marca;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Marca  $Marca
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $Marca = Marca::find($id);
        $Marca->nombre = $request->nombre;

        $Marca->save();
        return $Marca;
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Marca  $Marca
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $Marca = Marca::find($id);
        $Marca->estado=0;
        $Marca->save();
        return $Marca;
    }
}
