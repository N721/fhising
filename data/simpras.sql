-- Adminer 4.7.6 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP TABLE IF EXISTS `simpras_barang`;
CREATE TABLE `simpras_barang` (
  `kode_barang` char(9) NOT NULL,
  `kode_jenis` char(5) NOT NULL,
  `nama_barang` varchar(50) CHARACTER SET utf8 NOT NULL,
  `merek` char(30) DEFAULT NULL,
  `tipe` char(20) DEFAULT NULL,
  `inventaris` enum('Y','N') NOT NULL DEFAULT 'N',
  `satuan` enum('UNIT','PACK','PCS') DEFAULT NULL,
  `keterangan` varchar(512) CHARACTER SET utf8 DEFAULT NULL,
  `foto` varchar(128) CHARACTER SET utf8 DEFAULT NULL,
  `modified_by` char(20) CHARACTER SET utf8 NOT NULL,
  `modified_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`kode_barang`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

TRUNCATE `simpras_barang`;
INSERT INTO `simpras_barang` (`kode_barang`, `kode_jenis`, `nama_barang`, `merek`, `tipe`, `inventaris`, `satuan`, `keterangan`, `foto`, `modified_by`, `modified_dt`) VALUES
('04.01.001',	'04.01',	'Rak Buku Besar Olympic A1',	'Olympic',	'A1',	'Y',	'PCS',	'',	'',	'teddy',	'2019-10-21 13:52:34'),
('05.01.001',	'05.01',	'Pulpen Standart 0.5',	'Standart',	'0.5',	'N',	'PACK',	'',	'',	'teddy',	'2019-10-21 13:52:37'),
('05.02.001',	'05.02',	'Penggaris ButterFly 30',	'ButterFly',	'30',	'N',	'UNIT',	'',	'',	'teddy',	'2019-11-17 09:33:18'),
('05.01.002',	'05.01',	'Pulpen merek baru tipe baru',	'merek baru',	'tipe baru',	'N',	'UNIT',	'',	'Buku Siswa IPS Kelas IX (9) SMP Revisi 2018 Kurikulum 2013-rrt.png',	'teddy',	'2019-11-17 13:45:23');

DROP TABLE IF EXISTS `simpras_barang_hilang`;
CREATE TABLE `simpras_barang_hilang` (
  `id_barang_hilang` char(23) NOT NULL,
  `id_noninventaris` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `qty` smallint(6) unsigned NOT NULL,
  `sisa_stok` double DEFAULT '0',
  `keterangan` varchar(256) NOT NULL DEFAULT '',
  `branch` char(30) NOT NULL,
  `modified_by` char(20) NOT NULL,
  `modified_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

TRUNCATE `simpras_barang_hilang`;
INSERT INTO `simpras_barang_hilang` (`id_barang_hilang`, `id_noninventaris`, `tanggal`, `qty`, `sisa_stok`, `keterangan`, `branch`, `modified_by`, `modified_dt`) VALUES
('0006.00.UKSI-UIKA.2019',	1,	'2019-11-07',	10,	27,	'Hilang dijalan',	'UKSI',	'teddy',	'2019-11-21 20:31:34');

DROP TABLE IF EXISTS `simpras_barang_keluar`;
CREATE TABLE `simpras_barang_keluar` (
  `id_barang_keluar` char(23) NOT NULL,
  `id_noninventaris` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `kode_ruang` char(17) NOT NULL,
  `nama_penerima` char(50) NOT NULL,
  `qty` smallint(6) unsigned NOT NULL,
  `sisa_stok` double DEFAULT NULL,
  `keterangan` varchar(256) NOT NULL DEFAULT '',
  `branch` char(30) NOT NULL,
  `modified_by` char(20) NOT NULL,
  `modified_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_barang_keluar`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

TRUNCATE `simpras_barang_keluar`;
INSERT INTO `simpras_barang_keluar` (`id_barang_keluar`, `id_noninventaris`, `tanggal`, `kode_ruang`, `nama_penerima`, `qty`, `sisa_stok`, `keterangan`, `branch`, `modified_by`, `modified_dt`) VALUES
('0008.02.UKSI-UIKA.2019',	1,	'2019-11-28',	'B01.001',	'Teddy',	20,	-3,	'',	'UKSI',	'teddy',	'2019-11-27 21:07:42'),
('0007.02.UKSI-UIKA.2019',	1,	'2019-11-14',	'02.01.002.LB1.002',	'Teddy',	10,	17,	'',	'UKSI',	'teddy',	'2019-11-21 20:35:08'),
('0009.02.UKSI-UIKA.2019',	1,	'2019-11-28',	'B01.001',	'Teddy',	15,	-5,	'',	'UKSI',	'teddy',	'2019-11-27 21:09:28'),
('0010.02.UKSI-UIKA.2019',	1,	'2019-11-28',	'B01.001',	'Teddy',	15,	-5,	'',	'UKSI',	'teddy',	'2019-11-27 21:10:19'),
('0011.02.UKSI-UIKA.2019',	1,	'2019-11-28',	'B01.001',	'Teddy',	10,	-5,	'',	'UKSI',	'teddy',	'2019-11-27 21:14:49'),
('0012.02.UKSI-UIKA.2019',	1,	'2019-11-28',	'B01.001',	'Teddy',	5,	-1,	'',	'UKSI',	'teddy',	'2019-11-27 21:19:35');

DROP TABLE IF EXISTS `simpras_barang_masuk`;
CREATE TABLE `simpras_barang_masuk` (
  `id_barang_masuk` char(23) NOT NULL,
  `id_noninventaris` int(11) unsigned NOT NULL,
  `id_supplier` smallint(6) NOT NULL,
  `no_faktur` char(15) NOT NULL,
  `tanggal_beli` date NOT NULL,
  `harga_satuan` double NOT NULL,
  `harga_beli` double NOT NULL,
  `qty` smallint(6) unsigned NOT NULL,
  `sisa_stok` double DEFAULT '0',
  `keterangan` varchar(256) DEFAULT NULL,
  `branch` char(30) NOT NULL,
  `modified_by` char(20) NOT NULL,
  `modified_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_barang_masuk`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

TRUNCATE `simpras_barang_masuk`;
INSERT INTO `simpras_barang_masuk` (`id_barang_masuk`, `id_noninventaris`, `id_supplier`, `no_faktur`, `tanggal_beli`, `harga_satuan`, `harga_beli`, `qty`, `sisa_stok`, `keterangan`, `branch`, `modified_by`, `modified_dt`) VALUES
('0003.01.UKSI-UIKA.2019',	2,	4,	'5/nOMORr',	'2019-11-20',	2000,	10000,	10,	0,	'',	'UKSI',	'teddy',	'2019-12-24 01:06:42'),
('0004.01.UKSI-UIKA.2019',	1,	4,	'5/nOMORr',	'2019-11-20',	1000,	10000,	10,	30,	'',	'UKSI',	'teddy',	'2019-11-19 20:25:00'),
('0013.01.UKSI-UIKA.2019',	2,	4,	'5/nOMORr',	'2019-12-25',	3333.3333333333,	10000,	3,	13,	'',	'UKSI',	'teddy',	'2019-12-24 18:47:29'),
('0002.01.UKSI-UIKA.2019',	1,	4,	'5/nOMORr',	'2019-11-20',	1000,	10000,	10,	0,	'',	'UKSI',	'teddy',	'2019-11-19 20:19:47'),
('0005.01.UKSI-UIKA.2019',	1,	4,	'5/nOMORr',	'2019-11-20',	2000,	10000,	10,	40,	'',	'UKSI',	'teddy',	'2019-12-24 01:06:13'),
('0014.01.UKSI-UIKA.2019',	2,	4,	'5/nOMORr',	'2019-12-25',	3333.3333333333,	10000,	3,	16,	'',	'UKSI',	'teddy',	'2019-12-24 18:51:34'),
('0015.01.UKSI-UIKA.2019',	2,	4,	'5/nOMORr',	'2019-12-25',	3333.3333333333,	10000,	3,	19,	'',	'UKSI',	'teddy',	'2019-12-24 18:51:54'),
('0016.01.UKSI-UIKA.2019',	2,	4,	'5/nOMORr',	'2019-12-25',	3333.3333333333,	10000,	3,	22,	'',	'UKSI',	'teddy',	'2019-12-24 18:52:30'),
('0017.01.UKSI-UIKA.2019',	2,	4,	'5/nOMORr',	'2019-12-25',	3.33333,	10000,	3,	25,	'',	'UKSI',	'teddy',	'2019-12-24 18:53:04'),
('0018.01.UKSI-UIKA.2019',	2,	4,	'5/nOMORr',	'2019-12-25',	3.333,	10000,	3,	28,	'',	'UKSI',	'teddy',	'2019-12-24 18:53:36'),
('0019.01.UKSI-UIKA.2019',	2,	4,	'5/nOMORr',	'2019-12-25',	3333,	10000,	3,	31,	'',	'UKSI',	'teddy',	'2019-12-24 18:53:59');

DROP TABLE IF EXISTS `simpras_bast`;
CREATE TABLE `simpras_bast` (
  `nomor` char(30) NOT NULL,
  `tanggal` date NOT NULL,
  `kode_ruangan` char(17) NOT NULL,
  `menyerahkan` char(100) NOT NULL,
  `penerima` char(100) NOT NULL,
  `branch` char(50) NOT NULL,
  `modified_by` char(50) NOT NULL,
  `modified_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`nomor`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

TRUNCATE `simpras_bast`;
INSERT INTO `simpras_bast` (`nomor`, `tanggal`, `kode_ruangan`, `menyerahkan`, `penerima`, `branch`, `modified_by`, `modified_dt`) VALUES
('0001/BAST/UKSI-UIKA/',	'2019-12-02',	'B01.001',	'teddy',	'teddy9',	'UKSI',	'teddy',	'2019-12-24 23:33:25'),
('0001/BAST/UKSI-UIKA/2019',	'2019-12-02',	'B01.001',	'teddy',	'teddy9',	'UKSI',	'teddy',	'2019-12-24 23:33:26'),
('0002/BAST/UKSI-UIKA/2019',	'2019-12-02',	'B01.001',	'teddy',	'teddy9',	'UKSI',	'teddy',	'2019-12-24 23:33:27'),
('0003/BAST/UKSI-UIKA/2019',	'2019-12-02',	'B01.001',	'teddy',	'teddy9',	'UKSI',	'teddy',	'2019-12-24 23:33:27'),
('0004/BAST/UKSI-UIKA/2019',	'2019-12-02',	'B01.001',	'teddy',	'teddy9',	'UKSI',	'teddy',	'2019-12-24 23:33:28'),
('0005/BAST/UKSI-UIKA/2019',	'2019-12-02',	'B01.001',	'teddy',	'teddy9',	'UKSI',	'teddy',	'2019-12-24 23:33:29'),
('0006/BAST/UKSI-UIKA/2019',	'2019-12-02',	'B01.001',	'teddy',	'teddy9',	'UKSI',	'teddy',	'2019-12-24 23:33:29');

DROP TABLE IF EXISTS `simpras_gedung`;
CREATE TABLE `simpras_gedung` (
  `kode_gedung` char(2) NOT NULL,
  `kode_jenis` char(5) NOT NULL,
  `nama_gedung` varchar(50) NOT NULL,
  `jumlah_lantai` char(2) NOT NULL,
  `luas` double NOT NULL,
  `kepemilikan` enum('MILIK SENDIRI','SEWA','PINJAM','KERJASAMA') NOT NULL,
  `kondisi` enum('TERAWAT','TIDAK TERAWAT') NOT NULL,
  `keterangan` varchar(256) NOT NULL DEFAULT '',
  `foto` varchar(128) NOT NULL DEFAULT '',
  `branch` char(30) NOT NULL,
  `modified_by` char(50) NOT NULL,
  `modified_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `nilai_aset` bigint(20) NOT NULL,
  PRIMARY KEY (`kode_gedung`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

TRUNCATE `simpras_gedung`;
INSERT INTO `simpras_gedung` (`kode_gedung`, `kode_jenis`, `nama_gedung`, `jumlah_lantai`, `luas`, `kepemilikan`, `kondisi`, `keterangan`, `foto`, `branch`, `modified_by`, `modified_dt`, `nilai_aset`) VALUES
('A',	'02.01',	'Rektorat',	'4',	2000,	'MILIK SENDIRI',	'TERAWAT',	'',	'',	'UKSI',	'',	'2019-12-24 06:43:43',	100000000),
('B',	'02.01',	'Gedung Fakultas Teknik 	',	'1',	10,	'KERJASAMA',	'TERAWAT',	'',	'',	'UKSI',	'',	'2019-12-24 06:43:39',	200000000),
('C',	'02.02',	'Rektorat 3',	'1',	10,	'MILIK SENDIRI',	'TERAWAT',	'',	'Untitled-wdw.png',	'FTS',	'',	'2019-12-25 01:15:13',	800000000);

DROP TABLE IF EXISTS `simpras_inventarisasi`;
CREATE TABLE `simpras_inventarisasi` (
  `kode_inventaris` varchar(30) NOT NULL,
  `kode_barang` char(9) NOT NULL,
  `kode_ruangan` char(17) NOT NULL,
  `kode_pengadaan` char(23) NOT NULL,
  `tanggal_inventaris` date DEFAULT NULL,
  `kondisi` enum('BAIK','RUSAK RINGAN','RUSAK BERAT') NOT NULL DEFAULT 'BAIK',
  `status` enum('AKTIF','NON AKTIF','HILANG','DIMUSNAHKAN','DILELANG','MUTASI') NOT NULL DEFAULT 'AKTIF',
  `nomor_bast` char(30) DEFAULT NULL,
  `branch` char(20) NOT NULL,
  `modified_by` char(20) NOT NULL,
  `modified_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `masa_manfaat` int(4) DEFAULT NULL COMMENT 'Bulan',
  PRIMARY KEY (`kode_inventaris`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

TRUNCATE `simpras_inventarisasi`;
INSERT INTO `simpras_inventarisasi` (`kode_inventaris`, `kode_barang`, `kode_ruangan`, `kode_pengadaan`, `tanggal_inventaris`, `kondisi`, `status`, `nomor_bast`, `branch`, `modified_by`, `modified_dt`, `masa_manfaat`) VALUES
('04.01.001.UKSI-2019.0002',	'04.01.001',	'B01.001',	'0011.05.UKSI-UIKA.2019',	'2019-01-01',	'BAIK',	'AKTIF',	'0006/BAST/UKSI-UIKA/2019',	'UKSI',	'teddy',	'2019-12-15 10:07:54',	12),
('04.01.001.UKSI-2019.0001',	'04.01.001',	'B01.001',	'0021.05.UKSI-UIKA.2019',	'2019-11-28',	'BAIK',	'AKTIF',	'0006/BAST/UKSI-UIKA/2019',	'FTS',	'teddy',	'2019-12-25 01:16:48',	12);

DROP TABLE IF EXISTS `simpras_jenis`;
CREATE TABLE `simpras_jenis` (
  `kode_jenis` char(5) NOT NULL,
  `kode_kategori` char(10) NOT NULL,
  `nama_jenis` varchar(50) NOT NULL,
  `sifat_aset` enum('TETAP','BERGERAK') NOT NULL DEFAULT 'BERGERAK',
  `masa_manfaat` smallint(6) unsigned DEFAULT NULL COMMENT 'dalam bulan',
  PRIMARY KEY (`kode_jenis`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

TRUNCATE `simpras_jenis`;
INSERT INTO `simpras_jenis` (`kode_jenis`, `kode_kategori`, `nama_jenis`, `sifat_aset`, `masa_manfaat`) VALUES
('04.01',	'04',	'Rak Buku Besar',	'TETAP',	0),
('02.01',	'02',	'Gedung Perkuliahan',	'TETAP',	0),
('02.02',	'02',	'Gedung Perkantoran',	'TETAP',	0),
('02.03',	'02',	'Gedung Perkantoran dan Perkuliahan',	'TETAP',	0),
('01.01',	'01',	'Lapangan dan Olahraga',	'TETAP',	0),
('01.02',	'01',	'Parkir Motor',	'TETAP',	0),
('01.03',	'01',	'Parkir Mobil',	'TETAP',	0),
('05.02',	'05',	'Penggaris',	'BERGERAK',	0),
('03.01',	'03',	'Ruang Dosen',	'TETAP',	0),
('05.01',	'05',	'Pulpen',	'BERGERAK',	NULL);

DROP TABLE IF EXISTS `simpras_kategori`;
CREATE TABLE `simpras_kategori` (
  `kode_kategori` smallint(2) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `nama_kategori` varchar(30) NOT NULL,
  PRIMARY KEY (`kode_kategori`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

TRUNCATE `simpras_kategori`;
INSERT INTO `simpras_kategori` (`kode_kategori`, `nama_kategori`) VALUES
(01,	'Tanah'),
(02,	'Gedung'),
(03,	'Ruangan'),
(04,	'Mebeler'),
(05,	'Alat Tulis Kantor');

DROP TABLE IF EXISTS `simpras_maintenance`;
CREATE TABLE `simpras_maintenance` (
  `kode_pemeliharaan` char(23) NOT NULL,
  `kode_inventaris` varchar(30) DEFAULT NULL,
  `tanggal_servis` date DEFAULT NULL,
  `tanggal_servis_berikutnya` date DEFAULT NULL,
  `keluhan` varchar(256) DEFAULT NULL,
  `perusahaan_servis` varchar(50) DEFAULT NULL,
  `teknisi_servis` varchar(30) DEFAULT NULL,
  `nomor_hp` varchar(15) DEFAULT NULL,
  `biaya_servis` double NOT NULL,
  `status_servis` enum('SUDAH SELESAI','BELUM SELESAI') NOT NULL DEFAULT 'SUDAH SELESAI',
  `keterangan` varchar(256) DEFAULT NULL,
  `foto` varchar(128) DEFAULT NULL,
  `branch` char(30) NOT NULL,
  `modified_by` char(20) NOT NULL,
  `modified_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`kode_pemeliharaan`),
  KEY `id_pemeliharaan` (`kode_pemeliharaan`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

TRUNCATE `simpras_maintenance`;
INSERT INTO `simpras_maintenance` (`kode_pemeliharaan`, `kode_inventaris`, `tanggal_servis`, `tanggal_servis_berikutnya`, `keluhan`, `perusahaan_servis`, `teknisi_servis`, `nomor_hp`, `biaya_servis`, `status_servis`, `keterangan`, `foto`, `branch`, `modified_by`, `modified_dt`) VALUES
('0018.06.UKSI-UIKA.2019',	'04.01.001.0001.UKSI.2019',	'2019-10-16',	'0000-00-00',	'',	'',	'',	'',	100000,	'SUDAH SELESAI',	'',	'',	'',	'teddy',	'2019-10-23 03:59:55'),
('0001.06.UKSI-UIKA.2019',	'04.01.001.0001.UKSI.2019',	'0000-00-00',	'0000-00-00',	'',	'',	'',	'',	0,	'BELUM SELESAI',	'',	'',	'UKSI',	'teddy',	'2019-11-19 20:06:03'),
('0022.06.UKSI-UIKA.2019',	'04.01.001.0005.UKSI-UIKA.2019',	'2019-11-17',	'2019-11-19',	'dddd',	'd',	'd',	'd',	0,	'SUDAH SELESAI',	'd',	'13450718_1768146423430746_1164619917075167881_n-pte.jpg',	'UKSI',	'teddy',	'2019-11-16 19:59:37'),
('0025.06.UKSI-UIKA.2019',	'04.01.001.0001.UKSI.2019',	'0000-00-00',	'0000-00-00',	'',	'',	'',	'',	0,	'BELUM SELESAI',	'',	'',	'UKSI',	'teddy',	'2019-11-19 20:10:51');

DROP TABLE IF EXISTS `simpras_mutasi`;
CREATE TABLE `simpras_mutasi` (
  `kode_mutasi` char(23) NOT NULL,
  `tanggal_mutasi` date NOT NULL,
  `kode_inventaris` char(30) NOT NULL,
  `kode_inventaris_baru` char(30) DEFAULT NULL,
  `branch_lama` char(20) NOT NULL,
  `kode_ruang_lama` char(17) NOT NULL,
  `branch_baru` char(20) NOT NULL,
  `kode_ruang_baru` char(17) NOT NULL,
  `keterangan` varchar(512) NOT NULL,
  `modified_by` char(20) NOT NULL,
  `modified_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`kode_mutasi`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

TRUNCATE `simpras_mutasi`;
INSERT INTO `simpras_mutasi` (`kode_mutasi`, `tanggal_mutasi`, `kode_inventaris`, `kode_inventaris_baru`, `branch_lama`, `kode_ruang_lama`, `branch_baru`, `kode_ruang_baru`, `keterangan`, `modified_by`, `modified_dt`) VALUES
('0001.03.UKSI-UIKA.2019',	'0000-00-00',	'04.01.001.0001.UKSI.2019',	'04.01.001.0002.UKSI-UIKA.2019',	'UKSI',	'02.03.001.L01.001',	'UKSI',	'02.01.002.LB1.002',	'',	'teddy',	'2019-11-19 19:59:38'),
('0024.03.UKSI-UIKA.2019',	'0000-00-00',	'04.01.001.0001.UKSI.2019',	'04.01.001.0003.UKSI-UIKA.2019',	'UKSI',	'02.03.001.L01.001',	'UKSI',	'02.01.002.LB1.002',	'',	'teddy',	'2019-11-19 20:00:55');

DROP TABLE IF EXISTS `simpras_noninventaris`;
CREATE TABLE `simpras_noninventaris` (
  `id_noninventaris` int(11) NOT NULL AUTO_INCREMENT,
  `kode_barang` char(9) NOT NULL,
  `stok` int(11) NOT NULL DEFAULT '0',
  `minimal_stok` int(11) DEFAULT NULL,
  `keterangan` varchar(256) DEFAULT NULL,
  `branch` char(20) NOT NULL,
  `modified_by` char(20) NOT NULL,
  `modified_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_noninventaris`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

TRUNCATE `simpras_noninventaris`;
INSERT INTO `simpras_noninventaris` (`id_noninventaris`, `kode_barang`, `stok`, `minimal_stok`, `keterangan`, `branch`, `modified_by`, `modified_dt`) VALUES
(1,	'05.01.001',	5,	2,	'111',	'UKSI',	'teddy',	'2019-12-24 08:28:05'),
(2,	'05.01.001',	31,	5,	NULL,	'',	'',	'2019-12-25 00:53:59');

DROP TABLE IF EXISTS `simpras_peminjaman`;
CREATE TABLE `simpras_peminjaman` (
  `kode_peminjaman` char(23) NOT NULL,
  `kode_inventaris` varchar(30) NOT NULL,
  `tanggal_pinjam_dari` date NOT NULL,
  `tanggal_pinjam_sd` date NOT NULL,
  `username_peminjam` char(20) NOT NULL,
  `keterangan` varchar(256) NOT NULL,
  `tanggal_kembali` date NOT NULL,
  `branch` char(30) NOT NULL,
  `modified_by` char(20) NOT NULL,
  `modified_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`kode_peminjaman`),
  KEY `id_pemeliharaan` (`kode_peminjaman`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

TRUNCATE `simpras_peminjaman`;
INSERT INTO `simpras_peminjaman` (`kode_peminjaman`, `kode_inventaris`, `tanggal_pinjam_dari`, `tanggal_pinjam_sd`, `username_peminjam`, `keterangan`, `tanggal_kembali`, `branch`, `modified_by`, `modified_dt`) VALUES
('0023.07.UKSI-UIKA.2019',	'04.01.001.UKSI-2019.0002',	'2019-11-17',	'2019-11-20',	'4101000333',	'',	'0000-00-00',	'UKSI',	'teddy',	'2019-12-24 07:02:57'),
('0026.07.UKSI-UIKA.2019',	'04.01.001.UKSI-2019.0001',	'2019-12-01',	'2019-12-22',	'4101000333',	'keterangan',	'0000-00-00',	'UKSI',	'teddy',	'2019-12-24 00:58:52');

DROP TABLE IF EXISTS `simpras_pengadaan`;
CREATE TABLE `simpras_pengadaan` (
  `kode_pengadaan` char(23) NOT NULL,
  `id_supplier` smallint(6) NOT NULL,
  `kode_barang` char(9) NOT NULL,
  `no_faktur` char(15) NOT NULL,
  `tahun` smallint(6) DEFAULT NULL,
  `no_sertifikat` varchar(50) DEFAULT NULL,
  `no_bpkb` char(15) DEFAULT NULL,
  `no_polisi` char(10) DEFAULT NULL,
  `tanggal_beli` date NOT NULL,
  `harga_satuan` double NOT NULL,
  `harga_beli` double NOT NULL,
  `qty` smallint(6) NOT NULL,
  `keterangan` varchar(256) DEFAULT NULL,
  `branch` char(20) NOT NULL,
  `modified_by` char(20) NOT NULL,
  `modified_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`kode_pengadaan`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

TRUNCATE `simpras_pengadaan`;
INSERT INTO `simpras_pengadaan` (`kode_pengadaan`, `id_supplier`, `kode_barang`, `no_faktur`, `tahun`, `no_sertifikat`, `no_bpkb`, `no_polisi`, `tanggal_beli`, `harga_satuan`, `harga_beli`, `qty`, `keterangan`, `branch`, `modified_by`, `modified_dt`) VALUES
('0011.05.UKSI-UIKA.2019',	4,	'04.01.001',	'5/nOMORrw3333',	0,	'',	'',	'',	'2019-10-14',	10000000,	0,	3,	'',	'UKSI',	'teddy',	'2019-12-17 14:55:54'),
('0021.05.UKSI-UIKA.2019',	4,	'04.01.001',	'5/nOMORr',	2010,	'6',	'7',	'8',	'2019-11-17',	12000000,	10000,	45,	'',	'FTS',	'teddy',	'2019-12-25 01:45:49');

DROP TABLE IF EXISTS `simpras_penghapusan`;
CREATE TABLE `simpras_penghapusan` (
  `kode_penghapusan` char(23) NOT NULL,
  `kode_inventaris` varchar(30) NOT NULL,
  `tanggal_penghapusan` date NOT NULL,
  `alasan_penghapusan` enum('TIDAK LAYAK PAKAI','DILELANG','LAINNYA') NOT NULL DEFAULT 'TIDAK LAYAK PAKAI',
  `alasan_lainnya` varchar(128) NOT NULL,
  `keterangan` varchar(256) NOT NULL,
  `nilai_aset` double unsigned NOT NULL DEFAULT '0',
  `pemenang_lelang` varchar(50) DEFAULT NULL,
  `pemenang_nomor_hp` char(15) DEFAULT NULL,
  `dasar_hukum` varchar(50) DEFAULT NULL,
  `foto` varchar(128) DEFAULT NULL,
  `modified_by` char(20) CHARACTER SET utf8 NOT NULL,
  `modified_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `branch` char(50) DEFAULT NULL,
  PRIMARY KEY (`kode_inventaris`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

TRUNCATE `simpras_penghapusan`;
INSERT INTO `simpras_penghapusan` (`kode_penghapusan`, `kode_inventaris`, `tanggal_penghapusan`, `alasan_penghapusan`, `alasan_lainnya`, `keterangan`, `nilai_aset`, `pemenang_lelang`, `pemenang_nomor_hp`, `dasar_hukum`, `foto`, `modified_by`, `modified_dt`, `branch`) VALUES
('',	'04.01.001.0001.UKSI.2019',	'0000-00-00',	'TIDAK LAYAK PAKAI',	'',	'',	0,	'',	'',	'',	'',	'teddy',	'2019-11-20 14:05:36',	'UKSI');

DROP TABLE IF EXISTS `simpras_penyusutan`;
CREATE TABLE `simpras_penyusutan` (
  `kode_inventaris` varchar(30) NOT NULL,
  `tahun_buku` smallint(6) NOT NULL,
  `1` double NOT NULL,
  `2` double NOT NULL,
  `3` double NOT NULL,
  `4` double NOT NULL,
  `5` double NOT NULL,
  `6` double NOT NULL,
  `7` double NOT NULL,
  `8` double NOT NULL,
  `9` double NOT NULL,
  `10` double NOT NULL,
  `11` double NOT NULL,
  `12` double NOT NULL,
  `modified_by` char(20) NOT NULL,
  `modified_dt` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`kode_inventaris`,`tahun_buku`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

TRUNCATE `simpras_penyusutan`;
INSERT INTO `simpras_penyusutan` (`kode_inventaris`, `tahun_buku`, `1`, `2`, `3`, `4`, `5`, `6`, `7`, `8`, `9`, `10`, `11`, `12`, `modified_by`, `modified_dt`) VALUES
('04.01.001.0001.UKSI.2019',	2010,	1000,	1000,	1000,	1000,	1000,	1000,	1000,	1000,	1000,	1000,	1000,	1000,	'teddy',	'2019-11-06 14:36:53');

DROP TABLE IF EXISTS `simpras_ruangan`;
CREATE TABLE `simpras_ruangan` (
  `kode_ruang` char(17) NOT NULL,
  `kode_gedung` char(9) NOT NULL,
  `kode_jenis` char(5) NOT NULL,
  `lantai` enum('B1','01','02','03','04','05') NOT NULL,
  `nama_ruang` varchar(30) NOT NULL,
  `ukuran` char(20) NOT NULL,
  `luas` double NOT NULL,
  `kapasitas` double NOT NULL,
  `kepemilikan` enum('MILIK SENDIRI','SEWA','PINJAM','KERJASAMA') DEFAULT NULL,
  `kondisi` enum('TERAWAT','TIDAK TERAWAT') DEFAULT NULL,
  `keterangan` varchar(256) NOT NULL,
  `foto` varchar(128) NOT NULL,
  `branch` char(30) NOT NULL,
  `modified_by` char(20) NOT NULL,
  `modified_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`kode_ruang`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

TRUNCATE `simpras_ruangan`;
INSERT INTO `simpras_ruangan` (`kode_ruang`, `kode_gedung`, `kode_jenis`, `lantai`, `nama_ruang`, `ukuran`, `luas`, `kapasitas`, `kepemilikan`, `kondisi`, `keterangan`, `foto`, `branch`, `modified_by`, `modified_dt`) VALUES
('B01.001',	'B',	'03.01',	'01',	'Ruang Dosen FTS',	'50x40',	10,	30,	'MILIK SENDIRI',	'TERAWAT',	'keterangan',	'',	'FTS',	'teddy',	'2019-12-25 01:48:19');

DROP TABLE IF EXISTS `simpras_supplier`;
CREATE TABLE `simpras_supplier` (
  `id_supplier` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `nama_supplier` varchar(50) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `kota` varchar(30) NOT NULL,
  `telepon` varchar(15) NOT NULL,
  `narahubung` varchar(30) NOT NULL,
  `nomor_hp` varchar(15) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `keterangan` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id_supplier`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

TRUNCATE `simpras_supplier`;
INSERT INTO `simpras_supplier` (`id_supplier`, `nama_supplier`, `alamat`, `kota`, `telepon`, `narahubung`, `nomor_hp`, `email`, `keterangan`) VALUES
(4,	'Tes',	'',	'',	'',	'',	'',	'',	'');

DROP TABLE IF EXISTS `simpras_tanah`;
CREATE TABLE `simpras_tanah` (
  `kode_tanah` char(9) NOT NULL,
  `kode_jenis` char(5) NOT NULL,
  `nama_tanah` varchar(100) NOT NULL,
  `lokasi` varchar(100) NOT NULL,
  `luas` double NOT NULL,
  `kepemilikan` enum('MILIK SENDIRI','SEWA','PINJAM','KERJASAMA') NOT NULL,
  `kondisi` enum('TERAWAT','TIDAK TERAWAT') DEFAULT NULL,
  `foto` varchar(128) DEFAULT NULL,
  `branch` char(30) NOT NULL,
  `modified_by` char(50) NOT NULL,
  `modified_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`kode_tanah`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

TRUNCATE `simpras_tanah`;
INSERT INTO `simpras_tanah` (`kode_tanah`, `kode_jenis`, `nama_tanah`, `lokasi`, `luas`, `kepemilikan`, `kondisi`, `foto`, `branch`, `modified_by`, `modified_dt`) VALUES
('01.01.001',	'01.01',	'Basket',	'Gedung Fakultas Teknik',	10,	'SEWA',	'TERAWAT',	'13407136_1768130910098964_9141225848103361647_n-hhe.png',	'FTS',	'teddy',	'2019-12-25 01:10:49'),
('01.03.001',	'01.03',	'Parkir FTS',	'Gedung Fakultas Teknik',	10,	'MILIK SENDIRI',	'TIDAK TERAWAT',	'Untitled-akz.png',	'UKSI',	'teddy',	'2019-10-20 13:12:14');

DROP TABLE IF EXISTS `simpras_type_transaction`;
CREATE TABLE `simpras_type_transaction` (
  `id` int(2) unsigned zerofill NOT NULL,
  `name` char(20) NOT NULL,
  `active` enum('Y','N') NOT NULL DEFAULT 'N',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

TRUNCATE `simpras_type_transaction`;
INSERT INTO `simpras_type_transaction` (`id`, `name`, `active`) VALUES
(00,	'HILANG',	'N'),
(01,	'MASUK',	'N'),
(02,	'KELUAR',	'N'),
(03,	'MUTASI',	'N'),
(04,	'PEMINJAMAN',	'N'),
(05,	'PENGADAAN',	'N'),
(06,	'PEMELIHARAAN',	'N'),
(07,	'PEMINJAMAN',	'N'),
(09,	'PENGHAPUSAN',	'N');

-- 2022-10-14 23:02:17
