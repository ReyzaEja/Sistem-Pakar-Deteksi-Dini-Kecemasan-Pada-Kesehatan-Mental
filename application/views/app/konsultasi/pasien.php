<link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">

  <!-- Content Header (Page header) -->
  <div class="content-header">
    <div class="container-fluid">
      <div class="row mb-2">
        <div class="col-sm-6">
          <h1 class="m-0 text-dark">Data Pasien</h1>
        </div><!-- /.col -->
        <div class="col-sm-6">
          <ol class="breadcrumb float-sm-right">
            <li class="breadcrumb-item"><a href="#">Konsultasi</a></li>
            <li class="breadcrumb-item active">Data Pasien</li>
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
        <div class="col-7 mx-auto">
          <h3 class="text-center">Pengisian Data Pasien</h3>
          <hr class="text-center">

          <div class="row">
            <div class="col-10 mx-auto">
              <div class="card">
                <div class="card-body">
                  <form action="<?= base_url('app/konsultasi/3') ?>" method="post">
                    <div class="form-group">
                      <label>Nama</label>
                      <input type="text" name="nama" id="nama" class="form-control" placeholder="Masukkan Nama">
                      <?= form_error('nama', '<small class="text-danger pl-3">', '</small>'); ?>
                      <!-- <select name="nama" id="nama" class="js-example-basic-single form-control" required>
                        <option value="">- Pilih Nama -</option>
                        <?php foreach ($pasien->result_array() as $row) { ?>
                          <option value="<?= $row['id'] ?>"><?= $row['nama'] ?></option>
                        <?php } ?>
                      </select> -->
                    </div>
                    <div class="form-group">
                      <label>Umur</label>
                      <input type="number" name="umur" min=1 id="umur" class="form-control" placeholder="Masukkan Umur">
                    </div>
                    <div class="form-group">
                      <label>Nomor HP</label>
                      <input type="text" name="nomor_hp" id="nohp" class="form-control" placeholder="Masukkan Nomor HP (WA)">
                    </div>
                    <div class="form-group">
                      <label>Jenis Kelamin</label>
                      <br>
                      <div id="jenkel">
                        <input type="radio" name="jenis_kelamin" value="Laki-laki"> Laki-laki
                        <br>
                        <input type="radio" name="jenis_kelamin" value="Perempuan"> Perempuan
                      </div>
                    </div>
                    <div class="form-group">
                      <button type="submit" class="btn btn-primary btn-block">Lanjut</button>
                      <button type="reset" class="btn btn-danger btn-block">Reset</button>
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

<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
<script>
  $(document).ready(function() {
    $('.js-example-basic-single').select2();

    $('#nama').keyup(function() {
      var id_pasien = $('#nama').val();
      $.ajax({
        url: '<?= base_url('app/getPasien') ?>',
        data: 'id_pasien=' + id_pasien,
        type: 'post',
        dataType: 'json',
        cache: 'false',
        success: function(data) {
          // alert(data.nama);
          if ($('#nama').val() == "") {
            $('#umur').val('');
            $('#nohp').val('');
            $('#jenkel').html('<input type="radio" name="jenis_kelamin" value="Laki-laki"> Laki-laki<br>' +
              '<input type="radio" name="jenis_kelamin" value="Perempuan"> Perempuan');
          } else {


            $('#umur').val(data.umur);
            $('#nohp').val(data.nohp);
            if (data.jenkel == "Perempuan") {
              $('#jenkel').html('<input type="radio" name="jenis_kelamin" value="Laki-laki"> Laki-laki<br>' +
                '<input type="radio" name="jenis_kelamin" value="Perempuan" checked> Perempuan');
            } else if (data.jenkel == "Laki-laki") {
              $('#jenkel').html('<input type="radio" name="jenis_kelamin" value="Laki-laki" checked> Laki-laki<br>' +
                '<input type="radio" name="jenis_kelamin" value="Perempuan"> Perempuan');
            } else {
              $('#jenkel').html('<input type="radio" name="jenis_kelamin" value="Laki-laki"> Laki-laki<br>' +
                '<input type="radio" name="jenis_kelamin" value="Perempuan"> Perempuan');
            }
          }
        }
      })
    })
  });
</script>