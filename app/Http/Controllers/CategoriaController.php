<?php

namespace App\Http\Controllers;

use App\Models\Categoria;
use Illuminate\Http\Request;

class CategoriaController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return Categoria::where('estado', 1)->get();
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $Categoria = new Categoria();
        $Categoria->nombre = $request->nombre;

        $Categoria->save();
        return $Categoria;
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Categoria  $Categoria
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $Categoria = Categoria::find($id);
        return $Categoria;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Categoria  $Categoria
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $Categoria = Categoria::find($id);
        $Categoria->nombre = $request->nombre;

        $Categoria->save();
        return $Categoria;
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Categoria  $Categoria
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $Categoria = Categoria::find($id);
        $Categoria->estado=0;
        $Categoria->save();
        return $Categoria;
    }
}
