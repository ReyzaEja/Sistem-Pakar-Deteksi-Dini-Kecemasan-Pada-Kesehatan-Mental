-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 23 Feb 2022 pada 10.41
-- Versi server: 10.4.21-MariaDB
-- Versi PHP: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sp_gangguan_kecemasan`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `artikel`
--

CREATE TABLE `artikel` (
  `id` int(11) NOT NULL,
  `judul` varchar(255) NOT NULL,
  `konten` text NOT NULL,
  `gambar` varchar(255) NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `artikel`
--

INSERT INTO `artikel` (`id`, `judul`, `konten`, `gambar`, `created_at`, `updated_at`) VALUES
(1, 'Karena Cemas, Ibu nekat nyusul anak ke Eropa', 'Seorang Ibu asal Jepara nekat menyusul anaknya ke Eropa lantaran cemas', 'default.png', '2021-05-31', '2021-05-31');

-- --------------------------------------------------------

--
-- Struktur dari tabel `certainty`
--

CREATE TABLE `certainty` (
  `id` int(11) NOT NULL,
  `penyakit_id` int(11) NOT NULL,
  `gejala_id` int(11) NOT NULL,
  `skor` float NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `certainty`
--

INSERT INTO `certainty` (`id`, `penyakit_id`, `gejala_id`, `skor`, `created_at`, `updated_at`) VALUES
(61, 1, 1, 0.9, '2021-11-17', '2021-11-17'),
(62, 1, 2, 0.91, '2021-11-17', '2021-11-17'),
(63, 1, 3, 0.91, '2021-11-17', '2021-11-17'),
(64, 1, 4, 0.81, '2021-11-17', '2021-11-17'),
(65, 1, 5, 0.71, '2021-11-17', '2021-11-17'),
(66, 1, 6, 0.91, '2021-11-17', '2021-11-17'),
(67, 1, 7, 0.81, '2021-11-17', '2021-11-17'),
(68, 1, 8, 0.81, '2021-11-17', '2021-11-17'),
(69, 1, 9, 0.71, '2021-11-17', '2021-11-17'),
(70, 1, 10, 0.91, '2021-11-17', '2021-11-17'),
(71, 1, 11, 0.71, '2021-11-17', '2021-11-17'),
(72, 1, 12, 0.81, '2021-11-17', '2021-11-17'),
(73, 1, 13, 0.91, '2021-11-17', '2021-11-17'),
(74, 1, 14, 0.91, '2021-11-17', '2021-11-17'),
(107, 2, 1, 1, '2021-11-18', '2021-11-18'),
(108, 2, 5, 1, '2021-11-18', '2021-11-18');

-- --------------------------------------------------------

--
-- Struktur dari tabel `certainty1`
--

CREATE TABLE `certainty1` (
  `id` int(11) NOT NULL,
  `penyakit_id` int(11) NOT NULL,
  `gejala_id` int(11) NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `certainty1`
--

INSERT INTO `certainty1` (`id`, `penyakit_id`, `gejala_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2021-11-19', '2021-11-19'),
(2, 1, 2, '2021-11-19', '2021-11-19'),
(3, 1, 3, '2021-11-19', '2021-11-19'),
(4, 1, 4, '2021-11-19', '2021-11-19'),
(5, 1, 5, '2021-11-19', '2021-11-19'),
(6, 1, 6, '2021-11-19', '2021-11-19'),
(7, 1, 7, '2021-11-19', '2021-11-19'),
(8, 1, 8, '2021-11-19', '2021-11-19'),
(9, 1, 9, '2021-11-19', '2021-11-19'),
(10, 1, 10, '2021-11-19', '2021-11-19'),
(11, 1, 11, '2021-11-19', '2021-11-19'),
(12, 1, 12, '2021-11-19', '2021-11-19'),
(13, 1, 13, '2021-11-19', '2021-11-19'),
(14, 1, 14, '2021-11-19', '2021-11-19');

-- --------------------------------------------------------

--
-- Struktur dari tabel `gejala`
--

CREATE TABLE `gejala` (
  `id` int(11) NOT NULL,
  `nama` varchar(300) NOT NULL,
  `keterangan` text NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `gejala`
--

INSERT INTO `gejala` (`id`, `nama`, `keterangan`, `created_at`, `updated_at`) VALUES
(1, 'Perasaan cemas seperti : takut yang luar biasa terhadap ketidak pastian masa depan, merasa khawatir, merasa tidak aman, mudah tersinggung, dan kecemasan', 'Perasaan cemas : bagian ini akan melihat kondisi emosi pasien yang menunjukkan ketakutan yang luar biasa terhadap ketidakpastian masa depan, merasa khawatir, merasa tidak aman, mudah tersinggung, dan kecemasan.', '2021-08-04', '2021-12-21'),
(2, 'Ketegangan (tension) seperti : ketidak mampuan untuk relaks, tidak nervous, ketegangan, gemetaran, dan kepenatan', 'Ketegangan (tension) : bagian ini akan melihat ketidakmampuan pasien untuk bersikap relaks, tidak nervous, ketegangan, gemetaran, dan kepenatan.', '2021-05-31', '2021-12-21'),
(3, 'Ketakutan (fear) seperti : takut di keramaian, terhadap binatang, di tempat umum, sendirian, lalulintas, orang asing dan kegelapan', 'Ketakutan (fear) : bagian ini akan melihat ketakutan pasien di keramaian, terhadap binatang, di tempat umum, sendirian, lalulintas, orang asing dan kegelapan.', '2021-06-22', '2021-12-21'),
(4, 'Sulit tidur (insomnia) seperti : durasi tidur dan kepulasan tidur selama 3 malam sebelumnya. Sukar memulai tidur, terbangun pada malam hari, tidur tidak pulas, bangun dengan lesu, banyak mimpi-mimpi, mimpi buruk, dan mimpi menakutkan. Catatan: tanpa penggunaan obat', 'Sulit tidur (insomnia) : bagian ini akan melihat pengalaman pasien terhadap durasi tidur dan kepulasan tidur selama 3 malam sebelumnya. Sukar memulai tidur, terbangun pada malam hari, tidur tidak pulas, bangun dengan lesu, banyak mimpi-mimpi, mimpi buruk, dan mimpi menakutkan. Catatan: tanpa penggunaan obat penenang.', '2021-06-22', '2021-12-21'),
(5, 'Gangguan kecerdasan seperti : penurunan daya ingat, ,mudah lupa dan sulit berkonsentrasi', 'Sulit konsentrasi dan daya ingat : bagian ini akan melihat ketidakmampuan pasien untuk berkonsentrasi, mengambil keputusan terhadap kejadian seharihari, dan lemahnya daya ingat.', '2021-06-22', '2021-12-21'),
(6, 'Perasaan depresi seperti : hilangnya minat, berkurangnya kesenangan pada hobi, sedih, bangun dini hari, perasaan berubah-ubah sepanjang hari', 'Perasaan depresi : bagian ini akan melihat komunikasi pasien baik secara verbal maupun non-verbal tentang hilangnya minat, berkurangnya kesenangan pada hobi, sedih, bangun dini hari, perasaan berubah-ubah sepanjang hari.', '2021-06-22', '2021-12-21'),
(7, 'Gejala somatik (otot) seperti : merasa lemah, sakit, ketegangan otot seperti pada bagian leher dan rahang', 'Gejala Somatik : pasien merasa lemah, sakit, ketegangan otot seperti pada bagian leher dan rahang.', '2021-06-22', '2021-12-21'),
(8, 'Gejala sensorik seperti : merasa penat dan lemah, atau mengalami gangguan fungsi perasa seperti: tinnitus (telinga berdering), mata kabur, sensasi panasdingin dan biang keringat', 'Gejala sensorik : pasien merasa penat dan lemah, atau mengalami gangguan fungsi perasa seperti: tinnitus, mata kabur, sensasi panas dingin dan keringat buntat.', '2021-06-22', '2021-12-21'),
(9, 'Gejala jantung (cardiovascular) seperti : tachycardia (detak jantung cepat), jantung berdebar, tekanan pada bagian dada, dentaman pada pembuluh darah, dan perasaan seakanakan ingin pingsan', 'Gejala jantung (cardiovascular) : termasuk tachycardia, jantung berdebar, tekanan pada bagian dada, dentaman pada pembuluh darah, dan perasaan seakanakan ingin pingsan.', '2021-06-22', '2021-12-21'),
(10, 'Gejala pernafasan seperti : sesak nafas atau kontraksi pada tenggorokan atau dada, atau rasa seperti tercekik', 'Gejala pernafasan : seperti merasa sesak nafas atau kontraksi pada tenggorokan atau dada, atau rasa seperti tercekik.', '2021-06-22', '2021-12-21'),
(11, 'Gejala usus (Gastro-intestinal) seperti : sulit menelan, merasa ada tekanan pada bagian perut, gangguan pencernaan (rasa panas pada bagian perut, sakit perut berhubungan dengan makanan, mual dan muntah), perut terasa keroncongan dan diare', 'Gejala usus (Gastro-intestinal) : seperti sulit menelan, merasa ada tekanan pada bagian perut, gangguan pencernaan (rasa panas pada bagian perut, sakit perut berhubungan dengan makanan, mual dan muntah), perut terasa keroncongan dan diare.', '2021-06-22', '2021-12-21'),
(12, 'Gejala saluran kencing (genitourinary) seperti : sering atau susah buang air kecil, menstruasi tidak teratur, anorgasmia, ejakulasi dini', 'Gejala Saluran Kencing (genito-urinary): termasuk gejala-gejala non-organik atau psikis, seperti: sering atau susah buang air kecil, menstruasi tidak teratur, anorgasmia, ejakulasi dini.', '2021-06-22', '2021-12-21'),
(13, 'Gejala otonom seperti : mulut terasa kering, pucat, sering keluar keringat dingin dan pusing', 'Gejala Otonom : seperti mulut terasa kering, pucat, sering keluar keringat dingin dan pusing.', '2021-06-22', '2021-12-21'),
(14, 'Sikap pada saat menggunakan sistem seperti: tertekan, nervous, gelisah, tegang, suara gemetar, pucat, keluar keringat', 'Sikap pada saat mengguakan sistem seperti : pasien kelihatan tertekan, nervous, gelisah, tegang, suara gemetar, pucat, keluar keringat.', '2021-06-22', '2021-11-16');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pasien`
--

CREATE TABLE `pasien` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `umur` int(11) NOT NULL,
  `jenis_kelamin` varchar(10) NOT NULL,
  `nomor_hp` varchar(30) NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pasien`
--

INSERT INTO `pasien` (`id`, `nama`, `umur`, `jenis_kelamin`, `nomor_hp`, `created_at`, `updated_at`) VALUES
(43, 'Reyza', 22, 'Laki-laki', '082242291496', '2021-11-25', '2021-11-25'),
(44, 'rizky ananda', 23, 'Perempuan', '081242969051', '2021-11-28', '2021-11-28'),
(45, 'ruli', 17, 'Laki-laki', '0987654321', '2021-11-29', '2021-11-29'),
(47, 'Abd Rahim I Butolo', 21, 'Laki-laki', '085696216434', '2021-12-21', '2021-12-21'),
(48, 'Nurhidayah Saptono', 9, 'Perempuan', '081269310113', '2021-12-21', '2021-12-21'),
(49, 'Maria Babby Chrisva', 21, 'Perempuan', '081354597770', '2021-12-21', '2021-12-21'),
(50, 'Rizaldi Agil Faturrahman', 19, 'Laki-laki', '08111111111', '2021-12-21', '2021-12-21'),
(51, 'Mamat Darise', 21, 'Laki-laki', '082347265831', '2021-12-21', '2021-12-21'),
(52, 'Jumaidil Aruam', 20, 'Laki-laki', '085343633481', '2021-12-21', '2021-12-21'),
(53, 'Ni Nengah Widiani', 19, 'Perempuan', '081523965806', '2021-12-21', '2021-12-21'),
(54, 'Nadila Saitri', 21, 'Perempuan', '082188097973', '2021-12-21', '2021-12-21'),
(55, 'Wahyudin Maela', 19, 'Laki-laki', '082122001695', '2021-12-21', '2021-12-21'),
(56, 'Alfandi Timorti Pabara', 22, 'Laki-laki', '082358798804', '2021-12-21', '2021-12-21'),
(57, 'Muhammad Dival Maulana', 20, 'Laki-laki', '082113921064', '2021-12-21', '2021-12-21'),
(58, 'Anugrah Aldin', 19, 'Laki-laki', '087874547522', '2021-12-21', '2021-12-21'),
(59, 'Gayuh Laksono', 22, 'Laki-laki', '082292257089', '2021-12-21', '2021-12-21'),
(60, 'Ferri Rama Chandra', 19, 'Laki-laki', '082145110099', '2021-12-21', '2021-12-21'),
(61, 'Alvin Christian Davidson', 19, 'Laki-laki', '082290491884', '2021-12-21', '2021-12-21'),
(62, 'Riyandi Dwitama Djohari', 20, 'Laki-laki', '082346569131', '2021-12-21', '2021-12-21'),
(63, 'Chairul Muluk', 20, 'Laki-laki', '082184763570', '2021-12-21', '2021-12-21'),
(64, 'Asmaun', 19, 'Perempuan', '082291624437', '2021-12-21', '2021-12-21'),
(65, 'Mohammad Wafi Abdillah', 20, 'Laki-laki', '082293882230', '2021-12-21', '2021-12-21'),
(66, 'Nandana Niranjana', 20, 'Laki-laki', '082292439540', '2021-12-21', '2021-12-21'),
(67, 'Atira Damayanti', 19, 'Perempuan', '082189063703', '2021-12-21', '2021-12-21'),
(68, 'Amalya Magfira', 23, 'Perempuan', '082293691961', '2021-12-21', '2021-12-21'),
(69, 'Moh Abied Rabbani', 22, 'Laki-laki', '082292712250', '2021-12-21', '2021-12-21'),
(70, 'Nailul Hidayat Ramadhan', 21, 'Laki-laki', '082188171900', '2021-12-21', '2021-12-21'),
(71, 'Enggartriasna Alifianto Harun', 20, 'Laki-laki', '082292379175', '2021-12-21', '2021-12-21'),
(72, 'Nur Amalia Putri', 23, 'Perempuan', '082292382266', '2021-12-21', '2021-12-21'),
(73, 'Moh Nur M Tahir', 21, 'Laki-laki', '082293094306', '2021-12-21', '2021-12-21'),
(74, 'Sultan', 22, 'Laki-laki', '082231233664', '2021-12-21', '2021-12-21'),
(75, 'Fahmil', 20, 'Laki-laki', '082290704289', '2021-12-21', '2021-12-21'),
(76, 'Chandra Setiawan', 22, 'Laki-laki', '082193010571', '2021-12-21', '2021-12-21'),
(77, 'Wahyudin Maela', 19, 'Laki-laki', '081222001695', '2021-12-23', '2021-12-23'),
(78, 'Responden', 20, 'Laki-laki', '0808080808', '2021-12-23', '2021-12-23');

-- --------------------------------------------------------

--
-- Struktur dari tabel `penyakit`
--

CREATE TABLE `penyakit` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `keterangan` text NOT NULL,
  `solusi` text NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `penyakit`
--

INSERT INTO `penyakit` (`id`, `nama`, `keterangan`, `solusi`, `created_at`, `updated_at`) VALUES
(1, 'Tidak Ada Kecemasan ', 'Tidak ada kecemasan adalah kondisi dimana kesehatan mental masih dalam keadaan baik-baik saja dan belum mengalami gangguan (dr. Dewi Suryani Angjaja Sp.KJ, 2021) ', 'Solusi dari pakar : tetap menjaga kondisi tubuh baik fisik maupun mental.', '2021-05-31', '2021-12-21'),
(2, 'Kecemasan Ringan (Mild Anxiety)', 'Kecemasan ringan adalah cemas yang normal yang biasa menjadi bagian sehari-hari dan menyebabkan seseorang menjadi waspada dan meningkatkan perhatian, tetapi individu masih mampu memecahkan masalahnya (dr. Dewi Suryani Angjaja Sp.KJ, 2021) ', 'Solusi dari pakar : melakukan konsultasi kepada psikolog jika diperlukan.', '2021-06-22', '2021-12-21'),
(3, 'Kecemasan Sedang (Moderate Anxiety) ', 'Kecemasan sedang adalah kecemasan yang menjadikan seseorang untuk terfokus pada hal yang dirasakan penting dengan mengesampingkan aspek hal yang lain, sehingga seseorang masuk dalam kondisi perhatian yang selektif tetapi tetap dapat melakukan suatu hal tertentu dengan lebih terarah.(dr. Dewi Suryani Angjaja Sp.KJ, 2021) ', 'Solusi dari pakar : melakukan konsultasi kepada psikiater bila keluhan tidak juga membaik.', '2021-06-22', '2021-12-21'),
(4, 'Kecemasan Berat (Severe Anxiety) ', 'Kecemasan berat adalah kecemasan yang dapat menyebabkan seseorang cenderung untuk memusatkan pada sesuatu yang lebih terperinci, spesifik serta tidak dapat berpikir tentang perihal lain serta akan memerlukan banyak pengarahan agar dapat memusatkan perhatian pada suatu objek yang lain. (dr. Dewi Suryani Angjaja Sp.KJ, 2021) ', 'Solusi dari pakar : melakukan konsultasi kepada psikiater untuk mendapatkan penanganan lebih lanjut agar tidak memicu adanya gangguan mental yang lain pada diri pasien.', '2021-06-22', '2021-12-21');

-- --------------------------------------------------------

--
-- Struktur dari tabel `reset_password`
--

CREATE TABLE `reset_password` (
  `id` int(11) NOT NULL,
  `kunci` text NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `reset_password`
--

INSERT INTO `reset_password` (`id`, `kunci`, `user_id`, `created_at`, `updated_at`) VALUES
(3, 'ZELibzf1FtKWANep', 4, '2021-07-29 00:00:00', '2021-07-29 00:00:00'),
(4, 'oSx42AFQNXfMzBbp', 3, '2021-07-30 00:00:00', '2021-07-30 00:00:00'),
(5, 'AoiT9x6aEQOpM5qR', 10, '2021-08-04 00:00:00', '2021-08-04 00:00:00'),
(6, 'VAcrfYde08OCLNkB', 14, '2021-11-23 00:00:00', '2021-11-23 00:00:00'),
(7, '2cJoe7btQ8RFPEdZ', 14, '2021-11-23 00:00:00', '2021-11-23 00:00:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `riwayat`
--

CREATE TABLE `riwayat` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `pasien_id` int(11) NOT NULL,
  `penyakit_id` int(11) NOT NULL,
  `tanggal_konsultasi` datetime NOT NULL DEFAULT current_timestamp(),
  `diagnosis` varchar(255) NOT NULL,
  `solusi` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `nilai_skor` int(100) NOT NULL,
  `nilai_cf` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `riwayat`
--

INSERT INTO `riwayat` (`id`, `user_id`, `pasien_id`, `penyakit_id`, `tanggal_konsultasi`, `diagnosis`, `solusi`, `created_at`, `updated_at`, `nilai_skor`, `nilai_cf`) VALUES
(1, 18, 76, 1, '2022-02-23 13:04:39', 'Kecemasan Sedang (Moderate Anxiety) ', 'Solusi dari pakar : tetap menjaga kondisi tubuh baik fisik maupun mental.', '2022-02-23 12:04:39', '2022-02-23 12:04:39', 21, '99.66796875'),
(2, 19, 75, 1, '2022-02-23 13:06:02', 'Tidak Ada Kecemasan ', 'Solusi dari pakar : tetap menjaga kondisi tubuh baik fisik maupun mental.', '2022-02-23 12:06:02', '2022-02-23 12:06:02', 5, '55.62946875'),
(3, 20, 74, 1, '2022-02-23 13:07:28', 'Kecemasan Berat (Severe Anxiety) ', 'Solusi dari pakar : tetap menjaga kondisi tubuh baik fisik maupun mental.', '2022-02-23 12:07:28', '2022-02-23 12:07:28', 32, '99.99984646875'),
(4, 21, 73, 1, '2022-02-23 13:08:30', 'Tidak Ada Kecemasan ', 'Solusi dari pakar : tetap menjaga kondisi tubuh baik fisik maupun mental.', '2022-02-23 12:08:30', '2022-02-23 12:08:30', 5, '61.6171875'),
(5, 22, 72, 1, '2022-02-23 13:09:27', 'Kecemasan Ringan (Mild Anxiety)', 'Solusi dari pakar : tetap menjaga kondisi tubuh baik fisik maupun mental.', '2022-02-23 12:09:27', '2022-02-23 12:09:27', 13, '96.65916'),
(6, 23, 71, 1, '2022-02-23 13:10:21', 'Kecemasan Sedang (Moderate Anxiety) ', 'Solusi dari pakar : tetap menjaga kondisi tubuh baik fisik maupun mental.', '2022-02-23 12:10:21', '2022-02-23 12:10:21', 15, '95.742335546265'),
(7, 23, 71, 1, '2022-02-23 13:11:20', 'Kecemasan Ringan (Mild Anxiety)', 'Solusi dari pakar : tetap menjaga kondisi tubuh baik fisik maupun mental.', '2022-02-23 12:11:20', '2022-02-23 12:11:20', 14, '94.990982995605'),
(8, 24, 70, 1, '2022-02-23 13:12:12', 'Tidak Ada Kecemasan ', 'Solusi dari pakar : tetap menjaga kondisi tubuh baik fisik maupun mental.', '2022-02-23 12:12:12', '2022-02-23 12:12:12', 4, '54.84375'),
(9, 25, 69, 1, '2022-02-23 13:13:25', 'Kecemasan Sedang (Moderate Anxiety) ', 'Solusi dari pakar : tetap menjaga kondisi tubuh baik fisik maupun mental.', '2022-02-23 12:13:25', '2022-02-23 12:13:25', 25, '99.941432476044'),
(10, 26, 68, 1, '2022-02-23 13:14:41', 'Tidak Ada Kecemasan ', 'Solusi dari pakar : tetap menjaga kondisi tubuh baik fisik maupun mental.', '2022-02-23 12:14:41', '2022-02-23 12:14:41', 6, '62.2850484375'),
(11, 27, 67, 1, '2022-02-23 13:15:40', 'Kecemasan Sedang (Moderate Anxiety) ', 'Solusi dari pakar : tetap menjaga kondisi tubuh baik fisik maupun mental.', '2022-02-23 12:15:40', '2022-02-23 12:15:40', 26, '99.9375'),
(12, 28, 66, 1, '2022-02-23 13:16:46', 'Tidak Ada Kecemasan ', 'Solusi dari pakar : tetap menjaga kondisi tubuh baik fisik maupun mental.', '2022-02-23 12:16:46', '2022-02-23 12:16:46', 6, '62.2850484375'),
(13, 29, 65, 1, '2022-02-23 13:17:44', 'Kecemasan Ringan (Mild Anxiety)', 'Solusi dari pakar : tetap menjaga kondisi tubuh baik fisik maupun mental.', '2022-02-23 12:17:44', '2022-02-23 12:17:44', 7, '67.942291171875'),
(14, 30, 64, 1, '2022-02-23 13:18:48', 'Kecemasan Sedang (Moderate Anxiety) ', 'Solusi dari pakar : tetap menjaga kondisi tubuh baik fisik maupun mental.', '2022-02-23 12:18:48', '2022-02-23 12:18:48', 21, '99.665916'),
(15, 31, 63, 1, '2022-02-23 13:19:48', 'Kecemasan Ringan (Mild Anxiety)', 'Solusi dari pakar : tetap menjaga kondisi tubuh baik fisik maupun mental.', '2022-02-23 12:19:48', '2022-02-23 12:19:48', 12, '98.4646875'),
(16, 32, 62, 1, '2022-02-23 13:20:50', 'Kecemasan Ringan (Mild Anxiety)', 'Solusi dari pakar : tetap menjaga kondisi tubuh baik fisik maupun mental.', '2022-02-23 12:20:50', '2022-02-23 12:20:50', 8, '79.609130859375'),
(17, 33, 61, 1, '2022-02-23 13:21:48', 'Kecemasan Ringan (Mild Anxiety)', 'Solusi dari pakar : tetap menjaga kondisi tubuh baik fisik maupun mental.', '2022-02-23 12:21:48', '2022-02-23 12:21:48', 12, '91.985572792969'),
(18, 34, 60, 1, '2022-02-23 13:22:42', 'Kecemasan Sedang (Moderate Anxiety) ', 'Solusi dari pakar : tetap menjaga kondisi tubuh baik fisik maupun mental.', '2022-02-23 12:22:42', '2022-02-23 12:22:42', 18, '99.871769164688'),
(19, 35, 59, 1, '2022-02-23 13:23:36', 'Tidak Ada Kecemasan ', 'Solusi dari pakar : tetap menjaga kondisi tubuh baik fisik maupun mental.', '2022-02-23 12:23:36', '2022-02-23 12:23:36', 6, '62.2850484375'),
(20, 36, 58, 1, '2022-02-23 13:24:41', 'Kecemasan Ringan (Mild Anxiety)', 'Solusi dari pakar : tetap menjaga kondisi tubuh baik fisik maupun mental.', '2022-02-23 12:24:41', '2022-02-23 12:24:41', 9, '82.667761230469'),
(21, 37, 57, 1, '2022-02-23 13:25:47', 'Tidak Ada Kecemasan ', 'Solusi dari pakar : tetap menjaga kondisi tubuh baik fisik maupun mental.', '2022-02-23 12:25:47', '2022-02-23 12:25:47', 6, '62.2850484375'),
(22, 38, 56, 1, '2022-02-23 13:26:49', 'Kecemasan Sedang (Moderate Anxiety) ', 'Solusi dari pakar : tetap menjaga kondisi tubuh baik fisik maupun mental.', '2022-02-23 12:26:49', '2022-02-23 12:26:49', 17, '99.8694984375'),
(23, 39, 55, 1, '2022-02-23 13:27:46', 'Kecemasan Sedang (Moderate Anxiety) ', 'Solusi dari pakar : tetap menjaga kondisi tubuh baik fisik maupun mental.', '2022-02-23 12:27:46', '2022-02-23 12:27:46', 24, '99.99396560775'),
(24, 40, 54, 1, '2022-02-23 13:28:44', 'Kecemasan Sedang (Moderate Anxiety) ', 'Solusi dari pakar : tetap menjaga kondisi tubuh baik fisik maupun mental.', '2022-02-23 12:28:44', '2022-02-23 12:28:44', 15, '97.226841796875'),
(25, 41, 53, 1, '2022-02-23 13:29:43', 'Kecemasan Ringan (Mild Anxiety)', 'Solusi dari pakar : tetap menjaga kondisi tubuh baik fisik maupun mental.', '2022-02-23 12:29:43', '2022-02-23 12:29:43', 9, '79.963931982422'),
(26, 42, 52, 1, '2022-02-23 13:30:45', 'Kecemasan Ringan (Mild Anxiety)', 'Solusi dari pakar : tetap menjaga kondisi tubuh baik fisik maupun mental.', '2022-02-23 12:30:45', '2022-02-23 12:30:45', 8, '79.609130859375'),
(27, 43, 51, 1, '2022-02-23 13:31:41', 'Kecemasan Ringan (Mild Anxiety)', 'Solusi dari pakar : tetap menjaga kondisi tubuh baik fisik maupun mental.', '2022-02-23 12:31:41', '2022-02-23 12:31:41', 14, '94.990982995605'),
(28, 44, 50, 1, '2022-02-23 13:32:39', 'Kecemasan Berat (Severe Anxiety) ', 'Solusi dari pakar : tetap menjaga kondisi tubuh baik fisik maupun mental.', '2022-02-23 12:32:39', '2022-02-23 12:32:39', 30, '99.950523488224'),
(29, 45, 49, 1, '2022-02-23 13:33:35', 'Kecemasan Sedang (Moderate Anxiety) ', 'Solusi dari pakar : tetap menjaga kondisi tubuh baik fisik maupun mental.', '2022-02-23 12:33:35', '2022-02-23 12:33:35', 18, '98.296934218506'),
(30, 46, 48, 1, '2022-02-23 13:35:30', 'Tidak Ada Kecemasan ', 'Solusi dari pakar : tetap menjaga kondisi tubuh baik fisik maupun mental.', '2022-02-23 12:35:30', '2022-02-23 12:35:30', 6, '71.77734375'),
(31, 47, 47, 1, '2022-02-23 13:36:24', 'Kecemasan Ringan (Mild Anxiety)', 'Solusi dari pakar : tetap menjaga kondisi tubuh baik fisik maupun mental.', '2022-02-23 12:36:24', '2022-02-23 12:36:24', 12, '94.002685546875'),
(32, 2, 78, 1, '2022-02-23 13:37:24', 'Kecemasan Sedang (Moderate Anxiety) ', 'Solusi dari pakar : tetap menjaga kondisi tubuh baik fisik maupun mental.', '2022-02-23 12:37:24', '2022-02-23 12:37:24', 16, '98.22517875');

-- --------------------------------------------------------

--
-- Struktur dari tabel `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `roles`
--

INSERT INTO `roles` (`id`, `nama`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2021-05-26', '2021-05-26'),
(2, 'member', '2021-05-26', '2021-05-26'),
(3, 'pakar', '2021-07-08', '2021-07-08');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nama_lengkap` varchar(255) NOT NULL,
  `email` varchar(40) NOT NULL,
  `role_id` int(11) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL,
  `login_attemp` datetime NOT NULL,
  `gambar` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `nama_lengkap`, `email`, `role_id`, `is_active`, `created_at`, `updated_at`, `login_attemp`, `gambar`) VALUES
(1, 'admin', '$2y$10$O9MjxWje6GNrSuk1cD2i6.6bnPnpcv9oSLhZHTpmmJByK03Up39BG', 'Admin', 'admin@email.com', 1, 1, '2021-05-26', '2021-05-26', '2022-02-23 07:41:14', 'ejja.jpeg'),
(2, 'pakar', '$2y$10$O9MjxWje6GNrSuk1cD2i6.6bnPnpcv9oSLhZHTpmmJByK03Up39BG', 'Pakar', 'pakar@gmail.com', 3, 1, '2021-07-08', '2021-11-14', '2022-02-23 07:51:34', 'eja.jpeg'),
(3, 'reyzaeja', '$2y$10$rwWRsn5vDTp14U0Q0c/s9OWTCa8C1yxITrSek13/rUiub9qawa9SG', 'Reyza Cahya Ramadhan', 'reyzacramadhan96@gmail.com', 2, 1, '2021-11-02', '2021-12-23', '2021-12-21 08:09:47', 'default.jpg'),
(18, 'chandrasetiawan', '$2y$10$ImQFWlfBTaCrXIsTLaaA/u80wGjJj2TPJuP.7QASlpdpEYcJrIhyW', 'Chandra Setiawan', 'chandrasetiawan944@gmail.com', 2, 1, '2021-12-21', '2021-12-21', '2022-02-23 06:02:47', 'default.jpg'),
(19, 'fahmil', '$2y$10$T.AFr07eqxJPJmahwEfnwulh8XlKTKvcPj8sw6nkRKJ0R.UHJrOAK', 'Fahmil', 'fahmilclack8@gmail.com', 2, 1, '2021-12-21', '2021-12-21', '2022-02-23 06:05:28', 'default.jpg'),
(20, 'sultan', '$2y$10$3SNJiCdEibONx6GmIVeL8OVQKVT0VaXNlK7ZNesKUxYeqtcSF3Nri', 'Sultan', 'sull.tann038@gmail.com', 2, 1, '2021-12-21', '2021-12-21', '2022-02-23 06:06:46', 'default.jpg'),
(21, 'nurtahir', '$2y$10$OpXKZNqaCFB8egbDmouaDu7sa4cxp5vp1FOLv/5yQ1070LRx0jX6C', 'Moh Nur M Tahir', 'moh.nur.m.tahir123@gmail.com', 2, 1, '2021-12-21', '2021-12-21', '2022-02-23 06:07:43', 'default.jpg'),
(22, 'puteee', '$2y$10$jX0enYtJ93EuOoDApL5hJ.1WMQ.SgVM.3uFqEZbs.Ma/v4HpSddpy', 'Nur Amalia Putri', 'nuramalia1969@gmail.com', 2, 1, '2021-12-21', '2021-12-21', '2022-02-23 06:08:49', 'default.jpg'),
(23, 'enggar', '$2y$10$PkKTcjqZ93tJbp4PUXimD.rjQvs9HyMFwRipeqQHkgagF1aiMQDDG', 'Enggartiasna Alifianto Harun', 'enggariasnaalifiantoharun@gmail.com', 2, 1, '2021-12-21', '2021-12-21', '2022-02-23 06:09:43', 'default.jpg'),
(24, 'nailul', '$2y$10$mHl/4zYQTzokPS/.Xp/C5e8O/oXV4Stbr.ECJ7vDiLPyFfGPAuNbW', 'Nailul Hidayat Ramadhan', 'hidayat.nailul11@gmail.com', 2, 1, '2021-12-21', '2021-12-21', '2022-02-23 06:11:33', 'default.jpg'),
(25, 'abied', '$2y$10$fxr6IaZDFlbQLt6wM2RjsO6tUb0CWOQ2kCW.o/CLuyZ59XF/P4soC', 'Moh Abied Rabbani', 'abiedrabbani90@gmail.com', 2, 1, '2021-12-21', '2021-12-21', '2022-02-23 06:12:33', 'default.jpg'),
(26, 'amelll', '$2y$10$uOqBNigFXAgtGFY32g.97.1EQlXO0PIsl.nDyjKqnIEq8HJy2tdfW', 'Amalya Magfira', 'amalyamagfira@gmail.com', 2, 1, '2021-12-21', '2021-12-21', '2022-02-23 06:13:55', 'default.jpg'),
(27, 'atira', '$2y$10$c9cevM/6h58EHwyvqGcjjOM0MatCYMJGdh3U9fOjsnB/M35QJPJ3.', 'Atira Damayanti', 'atiradamayanti22@gmail.com', 2, 1, '2021-12-21', '2021-12-21', '2022-02-23 06:14:57', 'default.jpg'),
(28, 'nandana', '$2y$10$7E32Tp0B4TP1Xr/GweTC/.FzVBYig.4MlIO1rdTz2rqLKfwsnrF5i', 'Nandana Niranjana', 'nandananiranjana5@gmail.com', 2, 1, '2021-12-21', '2021-12-21', '2022-02-23 06:15:58', 'default.jpg'),
(29, 'wafiii', '$2y$10$iRswns1AXa1.nql.rVYRyOiBJuMZCGgXFHSURrecYyvf.A/joVtje', 'Mohammad Wafi Abdillah', 'wafiabdillah22@gmail.com', 2, 1, '2021-12-21', '2021-12-21', '2022-02-23 06:16:58', 'default.jpg'),
(30, 'asmaun', '$2y$10$Cez/87cuKNyKWAG0HqxJXOu9v/E3GVaGo7uAr6VJWiMD6UN4zN1F6', 'Asmaun', 'hasyanasry@gmail.com', 2, 1, '2021-12-21', '2021-12-21', '2022-02-23 06:18:02', 'default.jpg'),
(31, 'chairul', '$2y$10$PTfS3Wb6xTuYUsEE5kfJUuoWlYU7PefBv86kxbMvI0wC19Eq4XU82', 'Chairul Muluk', 'chairul.muluk28@gmail.com', 2, 1, '2021-12-21', '2021-12-21', '2022-02-23 06:19:04', 'default.jpg'),
(32, 'riyandi', '$2y$10$1hcD4.WXtLLV465jo0bYYO7nREQAozCci5/SntagmoDdHxbB8fBTy', 'Riyandi Dwitama Djohari', 'riyandidjohary8@gmail.com', 2, 1, '2021-12-21', '2021-12-21', '2022-02-23 06:20:04', 'default.jpg'),
(33, 'alvin', '$2y$10$8oLS4MNHumlRCkjybver4.DRm8buQdDDi4/Mr7HILNTLAkIa6HatS', 'Alvin Christian Davidson ', 'alvintherry20@gmail.com', 2, 1, '2021-12-21', '2021-12-21', '2022-02-23 06:21:05', 'default.jpg'),
(34, 'ferri', '$2y$10$Kom4POWGI.IIBfAhJf7Lju9oIKb0C9NOmEBQWm0LxvW98U4heMH3u', 'Ferri Rama Chandra', 'ferriramachandra@gmail.com', 2, 1, '2021-12-21', '2021-12-21', '2022-02-23 06:22:01', 'default.jpg'),
(35, 'gayuh', '$2y$10$JQX7WlMT32Wdsb29LTOGCOTizQUCoJRiRbMTjJMIItXJlWMx0ul3u', 'Gayuh Laksono', 'laksono.doank@gmail.com', 2, 1, '2021-12-21', '2021-12-21', '2022-02-23 06:22:55', 'default.jpg'),
(36, 'anugrah', '$2y$10$dHOM.QIsbfvp.a8zJZxoieAvgLhveUY6u8eUflRpwbnboFzWLxYry', 'Anugrah Aldin', 'didiyotolembah19@gmail.com', 2, 1, '2021-12-21', '2021-12-21', '2022-02-23 06:23:54', 'default.jpg'),
(37, 'dival', '$2y$10$Fs3GtDDeeORJBc9uDziHl.P0Vcc9Bb7xQgfpk1DOCsy/KEjvP/Mfy', 'Muhammad Dival Maulana', 'dival92@gmail.com', 2, 1, '2021-12-21', '2021-12-21', '2022-02-23 06:25:00', 'default.jpg'),
(38, 'alfandi', '$2y$10$JECp7xPyGhgIgb91y8L1SOYjQSoncIz5GRsfEPhz7lVEKYYHNsTpy', 'Alfandi Timorti Pabara', 'timortialfandi@gmail.com', 2, 1, '2021-12-21', '2021-12-21', '2022-02-23 06:26:02', 'default.jpg'),
(39, 'wahyudin', '$2y$10$eVuYYjwYADNRUiXeK7fFqub9aYkTUj/cXehs7bmm2tCF/A//BLQn2', 'Wahyudin Maela', 'wahyudinmaela6@gmail.com', 2, 1, '2021-12-21', '2021-12-21', '2022-02-23 06:27:02', 'default.jpg'),
(40, 'nadila', '$2y$10$LojtAppLJKYVGmt/YCbQQO2E3BmByXGZtQyYkdwKAbPC3003JWP5u', 'Nadila Safitri', 'snadila30@gmail.com', 2, 1, '2021-12-21', '2021-12-21', '2022-02-23 06:27:59', 'default.jpg'),
(41, 'widiani', '$2y$10$veb7FmQzQ1A0Zt/xnDh6tOwzbZoR6VRWFZZ5tMOg8vToqeffWPsW6', 'Ni Nengah Widiani', 'nengahwidiani18@gmail.com', 2, 1, '2021-12-21', '2021-12-21', '2022-02-23 06:29:00', 'default.jpg'),
(42, 'jumaidil', '$2y$10$Ml0z1hM4BiTqzPJXI0ARV.SW8JGp6AvIEs4HPHtoykjxlJi8ujC0e', 'Jumaidil Aruam', 'aruamjumaidil@gmail.com', 2, 1, '2021-12-21', '2021-12-21', '2022-02-23 06:30:00', 'default.jpg'),
(43, 'mamat', '$2y$10$3DM4LI8Qqn8AloGUcKY/9.OXbI99BWmQHl8UAT.slnjXgCkxanNcG', 'Mamat Darise', 'mamatdarise@gmail.com', 2, 1, '2021-12-21', '2021-12-21', '2022-02-23 06:31:01', 'default.jpg'),
(44, 'rizaldi', '$2y$10$ZFSuC3SXHsZMG/jDxrW4MeiQZKvALKx2/tS4nzmUr9vLZibCEb8ya', 'Rizaldi Agil Faturrahman', 'rizaldiagiltf52120008@gmail.com', 2, 1, '2021-12-21', '2021-12-21', '2022-02-23 06:31:57', 'default.jpg'),
(45, 'maria', '$2y$10$5.JUp7hJzzdfnsg6KpbZHe.ypuwYBdGl0Qt1obwIZn6IOgBpoa82W', 'Maria Babby Cahrisva', 'maria.chrisva370@gmail.com', 2, 1, '2021-12-21', '2021-12-21', '2022-02-23 06:32:54', 'default.jpg'),
(46, 'azizah', '$2y$10$LF3WI8lygCEw6RNe5Vlixe582ytcxcAtD80c7lOD1c99Hpq76hd2W', 'Nurhidayah Saptono', 'alpaca12j@gmail.com', 2, 1, '2021-12-21', '2021-12-21', '2022-02-23 06:34:10', 'default.jpg'),
(47, 'aimmm', '$2y$10$g3bPU0YsbQfJJQ1YgV970O55iLKMR3H6Tl7a1JqVE0yAmIZU/jbfy', 'Abd Rahim I Butolo', 'abdulrahimbutolo22@gmail.com', 2, 1, '2021-12-21', '2021-12-21', '2022-02-23 06:35:42', 'default.jpg'),
(52, 'hbkj', '$2y$10$pfmqmnx0zNPcMgxnLFXv6O9AT3XMIGNZS6Uqu7/p9t3z0i/ZDyjMi', 'gfygf677', 'jhghjhg@kkk', 2, 0, '2022-02-23', '2022-02-23', '0000-00-00 00:00:00', 'default.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_token`
--

CREATE TABLE `user_token` (
  `id` int(11) NOT NULL,
  `email` varchar(128) NOT NULL,
  `token` varchar(225) NOT NULL,
  `date_created` int(111) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `artikel`
--
ALTER TABLE `artikel`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `certainty`
--
ALTER TABLE `certainty`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `certainty1`
--
ALTER TABLE `certainty1`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `gejala`
--
ALTER TABLE `gejala`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pasien`
--
ALTER TABLE `pasien`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `penyakit`
--
ALTER TABLE `penyakit`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `reset_password`
--
ALTER TABLE `reset_password`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeks untuk tabel `riwayat`
--
ALTER TABLE `riwayat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`) USING BTREE,
  ADD KEY `pasien_id` (`pasien_id`),
  ADD KEY `penyakit_id` (`penyakit_id`);

--
-- Indeks untuk tabel `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `role_id` (`role_id`);

--
-- Indeks untuk tabel `user_token`
--
ALTER TABLE `user_token`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `artikel`
--
ALTER TABLE `artikel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `certainty`
--
ALTER TABLE `certainty`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;

--
-- AUTO_INCREMENT untuk tabel `certainty1`
--
ALTER TABLE `certainty1`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT untuk tabel `gejala`
--
ALTER TABLE `gejala`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT untuk tabel `pasien`
--
ALTER TABLE `pasien`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT untuk tabel `penyakit`
--
ALTER TABLE `penyakit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT untuk tabel `reset_password`
--
ALTER TABLE `reset_password`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `riwayat`
--
ALTER TABLE `riwayat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT untuk tabel `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT untuk tabel `user_token`
--
ALTER TABLE `user_token`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `riwayat`
--
ALTER TABLE `riwayat`
  ADD CONSTRAINT `riwayat_ibfk_1` FOREIGN KEY (`pasien_id`) REFERENCES `pasien` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
