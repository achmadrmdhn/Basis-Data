-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 18 Apr 2024 pada 18.31
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbpegawai`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `divisi`
--

CREATE TABLE `divisi` (
  `id` int(11) NOT NULL,
  `nama` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `divisi`
--

INSERT INTO `divisi` (`id`, `nama`) VALUES
(4, 'IT'),
(2, 'Keuangan'),
(3, 'Marketing'),
(1, 'SDM');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jabatan`
--

CREATE TABLE `jabatan` (
  `id` int(11) NOT NULL,
  `nama` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `jabatan`
--

INSERT INTO `jabatan` (`id`, `nama`) VALUES
(3, 'Asisten Manajer'),
(1, 'Direktur'),
(2, 'Manajer'),
(4, 'Staff');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pegawai`
--

CREATE TABLE `pegawai` (
  `id` int(11) NOT NULL,
  `nip` char(5) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `jenis_kelamin` enum('Laki-Laki','Perempuan') NOT NULL,
  `tmp_lahir` varchar(30) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `iddivisi` int(11) NOT NULL,
  `idjabatan` int(11) NOT NULL,
  `alamat` text DEFAULT NULL,
  `berat_badan` float NOT NULL,
  `umur` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `pegawai`
--

INSERT INTO `pegawai` (`id`, `nip`, `nama`, `jenis_kelamin`, `tmp_lahir`, `tgl_lahir`, `iddivisi`, `idjabatan`, `alamat`, `berat_badan`, `umur`) VALUES
(1, '00001', 'Achmad Rifai', 'Laki-Laki', 'Bogor', '2004-11-05', 1, 1, 'Jl. Lingkungan 03 Citatah\nRW 09', 90.68, 20),
(2, '00002', 'Rifai Ramadhan', 'Laki-Laki', 'Depok', '2008-02-16', 1, 2, 'Jl. Penuh CCTV No. 03', 50.73, 16),
(3, '00003', 'Hafis Adam', 'Laki-Laki', 'Bogor', '2005-05-23', 1, 4, 'Jl. Sarimie No. 13', 81.62, 19),
(4, '00004', 'Faliza', 'Perempuan', 'Bogor', '2004-09-10', 1, 4, 'Jl. Tanah Abang No. 55', 55.93, 20),
(5, '00005', 'Muhammad Rafli', 'Laki-Laki', 'Jakarta', '2004-03-25', 1, 3, 'Jl. Mushola Al Iman No. 01', 84.76, 20),
(6, '00006', 'Muhammad Hafis', 'Laki-Laki', 'Banten', '2003-01-18', 2, 2, 'Jl. Syekh Nawawi No. 09', 56.03, 21),
(7, '00007', 'Ibrahimovic', 'Laki-Laki', 'Denpasar', '1997-06-17', 2, 1, 'Jl. Pandawa No. 05', 75.86, 27),
(8, '00008', 'Rifzal', 'Laki-Laki', 'Bogor', '2002-07-12', 2, 3, 'Jl. Kranji Barat No. 23', 61.21, 22),
(9, '00009', 'Aisyah Nur', 'Perempuan', 'Sumedang', '1950-03-11', 2, 4, 'Jl. Istana Sumedang No. 33', 78.47, 74),
(10, '00010', 'Ryan Kholilie', 'Laki-Laki', 'Jakarta', '1956-05-11', 2, 2, 'Jl. Bangkalan No. 13', 58.71, 68),
(11, '00011', 'Kholil Nafis', 'Laki-Laki', 'Pasuruan', '1965-04-14', 3, 4, 'Jl. Kiara Angsana No. 51', 58.15, 59),
(12, '00012', 'Frimawan Santoso', 'Laki-Laki', 'Medan', '1995-10-28', 3, 1, 'Jl. Toba No. 52', 64.62, 29),
(13, '00013', 'Mada', 'Laki-Laki', 'Jakarta', '2005-02-15', 3, 2, 'Jl. Bundaran HI No. 13', 98.66, 19),
(14, '00014', 'Nilam Nur', 'Perempuan', 'Jakarta', '1955-11-23', 3, 3, 'Jl. Kampung Bayam No. 07', 99.42, 69),
(15, '00015', 'Asep Wedding', 'Laki-Laki', 'Jakarta', '2000-05-11', 3, 4, 'Jl. Menteng No. 17', 51.14, 24),
(16, '00016', 'Reisha', 'Perempuan', 'Bogor', '2003-11-22', 4, 2, 'Jl. Empang Bogor No. 01', 57.42, 21),
(17, '00017', 'Musthofa', 'Laki-Laki', 'Jakarta', '2003-10-13', 4, 4, 'Jl. Merdeka Barat No. 77', 83.71, 21),
(18, '00018', 'Muhammad Arifin', 'Laki-Laki', 'Bogor', '1991-08-17', 4, 2, 'Jl. Warung Jambu No. 21', 96.27, 33);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `divisi`
--
ALTER TABLE `divisi`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nama` (`nama`);

--
-- Indeks untuk tabel `jabatan`
--
ALTER TABLE `jabatan`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nama` (`nama`);

--
-- Indeks untuk tabel `pegawai`
--
ALTER TABLE `pegawai`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nip` (`nip`),
  ADD KEY `iddivisi` (`iddivisi`),
  ADD KEY `idjabatan` (`idjabatan`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `divisi`
--
ALTER TABLE `divisi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `jabatan`
--
ALTER TABLE `jabatan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `pegawai`
--
ALTER TABLE `pegawai`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `pegawai`
--
ALTER TABLE `pegawai`
  ADD CONSTRAINT `pegawai_ibfk_1` FOREIGN KEY (`iddivisi`) REFERENCES `divisi` (`id`),
  ADD CONSTRAINT `pegawai_ibfk_2` FOREIGN KEY (`idjabatan`) REFERENCES `jabatan` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
