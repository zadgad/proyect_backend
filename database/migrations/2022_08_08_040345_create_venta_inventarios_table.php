<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateVentaInventariosTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('venta_inventarios', function (Blueprint $table) {
            $table->id();
            $table->foreignId('inventario_id')->nullable()->constrained('inventarios');
            $table->foreignId('venta_id')->nullable()->constrained('ventas');
            $table->decimal('precio', 10, 2)->nullable();

            $table->decimal('cantidad', 10, 2)->nullable();

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
        Schema::dropIfExists('venta_inventarios');
    }
}
