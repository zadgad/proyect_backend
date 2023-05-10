<?php namespace App\Http\Controllers;use App\Models\Articulo;use Illuminate\Http\Request;class ArticuloController extends Controller{/**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */ public function index(){return Articulo::with([base64_decode('TWFyY2E='),base64_decode('Q2F0ZWdvcmlh'),base64_decode('TWVkaWRh')])->where(base64_decode('ZXN0YWRv'),1)->get();}/**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */ public function store(Request $request){$Articulo=new Articulo();$Articulo->nombre=$request->nombre;$Articulo->barra=$request->barra;$Articulo->compra=$request->compra;$Articulo->venta=$request->venta;$Articulo->stock_minimo=$request->stock_minimo;$Articulo->categoria_id=$request->categoria_id;$Articulo->medida_id=$request->medida_id;$Articulo->marca_id=$request->marca_id;$Articulo->save();return $Articulo;}/**
     * Display the specified resource.
     *
     * @param  \App\Models\Articulo  $articulo
     * @return \Illuminate\Http\Response
     */ public function show($id){$Articulo=Articulo::find($id);return $Articulo;}/**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Articulo  $articulo
     * @return \Illuminate\Http\Response
     */ public function update(Request $request,$id){$Articulo=Articulo::find($id);$Articulo->nombre=$request->nombre;$Articulo->barra=$request->barra;$Articulo->compra=$request->compra;$Articulo->venta=$request->venta;$Articulo->stock_minimo=$request->stock_minimo;$Articulo->categoria_id=$request->categoria_id;$Articulo->medida_id=$request->medida_id;$Articulo->marca_id=$request->marca_id;$Articulo->save();return $Articulo;}/**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Articulo  $articulo
     * @return \Illuminate\Http\Response
     */ public function destroy($id){$Articulo=Articulo::find($id);$Articulo->estado=0;$Articulo->save();return $Articulo;}}?>
