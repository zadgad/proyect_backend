<?php namespace App\Http\Controllers;use App\Models\Venta;use App\Models\CajaVenta;use App\Models\Inventario;use App\Models\VentaInventario;use Illuminate\Http\Request;class VentaController extends Controller{/**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */ public function index(){$model=Venta::where(base64_decode('ZXN0YWRv'),1)->get();$list=[];foreach($model as $m){$list[]=$this->show($m->id);}return $list;}/**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */ public function store(Request $request){$Venta=new Venta();$Venta->total=$request->total;$Venta->pago=$request->pago;$Venta->cambio=$request->cambio;$Venta->motivo=$request->motivo;$Venta->cliente=$request->cliente;$Venta->save();if(isset($request->cart)){foreach($request->cart as $item){$Inventario=new Inventario();$Inventario->cantidad=$item[base64_decode('Y2FudGlkYWQ=')];$Inventario->articulo_id=$item[base64_decode('YXJ0aWN1bG8=')][base64_decode('aWQ=')];$Inventario->tipo=2;$Inventario->venta=$item[base64_decode('cHJlY2lv')];$Inventario->compra=$item[base64_decode('YXJ0aWN1bG8=')][base64_decode('Y29tcHJh')];$Inventario->motivo=base64_decode('VkVOVEEg').$Venta->id;$Inventario->save();$VentaInventario=new VentaInventario();$VentaInventario->inventario_id=$Inventario->id;$VentaInventario->venta_id=$Venta->id;$VentaInventario->precio=$item[base64_decode('cHJlY2lv')];$VentaInventario->cantidad=$item[base64_decode('Y2FudGlkYWQ=')];$VentaInventario->save();}}$CajaVenta=new CajaVenta();$CajaVenta->venta_id=$Venta->id;$CajaVenta->caja_id=$request->caja_id;$CajaVenta->monto=$request->total;$CajaVenta->save();return $this->show($Venta->id);}/**
     * Display the specified resource.
     *
     * @param  \App\Models\Venta  $Venta
     * @return \Illuminate\Http\Response
     */ public function show($id){$Venta=Venta::find($id);$Venta->fecha=date(base64_decode('ZC1tLVk='),strtotime($Venta->created_at));$Venta->vendedor=$Venta->CajaVenta;if($Venta->vendedor!=null){$Caja=$Venta->vendedor->Caja;$User=$Caja->User;$Venta->vendedor=$User->nombre;}else{$Venta->vendedor=base64_decode('U2luIFZlbmRlZG9y');}$Venta->articulos=$Venta->VentaInventarios()->with([base64_decode('SW52ZW50YXJpbw==')=>function($i){$i->with([base64_decode('QXJ0aWN1bG8=')=>function($a){$a->with([base64_decode('Q2F0ZWdvcmlh'),base64_decode('TWFyY2E='),base64_decode('TWVkaWRh')]);}]);}])->get();return $Venta;}/**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Venta  $Venta
     * @return \Illuminate\Http\Response
     */ public function update(Request $request,Venta $Venta){}/**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Venta  $Venta
     * @return \Illuminate\Http\Response
     */ public function destroy($id){$Venta=Venta::find($id);$Venta->estado=0;$Venta->save();return $Venta;}}
