<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">

    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1 class="m-0 text-dark">Profil</h1>
                </div><!-- /.col -->
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="#">Profil Saya</a></li>
                        <li class="breadcrumb-item active">Profi</li>
                    </ol>
                </div><!-- /.col -->
            </div><!-- /.row -->
        </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->
    <div class="container-fluid">
        <div class="col-10">
            <div class="card mb-3 col-lg-8">
                <div class="row no-gutters">
                    <div class="col-md-4">
                        <img src="<?= base_url('assets/profil/') . $users['gambar']; ?>" class="card-img">
                    </div>
                    <div class="col-md-8">
                        <div class="card-body">
                            <h5 class="card-title"><?= $users['nama_lengkap']; ?></h5>
                            <p class="card-text"><?= $users['email']; ?></p>
                            <p class="card-text"><small class="text-muted">Member sejak <?= date('d F Y (H:i:s)', strtotime($users['login_attemp'])) ?></small></p>
                            <a href="<?= base_url('app/profil/editprofil') ?>" class="btn btn-success mb-3">Ubah Profil</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>
<!-- /.content-wrapper