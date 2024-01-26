<?php
class PresupuestosModel extends Query
{

    public function __construct()
    {
        parent::__construct();
    }
    public function getPresupuestos($estado)
    {
        $sql = "SELECT id_presupuesto, categoria, monto FROM presupuestos WHERE estado = $estado";
        return $this->selectAll($sql);
    }
    public function registrar($categoria, $monto)
    {
        $sql = "INSERT INTO presupuestos (categoria, monto) VALUES (?,?)";
        $array = array($categoria, $monto);
        return $this->insertar($sql, $array);
    }
    /* public function verificarCorreo($correo)
    {
        $sql = "SELECT correo FROM presupuestos WHERE correo = '$correo' AND estado = 1";
        return $this->select($sql);
    } */

    public function eliminar($id_presupuesto)
    {
        $sql = "UPDATE presupuestos SET estado = ? WHERE id_presupuesto = ?";
        $array = array(0, $id_presupuesto);
        return $this->save($sql, $array);
    }

    public function getPresupuesto($id_presupuesto)
    {
        $sql = "SELECT id_presupuesto, categoria, monto FROM presupuestos WHERE id_presupuesto = $id_presupuesto";
        return $this->select($sql);
    }

    public function modificar($categoria, $monto, $id_presupuesto)
    {
        $sql = "UPDATE presupuestos SET categoria = ?, monto = ? WHERE id_presupuesto = ?";
        $array = array($categoria, $monto, $id_presupuesto);
        return $this->save($sql, $array);
    }
}
