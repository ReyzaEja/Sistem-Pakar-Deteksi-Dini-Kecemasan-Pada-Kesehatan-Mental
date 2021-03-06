<?php

class CRUDModel extends CI_Model
{

	public function get_last($table)
	{
		$query = "SELECT * FROM $table ORDER BY id DESC LIMIT 1";

		return $this->db->query($query)->row_array();
	}

	public function insert($data, $table)
	{
		date_default_timezone_set('Asia/Jakarta');
		$data['created_at'] = date('Y-m-d H:i:s', time());
		$data['updated_at'] = date('Y-m-d H:i:s', time());

		$this->db->insert($table, $data);
		return $this->db->insert_id();
	}

	public function get($table, $id = NULL)
	{
		if ($id) {
			return $this->db->get_where($table, ['id' => $id])->row_array();
		} else {
			return $this->db->get($table)->result_array();
		}
	}

	public function custom_get($table, $data)
	{
		return $this->db->get_where($table, $data)->result_array();
	}

	public function update($data, $table, $id)
	{
		$data['updated_at'] = date('Y-m-d H:i:s', time());

		$this->db->set($data);
		$this->db->where('id', $id);
		$this->db->update($table);

		return $this->db->affected_rows();
	}

	public function delete($table, $id)
	{
		return $this->db->delete($table, ['id' => $id]);
	}

	public function custom_delete($table, $data)
	{
		return $this->db->delete($table, $data);
	}

	// fungsi aktivasi
	public function activation($id)
	{
		$user = $this->get('users', $id);

		$this->db->set('aktif', !$user['aktif']);
		$this->db->where('ID', $id);
		$this->db->update('users');

		return $this->db->affected_rows();
	}

	public function get_pertanyaan()
	{

		$query = "SELECT certainty1.id, gejala.id, gejala.nama as nama_gejala, certainty1.penyakit_id FROM certainty1 JOIN gejala ON certainty1.gejala_id = gejala.id";
		return $this->db->query($query)->result_array();
	}

	public function get_kategori_name($id)
	{
		$data = $this->db->get_where('penyakit', ['id' => $id])->row_array();

		$nama = $data['nama'];

		return $nama;
	}

	public function get_solusi_text($id)
	{
		$data = $this->db->get_where('penyakit', ['id' => $id])->row_array();

		$solusi = $data['solusi'];

		return $solusi;
	}

	public function get_keterangan_text($id)
	{
		$data = $this->db->get_where('penyakit', ['id' => $id])->row_array();

		$solusi = $data['keterangan'];

		return $solusi;
	}

	public function inserted_pasien($nomor_hp)
	{
		$pasien = $this->db->get_where('pasien', ['nomor_hp' => $nomor_hp])->row_array();

		if ($pasien) {
			return $pasien['id'];
		}

		return false;
	}

	public function page($limit, $start)
	{
		return $this->db->get('riwayat', $limit, $start)->result_array();
	}

	public function count()
	{
		return $this->db->get('riwayat')->num_rows();
	}

	public function pasien($id)
	{
		$query = $this->db->query("SELECT * FROM pasien WHERE id = '$id'");

		return $query->row_array();
	}

	public function allPasien($id = NULL)
	{
		if($id != NULL){
			$this->db->where('nama', $id);
		}

		$query = $this->db->get('pasien');

		return $query;
	}
}
