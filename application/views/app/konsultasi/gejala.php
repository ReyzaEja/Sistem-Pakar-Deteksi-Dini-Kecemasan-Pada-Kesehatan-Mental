<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">

  <!-- Content Header (Page header) -->
  <div class="content-header">
    <div class="container-fluid">
      <div class="row mb-2">
        <div class="col-sm-6">
          <h1 class="m-0 text-dark">Gejala</h1>
        </div><!-- /.col -->
        <div class="col-sm-6">
          <ol class="breadcrumb float-sm-right">
            <li class="breadcrumb-item"><a href="#">Konsultasi</a></li>
            <li class="breadcrumb-item active">Gejala</li>
          </ol>
        </div><!-- /.col -->
      </div><!-- /.row -->
    </div><!-- /.container-fluid -->
  </div>
  <!-- /.content-header -->

  <!-- Main content -->
  <section class="content">
    <div class="container-fluid">
      <div class="row">
        <div class="col-10 mx-auto">
          <h3 class="text-center">Gejala Pasien</h3>
          <hr class="text-center">

          <div class="row">
            <div class="col-12">
              <div class="card">
                <div class="card-body">
                  <form action="<?= base_url('app/konsultasi/4') ?>" method="post">
                    <table class="table table-striped table-bordered" style="width: 100%">
                      <thead>
                        <th style="width: 5%">#</th>
                        <th style="width: 75%">Apa yang anda rasakan dalam 2 minggu terakhir ?</th>
                        <th style="width: 20%"></th>
                      </thead>
                      <tbody>
                        <?php $nomor = 1 ?>
                        <?php foreach ($pertanyaan as $p) : ?>
                          <tr>
                            <td><?= $nomor++ ?></td>
                            <td><?= $p['nama_gejala'] ?>?</td>
                            <td>
                              <input type="radio" name="gejala-<?= $p['id'] ?>-<?= $p['penyakit_id'] ?>" value="0" required> Tidak Pernah <br>
                              <input type="radio" name="gejala-<?= $p['id'] ?>-<?= $p['penyakit_id'] ?>" value="1" required> Pernah <br>
                              <input type="radio" name="gejala-<?= $p['id'] ?>-<?= $p['penyakit_id'] ?>" value="2" required> Hampir Sering <br>
                              <input type="radio" name="gejala-<?= $p['id'] ?>-<?= $p['penyakit_id'] ?>" value="3" required> Sering <br>
                              <input type="radio" name="gejala-<?= $p['id'] ?>-<?= $p['penyakit_id'] ?>" value="4" required> Sangat Sering <br>
                            </td>
                          </tr>
                        <?php endforeach; ?>
                      </tbody>
                    </table>
                    <div class="form-group">
                      <button type="submit" class="btn btn-primary float-right">Hasil</button>
                    </div>
                  </form>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>

    </div><!-- /.container-fluid -->
  </section>
  <!-- /.content -->
</div>
<!-- /.content-wrapper -->