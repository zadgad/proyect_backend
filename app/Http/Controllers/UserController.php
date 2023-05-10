<?php namespace App\Http\Controllers;use App\Models\User;use App\Models\Caja;use Illuminate\Http\Request;use Illuminate\Support\Facades\Hash;use Illuminate\Support\Facades\Auth;class UserController extends Controller{/**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */ public function index(){return User::where(base64_decode('ZXN0YWRv'),1)->get();}/**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */ public function store(Request $request){$User=new User();$User->nombre=$request->nombre;$User->username=$request->username;$User->email=$request->email;if(isset($request->password)){if($request->password!=''){$User->password=Hash::make($request->password);}}$User->save();return $User;}/**
     * Display the specified resource.
     *
     * @param  \App\Models\User  $user
     * @return \Illuminate\Http\Response
     */ public function show($id){return User::find($id);}/**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\User  $user
     * @return \Illuminate\Http\Response
     */ public function update(Request $request,$id){$user=User::find($id);$user->nombre=$request->nombre;$user->username=$request->username;$user->email=$request->email;$user->password=Hash::make($request->password);$user->save();return $user;}/**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\User  $user
     * @return \Illuminate\Http\Response
     */ public function destroy($id){$user=User::find($id);$user->estado=0;$user->save();}public function iniciarSesion(Request $request){$user=User::where(base64_decode('ZW1haWw='),$request->email)->orWhere(base64_decode('dXNlcm5hbWU='),$request->email)->where(base64_decode('ZXN0YWRv'),1)->first();if($user){if(Hash::check($request->password,$user->password)){$caja=$user->Cajas()->where(base64_decode('ZXN0YWRv'),1)->get();if($caja->count()>0){$caja=$caja->first();$user->caja_id=$caja->id;}else{$caja=new Caja();$caja->user_id=$user->id;$caja->estado=1;$caja->save();$user->caja_id=$caja->id;}return $user;}else{return response()->json([base64_decode('ZXJyb3Jz')=>[base64_decode('bG9naW4=')=>[base64_decode('Tm8gc2UgcHVlZGUgaW5pY2lhciBzZXNpw7Nu')]]],422);}}else{return response()->json([base64_decode('ZXJyb3Jz')=>[base64_decode('bG9naW4=')=>[base64_decode('TG9zIGRhdG9zICBxdWUgaW5ncmVzYXN0ZSBzb24gaW5jb3JyZWN0b3M=')]]],422);}}}?>
