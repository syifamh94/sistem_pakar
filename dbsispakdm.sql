/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 10.1.19-MariaDB : Database - dbsispakdm
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`dbsispakdm` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `dbsispakdm`;

/*Table structure for table `data_pakar` */

DROP TABLE IF EXISTS `data_pakar`;

CREATE TABLE `data_pakar` (
  `username` varchar(10) NOT NULL,
  `password` varchar(50) NOT NULL,
  `pertanyaan` varchar(50) NOT NULL,
  `jawaban` varchar(50) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `data_pakar` */

insert  into `data_pakar`(`username`,`password`,`pertanyaan`,`jawaban`) values ('pakar','53e40ae266ebf8fc898a0b0bf34b789c','Apa Makanan Favorit Anda?','53e40ae266ebf8fc898a0b0bf34b789c');

/*Table structure for table `data_user` */

DROP TABLE IF EXISTS `data_user`;

CREATE TABLE `data_user` (
  `username` varchar(10) NOT NULL,
  `password` varchar(50) NOT NULL,
  `nama_user` varchar(30) NOT NULL,
  `usia` int(2) NOT NULL,
  `jenis_kelamin` enum('L','P') NOT NULL,
  `alamat` varchar(40) NOT NULL,
  `pertanyaan` varchar(50) NOT NULL,
  `jawaban` varchar(50) NOT NULL,
  PRIMARY KEY (`username`),
  UNIQUE KEY `username` (`username`),
  KEY `nama_user` (`nama_user`),
  KEY `usia` (`usia`),
  KEY `alamat` (`alamat`),
  KEY `jenis_kelamin` (`jenis_kelamin`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `data_user` */

insert  into `data_user`(`username`,`password`,`nama_user`,`usia`,`jenis_kelamin`,`alamat`,`pertanyaan`,`jawaban`) values ('kafbillah','d7c6f99c5f2420e22a71042f3e9e5613','abil',10,'L','cariu','Apa Makanan Favorit Anda?','7528bce9327c5b4bebeabfbd250d0dba'),('putriapril','d1da3819c8cedcecc525173f707123c2','putri aprilianti',25,'L','gadung','Di Kota Manakah Ibu Anda Lahir?','bb74a014a659160f9a88248183d3635d'),('syifa','fac6dcc99d753552059000479582260a','Syifa Muhammad Husni',24,'L','Kampung Cianjur','Apa Buku Favorit Anda?','b4c6b94ebac6c8c22e3c3db2c3a2ff77'),('syifamuham','dac4d2b269e1d785c01a13795ed7b2ed','abil abil',10,'L','Kampung Cianjur','Siapa Nama Sahabat Anda Waktu Masih Kecil?','475d919238f4a5f667179778359b76c6');

/*Table structure for table `gejala` */

DROP TABLE IF EXISTS `gejala`;

CREATE TABLE `gejala` (
  `kode_gejala` varchar(4) NOT NULL,
  `nama_gejala` varchar(100) NOT NULL,
  `kode_induk_ya` varchar(4) NOT NULL,
  `kode_induk_tidak` varchar(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`kode_gejala`),
  KEY `kode_induk_ya` (`kode_induk_ya`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `gejala` */

insert  into `gejala`(`kode_gejala`,`nama_gejala`,`kode_induk_ya`,`kode_induk_tidak`) values ('G001','ACUH TAK ACUH','',''),('G002','TIDAK EKSPRESIF','','G001'),('G003','SUKA MENGGANGGU ORANG LAIN','G004','G002'),('G004','TIDAK MAMPU MELAKUKAN KERJASAMA DENGAN ORANG LAIN','G001','G003'),('G005','BERBOHONG','G007','G004'),('G006','AGRESIF PADA APA SAJA DILINGKUNGAN SEKITAR','G006','G005'),('G007','MUDAH TERSINGGUNG','G005','G006'),('G008','MELAWAN SAAT DINASEHATI','G007','G006'),('G009','RASA PERCAYA DIRI YANG KURANG','G004','G008'),('G010','SERING MARAH','G006','G009'),('G011','SERING MELAMUN','G009','G010'),('G012','SUKA MENYENDIRI','G011','G010'),('G013','BERBICARA KASAR','G008','G012'),('G014','PERKELAHIAN FISIK','G013','G012');

/*Table structure for table `hasil_diagnosa` */

DROP TABLE IF EXISTS `hasil_diagnosa`;

CREATE TABLE `hasil_diagnosa` (
  `id_diagnosa` int(5) NOT NULL AUTO_INCREMENT,
  `username` varchar(10) NOT NULL,
  `kode_penyakit` varchar(4) NOT NULL,
  `tanggal_diagnosa` datetime NOT NULL,
  `persentase` int(2) DEFAULT NULL,
  PRIMARY KEY (`id_diagnosa`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=latin1;

/*Data for the table `hasil_diagnosa` */

insert  into `hasil_diagnosa`(`id_diagnosa`,`username`,`kode_penyakit`,`tanggal_diagnosa`,`persentase`) values (1,'putriapril','P001','2018-07-02 09:25:22',33),(2,'putriapril','P005','2018-07-02 09:25:22',20),(3,'putriapril','P009','2018-07-02 09:25:22',33),(4,'putriapril','P001','2018-07-02 09:26:19',67),(5,'putriapril','P002','2018-07-02 09:26:19',100),(6,'putriapril','P003','2018-07-02 09:26:19',100),(7,'putriapril','P005','2018-07-02 09:26:19',80),(8,'putriapril','P009','2018-07-02 09:26:19',67),(9,'kafbillah','P001','2018-07-02 09:31:47',33),(10,'kafbillah','P005','2018-07-02 09:31:47',20),(11,'kafbillah','P009','2018-07-02 09:31:47',33),(12,'kafbillah','P001','2018-07-02 09:32:21',33),(13,'kafbillah','P005','2018-07-02 09:32:21',20),(14,'kafbillah','P009','2018-07-02 09:32:21',33),(15,'kafbillah','P001','2018-07-02 09:33:03',33),(16,'kafbillah','P005','2018-07-02 09:33:03',20),(17,'kafbillah','P009','2018-07-02 09:33:03',33),(18,'kafbillah','P001','2018-07-02 09:33:53',33),(19,'kafbillah','P005','2018-07-02 09:33:53',20),(20,'kafbillah','P009','2018-07-02 09:33:53',33),(21,'kafbillah','P001','2018-07-02 09:33:55',66),(22,'kafbillah','P005','2018-07-02 09:33:55',40),(23,'kafbillah','P009','2018-07-02 09:33:55',66),(24,'kafbillah','P001','2018-07-02 09:33:56',99),(25,'kafbillah','P005','2018-07-02 09:33:56',60),(26,'kafbillah','P009','2018-07-02 09:33:56',99),(27,'kafbillah','P001','2018-07-02 09:33:57',132),(28,'kafbillah','P005','2018-07-02 09:33:57',80),(29,'kafbillah','P009','2018-07-02 09:33:57',132),(30,'kafbillah','P001','2018-07-02 09:33:58',165),(31,'kafbillah','P005','2018-07-02 09:33:58',100),(32,'kafbillah','P009','2018-07-02 09:33:58',165),(33,'kafbillah','P001','2018-07-02 09:33:59',198),(34,'kafbillah','P005','2018-07-02 09:33:59',120),(35,'kafbillah','P009','2018-07-02 09:33:59',198),(36,'kafbillah','P001','2018-07-02 09:33:59',231),(37,'kafbillah','P005','2018-07-02 09:33:59',140),(38,'kafbillah','P009','2018-07-02 09:33:59',231),(39,'kafbillah','P001','2018-07-02 09:34:07',264),(40,'kafbillah','P005','2018-07-02 09:34:07',160),(41,'kafbillah','P009','2018-07-02 09:34:07',264),(42,'kafbillah','P001','2018-07-02 09:34:10',297),(43,'kafbillah','P005','2018-07-02 09:34:10',180),(44,'kafbillah','P009','2018-07-02 09:34:10',297),(45,'kafbillah','P001','2018-07-02 09:39:09',67),(46,'kafbillah','P002','2018-07-02 09:39:09',67),(47,'kafbillah','P003','2018-07-02 09:39:10',100),(48,'kafbillah','P005','2018-07-02 09:39:10',40),(49,'kafbillah','P009','2018-07-02 09:39:10',33),(50,'kafbillah','P002','2018-07-02 09:39:38',33),(51,'kafbillah','P003','2018-07-02 09:39:38',100),(52,'kafbillah','P001','2018-07-02 09:41:29',67),(53,'kafbillah','P002','2018-07-02 09:41:29',100),(54,'kafbillah','P003','2018-07-02 09:41:29',100),(55,'kafbillah','P005','2018-07-02 09:41:29',80),(56,'kafbillah','P009','2018-07-02 09:41:29',67),(57,'kafbillah','P001','2018-07-02 09:43:20',33),(58,'kafbillah','P002','2018-07-02 09:43:20',66),(59,'kafbillah','P003','2018-07-02 09:43:20',100),(60,'kafbillah','P005','2018-07-02 09:43:20',20),(61,'kafbillah','P009','2018-07-02 09:43:20',33);

/*Table structure for table `penyakit` */

DROP TABLE IF EXISTS `penyakit`;

CREATE TABLE `penyakit` (
  `kode_penyakit` varchar(4) NOT NULL,
  `nama_penyakit` varchar(50) NOT NULL,
  `definisi` varchar(1000) NOT NULL,
  `pengobatan` varchar(1000) NOT NULL,
  `pencegahan` varchar(500) NOT NULL,
  PRIMARY KEY (`kode_penyakit`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `penyakit` */

insert  into `penyakit`(`kode_penyakit`,`nama_penyakit`,`definisi`,`pengobatan`,`pencegahan`) values ('P001','SCHIOZOPRENIA','skizofrenia merupakan sindrom dengan variasi penyebab dan perjalanan penyakit yang luas serta sejumlah akibat yang tergantung pada perimbangan pengaruh genetik, fisik dan sosial budaya.','1.Terapi Obat. Biasanya menggunakan obat-obatan anti psikotik.\r\n2.Penanganan Psikologis.\r\n3.Terapi Psikodinamika.\r\n4.Pelatihan Ketrampilan Sosial\r\n5.Terapi keluarga dan Mengurangi Ekspresi Emosi\r\n6.Manajemen fungsi kognitif','Pertama, pencegahan universal, ditujukan kepada populasi umum agar tidak terjadi faktor risiko. Caranya adalah mencegah komplikasi kehamilan dan persalinan. \r\nKedua, pencegahan selektif, ditujukan kepada kelompok yang mempunyai risiko tinggi dengan cara, orang tua menciptakan keluarga yang harmonis, hangat, dan stabil. \r\nKetiga, pencegahan terindikasi, yaitu mencegah mereka yang baru memperlihatkan tanda-tanda fase prodromal tidak menjadi skizofrenia yang nyata, dengan cara memberikan obat antip'),('P002','PARANOID','Gangguan kepribadian paranoid (GKP) adalah jenis gangguan kepribadian eksentrik di mana penderitanya memiliki rasa curiga dan tidak percaya yang tak ada hentinya terhadap orang lain. Tanda lain dari kondisi ini termasuk keengganan untuk bercerita pada orang lain, memendam dendam, dan menganggap semua peristiwa sebagai sesuatu yang â€œmerendahkanâ€ atau â€œmengancamâ€ dirinya. Seseorang dengan gangguan kepribadian seringnya lekas marah dan tidak bersahabat terhadap orang lain.','Psikoterapi (suatu bentuk konseling) adalah pengobatan pilihan untuk GKP. Pengobatan kemungkinan akan fokus pada meningkatkan kemampuan coping atau mengatasi hal secara umum, serta meningkatkan interaksi sosial, komunikasi, dan percaya diri.\r\nObat umumnya bukanlah fokus utama dalam pengobatan GKP. Namun, obat-obatan seperti obat anti-kecemasan, anti-depresan atau anti-psikotik, dapat miresepkan jika gejala orang tersebut ekstrem, atau jika ia juga menderita masalah psikologis lain yang terkait, seperti kecemasan atau depresi.','Istirahat yang cukup, hindari kerja larut malam, dan hindari stres berat.'),('P003','KONTEKS KELUARGA','','',''),('P004','BIPOLAR DISORDER','Gangguan bipolar adalah gangguan mental yang menyerang kondisi psikis seseorang yang ditandai dengan perubahan suasana hati yang sangat ekstrem berupa mania dan depresi, karena itu istilah medis sebelumnya disebut dengan manic depressive.','Selain dengan obat, penanganan bipolar harus dikombinasikan dengan terapi psikologis di bawah bimbingan dokter spesialis atau psikiater. Penderita biasanya juga akan disarankan untuk memperbaiki pola hidup ke arah yang lebih sehat, misalnya berolahraga secara teratur, tidur cukup, dan mengonsumsi makanan sehat.','Gangguan bipolar tidak dapat dicegah. Hal yang terpenting adalah mengenali secara dini gejala gangguan bipolar sehingga dapat ditangani segera sebelum penyakitnya menjadi berat dan membahayakan.'),('P005','OBSESSIVE COMPULSIVE','Gangguan obsesif kompulsif atau yang lebih dikenal dengan singkatan OCD adalah kelainan psikologis yang menyebabkan seseorang memiliki pikiran obsesif dan perilaku yang bersifat kompulsif. Gangguan ini merupakan penyakit jangka panjang seperti halnya tekanan darah tinggi maupun diabetes.','Terapi perilaku kognitif (CBT). Terapi ini dapat membantu Anda untuk mengurangi kecemasan dengan mengubah cara pikir dan perilaku Anda.\r\nPenggunaan obat-obatan untuk mengendalikan gejala yang Anda alami.','Terapi pajanan dan pencegahan respons (ERP) termasuk salah satu dari terapi perilaku kognitif (CBT) yang terbukti efektif untuk menangani OCD.'),('P006','HISTIONIC','Histrionic Personality Disorder didefinisikan sebagai gangguan kepribadian yang ditandai dengan pola emosi yang berlebihan dalam mencari perhatian, termasuk perilaku seduktif yang tidak tepat dan kebutuhan yang berlebihan untuk penerimaan','Dalam penyembuhan gangguan kepribadian histrionik, para ahli menyarankan untuk menempuh cara dengan mengkombinasikan penyembuhan secara medical dan psikoterapi. Penyembuhan dengan cara medical bisa dilakukan dengan pemberian obat. Namun, para ahli juga mengatakan bahwa tidak ada obat yang pasti untuk pengobatan gangguan kepribadian ini, namun biasanya dokter akan menganjurkan si penderita untuk mengobati kelainan ini dengan jenis obat-obat seperti Antidepressant, selective serotonin reuptake inhibitors (SSRIs), seperti fluoxetine (Prozac, Sarafem), sertraline (Zoloft), paroxetine (Paxil) dan nefazodone namun tentu nya dengan resep dokter dan lebih penting lagi obat diberikan dengan catatan jika si penderita mengalami gejala yang disertai dengan kecemasan dan depresi.','Meskipun pencegahan gangguan kepribadian histrionik tidak mungkin dilakukan, pengobatan seperti konseling dan edukasi dapat memungkinkan orang yang rentan terhadap gangguan ini untuk mempelajari cara-cara yang lebih produktif  dalam menangani gejala yang muncul.'),('P007','TERISOLASI','','',''),('P008','FAKTOR LINGKUNGAN PERGAULAN','','',''),('P009','AUTISME','','','');

/*Table structure for table `relasi_penyakit_gejala` */

DROP TABLE IF EXISTS `relasi_penyakit_gejala`;

CREATE TABLE `relasi_penyakit_gejala` (
  `kode_penyakit` varchar(4) NOT NULL,
  `kode_gejala` varchar(4) NOT NULL,
  `bobot` int(3) NOT NULL,
  KEY `kode_penyakit` (`kode_penyakit`),
  KEY `kode_gejala` (`kode_gejala`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `relasi_penyakit_gejala` */

insert  into `relasi_penyakit_gejala`(`kode_penyakit`,`kode_gejala`,`bobot`) values ('P001','G001',33),('P001','G004',33),('P001','G009',34),('P002','G002',33),('P002','G004',33),('P002','G009',34),('P003','G002',100),('P004','G005',25),('P004','G007',25),('P004','G008',25),('P004','G013',25),('P005','G001',20),('P005','G004',20),('P005','G009',20),('P005','G011',20),('P005','G012',20),('P006','G003',50),('P006','G005',50),('P007','G003',17),('P007','G006',16),('P007','G007',17),('P007','G008',16),('P007','G013',17),('P007','G014',17),('P008','G003',20),('P008','G006',20),('P008','G010',20),('P008','G013',20),('P008','G014',20),('P009','G001',33),('P009','G004',33),('P009','G012',34);

/*Table structure for table `tmp_analisa` */

DROP TABLE IF EXISTS `tmp_analisa`;

CREATE TABLE `tmp_analisa` (
  `username` varchar(10) NOT NULL,
  `kode_penyakit` varchar(5) NOT NULL,
  `kode_gejala` varchar(5) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

/*Data for the table `tmp_analisa` */

/*Table structure for table `tmp_gejala` */

DROP TABLE IF EXISTS `tmp_gejala`;

CREATE TABLE `tmp_gejala` (
  `username` varchar(10) NOT NULL,
  `kode_gejala` varchar(5) NOT NULL,
  `status` enum('1','0') NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `tmp_gejala` */

/*Table structure for table `tmp_penyakit` */

DROP TABLE IF EXISTS `tmp_penyakit`;

CREATE TABLE `tmp_penyakit` (
  `username` varchar(10) NOT NULL,
  `kode_penyakit` varchar(5) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `tmp_penyakit` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
