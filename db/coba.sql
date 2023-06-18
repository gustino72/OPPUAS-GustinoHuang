-- phpMyAdmin SQL Dump
-- version 4.9.10
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Waktu pembuatan: 23 Des 2022 pada 00.10
-- Versi server: 10.1.22-MariaDB
-- Versi PHP: 7.2.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `college`
--
CREATE DATABASE IF NOT EXISTS `college` DEFAULT CHARACTER SET latin1 COLLATE latin1_general_ci;
USE `college`;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_mahasiswa`
--

DROP TABLE IF EXISTS `tb_mahasiswa`;
CREATE TABLE `tb_mahasiwa` (
  `nim` varchar(25) COLLATE latin1_general_ci NOT NULL,
  `nama_mh` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `jenis_kelamin` enum('Laki-Laki','Perempuan') COLLATE latin1_general_ci DEFAULT NULL,
  `tgl_lahir` date DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data untuk tabel `tb_mahasiswa`
--

INSERT INTO `tb_mahasiswa` (`nim`, `nama_mh`, `jenis_kelamin`, `tgl_lahir`) VALUES
('21010101', 'Peter B. Parker', 'Laki-Laki', '2001-08-14'),
('21010204', 'Barry Allen', 'Laki-Laki', '2000-02-07'),
('21010309', 'Kara Zor-El', 'Perempuan', '1997-07-20'),
('21010416', 'Takeru Satou', 'Laki-Laki', '1998-03-12'),
('21010525', 'Noa Tsurushima', 'Perempuan', '2002-04-11'),
('21010636', 'TES input', 'Perempuan', '1999-06-24');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_dosen`
--

DROP TABLE IF EXISTS `tb_dosen`;
CREATE TABLE `tb_dosen` (
  `nidn` varchar(10) COLLATE latin1_general_ci NOT NULL,
  `nama_ds` varchar(30) COLLATE latin1_general_ci DEFAULT NULL,
  `no_telp` varchar(25) COLLATE latin1_general_ci DEFAULT NULL,
  `mata_kuliah` varchar(50) COLLATE latin1_general_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data untuk tabel `tb_dosen`
--

INSERT INTO `tb_dosen` (`nidn`, `nama_ds`, `no_telp`, `mata_kuliah`) VALUES
('9137528460', 'Joseph Joestar', '628126699269', '1960-08-24'),
('9238028465', 'Hiratsuka Shizuka', '628121626671', '1985-05-25'),
('9147027435', 'Kisuke Uehara', '628127644855', '1965-10-20'),
('9248527360', 'Irina Jelavic', '628224488660', '1985-12-24'),
('9999999999', 'TES input', '6289999999999', '1999-09-09');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_pengguna`
--

DROP TABLE IF EXISTS `tb_pengguna`;
CREATE TABLE `tb_pengguna` (
  `nm_pengguna` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `psw_pengguna` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `level_user` enum('Admin','Operator') COLLATE latin1_general_ci DEFAULT NULL,
  `status_akun` enum('Aktif','Suspend') COLLATE latin1_general_ci NOT NULL,
  `terakhir_login` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data untuk tabel `tb_pengguna`
--

INSERT INTO `tb_pengguna` (`nm_pengguna`, `psw_pengguna`, `level_user`, `status_akun`, `terakhir_login`) VALUES
('JeanRiko', '4321', 'Admin', 'Aktif', '2022-12-17 22:54:15'),
('operator', '1234', 'Operator', 'Aktif', NULL),
('admin', '5678', 'Admin', 'Aktif', '2022-12-17 22:53:53');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_pengguna_histori`
--

DROP TABLE IF EXISTS `tb_pengguna_histori`;
CREATE TABLE `tb_pengguna_histori` (
  `kd_histori` int(11) NOT NULL,
  `nm_pengguna` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `keterangan` varchar(500) COLLATE latin1_general_ci DEFAULT NULL,
  `tgl_wkt` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data untuk tabel `tb_pengguna_histori`
--

INSERT INTO `tb_pengguna_histori` (`kd_histori`, `nm_pengguna`, `keterangan`, `tgl_wkt`) VALUES
(1, 'Jeanriko', 'Pengguna ini barusan login', '2022-12-16 11:31:58'),
(2, 'JeanRiko', 'Barusan mengubah status : \'Suspend\', data pengguna dengan nama : \'operator\'.', '2022-12-17 22:32:29'),
(3, 'JeanRiko', 'Barusan mengubah status : \'Aktif\', data pengguna dengan nama : \'operator\'.', '2022-12-17 22:32:38'),
(4, 'admin', 'Pengguna ini barusan login', '2022-12-17 22:48:07'),
(6, 'admin', 'Barusan mengubah status : \'Suspend\', data pengguna dengan nama : \'JeanRiko\'.', '2022-12-17 22:51:59'),
(7, 'admin', 'Pengguna ini barusan login', '2022-12-17 22:53:53'),
(8, 'admin', 'Barusan mengubah status : \'Aktif\', data pengguna dengan nama : \'JeanRiko\'.', '2022-12-17 22:54:03'),
(9, 'JeanRiko', 'Pengguna ini barusan login', '2022-12-17 22:54:15');
(10, 'GustinoHuang', 'Pengguna ini barusan login', '2023-06-17 15:06:15');
--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tb_mahasiswa`
--
ALTER TABLE `tb_mahasiswa`
  ADD PRIMARY KEY (`nim`);

--
-- Indeks untuk tabel `tb_dosen`
--
ALTER TABLE `tb_dosen`
  ADD PRIMARY KEY (`nidn`);

--
-- Indeks untuk tabel `tb_pengguna`
--
ALTER TABLE `tb_pengguna`
  ADD PRIMARY KEY (`nm_pengguna`);

--
-- Indeks untuk tabel `tb_pengguna_histori`
--
ALTER TABLE `tb_pengguna_histori`
  ADD PRIMARY KEY (`kd_histori`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tb_mahasiswa`
--

--
-- AUTO_INCREMENT untuk tabel `tb_pengguna_histori`
--
ALTER TABLE `tb_pengguna_histori`
  MODIFY `kd_histori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;