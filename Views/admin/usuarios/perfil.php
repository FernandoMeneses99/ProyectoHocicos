<?php include_once 'Views/template/header-admin.php'; ?>

<div class="row">
    <div class="col-sm-12">
        <div class="page-title-box">
            <div class="row align-items-center">
                <div class="col-md-12">
                    <h4 class="page-title m-0">Tus datos</h4>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Mostrar datos del perfil -->
<div class="card shadow mb-4">
    <div class="card-header py-3">
        <h5 class="m-0 font-weight-bold text-primary">Información del usuario</h5>
    </div>
    <div class="card-body">
        <p><strong>Nombre:</strong> <?php echo $data['usuario']['nombre']; ?></p>
        <p><strong>Apellido:</strong> <?php echo $data['usuario']['apellido']; ?></p>
        <p><strong>Correo:</strong> <?php echo $data['usuario']['correo']; ?></p>
        <p><strong>Dirección:</strong> <?php echo $data['usuario']['direccion']; ?></p>
    </div>
</div>

<?php include_once 'Views/template/footer-admin.php'; ?>

<script src="<?php echo BASE_URL . 'public/admin/js/page/perfil.js'; ?>"></script>

</body>
</html>
