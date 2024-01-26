const nuevo = document.querySelector("#nuevo_registro");
const frm = document.querySelector("#frmRegistro");
const titleModal = document.querySelector("#titleModal");
const btnAccion = document.querySelector("#btnAccion");
const myModal = new bootstrap.Modal(document.getElementById("nuevoModal"));
let tblGastos;
document.addEventListener("DOMContentLoaded", function () {
    tblGastos = $("#tblGastos").DataTable({
        ajax: {
            url: base_url + "gastos/listar",
            dataSrc: "",
        },
        columns: [
            { data: "id_gasto" },
            { data: "descripcion" },
            { data: "monto" },
            { data: "categoria" },
            { data: "fecha_gasto" },
            { data: "accion" },
        ],
        language,
        dom,
        buttons,
    });
    //levantar modal
    nuevo.addEventListener("click", function () {
        document.querySelector('#id_gasto').value = '';
        titleModal.textContent = "NUEVO GASTO";
        btnAccion.textContent = 'Registrar';
        frm.reset();
        myModal.show();
    });
    //submit gastos
    frm.addEventListener("submit", function (e) {
        e.preventDefault();
        let data = new FormData(this);
        const url = base_url + "gastos/registrar";
        const http = new XMLHttpRequest();
        http.open("POST", url, true);
        http.send(data);
        http.onreadystatechange = function () {
            if (this.readyState == 4 && this.status == 200) {
                console.log(this.responseText);
                const res = JSON.parse(this.responseText);
                if (res.icono == "success") {
                    myModal.hide();
                    tblGastos.ajax.reload();
                }
                Swal.fire("Aviso?", res.msg.toUpperCase(), res.icono);
            }
        }
    });
});

function eliminarGasto(id_gasto) {
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
            const url = base_url + "gastos/delete/" + id_gasto;
            const http = new XMLHttpRequest();
            http.open("GET", url, true);
            http.send();
            http.onreadystatechange = function () {
                if (this.readyState == 4 && this.status == 200) {
                    console.log(this.responseText);
                    const res = JSON.parse(this.responseText);
                    if (res.icono == "success") {
                        tblGastos.ajax.reload();
                    }
                    Swal.fire("Aviso?", res.msg.toUpperCase(), res.icono);
                }
            }
        }
    });
}

function editGasto(id_gasto) {
    const url = base_url + "gastos/edit/" + id_gasto;
    const http = new XMLHttpRequest();
    http.open("GET", url, true);
    http.send();
    http.onreadystatechange = function () {
        if (this.readyState == 4 && this.status == 200) {
            console.log(this.responseText);
            const res = JSON.parse(this.responseText);
            document.querySelector('#id_gasto').value = res.id_gasto;
            document.querySelector('#descripcion').value = res.descripcion;
            document.querySelector('#monto').value = res.monto;
            document.querySelector('#categoria').value = res.categoria;
            // document.querySelector('#fecha_gasto').value = res.fecha_gasto;
            btnAccion.textContent = 'Actualizar';
            titleModal.textContent = "MODIFICAR GASTO";
            myModal.show();
            //$('#nuevoModal').modal('show');
        }
    }
}