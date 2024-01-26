<?php
class Presupuestos extends Controller
{
    public function __construct()
    {
        parent::__construct();
        session_start();
        if (empty($_SESSION['nombre_usuario'])) {
            header('Location: ' . BASE_URL . 'admin');
            exit;
        }
    }
    public function index()
    {
        $data['title'] = 'presupuestos';
        $this->views->getView('admin/presupuestos', "index", $data);
    }
    public function listar()
    {
        $data = $this->model->getPresupuestos(1);
        for ($i = 0; $i < count($data); $i++) {
            $data[$i]['accion'] = '<div class="d-flex">
            <button class="btn btn-primary" type="button" onclick="editPresupuesto(' . $data[$i]['id_presupuesto'] . ')"><i class="fas fa-edit"></i></button>
            <button class="btn btn-danger" type="button" onclick="eliminarPresupuesto(' . $data[$i]['id_presupuesto'] . ')"><i class="fas fa-trash"></i></button>
        </div>';
        }
        echo json_encode($data);
        die();
    }
    public function registrar()
    {
        if (isset($_POST['categoria'])) {
            $categoria = $_POST['categoria'];
            $monto = $_POST['monto'];
            $id_presupuesto = $_POST['id_presupuesto'];
            if (empty($_POST['categoria']) || empty($_POST['monto'])) {
                $respuesta = array('msg' => 'todo los campos son requeridos', 'icono' => 'warning');
            } else {
                if (empty($id_presupuesto)) {
                    // $result = $this->model->verificarcategoria($categoria);
                    if (empty($result)) {
                        $data = $this->model->registrar($categoria, $monto);
                        if ($data > 0) {
                            $respuesta = array('msg' => 'presupuesto registrado', 'icono' => 'success');
                        } else {
                            $respuesta = array('msg' => 'error al registrar', 'icono' => 'error');
                        }
                    } else {
                        // $respuesta = array('msg' => 'categoria ya existe', 'icono' => 'warning');
                    }
                } else {
                    $data = $this->model->modificar($categoria, $monto, $id_presupuesto);
                    if ($data == 1) {
                        $respuesta = array('msg' => 'presupuesto modificado', 'icono' => 'success');
                    } else {
                        $respuesta = array('msg' => 'error al modificar', 'icono' => 'error');
                    }
                }
            }
            echo json_encode($respuesta);
        }
        die();
    }
    //eliminar user
    public function delete($id_presupuesto)
    {
        if (is_numeric($id_presupuesto)) {
            $data = $this->model->eliminar($id_presupuesto);
            if ($data == 1) {
                $respuesta = array('msg' => 'presupuesto dado de baja', 'icono' => 'success');
            } else {
                $respuesta = array('msg' => 'error al eliminar', 'icono' => 'error');
            }
        } else {
            $respuesta = array('msg' => 'error desconocido', 'icono' => 'error');
        }
        echo json_encode($respuesta);
        die();
    }
    //editar user
    public function edit($id_presupuesto)
    {
        if (is_numeric($id_presupuesto)) {
            $data = $this->model->getPresupuesto($id_presupuesto);
            echo json_encode($data, JSON_UNESCAPED_UNICODE);
        }
        die();
    }
}
