<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">

  <!-- Content Header (Page header) -->
  <div class="content-header">
    <div class="container-fluid">
      <div class="row mb-2">
        <div class="col-sm-6">
          <h1 class="m-0 text-dark">Deteksi</h1>
        </div><!-- /.col -->
        <div class="col-sm-6">
          <ol class="breadcrumb float-sm-right">
            <li class="breadcrumb-item"><a href="#">Konsultasi</a></li>
            <li class="breadcrumb-item active">Deteksi</li>
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
        <div class="col-11 mx-auto">
          <h3 class="display-4 text-center">Hasil Deteksi Dini</h3>
          <hr class="text-center">

          <div class="row">
            <div class="col-6 mx-auto">
              <div class="row">
                <div class="col-12">
                  <div class="card">
                    <div class="card-body">
                      <div class="row">
                        <div class="col text-center">
                          <?php $gambar = ($kepercayaan >= 0.1) ? mt_rand(1, 10) : 1; ?>
                          <?php if ($kepercayaan >= 0.1) : ?>
                            <img src="<?= base_url('assets/penyakit/') . strval($gambar) . '.jpg' ?>" alt="Gambar" width="300">
                          <?php else : ?>
                            <img src="<?= base_url('assets/penyakit/sehat/') . strval($gambar) . '.jpg' ?>" alt="Gambar" width="300">
                          <?php endif; ?>
                          <h3 class="display-5">
                            <?= $hasil ?>
                          </h3>
                          <hr>
                          <p class="lead">Nilai Skor <?= $total; ?></p>
                          <p class="lead <?= ($kepercayaan > 0) ? 'text-success' : 'text-danger' ?>">
                            <?php if ($kepercayaan >= 0.1) : ?>
                              Nilai Kepercayaan <?= $kepercayaan . '%' ?> (<?= $teks_kepercayaan ?>)
                            <?php else : ?>
                              <?= $teks_kepercayaan; ?>
                            <?php endif; ?>
                          </p>
                        </div>
                      </div>
                    </div>
                  </div>

                  <div class="card">
                    <div class="card-body">
                      <h3>Informasi Tinggkat Kecemasan</h3>
                      <hr>
                      <p align="justify">
                        Nilai skor <strong>1</strong> sampai <strong>6</strong> berarti <strong> Tidak Ada Kecemasan </strong><br>
                        Nilai skor <strong>7</strong> sampai <strong>14</strong> berarti <strong> Kecemasan Ringan </strong><br>
                        Nilai skor <strong>15</strong> sampai <strong>27</strong> berarti <strong> Kecemasan Sedang </strong><br>
                        Nilai skor <strong>28</strong> sampai <strong>56</strong> berarti <strong> Keceemasan Berat </strong><br>
                      </p>
                    </div>
                  </div>

                </div>

              </div>
            </div>
            <div class="col-6">
              <div class="col-12">
                <div class="card">
                  <div class="card-body">
                    <h3>Solusi dan Saran</h3>
                    <hr>
                    <p align="justify"><?= $solusi ?></p>

                    <?php if ($total >= 1 && $total <= 6) : ?>
                      <hr class="mt-2">
                      <h3>Rekomendasi Audio Relaksasi</h3>
                      <hr>
                      <audio controls>
                        <!-- <source src="horse.ogg" type="audio/ogg"> -->
                        <source src="<?= base_url() ?>assets/relaksasi/relaksasi1.mp3" type="audio/mpeg">
                        Your browser does not support the audio element.
                      </audio>

                    <?php elseif ($total >= 7 && $total <= 14) : ?>
                      <hr class="mt-2">
                      <h3>Rekomendasi Audio Relaksasi</h3>
                      <hr>
                      <audio controls>
                        <!-- <source src="horse.ogg" type="audio/ogg"> -->
                        <source src="<?= base_url() ?>assets/relaksasi/relaksasi2.mp3" type="audio/mpeg">
                        Your browser does not support the audio element.
                      </audio>

                    <?php elseif ($total >= 15 && $total <= 27) : ?>
                      <hr class="mt-2">
                      <h3>Rekomendasi Audio Relaksasi</h3>
                      <hr>
                      <audio controls>
                        <!-- <source src="horse.ogg" type="audio/ogg"> -->
                        <source src="<?= base_url() ?>assets/relaksasi/relaksasi3.mp3" type="audio/mpeg">
                        Your browser does not support the audio element.
                      </audio>

                    <?php elseif ($total >= 28 && $total <= 56) : ?>
                      <hr class="mt-2">
                      <h3>Rekomendasi Audio Relaksasi</h3>
                      <hr>
                      <audio controls>
                        <!-- <source src="horse.ogg" type="audio/ogg"> -->
                        <source src="<?= base_url() ?>assets/relaksasi/relaksasi4.mp3" type="audio/mpeg">
                        Your browser does not support the audio element.
                      </audio>

                    <?php else : ?>
                      <hr class="mt-2">
                      <h3>Rekomendasi Audio Relaksasi</h3>
                      <hr>
                      <audio controls>
                        <!-- <source src="horse.ogg" type="audio/ogg"> -->
                        <source src="<?= base_url() ?>assets/relaksasi/relaksasi.mp3" type="audio/mpeg">
                        Your browser does not support the audio element.
                      </audio>
                    <?php endif; ?>
                  </div>
                </div>
              </div>

              <div class="col-12">
                <div class="card">
                  <div class="card-body">
                    <h3>Keterangan Gangguan</h3>
                    <hr>
                    <p align="justify"><?= $keterangan ?></p>
                  </div>
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
<!-- /.content-wrapper