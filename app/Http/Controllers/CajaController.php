<?php namespace App\Http\Controllers;use App\Models\Caja;use Illuminate\Http\Request;use Illuminate\Support\Carbon;class CajaController extends Controller{/**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */ public function index(){}/**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */ public function store(Request $request){}/**
     * Display the specified resource.
     *
     * @param  \App\Models\Caja  $caja
     * @return \Illuminate\Http\Response
     */ public function show($id){$Caja=Caja::find($id);$Caja->movimientos=$Caja->CajaMovimientos()->where(base64_decode('ZXN0YWRv'),1)->orderBy(base64_decode('aWQ='),base64_decode('ZGVzYw=='))->get()->each(function($movimiento){$movimiento->fecha=date(base64_decode('ZC1tLVk='),strtotime($movimiento->created_at));});$Caja->ingresos=$Caja->CajaMovimientos()->where(base64_decode('dGlwbw=='),1)->where(base64_decode('ZXN0YWRv'),1)->sum(base64_decode('bW9udG8='));$Caja->egresos=$Caja->CajaMovimientos()->where(base64_decode('dGlwbw=='),2)->where(base64_decode('ZXN0YWRv'),1)->sum(base64_decode('bW9udG8='));$Caja->monto_ventas=$Caja->CajaVentas()->where(base64_decode('ZXN0YWRv'),1)->sum(base64_decode('bW9udG8='));$Caja->monto_compras=$Caja->CajaCompras()->where(base64_decode('ZXN0YWRv'),1)->sum(base64_decode('bW9udG8='));$Caja->monto_caja=($Caja->monto_ventas+$Caja->ingresos)-($Caja->monto_compras+$Caja->egresos);$Caja->fecha_string=Carbon::parse($Caja->created_at)->format(base64_decode('ZC1tLVkgSDppIGE='));return $Caja;}/**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Caja  $caja
     * @return \Illuminate\Http\Response
     */ public function update(Request $request,$id){$Caja=Caja::find($id);$Caja->estado=0;$Caja->save();$CajaNew=new Caja();$CajaNew->user_id=$request->user_id;$CajaNew->estado=1;$CajaNew->save();return $CajaNew;}/**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Caja  $caja
     * @return \Illuminate\Http\Response
     */ public function destroy(Caja $caja){}}?>
