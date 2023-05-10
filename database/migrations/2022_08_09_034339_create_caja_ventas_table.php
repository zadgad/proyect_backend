<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCajaVentasTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('caja_ventas', function (Blueprint $table) {
            $table->id();
            $table->foreignId('caja_id')->nullable()->constrained('cajas');
            $table->foreignId('venta_id')->nullable()->constrained('ventas');
            $table->decimal('monto', 10, 2)->default(0);
            $table->integer('estado')->default(1);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('caja_ventas');
    }
}
