<?php
class GastosModel extends Query
{

    public function __construct()
    {
        parent::__construct();
    }
    public function getGastos($estado)
    {
        $sql = "SELECT id_gasto, descripcion, monto, categoria, fecha_gasto FROM gastos WHERE estado = $estado";
        return $this->selectAll($sql);
    }
    public function registrar($descripcion, $monto, $categoria)
    {
        $sql = "INSERT INTO gastos (descripcion, monto, categoria, fecha_gasto) VALUES (?,?,?,NOW())";
        $array = array($descripcion, $monto, $categoria);
        return $this->insertar($sql, $array);
    }
    /* public function verificarCorreo($correo)
    {
        $sql = "SELECT correo FROM gastos WHERE correo = '$correo' AND estado = 1";
        return $this->select($sql);
    } */

    public function eliminar($id_gasto)
    {
        $sql = "UPDATE gastos SET estado = ? WHERE id_gasto = ?";
        $array = array(0, $id_gasto);
        return $this->save($sql, $array);
    }

    public function getGasto($id_gasto)
    {
        $sql = "SELECT id_gasto, descripcion, monto, categoria, fecha_gasto FROM gastos WHERE id_gasto = $id_gasto";
        return $this->select($sql);
    }

    public function modificar($descripcion, $monto, $categoria, $id_gasto)
    {
        $sql = "UPDATE gastos SET descripcion = ?, monto = ?, categoria = ?, fecha_gasto = NOW() WHERE id_gasto = ?";
        $array = array($descripcion, $monto, $categoria, $id_gasto);
        return $this->save($sql, $array);
    }

    /* public function getTotalGastosPorCategoriaUltimoMes()
    {
        $sql = "SELECT categoria, SUM(monto) AS total_gastos 
                FROM gastos 
                WHERE fecha_gasto >= DATE_SUB(NOW(), INTERVAL 1 MONTH) 
                GROUP BY categoria";
        return $this->selectAll($sql);
    } */
}
