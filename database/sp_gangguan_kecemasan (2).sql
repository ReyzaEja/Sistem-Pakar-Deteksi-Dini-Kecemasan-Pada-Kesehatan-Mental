-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 05 Jan 2022 pada 08.25
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
(3, 'Reyza', 22, 'Laki-laki', '082242291496', '2021-11-25', '2021-11-25'),
(18, 'Chandra Setiawan', 22, 'Laki-laki', '082193010571', '2021-12-21', '2021-12-21'),
(19, 'Fahmil', 20, 'Laki-laki', '082290704289', '2021-12-21', '2021-12-21'),
(20, 'Sultan', 22, 'Laki-laki', '082231233664', '2021-12-21', '2021-12-21'),
(26, 'Amalya Magfira', 23, 'Perempuan', '082293691961', '2021-12-21', '2021-12-21'),
(44, 'rizky ananda', 23, 'Perempuan', '081242969051', '2021-11-28', '2021-11-28'),
(45, 'ruli', 17, 'Laki-laki', '0987654321', '2021-11-29', '2021-11-29'),
(47, 'Abd. Rahim I Butolo', 21, 'Laki-laki', '085696216434', '2021-12-21', '2021-12-21'),
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
(69, 'Moh. Abied Rabbani', 22, 'Laki-laki', '082292712250', '2021-12-21', '2021-12-21'),
(70, 'Nailul Hidayat Ramadhan', 21, 'Laki-laki', '082188171900', '2021-12-21', '2021-12-21'),
(71, 'Enggartriasna Alifianto Harun', 20, 'Laki-laki', '082292379175', '2021-12-21', '2021-12-21'),
(72, 'Nur Amalia Putri', 23, 'Perempuan', '082292382266', '2021-12-21', '2021-12-21'),
(73, 'Moh. Nur M Tahir', 21, 'Laki-laki', '082293094306', '2021-12-21', '2021-12-21'),
(77, 'Wahyudin Maela', 19, 'Laki-laki', '081222001695', '2021-12-23', '2021-12-23'),
(78, 'Responden', 20, 'Laki-laki', '0808080808', '2021-12-23', '2021-12-23'),
(79, 'Reyza', 22, 'Laki-laki', '089999', '2021-12-25', '2021-12-25');

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
(58, 2, 3, 1, '2021-12-23 09:35:30', 'Kecemasan Berat', 'Solusi dari pakar : tetap menjaga kondisi tubuh baik fisik maupun mental.', '2021-12-23 08:35:30', '2021-12-23 08:35:30', 37, '99.99999913536'),
(59, 18, 18, 1, '2021-12-23 09:38:28', 'Kecemasan Sedang', 'Solusi dari pakar : tetap menjaga kondisi tubuh baik fisik maupun mental.', '2021-12-23 08:38:28', '2021-12-23 08:38:28', 21, '99.92088006817'),
(60, 19, 19, 1, '2021-12-23 09:40:00', 'Tidak Ada Kecemasan', 'Solusi dari pakar : tetap menjaga kondisi tubuh baik fisik maupun mental.', '2021-12-23 08:40:00', '2021-12-23 08:40:00', 5, '72.041844726563'),
(61, 20, 20, 1, '2021-12-23 09:41:27', 'Kecemasan Berat', 'Solusi dari pakar : tetap menjaga kondisi tubuh baik fisik maupun mental.', '2021-12-23 08:41:27', '2021-12-23 08:41:27', 32, '99.999951662902'),
(62, 21, 73, 1, '2021-12-23 09:42:36', 'Tidak Ada Kecemasan', 'Solusi dari pakar : tetap menjaga kondisi tubuh baik fisik maupun mental.', '2021-12-23 08:42:36', '2021-12-23 08:42:36', 5, '74.398359375'),
(63, 22, 72, 1, '2021-12-23 09:43:51', 'Kecemasan Ringan', 'Solusi dari pakar : tetap menjaga kondisi tubuh baik fisik maupun mental.', '2021-12-23 08:43:51', '2021-12-23 08:43:51', 13, '98.761611549683'),
(64, 23, 71, 1, '2021-12-23 09:46:03', 'Kecemasan Ringan', 'Solusi dari pakar : tetap menjaga kondisi tubuh baik fisik maupun mental.', '2021-12-23 08:46:03', '2021-12-23 08:46:03', 14, '98.34910041822'),
(65, 24, 70, 1, '2021-12-23 09:47:13', 'Tidak Ada Kecemasan', 'Solusi dari pakar : tetap menjaga kondisi tubuh baik fisik maupun mental.', '2021-12-23 08:47:13', '2021-12-23 08:47:13', 4, '66.965625'),
(66, 25, 69, 1, '2021-12-23 09:48:34', 'Kecemasan Sedang', 'Solusi dari pakar : tetap menjaga kondisi tubuh baik fisik maupun mental.', '2021-12-23 08:48:34', '2021-12-23 08:48:34', 25, '99.986390318353'),
(67, 26, 26, 1, '2021-12-23 09:49:46', 'Tidak Ada Kecemasan', 'Solusi dari pakar : tetap menjaga kondisi tubuh baik fisik maupun mental.', '2021-12-23 08:49:46', '2021-12-23 08:49:46', 6, '78.332429663086'),
(68, 27, 67, 1, '2021-12-23 09:51:12', 'Kecemasan Sedang', 'Solusi dari pakar : tetap menjaga kondisi tubuh baik fisik maupun mental.', '2021-12-23 08:51:12', '2021-12-23 08:51:12', 26, '99.989216718968'),
(69, 28, 66, 1, '2021-12-23 09:52:15', 'Tidak Ada Kecemasan', 'Solusi dari pakar : tetap menjaga kondisi tubuh baik fisik maupun mental.', '2021-12-23 08:52:15', '2021-12-23 08:52:15', 6, '78.332429663086'),
(70, 29, 65, 1, '2021-12-23 09:53:29', 'Kecemasan Ringan', 'Solusi dari pakar : tetap menjaga kondisi tubuh baik fisik maupun mental.', '2021-12-23 08:53:29', '2021-12-23 08:53:29', 7, '83.207632988892'),
(71, 30, 64, 1, '2021-12-23 09:54:53', 'Kecemasan Sedang', 'Solusi dari pakar : tetap menjaga kondisi tubuh baik fisik maupun mental.', '2021-12-23 08:54:53', '2021-12-23 08:54:53', 21, '99.928057370964'),
(72, 31, 63, 1, '2021-12-23 09:56:10', 'Kecemasan Ringan', 'Solusi dari pakar : tetap menjaga kondisi tubuh baik fisik maupun mental.', '2021-12-23 08:56:10', '2021-12-23 08:56:10', 12, '99.167946679688'),
(73, 32, 62, 1, '2021-12-23 09:57:26', 'Kecemasan Ringan', 'Solusi dari pakar : tetap menjaga kondisi tubuh baik fisik maupun mental.', '2021-12-23 08:57:26', '2021-12-23 08:57:26', 8, '89.087300683594'),
(74, 33, 61, 1, '2021-12-23 09:58:38', 'Kecemasan Ringan', 'Solusi dari pakar : tetap menjaga kondisi tubuh baik fisik maupun mental.', '2021-12-23 08:58:38', '2021-12-23 08:58:38', 12, '96.998364396764'),
(75, 34, 60, 1, '2021-12-23 09:59:43', 'Kecemasan Sedang', 'Solusi dari pakar : tetap menjaga kondisi tubuh baik fisik maupun mental.', '2021-12-23 08:59:43', '2021-12-23 08:59:43', 18, '99.945424807214'),
(76, 35, 59, 1, '2021-12-23 10:01:19', 'Tidak Ada Kecemasan', 'Solusi dari pakar : tetap menjaga kondisi tubuh baik fisik maupun mental.', '2021-12-23 09:01:19', '2021-12-23 09:01:19', 6, '78.332429663086'),
(77, 36, 58, 1, '2021-12-23 10:02:32', 'Kecemasan Ringan', 'Solusi dari pakar : tetap menjaga kondisi tubuh baik fisik maupun mental.', '2021-12-23 09:02:32', '2021-12-23 09:02:32', 9, '91.542658029785'),
(78, 37, 57, 1, '2021-12-23 10:03:41', 'Tidak Ada Kecemasan', 'Solusi dari pakar : tetap menjaga kondisi tubuh baik fisik maupun mental.', '2021-12-23 09:03:41', '2021-12-23 09:03:41', 6, '78.332429663086'),
(79, 38, 56, 1, '2021-12-23 10:04:51', 'Kecemasan Sedang', 'Solusi dari pakar : tetap menjaga kondisi tubuh baik fisik maupun mental.', '2021-12-23 09:04:51', '2021-12-23 09:04:51', 17, '99.935515867676'),
(80, 39, 77, 1, '2021-12-23 10:06:43', 'Kecemasan Sedang', 'Solusi dari pakar : tetap menjaga kondisi tubuh baik fisik maupun mental.', '2021-12-23 09:06:43', '2021-12-23 09:06:43', 24, '99.997711362883'),
(81, 40, 54, 1, '2021-12-23 10:08:53', 'Kecemasan Sedang', 'Solusi dari pakar : tetap menjaga kondisi tubuh baik fisik maupun mental.', '2021-12-23 09:08:53', '2021-12-23 09:08:53', 15, '99.106693254396'),
(82, 41, 53, 1, '2021-12-23 10:10:12', 'Kecemasan Ringan', 'Solusi dari pakar : tetap menjaga kondisi tubuh baik fisik maupun mental.', '2021-12-23 09:10:12', '2021-12-23 09:10:12', 9, '90.76419814389'),
(83, 42, 52, 1, '2021-12-23 10:11:27', 'Kecemasan Ringan', 'Solusi dari pakar : tetap menjaga kondisi tubuh baik fisik maupun mental.', '2021-12-23 09:11:27', '2021-12-23 09:11:27', 8, '89.087300683594'),
(84, 43, 51, 1, '2021-12-23 10:12:41', 'Kecemasan Ringan', 'Solusi dari pakar : tetap menjaga kondisi tubuh baik fisik maupun mental.', '2021-12-23 09:12:41', '2021-12-23 09:12:41', 14, '98.34910041822'),
(85, 44, 50, 1, '2021-12-23 10:13:53', 'Kecemasan Berat', 'Solusi dari pakar : tetap menjaga kondisi tubuh baik fisik maupun mental.', '2021-12-23 09:13:53', '2021-12-23 09:13:53', 30, '99.99326126031'),
(86, 45, 49, 1, '2021-12-23 10:15:02', 'Kecemasan Sedang', 'Solusi dari pakar : tetap menjaga kondisi tubuh baik fisik maupun mental.', '2021-12-23 09:15:02', '2021-12-23 09:15:02', 18, '99.584179667839'),
(87, 46, 48, 1, '2021-12-23 10:16:07', 'Tidak Ada Kecemasan', 'Solusi dari pakar : tetap menjaga kondisi tubuh baik fisik maupun mental.', '2021-12-23 09:16:07', '2021-12-23 09:16:07', 6, '81.83109375'),
(88, 47, 47, 1, '2021-12-23 10:17:17', 'Kecemasan Ringan', 'Solusi dari pakar : tetap menjaga kondisi tubuh baik fisik maupun mental.', '2021-12-23 09:17:17', '2021-12-23 09:17:17', 12, '97.483038706055'),
(89, 2, 78, 1, '2021-12-23 10:18:42', 'Kecemasan Sedang', 'Solusi dari pakar : tetap menjaga kondisi tubuh baik fisik maupun mental.', '2021-12-23 09:18:42', '2021-12-23 09:18:42', 16, '99.472136923052'),
(90, 2, 78, 1, '2021-12-23 10:20:07', 'Tidak Ada Kecemasan', 'Solusi dari pakar : tetap menjaga kondisi tubuh baik fisik maupun mental.', '2021-12-23 09:20:07', '2021-12-23 09:20:07', 4, '90'),
(91, 2, 78, 1, '2021-12-23 10:20:48', 'Tidak Ada Kecemasan', 'Solusi dari pakar : tetap menjaga kondisi tubuh baik fisik maupun mental.', '2021-12-23 09:20:48', '2021-12-23 09:20:48', 6, '94.5'),
(92, 2, 78, 1, '2021-12-23 10:32:05', 'Tidak Ada Kecemasan', 'Solusi dari pakar : tetap menjaga kondisi tubuh baik fisik maupun mental.', '2021-12-23 09:32:05', '2021-12-23 09:32:05', 6, '94.5'),
(93, 3, 79, 1, '2021-12-25 09:37:25', 'Kecemasan Sedang (Moderate Anxiety) ', 'Solusi dari pakar : tetap menjaga kondisi tubuh baik fisik maupun mental.', '2021-12-25 08:37:25', '2021-12-25 08:37:25', 16, '99.366040374088'),
(94, 3, 79, 1, '2021-12-25 09:44:33', 'Kecemasan Berat (Severe Anxiety) ', 'Solusi dari pakar : tetap menjaga kondisi tubuh baik fisik maupun mental.', '2021-12-25 08:44:33', '2021-12-25 08:44:33', 28, '99.998782509355'),
(95, 3, 79, 0, '2021-12-25 09:50:31', 'Tidak Terdiagnosis', 'Selamat! Kondisi mental anda tergolong baik-baik saja. tidak perlu khawatir, tetap menjalani aktivitas sehari-hari dan tetap berpikir positif. Jika ingin merasa lebih baik, anda bisa mencoba audio relaksasi di bawah ini.', '2021-12-25 08:50:31', '2021-12-25 08:50:31', 0, '0'),
(96, 3, 79, 1, '2021-12-25 09:52:16', 'Kecemasan Berat (Severe Anxiety) ', 'Solusi dari pakar : tetap menjaga kondisi tubuh baik fisik maupun mental.', '2021-12-25 08:52:16', '2021-12-25 08:52:16', 42, '99.99998533213'),
(97, 3, 79, 1, '2021-12-25 09:54:12', 'Kecemasan Berat (Severe Anxiety) ', 'Solusi dari pakar : tetap menjaga kondisi tubuh baik fisik maupun mental.', '2021-12-25 08:54:12', '2021-12-25 08:54:12', 28, '99.976821909571'),
(98, 3, 79, 1, '2021-12-25 12:33:49', 'Kecemasan Berat (Severe Anxiety) ', 'Solusi dari pakar : tetap menjaga kondisi tubuh baik fisik maupun mental.', '2021-12-25 11:33:49', '2021-12-25 11:33:49', 28, '99.993896484375'),
(99, 3, 79, 1, '2021-12-25 12:35:03', 'Tidak Ada Kecemasan ', 'Solusi dari pakar : tetap menjaga kondisi tubuh baik fisik maupun mental.', '2021-12-25 11:35:03', '2021-12-25 11:35:03', 2, '50'),
(100, 3, 79, 1, '2021-12-25 12:37:37', 'Tidak Ada Kecemasan ', 'Solusi dari pakar : tetap menjaga kondisi tubuh baik fisik maupun mental.', '2021-12-25 11:37:37', '2021-12-25 11:37:37', 4, '100'),
(101, 3, 79, 0, '2021-12-25 13:14:59', 'Tidak Terdiagnosis', 'Selamat! Kondisi mental anda tergolong baik-baik saja. tidak perlu khawatir, tetap menjalani aktivitas sehari-hari dan tetap berpikir positif. Jika ingin merasa lebih baik, anda bisa mencoba audio relaksasi di bawah ini.', '2021-12-25 12:14:59', '2021-12-25 12:14:59', 0, '0'),
(102, 3, 79, 0, '2021-12-25 13:29:27', 'Tidak Terdiagnosis', 'Selamat! Kondisi mental anda tergolong baik-baik saja. tidak perlu khawatir, tetap menjalani aktivitas sehari-hari dan tetap berpikir positif. Jika ingin merasa lebih baik, anda bisa mencoba audio relaksasi di bawah ini.', '2021-12-25 12:29:27', '2021-12-25 12:29:27', 0, '0'),
(103, 3, 79, 1, '2021-12-25 13:29:51', 'Tidak Ada Kecemasan ', 'Solusi dari pakar : tetap menjaga kondisi tubuh baik fisik maupun mental.', '2021-12-25 12:29:51', '2021-12-25 12:29:51', 2, '50'),
(104, 3, 79, 0, '2021-12-25 14:10:32', 'Tidak Terdiagnosis', 'Selamat! Kondisi mental anda tergolong baik-baik saja. tidak perlu khawatir, tetap menjalani aktivitas sehari-hari dan tetap berpikir positif. Jika ingin merasa lebih baik, anda bisa mencoba audio relaksasi di bawah ini.', '2021-12-25 13:10:32', '2021-12-25 13:10:32', 0, '0'),
(105, 3, 79, 0, '2021-12-25 14:17:47', 'Tidak Terdiagnosis', 'Selamat! Kondisi mental anda tergolong baik-baik saja. tidak perlu khawatir, tetap menjalani aktivitas sehari-hari dan tetap berpikir positif. Jika ingin merasa lebih baik, anda bisa mencoba audio relaksasi di bawah ini.', '2021-12-25 13:17:47', '2021-12-25 13:17:47', 0, '0'),
(106, 3, 79, 0, '2021-12-25 14:17:59', 'Tidak Terdiagnosis', 'Selamat! Kondisi mental anda tergolong baik-baik saja. tidak perlu khawatir, tetap menjalani aktivitas sehari-hari dan tetap berpikir positif. Jika ingin merasa lebih baik, anda bisa mencoba audio relaksasi di bawah ini.', '2021-12-25 13:17:59', '2021-12-25 13:17:59', 0, '0'),
(107, 3, 79, 1, '2021-12-25 14:19:30', 'Tidak Ada Kecemasan ', 'Solusi dari pakar : tetap menjaga kondisi tubuh baik fisik maupun mental.', '2021-12-25 13:19:30', '2021-12-25 13:19:30', 2, '50'),
(108, 3, 79, 1, '2021-12-25 14:31:33', 'Tidak Ada Kecemasan ', 'Solusi dari pakar : tetap menjaga kondisi tubuh baik fisik maupun mental.', '2021-12-25 13:31:33', '2021-12-25 13:31:33', 2, '45'),
(109, 3, 79, 1, '2021-12-25 14:49:38', 'Tidak Ada Kecemasan ', 'Solusi dari pakar : tetap menjaga kondisi tubuh baik fisik maupun mental.', '2021-12-25 13:49:38', '2021-12-25 13:49:38', 2, '35'),
(110, 3, 79, 1, '2021-12-25 14:52:19', 'Tidak Ada Kecemasan ', 'Solusi dari pakar : tetap menjaga kondisi tubuh baik fisik maupun mental.', '2021-12-25 13:52:19', '2021-12-25 13:52:19', 3, '44.75'),
(111, 3, 79, 1, '2021-12-25 14:54:51', 'Tidak Ada Kecemasan ', 'Solusi dari pakar : tetap menjaga kondisi tubuh baik fisik maupun mental.', '2021-12-25 13:54:51', '2021-12-25 13:54:51', 6, '92.775'),
(112, 3, 79, 1, '2021-12-26 14:04:38', 'Kecemasan Ringan (Mild Anxiety)', 'Solusi dari pakar : tetap menjaga kondisi tubuh baik fisik maupun mental.', '2021-12-26 13:04:38', '2021-12-26 13:04:38', 12, '99'),
(113, 3, 79, 1, '2021-12-26 14:05:47', 'Kecemasan Ringan (Mild Anxiety)', 'Solusi dari pakar : tetap menjaga kondisi tubuh baik fisik maupun mental.', '2021-12-26 13:05:47', '2021-12-26 13:05:47', 12, '99'),
(114, 3, 79, 1, '2021-12-26 14:10:03', 'Kecemasan Berat (Severe Anxiety) ', 'Solusi dari pakar : tetap menjaga kondisi tubuh baik fisik maupun mental.', '2021-12-26 13:10:03', '2021-12-26 13:10:03', 28, '99.861222121922'),
(115, 3, 79, 1, '2021-12-26 14:10:58', 'Kecemasan Ringan (Mild Anxiety)', 'Solusi dari pakar : tetap menjaga kondisi tubuh baik fisik maupun mental.', '2021-12-26 13:10:58', '2021-12-26 13:10:58', 14, '89.723033046912'),
(116, 3, 79, 1, '2021-12-26 14:12:06', 'Kecemasan Ringan (Mild Anxiety)', 'Solusi dari pakar : tetap menjaga kondisi tubuh baik fisik maupun mental.', '2021-12-26 13:12:06', '2021-12-26 13:12:06', 7, '67.942291171875'),
(117, 3, 79, 1, '2021-12-26 14:13:02', 'Kecemasan Ringan (Mild Anxiety)', 'Solusi dari pakar : tetap menjaga kondisi tubuh baik fisik maupun mental.', '2021-12-26 13:13:02', '2021-12-26 13:13:02', 14, '99.7875'),
(118, 3, 79, 1, '2021-12-26 14:14:25', 'Kecemasan Sedang (Moderate Anxiety) ', 'Solusi dari pakar : tetap menjaga kondisi tubuh baik fisik maupun mental.', '2021-12-26 13:14:25', '2021-12-26 13:14:25', 16, '99.99'),
(119, 3, 79, 1, '2021-12-26 14:15:29', 'Tidak Ada Kecemasan ', 'Solusi dari pakar : tetap menjaga kondisi tubuh baik fisik maupun mental.', '2021-12-26 13:15:29', '2021-12-26 13:15:29', 4, '90'),
(120, 3, 79, 1, '2021-12-28 10:18:05', 'Kecemasan Ringan (Mild Anxiety)', 'Solusi dari pakar : tetap menjaga kondisi tubuh baik fisik maupun mental.', '2021-12-28 09:18:05', '2021-12-28 09:18:05', 9, '91.5'),
(121, 2, 79, 0, '2022-01-02 21:06:19', 'Tidak Terdiagnosis', 'Selamat! Kondisi mental anda tergolong baik-baik saja. tidak perlu khawatir, tetap menjalani aktivitas sehari-hari dan tetap berpikir positif. Jika ingin merasa lebih baik, anda bisa mencoba audio relaksasi di bawah ini.', '2022-01-02 20:06:19', '2022-01-02 20:06:19', 0, '0'),
(122, 2, 79, 0, '2022-01-02 21:29:35', 'Tidak Terdiagnosis', 'Selamat! Kondisi mental anda tergolong baik-baik saja. tidak perlu khawatir, tetap menjalani aktivitas sehari-hari dan tetap berpikir positif. Jika ingin merasa lebih baik, anda bisa mencoba audio relaksasi di bawah ini.', '2022-01-02 20:29:35', '2022-01-02 20:29:35', 0, '0'),
(123, 2, 79, 0, '2022-01-02 21:32:32', 'Tidak Terdiagnosis', 'Selamat! Kondisi mental anda tergolong baik-baik saja. tidak perlu khawatir, tetap menjalani aktivitas sehari-hari dan tetap berpikir positif. Jika ingin merasa lebih baik, anda bisa mencoba audio relaksasi di bawah ini.', '2022-01-02 20:32:32', '2022-01-02 20:32:32', 0, '0'),
(124, 2, 79, 1, '2022-01-02 21:34:36', 'Kecemasan Sedang (Moderate Anxiety) ', 'Solusi dari pakar : tetap menjaga kondisi tubuh baik fisik maupun mental.', '2022-01-02 20:34:36', '2022-01-02 20:34:36', 20, '99.99'),
(125, 2, 79, 1, '2022-01-02 21:36:37', 'Kecemasan Sedang (Moderate Anxiety) ', 'Solusi dari pakar : tetap menjaga kondisi tubuh baik fisik maupun mental.', '2022-01-02 20:36:37', '2022-01-02 20:36:37', 20, '99.99'),
(126, 2, 79, 0, '2022-01-02 21:38:00', 'Tidak Terdiagnosis', 'Selamat! Kondisi mental anda tergolong baik-baik saja. tidak perlu khawatir, tetap menjalani aktivitas sehari-hari dan tetap berpikir positif. Jika ingin merasa lebih baik, anda bisa mencoba audio relaksasi di bawah ini.', '2022-01-02 20:38:00', '2022-01-02 20:38:00', 0, '0'),
(127, 2, 79, 0, '2022-01-02 21:42:42', 'Tidak Terdiagnosis', 'Selamat! Kondisi mental anda tergolong baik-baik saja. tidak perlu khawatir, tetap menjalani aktivitas sehari-hari dan tetap berpikir positif. Jika ingin merasa lebih baik, anda bisa mencoba audio relaksasi di bawah ini.', '2022-01-02 20:42:42', '2022-01-02 20:42:42', 0, '0'),
(128, 2, 79, 0, '2022-01-02 21:49:15', 'Tidak Terdiagnosis', 'Selamat! Kondisi mental anda tergolong baik-baik saja. tidak perlu khawatir, tetap menjalani aktivitas sehari-hari dan tetap berpikir positif. Jika ingin merasa lebih baik, anda bisa mencoba audio relaksasi di bawah ini.', '2022-01-02 20:49:15', '2022-01-02 20:49:15', 0, '0'),
(129, 2, 79, 0, '2022-01-02 21:52:05', 'Tidak Terdiagnosis', 'Selamat! Kondisi mental anda tergolong baik-baik saja. tidak perlu khawatir, tetap menjalani aktivitas sehari-hari dan tetap berpikir positif. Jika ingin merasa lebih baik, anda bisa mencoba audio relaksasi di bawah ini.', '2022-01-02 20:52:05', '2022-01-02 20:52:05', 0, '0'),
(130, 2, 79, 1, '2022-01-02 21:53:46', 'Kecemasan Sedang (Moderate Anxiety) ', 'Solusi dari pakar : tetap menjaga kondisi tubuh baik fisik maupun mental.', '2022-01-02 20:53:46', '2022-01-02 20:53:46', 20, '99.999'),
(131, 2, 79, 1, '2022-01-02 21:54:53', 'Tidak Ada Kecemasan ', 'Solusi dari pakar : tetap menjaga kondisi tubuh baik fisik maupun mental.', '2022-01-02 20:54:53', '2022-01-02 20:54:53', 4, '90'),
(132, 2, 79, 1, '2022-01-02 21:55:40', 'Kecemasan Berat (Severe Anxiety) ', 'Solusi dari pakar : tetap menjaga kondisi tubuh baik fisik maupun mental.', '2022-01-02 20:55:40', '2022-01-02 20:55:40', 48, '99.99999999966'),
(133, 2, 79, 1, '2022-01-02 21:56:23', 'Kecemasan Ringan (Mild Anxiety)', 'Solusi dari pakar : tetap menjaga kondisi tubuh baik fisik maupun mental.', '2022-01-02 20:56:23', '2022-01-02 20:56:23', 12, '99.9'),
(134, 2, 79, 0, '2022-01-02 21:57:45', 'Tidak Terdiagnosis', 'Selamat! Kondisi mental anda tergolong baik-baik saja. tidak perlu khawatir, tetap menjalani aktivitas sehari-hari dan tetap berpikir positif. Jika ingin merasa lebih baik, anda bisa mencoba audio relaksasi di bawah ini.', '2022-01-02 20:57:45', '2022-01-02 20:57:45', 0, '0'),
(135, 2, 79, 0, '2022-01-02 22:02:15', 'Tidak Terdiagnosis', 'Selamat! Kondisi mental anda tergolong baik-baik saja. tidak perlu khawatir, tetap menjalani aktivitas sehari-hari dan tetap berpikir positif. Jika ingin merasa lebih baik, anda bisa mencoba audio relaksasi di bawah ini.', '2022-01-02 21:02:15', '2022-01-02 21:02:15', 0, '0');

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
(1, 'admin', '$2y$10$O9MjxWje6GNrSuk1cD2i6.6bnPnpcv9oSLhZHTpmmJByK03Up39BG', 'Admin', 'admin@email.com', 1, 1, '2021-05-26', '2021-05-26', '2021-12-28 03:13:08', 'ejja.jpeg'),
(2, 'pakar', '$2y$10$O9MjxWje6GNrSuk1cD2i6.6bnPnpcv9oSLhZHTpmmJByK03Up39BG', 'Pakar', 'pakar@gmail.com', 3, 1, '2021-07-08', '2021-11-14', '2022-01-03 06:16:40', 'eja.jpeg'),
(3, 'reyzaeja', '$2y$10$rwWRsn5vDTp14U0Q0c/s9OWTCa8C1yxITrSek13/rUiub9qawa9SG', 'Reyza Cahya Ramadhan', 'reyzacramadhan96@gmail.com', 2, 1, '2021-11-02', '2021-12-23', '2021-12-28 03:20:27', 'default.jpg'),
(18, 'chandrasetiawan', '$2y$10$ImQFWlfBTaCrXIsTLaaA/u80wGjJj2TPJuP.7QASlpdpEYcJrIhyW', 'Chandra Setiawan', 'chandrasetiawan944@gmail.com', 2, 1, '2021-12-21', '2021-12-21', '2021-12-23 02:37:28', 'default.jpg'),
(19, 'fahmil', '$2y$10$T.AFr07eqxJPJmahwEfnwulh8XlKTKvcPj8sw6nkRKJ0R.UHJrOAK', 'Fahmil', 'fahmilclack8@gmail.com', 2, 1, '2021-12-21', '2021-12-21', '2021-12-23 02:38:59', 'default.jpg'),
(20, 'sultan', '$2y$10$3SNJiCdEibONx6GmIVeL8OVQKVT0VaXNlK7ZNesKUxYeqtcSF3Nri', 'Sultan', 'sull.tann038@gmail.com', 2, 1, '2021-12-21', '2021-12-21', '2021-12-23 02:40:19', 'default.jpg'),
(21, 'nurtahir', '$2y$10$OpXKZNqaCFB8egbDmouaDu7sa4cxp5vp1FOLv/5yQ1070LRx0jX6C', 'Moh. Nur M Tahir', 'moh.nur.m.tahir123@gmail.com', 2, 1, '2021-12-21', '2021-12-21', '2021-12-23 02:41:43', 'default.jpg'),
(22, 'puteee', '$2y$10$jX0enYtJ93EuOoDApL5hJ.1WMQ.SgVM.3uFqEZbs.Ma/v4HpSddpy', 'Nur Amalia Putri', 'nuramalia1969@gmail.com', 2, 1, '2021-12-21', '2021-12-21', '2021-12-23 02:42:56', 'default.jpg'),
(23, 'enggar', '$2y$10$PkKTcjqZ93tJbp4PUXimD.rjQvs9HyMFwRipeqQHkgagF1aiMQDDG', 'Enggartiasna Alifianto Harun', 'enggariasnaalifiantoharun@gmail.com', 2, 1, '2021-12-21', '2021-12-21', '2021-12-23 02:44:03', 'default.jpg'),
(24, 'nailul', '$2y$10$mHl/4zYQTzokPS/.Xp/C5e8O/oXV4Stbr.ECJ7vDiLPyFfGPAuNbW', 'Nailul Hidayat Ramadhan', 'hidayat.nailul11@gmail.com', 2, 1, '2021-12-21', '2021-12-21', '2021-12-23 02:46:21', 'default.jpg'),
(25, 'abied', '$2y$10$fxr6IaZDFlbQLt6wM2RjsO6tUb0CWOQ2kCW.o/CLuyZ59XF/P4soC', 'Moh. Abied Rabbani', 'abiedrabbani90@gmail.com', 2, 1, '2021-12-21', '2021-12-21', '2021-12-23 02:47:27', 'default.jpg'),
(26, 'amelll', '$2y$10$uOqBNigFXAgtGFY32g.97.1EQlXO0PIsl.nDyjKqnIEq8HJy2tdfW', 'Amalya Magfira', 'amalyamagfira@gmail.com', 2, 1, '2021-12-21', '2021-12-21', '2022-01-05 08:09:26', 'default.jpg'),
(27, 'atira', '$2y$10$c9cevM/6h58EHwyvqGcjjOM0MatCYMJGdh3U9fOjsnB/M35QJPJ3.', 'Atira Damayanti', 'atiradamayanti22@gmail.com', 2, 1, '2021-12-21', '2021-12-21', '2021-12-23 02:50:02', 'default.jpg'),
(28, 'nandana', '$2y$10$7E32Tp0B4TP1Xr/GweTC/.FzVBYig.4MlIO1rdTz2rqLKfwsnrF5i', 'Nandana Niranjana', 'nandananiranjana5@gmail.com', 2, 1, '2021-12-21', '2021-12-21', '2021-12-23 02:51:25', 'default.jpg'),
(29, 'wafiii', '$2y$10$iRswns1AXa1.nql.rVYRyOiBJuMZCGgXFHSURrecYyvf.A/joVtje', 'Mohammad Wafi Abdillah', 'wafiabdillah22@gmail.com', 2, 1, '2021-12-21', '2021-12-21', '2021-12-23 02:52:32', 'default.jpg'),
(30, 'asmaun', '$2y$10$Cez/87cuKNyKWAG0HqxJXOu9v/E3GVaGo7uAr6VJWiMD6UN4zN1F6', 'Asmaun', 'hasyanasry@gmail.com', 2, 1, '2021-12-21', '2021-12-21', '2021-12-23 02:53:40', 'default.jpg'),
(31, 'chairul', '$2y$10$PTfS3Wb6xTuYUsEE5kfJUuoWlYU7PefBv86kxbMvI0wC19Eq4XU82', 'Chairul Muluk', 'chairul.muluk28@gmail.com', 2, 1, '2021-12-21', '2021-12-21', '2021-12-23 02:55:15', 'default.jpg'),
(32, 'riyandi', '$2y$10$1hcD4.WXtLLV465jo0bYYO7nREQAozCci5/SntagmoDdHxbB8fBTy', 'Riyandi Dwitama Djohari', 'riyandidjohary8@gmail.com', 2, 1, '2021-12-21', '2021-12-21', '2021-12-23 02:56:29', 'default.jpg'),
(33, 'alvin', '$2y$10$8oLS4MNHumlRCkjybver4.DRm8buQdDDi4/Mr7HILNTLAkIa6HatS', 'Alvin Christian Davidson ', 'alvintherry20@gmail.com', 2, 1, '2021-12-21', '2021-12-21', '2021-12-23 02:57:45', 'default.jpg'),
(34, 'ferri', '$2y$10$Kom4POWGI.IIBfAhJf7Lju9oIKb0C9NOmEBQWm0LxvW98U4heMH3u', 'Ferri Rama Chandra', 'ferriramachandra@gmail.com', 2, 1, '2021-12-21', '2021-12-21', '2021-12-23 02:58:52', 'default.jpg'),
(35, 'gayuh', '$2y$10$JQX7WlMT32Wdsb29LTOGCOTizQUCoJRiRbMTjJMIItXJlWMx0ul3u', 'Gayuh Laksono', 'laksono.doank@gmail.com', 2, 1, '2021-12-21', '2021-12-21', '2021-12-23 02:59:58', 'default.jpg'),
(36, 'anugrah', '$2y$10$dHOM.QIsbfvp.a8zJZxoieAvgLhveUY6u8eUflRpwbnboFzWLxYry', 'Anugrah Aldin', 'didiyotolembah19@gmail.com', 2, 1, '2021-12-21', '2021-12-21', '2021-12-23 03:01:35', 'default.jpg'),
(37, 'dival', '$2y$10$Fs3GtDDeeORJBc9uDziHl.P0Vcc9Bb7xQgfpk1DOCsy/KEjvP/Mfy', 'Muhammad Dival Maulana', 'dival92@gmail.com', 2, 1, '2021-12-21', '2021-12-21', '2021-12-23 03:02:52', 'default.jpg'),
(38, 'alfandi', '$2y$10$JECp7xPyGhgIgb91y8L1SOYjQSoncIz5GRsfEPhz7lVEKYYHNsTpy', 'Alfandi Timorti Pabara', 'timortialfandi@gmail.com', 2, 1, '2021-12-21', '2021-12-21', '2021-12-23 03:03:56', 'default.jpg'),
(39, 'wahyudin', '$2y$10$eVuYYjwYADNRUiXeK7fFqub9aYkTUj/cXehs7bmm2tCF/A//BLQn2', 'Wahyudin Maela', 'wahyudinmaela6@gmail.com', 2, 1, '2021-12-21', '2021-12-21', '2021-12-23 03:05:16', 'default.jpg'),
(40, 'nadila', '$2y$10$LojtAppLJKYVGmt/YCbQQO2E3BmByXGZtQyYkdwKAbPC3003JWP5u', 'Nadila Safitri', 'snadila30@gmail.com', 2, 1, '2021-12-21', '2021-12-21', '2021-12-23 03:07:08', 'default.jpg'),
(41, 'widiani', '$2y$10$veb7FmQzQ1A0Zt/xnDh6tOwzbZoR6VRWFZZ5tMOg8vToqeffWPsW6', 'Ni Nengah Widiani', 'nengahwidiani18@gmail.com', 2, 1, '2021-12-21', '2021-12-21', '2021-12-23 03:09:18', 'default.jpg'),
(42, 'jumaidil', '$2y$10$Ml0z1hM4BiTqzPJXI0ARV.SW8JGp6AvIEs4HPHtoykjxlJi8ujC0e', 'Jumaidil Aruam', 'aruamjumaidil@gmail.com', 2, 1, '2021-12-21', '2021-12-21', '2021-12-23 03:10:36', 'default.jpg'),
(43, 'mamat', '$2y$10$3DM4LI8Qqn8AloGUcKY/9.OXbI99BWmQHl8UAT.slnjXgCkxanNcG', 'Mamat Darise', 'mamatdarise@gmail.com', 2, 1, '2021-12-21', '2021-12-21', '2021-12-23 03:11:43', 'default.jpg'),
(44, 'rizaldi', '$2y$10$ZFSuC3SXHsZMG/jDxrW4MeiQZKvALKx2/tS4nzmUr9vLZibCEb8ya', 'Rizaldi Agil Faturrahman', 'rizaldiagiltf52120008@gmail.com', 2, 1, '2021-12-21', '2021-12-21', '2021-12-23 03:12:55', 'default.jpg'),
(45, 'maria', '$2y$10$5.JUp7hJzzdfnsg6KpbZHe.ypuwYBdGl0Qt1obwIZn6IOgBpoa82W', 'Maria Babby Cahrisva', 'maria.chrisva370@gmail.com', 2, 1, '2021-12-21', '2021-12-21', '2021-12-23 03:14:09', 'default.jpg'),
(46, 'azizah', '$2y$10$LF3WI8lygCEw6RNe5Vlixe582ytcxcAtD80c7lOD1c99Hpq76hd2W', 'Nurhidayah Saptono', 'alpaca12j@gmail.com', 2, 1, '2021-12-21', '2021-12-21', '2021-12-23 03:15:16', 'default.jpg'),
(47, 'aimmm', '$2y$10$g3bPU0YsbQfJJQ1YgV970O55iLKMR3H6Tl7a1JqVE0yAmIZU/jbfy', 'Abd. Rahim I Butolo', 'abdulrahimbutolo22@gmail.com', 2, 1, '2021-12-21', '2021-12-21', '2021-12-23 03:16:28', 'default.jpg');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=136;

--
-- AUTO_INCREMENT untuk tabel `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

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
