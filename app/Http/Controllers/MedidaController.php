<?php namespace App\Http\Controllers;use App\Models\Medida;use Illuminate\Http\Request;class MedidaController extends Controller{/**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */ public function index(){return Medida::where(base64_decode('ZXN0YWRv'),1)->get();}/**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */ public function store(Request $request){$medida=new Medida();$medida->nombre=$request->nombre;$medida->codigo=$request->codigo;$medida->save();return $medida;}/**
     * Display the specified resource.
     *
     * @param  \App\Models\Medida  $medida
     * @return \Illuminate\Http\Response
     */ public function show($id){$medida=Medida::find($id);return $medida;}/**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Medida  $medida
     * @return \Illuminate\Http\Response
     */ public function update(Request $request,$id){$medida=Medida::find($id);$medida->nombre=$request->nombre;$medida->codigo=$request->codigo;$medida->save();return $medida;}/**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Medida  $medida
     * @return \Illuminate\Http\Response
     */ public function destroy($id){$medida=Medida::find($id);$medida->estado=0;$medida->save();return $medida;}}?>
