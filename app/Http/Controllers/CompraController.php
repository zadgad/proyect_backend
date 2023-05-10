<?php namespace App\Http\Controllers;use App\Models\Compra;use App\Models\CajaCompra;use App\Models\Inventario;use App\Models\CompraInventario;use Illuminate\Http\Request;class CompraController extends Controller{/**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */ public function index(){$model=Compra::where(base64_decode('ZXN0YWRv'),1)->get();$list=[];foreach($model as $m){$list[]=$this->show($m->id);}return $list;}/**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */ public function store(Request $request){$Compra=new Compra();$Compra->total=$request->total;$Compra->motivo=$request->motivo;$Compra->proveedor=$request->proveedor;$Compra->save();if(isset($request->cart)){foreach($request->cart as $item){$Inventario=new Inventario();$Inventario->cantidad=$item[base64_decode('Y2FudGlkYWQ=')];$Inventario->articulo_id=$item[base64_decode('YXJ0aWN1bG8=')][base64_decode('aWQ=')];$Inventario->tipo=1;$Inventario->compra=$item[base64_decode('cHJlY2lv')];$Inventario->venta=$item[base64_decode('YXJ0aWN1bG8=')][base64_decode('dmVudGE=')];$Inventario->motivo=base64_decode('Q09NUFJBIA==').$Compra->id;$Inventario->save();$CompraInventario=new CompraInventario();$CompraInventario->inventario_id=$Inventario->id;$CompraInventario->compra_id=$Compra->id;$CompraInventario->precio=$item[base64_decode('cHJlY2lv')];$CompraInventario->cantidad=$item[base64_decode('Y2FudGlkYWQ=')];$CompraInventario->save();}}$CajaCompra=new CajaCompra();$CajaCompra->compra_id=$Compra->id;$CajaCompra->caja_id=$request->caja_id;$CajaCompra->monto=$request->total;$CajaCompra->save();return $Compra;}/**
     * Display the specified resource.
     *
     * @param  \App\Models\Compra  $compra
     * @return \Illuminate\Http\Response
     */ public function show($id){$Compra=Compra::find($id);$Compra->fecha=date(base64_decode('ZC1tLVk='),strtotime($Compra->created_at));$Compra->vendedor=$Compra->CajaCompra;if($Compra->vendedor!=null){$Caja=$Compra->vendedor->Caja;$User=$Caja->User;$Compra->vendedor=$User->nombre;}else{$Compra->vendedor=base64_decode('U2luIFZlbmRlZG9y');}$Compra->articulos=$Compra->CompraInventarios()->with([base64_decode('SW52ZW50YXJpbw==')=>function($i){$i->with([base64_decode('QXJ0aWN1bG8=')=>function($a){$a->with([base64_decode('Q2F0ZWdvcmlh'),base64_decode('TWFyY2E='),base64_decode('TWVkaWRh')]);}]);}])->get();return $Compra;}/**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Compra  $compra
     * @return \Illuminate\Http\Response
     */ public function update(Request $request,Compra $compra){}/**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Compra  $compra
     * @return \Illuminate\Http\Response
     */ public function destroy($id){$Compra=Compra::find($id);$Compra->estado=0;$Compra->save();return $Compra;}}?>
