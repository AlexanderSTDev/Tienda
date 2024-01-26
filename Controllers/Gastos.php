<?php
class Gastos extends Controller
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
        $data['title'] = 'gastos';
        $this->views->getView('admin/gastos', "index", $data);
    }
    public function listar()
    {
        $data = $this->model->getGastos(1);
        for ($i = 0; $i < count($data); $i++) {
            $data[$i]['accion'] = '<div class="d-flex">
            <button class="btn btn-primary" type="button" onclick="editGasto(' . $data[$i]['id_gasto'] . ')"><i class="fas fa-edit"></i></button>
            <button class="btn btn-danger" type="button" onclick="eliminarGasto(' . $data[$i]['id_gasto'] . ')"><i class="fas fa-trash"></i></button>
        </div>';
        }
        echo json_encode($data);
        die();
    }
    public function registrar()
    {
        if (isset($_POST['descripcion'])) {
            $descripcion = $_POST['descripcion'];
            $monto = $_POST['monto'];
            $categoria = $_POST['categoria'];
            // $fecha_gasto = $_POST['fecha_gasto'];
            $id_gasto = $_POST['id_gasto'];
            if (empty($_POST['descripcion']) || empty($_POST['monto']) || empty($_POST['categoria'])) {
                $respuesta = array('msg' => 'todo los campos son requeridos', 'icono' => 'warning');
            } else {
                if (empty($id_gasto)) {
                    // $result = $this->model->verificarcategoria($categoria);
                    if (empty($result)) {
                        $data = $this->model->registrar($descripcion, $monto, $categoria);
                        if ($data > 0) {
                            $respuesta = array('msg' => 'gasto registrado', 'icono' => 'success');
                        } else {
                            $respuesta = array('msg' => 'error al registrar', 'icono' => 'error');
                        }
                    } else {
                        // $respuesta = array('msg' => 'categoria ya existe', 'icono' => 'warning');
                    }
                } else {
                    $data = $this->model->modificar($descripcion, $monto, $categoria, $id_gasto);
                    if ($data == 1) {
                        $respuesta = array('msg' => 'gasto modificado', 'icono' => 'success');
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
    public function delete($id_gasto)
    {
        if (is_numeric($id_gasto)) {
            $data = $this->model->eliminar($id_gasto);
            if ($data == 1) {
                $respuesta = array('msg' => 'gasto dado de baja', 'icono' => 'success');
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
    public function edit($id_gasto)
    {
        if (is_numeric($id_gasto)) {
            $data = $this->model->getGasto($id_gasto);
            echo json_encode($data, JSON_UNESCAPED_UNICODE);
        }
        die();
    }
}
