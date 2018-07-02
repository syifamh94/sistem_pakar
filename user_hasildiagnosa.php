<?php
// session_start();
include("otentifikasi.php");
include ("koneksi_db.php");
mysql_query("TRUNCATE TABLE `tmp_gejala`");
$u=$_SESSION['SESS_USERNAME'];
$qry = mysql_query("SELECT u.nama_user, u.usia, u.jenis_kelamin, u.alamat
                    FROM hasil_diagnosa AS h
                    JOIN data_user AS u ON h.username=u.username
                    WHERE h.username =  '$u';
                    ");
 $data = mysql_fetch_array($qry);
// mysql_query("TRUNCATE TABLE `tmp_analisa`");
// 
// mysql_query("TRUNCATE TABLE `tmp_penyakit`");
?>
<div class="text-area-user" align="justify">  
<br>
<div class="title">Hasil Diagnosa</div>
<br />
<form action="javascript: void(0)" method="post" align="left" cellpadding="5">
<table width="100%"  cellpadding="5">
<tr>
    <td colspan="3"><hr color="#AAAAAA"></td>
  </tr>
  <tr>
    <td height="30" colspan="3" class="subtitle">Biodata User (Pasien) </td>
  </tr>
  <tr>
    <td width="22%"><strong>Nama  </strong></td>
    <td width="2%">:</td>
    <td width="76%"><?php echo $data['nama_user'];?></td>
  </tr>
   <tr>
    <td><strong>Usia</strong></td>
    <td>:</td>
    <td><?php echo $data['usia'];?> tahun</td>
  </tr>
  <tr>
    <td><strong>Jenis Kelamin</strong></td>
    <td>:</td>
    <td><?php if ($data['jenis_kelamin']=='L') echo "Laki-laki"; else echo "Perempuan";?></td>
  </tr>
  <tr>
    <td><strong>Alamat</strong></td>
    <td>:</td>
    <td><?php echo $data['alamat'];?></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td colspan="3"><hr color="#AAAAAA" class="style3"></td>
  </tr>
  <tr>
    <td colspan="3" class="subtitle"><strong>Hasil Diagnosa</strong></td>
  </tr>
  
<?php
$date =date('Y-m-d H:i:s');

$qry2 = mysql_query("SELECT p.kode_penyakit,p.nama_penyakit, h.persentase ,p.definisi,p.pengobatan,p.pencegahan,h.tanggal_diagnosa
                     FROM hasil_diagnosa AS h
                     LEFT JOIN penyakit AS p ON h.kode_penyakit=p.kode_penyakit
                     WHERE tanggal_diagnosa='$date'");
 $no = 1;
 while($data2 = mysql_fetch_array($qry2)){ 
 ?>
   <tr>
    <td><div align="right"><strong>Kemungkinan </strong></div></td>
    <td>:</td>
    <td><?php echo $no;?></td>
  </tr>
  <tr>
    <td><div align="right"><strong>Tipe Penyakit DM</strong></div></td>
    <td>:</td>
    <td><?php echo $data2['nama_penyakit'];?></td>
  </tr>
  <tr>
    <td><div align="right"><strong>Persentase</strong></div></td>
    <td>:</td>
    <td><?php echo $data2['persentase'];?> %persen</td>
  </tr>
  <tr>
    <td valign="top"><div align="right"><strong>Gejala Umum</strong></div></td>
    <td valign="top">:</td>
    <td>
      <?php
    $sql_gejala = "SELECT gejala.* FROM gejala,relasi_penyakit_gejala
            WHERE gejala.kode_gejala=relasi_penyakit_gejala.kode_gejala
            AND relasi_penyakit_gejala.kode_penyakit='$data2[kode_penyakit]'";
    $qry_gejala = mysql_query($sql_gejala);
      $i=0;
      while($hsl_gejala=mysql_fetch_array($qry_gejala)){
        $i++;
        echo "$i. $hsl_gejala[nama_gejala] <br>";
      } 
      ?>    </td>
  </tr>
  <tr>
    <td valign="top"><div align="right"><strong>Definisi</strong></div></td>
    <td valign="top">:</td>
    <td valign="top"><?php echo $data2['definisi'];?></td>
  </tr>
  <tr>
    <td valign="top"><div align="right"><strong>Pengobatan</strong></div></td>
    <td valign="top">:</td>
    <td valign="top"><?php echo $data2['pengobatan'];?></td>
  </tr>
  <tr>
    <td valign="top"><div align="right"><strong>Pencegahan</strong></div></td>
    <td valign="top">:</td>
    <td valign="top"><?php echo $data2['pencegahan'];?></td>
  </tr>
  <tr>
    <td><div align="right"><strong>Waktu Diagnosa</strong></div></td>
    <td>:</td>
    <td><?php echo tgl_indo($data2['tanggal_diagnosa']);?></td>
  </tr>
  <tr>
    <td colspan="3"><hr color="#AAAAAA"></td>
  </tr>
<?php
$no++;
  }
?>
  <tr>
    <td colspan="3" align="center">
<input type="submit" name="submit" value="Cetak"/></td>
  </tr>
</table>
</div>

