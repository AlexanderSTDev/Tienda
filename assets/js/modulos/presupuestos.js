const nuevo = document.querySelector("#nuevo_registro");
const frm = document.querySelector("#frmRegistro");
const titleModal = document.querySelector("#titleModal");
const btnAccion = document.querySelector("#btnAccion");
const myModal = new bootstrap.Modal(document.getElementById("nuevoModal"));
let tblPresupuesto;
document.addEventListener("DOMContentLoaded", function () {
    tblPresupuesto = $("#tblPresupuesto").DataTable({
        ajax: {
            url: base_url + "presupuestos/listar",
            dataSrc: "",
        },
        columns: [
            { data: "id_presupuesto" },
            { data: "categoria" },
            { data: "monto" },
            { data: "accion" },
        ],
        language,
        dom,
        buttons,
    });
    //levantar modal
    nuevo.addEventListener("click", function () {
        document.querySelector('#id_presupuesto').value = '';
        titleModal.textContent = "NUEVO GASTO";
        btnAccion.textContent = 'Registrar';
        frm.reset();
        myModal.show();
    });
    //submit presupuestos
    frm.addEventListener("submit", function (e) {
        e.preventDefault();
        let data = new FormData(this);
        const url = base_url + "presupuestos/registrar";
        const http = new XMLHttpRequest();
        http.open("POST", url, true);
        http.send(data);
        http.onreadystatechange = function () {
            if (this.readyState == 4 && this.status == 200) {
                console.log(this.responseText);
                const res = JSON.parse(this.responseText);
                if (res.icono == "success") {
                    myModal.hide();
                    tblPresupuesto.ajax.reload();
                }
                Swal.fire("Aviso?", res.msg.toUpperCase(), res.icono);
            }
        }
    });
});

function eliminarPresupuesto(id_presupuesto) {
    Swal.fire({
        title: "Aviso?",
        text: "Esta seguro de eliminar el registro!",
        icon: "warning",
        showCancelButton: true,
        confirmButtonColor: "#3085d6",
        cancelButtonColor: "#d33",
        confirmButtonText: "Si, Eliminar!",
    }).then((result) => {
        if (result.isConfirmed) {
            const url = base_url + "presupuestos/delete/" + id_presupuesto;
            const http = new XMLHttpRequest();
            http.open("GET", url, true);
            http.send();
            http.onreadystatechange = function () {
                if (this.readyState == 4 && this.status == 200) {
                    console.log(this.responseText);
                    const res = JSON.parse(this.responseText);
                    if (res.icono == "success") {
                        tblPresupuesto.ajax.reload();
                    }
                    Swal.fire("Aviso?", res.msg.toUpperCase(), res.icono);
                }
            }
        }
    });
}

function editPresupuesto(id_presupuesto) {
    const url = base_url + "presupuestos/edit/" + id_presupuesto;
    const http = new XMLHttpRequest();
    http.open("GET", url, true);
    http.send();
    http.onreadystatechange = function () {
        if (this.readyState == 4 && this.status == 200) {
            console.log(this.responseText);
            const res = JSON.parse(this.responseText);
            document.querySelector('#id_presupuesto').value = res.id_presupuesto;
            document.querySelector('#categoria').value = res.categoria;
            document.querySelector('#monto').value = res.monto;
            btnAccion.textContent = 'Actualizar';
            titleModal.textContent = "MODIFICAR GASTO";
            myModal.show();
            //$('#nuevoModal').modal('show');
        }
    }
}