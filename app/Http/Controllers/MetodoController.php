<?php

namespace App\Http\Controllers;

use App\Models\Metodo;
use Illuminate\Http\Request;

class MetodoController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return Metodo::where('estado', 1)->get();
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $Metodo = new Metodo();
        $Metodo->nombre = $request->nombre;

        $Metodo->save();
        return $Metodo;
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Metodo  $Metodo
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $Metodo = Metodo::find($id);
        return $Metodo;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Metodo  $Metodo
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $Metodo = Metodo::find($id);
        $Metodo->nombre = $request->nombre;

        $Metodo->save();
        return $Metodo;
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Metodo  $Metodo
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $Metodo = Metodo::find($id);
        $Metodo->estado=0;
        $Metodo->save();
        return $Metodo;
    }
}
