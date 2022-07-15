<?php

class Api extends CI_Controller
{
	public function __construct()
	{
		parent::__construct();
		$data['users'] = $this->db->get_where('users', ['gambar' => $this->session->userdata('sess_gambar')])->row_array();
		$this->load->model('CRUDModel', 'crud');
	}

	public function certainty($aksi = NULL, $id = NULL)
	{
		if ($aksi == 'get') {
			$data = $this->crud->get('certainty1', $id);

			echo json_encode($data, JSON_PRETTY_PRINT);
		}
	}

	public function penyakit($aksi = NULL, $id = NULL)
	{
		if ($aksi == 'get') {
			$data = $this->crud->get('penyakit', $id);

			echo json_encode($data, JSON_PRETTY_PRINT);
		}
	}

	public function gejala($aksi = NULL, $id = NULL)
	{
		if ($aksi == 'get') {
			$data = $this->crud->get('gejala', $id);

			echo json_encode($data, JSON_PRETTY_PRINT);
		}
	}

	public function user($aksi = NULL, $id = NULL)
	{
		if ($aksi == 'get') {
			$data = $this->crud->get('users', $id);

			echo json_encode($data, JSON_PRETTY_PRINT);
		}
	}
	public function pasien($aksi = NULL, $id = NULL)
	{
		if ($aksi == 'get') {
			$data = $this->crud->get('pasien', $id);

			echo json_encode($data, JSON_PRETTY_PRINT);
		}
	}
}
