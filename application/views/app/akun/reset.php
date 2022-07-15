<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">

  <!-- Content Header (Page header) -->
  <div class="content-header">
    <div class="container-fluid">
      <div class="row mb-2">
        <div class="col-sm-6">
          <h1 class="m-0 text-dark">Login</h1>
        </div><!-- /.col -->
        <div class="col-sm-6">
          <ol class="breadcrumb float-sm-right">
            <li class="breadcrumb-item"><a href="#">Akun</a></li>
            <li class="breadcrumb-item active">Login</li>
          </ol>
        </div><!-- /.col -->
      </div><!-- /.row -->
    </div><!-- /.container-fluid -->
  </div>
  <!-- /.content-header -->

  <!-- Main content -->
  <section class="content">
    <div class="container-fluid">
      <?php if ($this->session->flashdata('message')) : ?>
        <div class="row">
          <div class="col-5 mx-auto">
            <?= $this->session->flashdata('message'); ?>
          </div>
        </div>
      <?php endif; ?>
      <div class="row">
        <div class="col-5 mx-auto">
          <div class="card">
            <div class="card-body">
              <form action="<?= base_url('app/changepassword') ?>" method="post">
                <h5 class="mb-4"><?= $this->session->userdata('reset_email'); ?></h5>
                <!-- <input type="hidden" name="email" value="<?= $users['email'] ?>"> -->
                <div class="form-group">
                  <label>Password baru : </label>
                  <input type="password" class="form-control form-control-user" id="password1" name="password1" placeholder="Masukan password baru">
                  <?= form_error('password1', '<small class="text-danger pl-3">', '</small>'); ?>
                </div>
                <div class="form-group">
                  <label>Ulangi password : </label>
                  <input type="password" class="form-control form-control-user" id="password2" name="password2" placeholder="Ulangi password">
                  <?= form_error('password1', '<small class="text-danger pl-3">', '</small>'); ?>
                </div>
                <div class="form-group">
                  <button type="submit" class="btn btn-primary btn-block">RESET PASSWORD</button>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>

    </div><!-- /.container-fluid -->
  </section>
  <!-- /.content -->
</div>
<!-- /.content-wrapper -->

<script type="text/javascript">
  const validation = (target) => {
    const password = document.getElementById('primary').value;
    if (target.value !== password) {
      document.getElementById('error_message').innerHTML = "Password tidak cocok";
    } else {
      document.getElementById('error_message').innerHTML = "";
    }
  }
</script>