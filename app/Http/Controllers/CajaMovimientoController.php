<?php

namespace App\Http\Controllers;

use App\Models\CajaMovimiento;
use Illuminate\Http\Request;

class CajaMovimientoController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $CajaMovimiento = new CajaMovimiento();
        $CajaMovimiento->caja_id = $request->caja_id;
        $CajaMovimiento->tipo = $request->tipo;
        $CajaMovimiento->monto = $request->monto;
        $CajaMovimiento->motivo = $request->motivo;
        $CajaMovimiento->save();
        return $CajaMovimiento;
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\CajaMovimiento  $cajaMovimiento
     * @return \Illuminate\Http\Response
     */
    public function show(CajaMovimiento $cajaMovimiento)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\CajaMovimiento  $cajaMovimiento
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, CajaMovimiento $cajaMovimiento)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\CajaMovimiento  $cajaMovimiento
     * @return \Illuminate\Http\Response
     */
    public function destroy( $id)
    {
        $CajaMovimiento = CajaMovimiento::find($id);
        $CajaMovimiento->estado = 0;
        $CajaMovimiento->save();
    }
}
