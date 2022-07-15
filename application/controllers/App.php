<?php

class App extends CI_Controller
{
	public function __construct()
	{
		parent::__construct();


		$this->load->model('CRUDModel', 'crud');
		$this->load->model('AuthModel', 'auth');
		$this->load->model('AdminModel', 'admin');
	}

	// halaman dashboard
	public function index()
	{
		$data['users'] = $this->db->get_where('users', ['username' => $this->session->userdata('sess_username')])->row_array();
		$this->load->view('templates/header');
		$this->load->view('templates/navbar');
		$this->load->view('templates/sidebar', $data);
		$this->load->view('app/dashboard');
		$this->load->view('templates/footer');
	}


	public function users($aksi = NULL, $id = NULL)
	{
		$data['users'] = $this->db->get_where('users', ['username' => $this->session->userdata('sess_username')])->row_array();

		if ($aksi == 'add') {
			$data = $this->input->post();
			$data['password'] = password_hash($data['password'], PASSWORD_DEFAULT);

			if ($this->crud->insert($data, 'users')) {
				$this->session->set_flashdata('pesan', '<div class="alert alert-success" role="alert">Data berhasil disimpan</div>');
			} else {
				$this->session->set_flashdata('pesan', '<div class="alert alert-danger" role="alert">Data gagal disimpan</div>');
			}

			redirect('App/users');
		} else if ($aksi == 'aktivasi') {
			if ($this->crud->activation($id)) {
				$this->session->set_flashdata('pesan', '<div class="alert alert-success" role="alert">Status akun berhasil diubah</div>');
			} else {
				$this->session->set_flashdata('pesan', '<div class="alert alert-danger" role="alert">Status akun gagal diubah</div>');
			}

			redirect('App/users');
		} else {
			$data['users'] = $this->crud->get('users');

			$this->load->view('templates/header');
			$this->load->view('templates/navbar');
			$this->load->view('templates/sidebar', $data);
			$this->load->view('app/member/users', $data);
			$this->load->view('templates/footer');
		}
	}

	public function members($aksi = NULL, $id = NULL)
	{
		$data['users'] = $this->db->get_where('users', ['username' => $this->session->userdata('sess_username')])->row_array();
		if ($aksi == "delete") {

			$id = $this->input->post('id');

			if ($this->crud->delete('members', $id)) {
				$this->session->set_flashdata('pesan', '<div class="alert alert-success" role="alert">Member berhasil menghapus.</div>');
			} else {
				$this->session->set_flashdata('pesan', '<div class="alert alert-danger" role="alert">Member gagal menghapus.</div>');
			}

			redirect('App/members');
		} else if ($aksi == "edit") {
		} else {
			$data['members'] = $this->crud->get('members');

			$this->load->view('templates/header');
			$this->load->view('templates/navbar');
			$this->load->view('templates/sidebar', $data);
			$this->load->view('app/member/members', $data);
			$this->load->view('templates/footer');
		}
	}

	public function login()
	{

		$this->form_validation->set_rules('username', 'Username', 'required');
		$this->form_validation->set_rules('password', 'Password', 'required');

		if ($this->form_validation->run() == FALSE) {
			$this->load->view('templates/header');
			$this->load->view('templates/navbar');
			$this->load->view('templates/sidebar');
			$this->load->view('app/akun/login');
			$this->load->view('templates/footer');
		} else {

			$data = $this->input->post();

			if ($this->auth->login($data)) {
				$this->session->set_flashdata('pesan', '<div class="alert alert-success" role="alert">Login Berhasil</div>');
				if ($this->session->userdata('sess_role_id') == 1) {
					redirect('admin/dashboard');
				}

				redirect('app/index');
			} else {
				// $this->session->set_flashdata('pesan', '<div class="alert alert-danger" role="alert">Login Gagal</div>');

				redirect('app/login');
			}
		}
	}

	public function register()
	{
		$data['users'] = $this->db->get_where('users', ['username' => $this->session->userdata('sess_username')])->row_array();
		$this->form_validation->set_rules('nama_lengkap', 'NamaLengkap', 'required|alpha', ['required' => 'Nama tidak boleh kosong', 'alpha' => 'Harus menggunakan huruf']);
		$this->form_validation->set_rules('username', 'Username', 'required', ['required' => 'Username tidak boleh kosong']);
		$this->form_validation->set_rules('password', 'Password', 'required', ['required' => 'Password tidak boleh kosong']);
		$this->form_validation->set_rules('email', 'Email', 'required|valid_email|is_unique[users.email]', ['required' => 'Email tidak boleh kosong', 'is_unique' => 'Email sudah terdaftar!']);

		if ($this->form_validation->run() === FALSE) {
			$this->load->view('templates/header');
			$this->load->view('templates/navbar');
			$this->load->view('templates/sidebar', $data);
			$this->load->view('app/akun/register');
			$this->load->view('templates/footer');
		} else {
			$data = $this->input->post();
			$data['password'] = password_hash($data['password'], PASSWORD_DEFAULT);
			$data['role_id'] = 2;
			$data['is_active'] = 0;
			$data['id'] = NULL;
			$data['gambar'] = 'default.jpg';

			$success = false;

			if ($this->auth->username_exists($data['username']) && $this->auth->email_exists($data['email'])) {
				$success = true;
			}

			if ($this->crud->insert($data, 'users') && $success) {
				$this->session->set_flashdata('pesan', '<div class="alert alert-success" role="alert">Berhasil registrasi. Silahkan periksa email untuk melakukan aktivasi.</div>');

				$subject = 'AKTIVASI AKUN';
				$url = base_url() . 'app/aktivasi/' . $data['username'];
				$message = "Halo $data[email], kamu bisa aktivasi akun mu pada link berikut ini : " . $url;

				$this->kirim_email($data['email'], $subject, $message);

				redirect('app/login');
			} else {
				$this->session->set_flashdata('pesan', '<div class="alert alert-danger" role="alert">Gagal registrasi.</div>');

				redirect('app/register');
			}
		}
	}

	public function aktivasi($username)
	{
		if ($this->auth->aktivasi($username)) {
			$this->session->set_flashdata('pesan', '<div class="alert alert-success" role="alert">Berhasil melakukan aktivasi</div>');
		} else {
			$this->session->set_flashdata('pesan', '<div class="alert alert-danger" role="alert">Gagal melakukan aktivasi</div>');
		}

		redirect('app/login');
	}

	public function kirim_email($email, $subject, $message)
	{

		$config['protocol'] = 'smtp';
		$config['smtp_host'] = 'ssl://smtp.googlemail.com';
		$config['smtp_port'] = 465;
		$config['smtp_user'] = 'spkecemasan@gmail.com';
		$config['smtp_pass'] = 'spkecemasanreyza';
		$config['mailtype'] = 'html';
		$config['charset'] = 'utf-8';

		$this->load->library('email');
		$this->email->initialize($config);

		$this->email->set_newline("\r\n");

		$this->email->from('spkecemasan@gmail.com', 'SP Kecemasan');
		$this->email->to($email);

		$this->email->subject($subject);
		$this->email->message($message);

		$this->email->send();
		// var_dump($this->email->send()); die;
	}

	public function forgot($aksi = '')
	{
		$data['users'] = $this->db->get_where('users', ['username' => $this->session->userdata('sess_username')])->row_array();
		if ($aksi == 'reset') {
			$email = $this->input->post('email');

			$this->load->helper('string');
			// generate key code and send to email
			$key = random_string('alnum', 16);

			if ($this->auth->reset_password($email, $key)) {
				$subject = 'RESET PASSWORD';
				$url = base_url() . 'app/reset/' . $key;
				$message = "Halo $email, kamu bisa reset password mu pada link : " . $url;
				// $message = "Halo $email, kamu bisa reset password mu pada link : http://localhost/gangguan-kecemasan/app/reset/$key";
				$this->kirim_email($email, $subject, $message);

				$this->session->set_flashdata('pesan', '<div class="alert alert-success" role="alert">Mohon periksa alamat email anda</div>');
			} else {
				$this->session->set_flashdata('pesan', '<div class="alert alert-danger" role="alert">Gagal melakukan reset password</div>');
			}

			redirect('app/forgot');
		} else {
			$this->load->view('templates/header');
			$this->load->view('templates/navbar');
			$this->load->view('templates/sidebar', $data);
			$this->load->view('app/akun/forgot');
			$this->load->view('templates/footer');
		}
	}

	public function reset($key)
	{
		$data['users'] = $this->db->get_where('users', ['username' => $this->session->userdata('sess_username')])->row_array();
		$user = $this->auth->key_exists($key);

		if ($user) {
			$data['user'] = $user;

			$this->load->view('templates/header');
			$this->load->view('templates/navbar');
			$this->load->view('templates/sidebar', $data);
			$this->load->view('app/akun/reset', $data['user']);
			$this->load->view('templates/footer');
		} else {
			$this->session->set_flashdata('pesan', '<div class="alert alert-danger" role="alert">Kunci tidak valid</div>');
			redirect('app/reset/' . $key);
		}
	}

	public function change_password()
	{
		$this->form_validation->set_rules('email', 'Email', 'required');
		$this->form_validation->set_rules('password', 'Password', 'required');

		if ($this->form_validation->run() === FALSE) {
			$this->session->set_flashdata('pesan', '<div class="alert alert-danger" role="alert">Terjadi kesalahan dalam reset password</div>');

			redirect('app/login');
		} else {
			$data = $this->input->post();

			$data['password'] = password_hash($data['password'], PASSWORD_DEFAULT);

			if ($this->auth->change_password($data['email'], $data['password'])) {
				$this->session->set_flashdata('pesan', '<div class="alert alert-success" role="alert">Berhasil reset password</div>');
			} else {
				$this->session->set_flashdata('pesan', '<div class="alert alert-danger" role="alert">Gagal reset password</div>');
			}

			redirect('app/login');
		}
	}

	public function logout()
	{
		$this->session->sess_destroy();

		redirect('app/login');
	}

	public function getPasien()
	{
		$id = $this->input->post('id_pasien');
		$q = $this->crud->allPasien($id);

		$num = $q->num_rows();

		if ($num > 0) {
			$q = $q->row();
			echo json_encode(array(
				'nama' => $q->nama,
				'umur' => $q->umur,
				'nohp' => $q->nomor_hp,
				'jenkel' => $q->jenis_kelamin
			));
		} else {
			echo json_encode(array(
				'nama' => '',
				'umur' => '',
				'nohp' => '',
				'jenkel' => ''
			));
		}
	}

	public function konsultasi($page = 1)
	{

		$url_page = "app/konsultasi/index";

		$data = [];
		switch ($page) {
			case 1:
				$url_page = "app/konsultasi/index";
				break;
			case 2:
				$id = $this->session->userdata('sess_user_id');
				// $data['pasien'] = $this->crud->pasien($id);
				$data['pasien'] = $this->crud->allPasien();
				$url_page = "app/konsultasi/pasien";
				break;
			case 3:

				$user_data = [
					'sess_pasien_nama' => $this->input->post('nama'),
					'sess_pasien_umur' => $this->input->post('umur'),
					'sess_pasien_jenis_kelamin' => $this->input->post('jenis_kelamin'),
					'sess_pasien_nomor_hp' => $this->input->post('nomor_hp')
				];

				$this->session->set_userdata($user_data);

				$pertanyaan = [];
				$temp_pertanyaan = $this->crud->get_pertanyaan();


				foreach ($temp_pertanyaan as $hasil) {
					// print_r($hasil);
					// echo "<br>";
					$temp = [
						'id' => $hasil['id'],
						'nama_gejala' => $hasil['nama_gejala'],
						'penyakit_id' => strval($hasil['penyakit_id']),
					];
					if (!array_key_exists($hasil['id'], $pertanyaan)) {
						$pertanyaan[$hasil['id']] = $temp;
					} else {
						$pertanyaan[$hasil['id']]['penyakit_id'] .= '&' . strval($hasil['penyakit_id']);
					}
				}

				$data['pertanyaan'] = $pertanyaan;

				// echo "<br>";
				// foreach($pertanyaan as $p) {
				// 	print_r($p);
				// 	echo "<br>";

				// 	// if(strpos($p['penyakit_id'], '&') !== false) {
				// 	// 	$temp = explode('&', $p['penyakit_id']);
				// 	// 	foreach($temp as $t) {
				// 	// 		echo $t;
				// 	// 		echo "<br>";
				// 	// 	}

				// 	// 	die;
				// 	// } else {
				// 	// 	echo $p;
				// 	// }
				// }

				// die;

				$url_page = "app/konsultasi/gejala";
				break;
			case 4:
				$jawaban = [];
				$get_hasil = $this->input->post();
				$past_kategori = [];
				$inserted_kategori = []; // kategori penyakit
				$total = 0;
				foreach ($get_hasil as $kunci => $dt) {
					if (strpos($kunci, '-') == false) {
						continue;
					}

					$temp = explode('-', $kunci);
					// echo $perulangan_ke++;
					// echo "<br>";
					// // var_dump($temp[3]); die;
					$id = (int) $temp[1];
					$penyakit_id = $temp[2];
					$skor = 0; // nilai cf pakar
					// $skor = (float) str_replace('_', '.', $skor);
					$bobot = (float) $dt;
					$total = $total + $bobot;

					if ($bobot == 0) {
						$skor = 0;
					} elseif ($bobot == 1) {
						$skor = 0.6;
					} elseif ($bobot == 2) {
						$skor = 0.75;
					} elseif ($bobot == 3) {
						$skor = 0.8;
					} else {
						$skor = 0.9;
					}

					if ($bobot != 0)
						$bobot = (float) $bobot / 4;

					if (strpos($penyakit_id, '&') !== false) {
						$penyakit_ids = explode('&', $penyakit_id);
						// var_dump($penyakit_ids); die;
						foreach ($penyakit_ids as $pi) {
							$pi = (int) $pi;
							if (!in_array($pi, $inserted_kategori)) {
								$cf = $bobot;
								$kombinasi = $cf * $skor;

								array_push($inserted_kategori, $pi);
								// array_push($past_kategori, [$pi => $kombinasi]);
								$past_kategori[$pi] = $kombinasi;
							} else {
								$cf = $bobot;
								$kombinasi = $cf * $skor;

								$last_kombinasi = $past_kategori[$pi];

								$new_kombinasi = 0;

								if ($last_kombinasi > 0 && $kombinasi > 0) {
									$new_kombinasi = $last_kombinasi + $kombinasi * (1 - $last_kombinasi);
								} elseif ($last_kombinasi < 0 && $kombinasi < 0) {
									$new_kombinasi = $last_kombinasi + $kombinasi * (1 + $last_kombinasi);
								} else {
									$new_kombinasi = ($last_kombinasi + $kombinasi) / (1 - min([abs($last_kombinasi), abs($kombinasi)]));
								}

								// echo "==============<br>";
								// var_dump($kombinasi);
								// echo "<br>";
								// var_dump($last_kombinasi);
								// echo "<br>";
								// var_dump($new_kombinasi);
								// echo "<br>";

								$past_kategori[$pi] = $new_kombinasi;
							}
						}
					} else {
						$penyakit_id = (int) $penyakit_id;
						if (!in_array($penyakit_id, $inserted_kategori)) {
							$cf = $bobot;
							$kombinasi = $cf * $skor;

							array_push($inserted_kategori, $penyakit_id);
							// array_push($past_kategori, [$penyakit_id => $kombinasi]);
							$past_kategori[$penyakit_id] = $kombinasi;
						} else {
							$cf = $bobot;
							$kombinasi = $cf * $skor;

							$last_kombinasi = $past_kategori[$penyakit_id];

							$new_kombinasi = 0;

							if ($last_kombinasi > 0 && $kombinasi > 0) {
								$new_kombinasi = $last_kombinasi + $kombinasi * (1 - $last_kombinasi);
							} elseif ($last_kombinasi < 0 && $kombinasi < 0) {
								$new_kombinasi = $last_kombinasi + $kombinasi * (1 + $last_kombinasi);
							} else {
								$new_kombinasi = ($last_kombinasi + $kombinasi) / (1 - min([abs($last_kombinasi), abs($kombinasi)]));
							}
							$past_kategori[$penyakit_id] = $new_kombinasi;
						}
					}
					$kategori1 = "";
					if ($total <= 6) {
						$kategori1 = $this->crud->get_kategori_name(1);
						$keterangan1 = $this->crud->get_keterangan_text(1);
						$solusi1 = $this->crud->get_solusi_text(1);
					} elseif ($total >= 7 && $total <= 14) {
						$kategori1 = $this->crud->get_kategori_name(2);
						$keterangan1 = $this->crud->get_keterangan_text(2);
						$solusi1 = $this->crud->get_solusi_text(2);
					} elseif ($total >= 15 && $total <= 27) {
						$kategori1 = $this->crud->get_kategori_name(3);
						$keterangan1 = $this->crud->get_keterangan_text(3);
						$solusi1 = $this->crud->get_solusi_text(3);
					} else {
						$kategori1 = $this->crud->get_kategori_name(4);
						$keterangan1 = $this->crud->get_keterangan_text(4);
						$solusi1 = $this->crud->get_solusi_text(4);
					}

					// array_push($jawaban, [$penyakit_id => ['gejala_id' => $id, 'skor' => $skor, 'nilai' => $data]]);
				}

				// var_dump($past_kategori);
				// die;

				$penyakit_id = 0;
				$max_skor = 0;
				$kategori = "";
				$solusi = "";
				$keterangan = "";

				foreach ($past_kategori as $id => $skor) {
					if ($max_skor < (float)$skor) {
						$penyakit_id = $id;
						$max_skor = (float)$skor;
						$kategori = $this->crud->get_kategori_name($id);
						$solusi = $this->crud->get_solusi_text($id);
						$keterangan = $this->crud->get_keterangan_text($id);
					}
				}

				$belief_score = (float)$max_skor;

				$teks_kepercayaan = "Tidak Memiliki Gangguan";

				if ($belief_score < 0.1) {
					$kategori1 = "Tidak Terdiagnosis";
					$teks_kepercayaan = "Tidak Memiliki Gangguan";
					$solusi = "Selamat! Kondisi mental anda tergolong baik-baik saja. tidak perlu khawatir, tetap menjalani aktivitas sehari-hari dan tetap berpikir positif. Jika ingin merasa lebih baik, anda bisa mencoba audio relaksasi di bawah ini.";
					$keterangan1 = "Tidak Terdiagnosis Gangguan Kecemasan.";
				} else {
					if ($belief_score > 0.8 && $belief_score <= 1) {
						$teks_kepercayaan = "Pasti";
					} elseif ($belief_score > 0.6) {
						$teks_kepercayaan = "Hampir Pasti";
					} elseif ($belief_score > 0.4) {
						$teks_kepercayaan = "Kemungkinan Besar";
					} else if ($belief_score > 0.2) {
						$teks_kepercayaan = "Mungkin";
					} else if ($belief_score >= 0.1) {
						$teks_kepercayaan = "Sedikit Kemungkinan";
					} else {
						$teks_kepercayaan = "Tidak Memiliki Gangguan";
					}
				}
				$belief_score = $belief_score * 100;

				$data['total'] = $total;
				$data['penyakit_id'] = $penyakit_id;
				$data['hasil'] = $kategori1;
				$data['solusi'] = $solusi1;
				$data['keterangan'] = $keterangan1;
				$data['kepercayaan'] = $belief_score;
				$data['teks_kepercayaan'] = $teks_kepercayaan;

				// echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~<br>";
				// var_dump($data['hasil']);
				// var_dump($data['solusi']);
				// var_dump($data['kepercayaan']);
				// die;

				// akan menyimpan riwayat ketika sudah login
				if ($this->session->userdata('sess_user_id')) {
					$pasien = [
						'id' => NULL,
						'nama' => $this->session->userdata('sess_pasien_nama'),
						'umur' => $this->session->userdata('sess_pasien_umur'),
						'jenis_kelamin' => $this->session->userdata('sess_pasien_jenis_kelamin'),
						'nomor_hp' => $this->session->userdata('sess_pasien_nomor_hp')
					];

					$pasien_id = $this->crud->inserted_pasien($pasien['nomor_hp']);

					if (!$pasien_id) {
						$pasien_id = $this->crud->insert($pasien, 'pasien');
					}

					$riwayat = [
						'id' => NULL,
						'user_id' => $this->session->userdata('sess_user_id'),
						'pasien_id' => $pasien_id,
						'penyakit_id' => $penyakit_id,
						'diagnosis' => $kategori1,
						'solusi' => $solusi,
						'nilai_skor' => $total,
						'nilai_cf' => $belief_score
					];

					$this->crud->insert($riwayat, 'riwayat');
				}

				$url_page = "app/konsultasi/result";
				break;
			case 5:
				$user_id = $this->session->userdata('sess_user_id');
				$data['riwayat'] = [];

				if ($user_id) {
					$data['riwayat'] = $this->admin->riwayat_konsultasi($user_id);
				}

				$url_page = "app/konsultasi/riwayat";
				break;
			default:
				$url_page = "app/konsultasi/index";
		}
		$data['users'] = $this->db->get_where('users', ['username' => $this->session->userdata('sess_username')])->row_array();
		$this->load->view('templates/header');
		$this->load->view('templates/navbar');
		$this->load->view('templates/sidebar', $data);
		$this->load->view($url_page, $data);
		$this->load->view('templates/footer');
	}

	public function edukasi()
	{
		$data['users'] = $this->db->get_where('users', ['username' => $this->session->userdata('sess_username')])->row_array();
		$penyakit = $this->crud->get('penyakit');
		$gejala = $this->crud->get('gejala');

		// $data['edukasi'] = array_merge($penyakit, $gejala);
		$data['edukasi'] = $penyakit;

		$this->load->view('templates/header');
		$this->load->view('templates/navbar');
		$this->load->view('templates/sidebar', $data);
		$this->load->view('app/edukasi/index', $data);
		$this->load->view('templates/footer');
	}

	public function artikel()
	{
		$this->load->view('templates/header');
		$this->load->view('templates/navbar');
		$this->load->view('templates/sidebar');
		$this->load->view('app/artikel/index');
		$this->load->view('templates/footer');
	}

	public function bantuan()
	{
		$this->load->view('templates/header');
		$this->load->view('templates/navbar');
		$this->load->view('templates/sidebar');
		$this->load->view('app/bantuan/index');
		$this->load->view('templates/footer');
	}

	// lainnya untuk kebutuhan API
	public function get_data($table, $id = NULL)
	{
		$data = $this->crud->get($table, $id);

		echo json_encode($data, JSON_PRETTY_PRINT);
	}

	public function profil($aksi = NULL, $id = NULL)
	{
		if ($aksi == "editprofil") {
			$data = $this->crud->get('users');
			$data['users'] = $this->db->get_where('users', ['username' => $this->session->userdata('sess_username')])->row_array();

			$this->form_validation->set_rules('nama_lengkap', 'Nama Lengkap', 'required|trim');
			$this->form_validation->set_rules('username', 'Username', 'required|trim');

			if ($this->form_validation->run() == false) {
				$this->load->view('templates/header');
				$this->load->view('templates/navbar');
				$this->load->view('templates/sidebar', $data);
				$this->load->view('app/profil/editprofil', $data);
				$this->load->view('templates/footer', $data);
			} else {
				$nama_lengkap = $this->input->post('nama_lengkap');
				$username = $this->input->post('username');
				$email = $this->input->post('email');

				// cek jika ada gambar yang akan diupload
				$upload_image = $_FILES['gambar']['name'];

				if ($upload_image) {
					$config['allowed_types'] = 'gif|jpg|jpeg|png';
					$config['max_size']      = '2048';
					$config['upload_path'] = './assets/profil/';

					$this->load->library('upload', $config);

					if ($this->upload->do_upload('gambar')) {
						$old_image = $data['users']['gambar'];
						if ($old_image != 'default.jpg') {
							unlink(FCPATH . 'assets/profil/' . $old_image);
						}
						$new_image = $this->upload->data('file_name');
						$this->db->set('gambar', $new_image);
					} else {
						echo $this->upload->dispay_errors();
					}
				}

				$this->db->set('nama_lengkap', $nama_lengkap);
				$this->db->set('email', $email);
				$this->db->where('username', $username);
				$this->db->update('users');

				$this->session->set_flashdata('message', '<div class="alert alert-success" role="alert">Your profile has been updated!</div>');
				redirect('app/profil');
			}
		} else {

			$data['users'] = $this->db->get_where('users', ['username' => $this->session->userdata('sess_username')])->row_array();

			$this->load->view('templates/header');
			$this->load->view('templates/navbar');
			$this->load->view('templates/sidebar', $data);
			$this->load->view('app/profil/index', $data);
			$this->load->view('templates/footer');
		}
	}

	public function forgotPassword()
	{
		$data['users'] = $this->db->get_where('users', ['username' => $this->session->userdata('sess_username')])->row_array();
		$this->form_validation->set_rules('email', 'Email', 'trim|required|valid_email');

		if ($this->form_validation->run() == false) {
			$this->load->view('templates/header');
			$this->load->view('templates/navbar');
			$this->load->view('templates/sidebar', $data);
			$this->load->view('app/akun/forgot', $data);
			$this->load->view('templates/footer');
		} else {
			$email = $this->input->post('email');
			$user = $this->db->get_where('users', ['email' => $email, 'is_active' => 1])->row_array();

			if ($user) {
				$token = base64_encode(random_bytes(32));
				$user_token = [
					'email' => $email,
					'token' => $token,
					'date_created' => time()
				];

				$this->db->insert('user_token', $user_token);
				$this->_sendEmail($token, 'forgot');

				$this->session->set_flashdata('message', '<div class="alert alert-success" role="alert">Silahkan cek email anda untuk mengubah kata sandi!</div>');
				redirect('app/forgotpassword');
			} else {
				$this->session->set_flashdata('message', '<div class="alert alert-danger" role="alert">Email tidak terdaftar atau belum aktivasi!</div>');
				redirect('app/forgotpassword');
			}
		}
	}


	public function resetPassword()
	{
		$email = $this->input->get('email');
		$token = $this->input->get('token');

		$user = $this->db->get_where('users', ['email' => $email])->row_array();

		if ($user) {
			$user_token = $this->db->get_where('user_token', ['token' => $token])->row_array();

			if ($user_token) {
				$this->session->set_userdata('reset_email', $email);
				$this->changePassword();
			} else {
				$this->session->set_flashdata('message', '<div class="alert alert-danger" role="alert">Ubah kata sandi gagal! Token salah.</div>');
				redirect('app/login');
			}
		} else {
			$this->session->set_flashdata('message', '<div class="alert alert-danger" role="alert">Ubah kata sandi gagal! Email salah.</div>');
			redirect('app/login');
		}
	}


	public function changePassword()
	{
		$data['users'] = $this->db->get_where('users', ['username' => $this->session->userdata('sess_username')])->row_array();
		if (!$this->session->userdata('reset_email')) {
			redirect('app/login');
		}

		$this->form_validation->set_rules('password1', 'Password', 'trim|required|min_length[3]|matches[password2]');
		$this->form_validation->set_rules('password2', 'Repeat Password', 'trim|required|min_length[3]|matches[password1]');

		if ($this->form_validation->run() == false) {
			$this->load->view('templates/header');
			$this->load->view('templates/navbar');
			$this->load->view('templates/sidebar', $data);
			$this->load->view('app/akun/reset', $data);
			$this->load->view('templates/footer');
		} else {
			$password = password_hash($this->input->post('password1'), PASSWORD_DEFAULT);
			$email = $this->session->userdata('reset_email');

			$this->db->set('password', $password);
			$this->db->where('email', $email);
			$this->db->update('users');

			$this->session->unset_userdata('reset_email');

			$this->db->delete('user_token', ['email' => $email]);

			$this->session->set_flashdata('message', '<div class="alert alert-success" role="alert">Kata sandi telah diubah! Silahkan login.</div>');
			redirect('app/changepassword');
		}
	}

	private function _sendEmail($token, $type)
	{
		$config = [
			'protocol'  => 'smtp',
			'smtp_host' => 'ssl://smtp.googlemail.com',
			'smtp_user' => 'spkecemasan@gmail.com',
			'smtp_pass' => 'spkecemasanreyza',
			'smtp_port' => 465,
			'mailtype'  => 'html',
			'charset'   => 'utf-8',
			'newline'   => "\r\n"
		];

		$this->email->initialize($config);

		$this->email->from('spkecemasan@gmail.com', 'SP Kecemasan');
		$this->email->to($this->input->post('email'));

		if ($type == 'verify') {
			$this->email->subject('Account Verification');
			$this->email->message('Click this link to verify you account : <a href="' . base_url() . 'app/verify?email=' . $this->input->post('email') . '&token=' . urlencode($token) . '">Aktivasi</a>');
		} else if ($type == 'forgot') {
			$this->email->subject('UBAH KATA SANDI');
			$this->email->message('Klik link berikut ini untuk mengubah kata sandi : <a href="' . base_url() . 'app/resetpassword?email=' . $this->input->post('email') . '&token=' . urlencode($token) . '">Ubah Kata Sandi</a>');
		}

		if ($this->email->send()) {
			return true;
		} else {
			echo $this->email->print_debugger();
			die;
		}
	}
}
