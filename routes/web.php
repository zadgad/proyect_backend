<?php

/** @var \Laravel\Lumen\Routing\Router $router */
use Illuminate\Support\Facades\Route;
/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It is a breeze. Simply tell Lumen the URIs it should respond to
| and give it the Closure to call when that URI is requested.
|
*/
use Lararoutes\Lumen\CustomRoutes;
$app = new CustomRoutes($router);

$router->group(['prefix'=>'api'],function($router){
    $router->group(['prefix'=>'amosis'],function($router){
        $app = new CustomRoutes($router);
            $app->apiResource('medidas', 'MedidaController');
            $app->apiResource('marcas', 'MarcaController');
            $app->apiResource('categorias', 'CategoriaController');
            $app->apiResource('articulos', 'ArticuloController');
            $router->get('inventarios/articulo/{id}', 'InventarioController@articulo');
            $router->get('dashboard', 'DashboardController@index');
            $app->apiResource('inventarios', 'InventarioController');
            $app->apiResource('compras', 'CompraController');
            $app->apiResource('ventas', 'VentaController');
            $app->apiResource('users', 'UserController');
            $router->post('iniciar-sesion', 'UserController@iniciarSesion');
            $app->apiResource('cajas', 'CajaController');
            $app->apiResource('cajaMovimientos', 'CajaMovimientoController');
            $app->apiResource('monedas', 'MonedaController');
            $app->apiResource('metodos', 'MetodoController');
            $app->apiResource('sucursals', 'SucursalController');

    });

});
$router->get('/', function () use ($router) {
    return $router->app->version();
});
