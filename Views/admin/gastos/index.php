<?php include_once 'Views/template/header-admin.php'; ?>

<button class="btn btn-primary mb-2" type="button" id="nuevo_registro">Nuevo</button>

<div class="card">
    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-bordered table-striped table-hover" style="width: 100%;" id="tblGastos">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Descripción</th>
                        <th>Monto</th>
                        <th>Categoria</th>
                        <th>Fecha</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
        </div>
    </div>
</div>

<div id="nuevoModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="my-modal-title" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header bg-primary">
                <h5 class="modal-title" id="titleModal"></h5>
                <button class="btn-close" data-bs-dismiss="modal" aria-label="Close">
                </button>
            </div>
            <form id="frmRegistro">
                <div class="modal-body">
                    <input type="hidden" id="id_gasto" name="id_gasto">
                    <div class="input-group input-group-outline my-3">
                        <label class="form-label" for="descripcion">Descripción</label>
                        <input id="descripcion" class="form-control" type="text" name="descripcion">
                    </div>
                    <div class="input-group input-group-outline my-3">
                        <label class="form-label" for="monto">Monto</label>
                        <input id="monto" class="form-control" type="text" name="monto">
                    </div>
                    <div class="input-group input-group-outline my-3">
                        <label class="form-label" for="categoria">Categoria</label>
                        <input id="categoria" class="form-control" type="text" name="categoria">
                    </div>
                    <!-- <div class="input-group input-group-outline my-3">
                        <label class="form-label" for="fecha_gasto">Fecha</label>
                        <input id="fecha_gasto" class="form-control" type="text" name="fecha_gasto">
                    </div> -->
                </div>
                <div class="modal-footer">
                    <button class="btn btn-primary" type="submit" id="btnAccion">Registrar</button>
                    <button class="btn btn-danger" type="button" data-bs-dismiss="modal">Cancelar</button>
                </div>
            </form>
        </div>
    </div>
</div>

<?php include_once 'Views/template/footer-admin.php'; ?>

<script src="<?php echo BASE_URL . 'assets/js/modulos/gastos.js'; ?>"></script>

</body>

</html>