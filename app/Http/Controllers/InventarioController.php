<?php namespace App\Http\Controllers;use App\Models\Inventario;use App\Models\Articulo;use Illuminate\Http\Request;class InventarioController extends Controller{/**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */ public function index(){$model=Articulo::where(base64_decode('ZXN0YWRv'),1)->get();$list=[];foreach($model as $m){$list[]=$this->articulo($m->id);}return $list;}/**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */ public function store(Request $request){$Inventario=new Inventario();$Inventario->articulo_id=$request->articulo_id;$Inventario->cantidad=$request->cantidad;$Inventario->compra=$request->compra;$Inventario->venta=$request->venta;$Inventario->tipo=$request->tipo;$Inventario->motivo=$request->motivo;$Inventario->save();return $Inventario;}/**
     * Display the specified resource.
     *
     * @param  \App\Models\Inventario  $inventario
     * @return \Illuminate\Http\Response
     */ public function show(Inventario $inventario){}public function articulo($id){$Articulo=Articulo::with([base64_decode('TWFyY2E='),base64_decode('Q2F0ZWdvcmlh'),base64_decode('TWVkaWRh')])->find($id);$Articulo->entrada=$Articulo->Inventarios()->where(base64_decode('dGlwbw=='),1)->where(base64_decode('ZXN0YWRv'),1)->sum(base64_decode('Y2FudGlkYWQ='));$Articulo->salida=$Articulo->Inventarios()->where(base64_decode('dGlwbw=='),2)->where(base64_decode('ZXN0YWRv'),1)->sum(base64_decode('Y2FudGlkYWQ='));$Articulo->stock=$Articulo->entrada-$Articulo->salida;$Articulo->movimientos=$Articulo->Inventarios()->where(base64_decode('ZXN0YWRv'),1)->orderBy(base64_decode('aWQ='),base64_decode('ZGVzYw=='))->get()->each(function($item){$item->fecha=date(base64_decode('ZC1tLVk='),strtotime($item->created_at));});return $Articulo;}/**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Inventario  $inventario
     * @return \Illuminate\Http\Response
     */ public function update(Request $request,Inventario $inventario){}/**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Inventario  $inventario
     * @return \Illuminate\Http\Response
     */ public function destroy($id){$Inventario=Inventario::find($id);$Inventario->estado=0;$Inventario->save();}}?>
