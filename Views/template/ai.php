<?php
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Taty AI</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha384-ezLIEgE3iQpZ0wbTb6jNGXu7E1wUPqrbGipGVI9L0x5G9e7Brh6eLvTmVF6aDso" crossorigin="anonymous">
    <link rel="stylesheet" href="Views/template/ai.css">
    <link rel="icon" href="assets/images/ai/icono.ico" type="image/x-icon">

    <style>
        body,
        html {
            margin: 0;
            padding: 0;
            height: 100%;
            overflow: hidden;
            position: relative;
        }

        iframe {
            width: 100%;
            height: calc(100%);
            border: 0;
        }

        .fixed-button {
            position: fixed;
            bottom: 0px;
            /* Ajuste para evitar que el botón se superponga al contenido */
            right: 15px;
            margin: 30px;
        }

        .fixed-button button {
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 10px;
            cursor: pointer;
            border-radius: 5px;
            /* Bordes redondeados */
            outline: none;
            /* Eliminar el contorno al hacer clic */
            transition: background-color 0.3s ease, transform 0.3s ease, box-shadow 0.3s ease;
            /* Transiciones suaves */
            box-shadow: 0 4px 8px rgba(0, 123, 255, 0.3);
            /* Sutil sombra al inicio */
        }

        .fixed-button button a {
            text-decoration: none;
            color: #000;
            /* Color negro para el texto */
            display: flex;
            align-items: center;
        }

        .fixed-button button:hover {
            background-color: #0056b3;
            /* Cambio de color al pasar el ratón */
            transform: scale(1.05);
            /* Aumenta el tamaño al pasar el ratón */
            box-shadow: 0 8px 16px rgba(0, 123, 255, 0.6);
            /* Aumenta la sombra al pasar el ratón */
        }
    </style>
</head>

<body>
    <iframe src="https://www.stack-ai.com/internal_ui/02060f1d-9b30-47f7-8bc2-7574eeb4aba0/4d53432d-e40d-49d7-90b4-275c6544749a/65b3ea18c6c9f18b0efaab68" title="Ferreteria DAO">
    </iframe>

    <!-- Botón en la esquina inferior derecha -->
    <div class="fixed-button">
        <div class="text-center mb-5 mt-5 w-50 mx-auto">
            <button class="btn btn-primary">
                <a href="http://localhost/Tienda3/">Regresar</a>
            </button>
        </div>
    </div>

</body>

</html>