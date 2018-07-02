<?php
// session_start();
include("otentifikasi.php");
include ("koneksi_db.php");
$u=$_SESSION['SESS_USERNAME'];
if(isset($_GET['kode_gejala'])){
  $new_kd_gejala=$_GET['kode_gejala'];
  $query = mysql_query("SELECT * FROM gejala WHERE kode_gejala='$new_kd_gejala'");
}else{
  $query = mysql_query("SELECT * FROM gejala LIMIT 0,1");
}
$hasil = mysql_fetch_array($query);
$kode_gejala = $hasil['kode_gejala'];
//$_GET['kode_gejala'] = $hasil['kode_gejala'];
?>

<link href="style.css" rel="stylesheet" type="text/css" />
<style type="text/css">
<!--
.style3 {font-weight: bold}
-->
</style>
<div class="text-area-user" align="justify">  
<br>
<form action="" method="post">
<input  name="kode_gejala" value="<?php echo $kode_gejala;?>" type="hidden"/>
<table width="100%" align="center" cellpadding="5">
  <tr>
    <td colspan="2"><div class="title">Jawablah pertanyaan di bawah ini :</div></td>
  </tr>
  <tr>
    <td></td>
  </tr>
  <tr>
    <td colspan="2" align="center"><div class="pertanyaan"><?php echo " &nbsp; Apakah Anda mengalami <b>".$hasil['nama_gejala']."</b> ?";?></div></td>
  </tr>
  <tr>
    <td width="50%" align="right"><label><input type="radio" name="status" value="1" checked="checked" />Ya (Benar)</label></td>
    <td width="50%" align="left"><label><input type="radio" name="status" value="0" />Tidak (Salah)</label></td>
  </tr>
  <tr>
    <td colspan="2" align="center"><input type="submit" value="Jawab" name="submit" /></td>
  </tr>
</table>
</form>
</div>
<?php
# Fungsi hapus tabel tmp_gejala
function AddTmpGejala($kode_gejala, $u,$status) {
  $sql_gejala = "INSERT INTO tmp_gejala (username,kode_gejala,status) VALUES ('$u','$kode_gejala','$status')";
  mysql_query($sql_gejala);
}



if(isset($_POST['submit'])){
  $status = $_POST['status'];
  AddTmpGejala($kode_gejala, $u, $status);
  # PEMERIKSAAN
        if(isset($_GET['status'])){
          $get_status=1;
        }else{
          $get_status=0;
        }

        if ($status == "1" || $get_status==1) {
          //echo $u;
            $var_q=mysql_query("SELECT p.kode_penyakit, p.nama_penyakit, pr.kode_gejala, gj.nama_gejala FROM penyakit AS p
                      JOIN relasi_penyakit_gejala AS rp ON rp.kode_penyakit = p.kode_penyakit AND rp.kode_gejala= '$kode_gejala'
                      JOIN relasi_penyakit_gejala AS pr ON pr.kode_penyakit = rp.kode_penyakit
                      JOIN gejala AS gj ON gj.kode_gejala = pr.kode_gejala WHERE pr.`kode_gejala`
                      NOT IN (SELECT kode_gejala AS g FROM tmp_gejala AS g WHERE username='$u') LIMIT 0,1");
            $hasil2 = mysql_fetch_array($var_q);
            //hitung count
            /*$var_q3=mysql_query("SELECT p.kode_penyakit, p.nama_penyakit, gj.kode_gejala FROM penyakit AS p
                      JOIN relasi_penyakit_gejala AS rp ON rp.kode_penyakit = p.kode_penyakit AND rp.kode_gejala= '$kode_gejala'
                      JOIN relasi_penyakit_gejala AS pr ON pr.kode_penyakit = rp.kode_penyakit
                      JOIN gejala AS gj ON gj.kode_gejala = pr.kode_gejala
                      GROUP BY gj.`kode_gejala`");
            $hasil3 = mysql_num_rows($var_q3); 
            
            $var_q4=mysql_query("SELECT username, kode_gejala,status FROM tmp_gejala WHERE username = '$u' GROUP BY kode_gejala");
            $hasil4 = mysql_num_rows($var_q4);*/ 
            
            if(empty($_GET['kode_gejala'])){
              //hitung jumlah untuk masuk ke tmpdiagnosa
              //menghitungg bobottt
              $var_bobot2="SELECT rp.kode_penyakit, p.nama_penyakit, tg.username, tg.kode_gejala, tg.status, rp.bobot, SUM(rp.bobot) AS total 
                        FROM tmp_gejala AS tg
                        LEFT JOIN relasi_penyakit_gejala AS rp ON rp.kode_gejala= tg.kode_gejala
                        LEFT JOIN penyakit AS p ON p.kode_penyakit = rp.kode_penyakit
                        WHERE tg.status= '1'
                        GROUP BY rp.kode_penyakit 
                        ORDER BY rp.kode_penyakit, tg.kode_gejala ASC";
              $bobot = mysql_query($var_bobot2);
              while($hasilbobot = mysql_fetch_array($bobot)){
                $username=$hasilbobot['username'];
                $kode_penyakit=$hasilbobot['kode_penyakit'];
                $total=$hasilbobot['total'];
                $tgl=date('Y-m-d H:i:s');
                      
                      //masukan ke diagnosaa
                       $sql_diagnosa = "INSERT INTO hasil_diagnosa VALUES ('','$username','$kode_penyakit','$tgl','$total')";
                       mysql_query($sql_diagnosa) or die (mysql_error());
              }
              //link menuju 
              echo "<meta http-equiv=\"refresh\" content=\"0; url=user_index.php?page=11\" >";
            }else{
              $new_kd_gejala2=$hasil2['kode_gejala'];
              echo "<meta http-equiv=\"refresh\" content=\"0; url=user_index.php?page=7&status=1&kode_gejala=$new_kd_gejala2\" >";
            }
        }else if ($status == "0") { 
          //echo "tidak";
            $var_q=mysql_query("SELECT * FROM gejala WHERE kode_gejala > '$kode_gejala' LIMIT 0,1");
            $hasil2 = mysql_fetch_array($var_q);
            $new_kd_gejala2=$hasil2['kode_gejala'];
            echo "<meta http-equiv=\"refresh\" content=\"0; url=user_index.php?page=7&kode_gejala=$new_kd_gejala2\" >";
        }
  
}





// if($act=="diagnosis"){
  
// # Baca variabel Form (If Register Global ON)
// $jawaban  = $_REQUEST['jawaban'];
// $kode_gejala   = $_REQUEST['kode_gejala'];

// # Mendapatkan username
// $u=$_SESSION['SESS_USERNAME'];

// # Fungsi untuk menambah data ke tmp_analisa
// function AddTmpAnalisa($kode_gejala, $u) {
//   $sql_sakit = "SELECT relasi_penyakit_gejala.* FROM relasi_penyakit_gejala,tmp_penyakit 
//           WHERE relasi_penyakit_gejala.kode_penyakit=tmp_penyakit.kode_penyakit 
//           AND username='$u' ORDER BY relasi_penyakit_gejala.kode_penyakit,relasi_penyakit_gejala.kode_gejala";
//   $qry_sakit = mysql_query($sql_sakit);
//   while ($data_sakit = mysql_fetch_array($qry_sakit)) {
//     $sqltmp = "INSERT INTO tmp_analisa (username, kode_penyakit,kode_gejala)
//           VALUES ('$u','$data_sakit[kode_penyakit]','$data_sakit[kode_gejala]')";
//     mysql_query($sqltmp);
//   }
// }

// # Fungsi hapus tabel tmp_gejala
// function AddTmpGejala($kode_gejala, $u,$status) {
//   $sql_gejala = "INSERT INTO tmp_gejala (username,kode_gejala,status) VALUES ('$u','$kode_gejala','$status')";
//   mysql_query($sql_gejala);
// }

// # Fungsi hapus tabel tmp_sakit
// function DelTmpSakit($u) {
//   $sql_del = "DELETE FROM tmp_penyakit WHERE username='$u'";
//   mysql_query($sql_del);
// }

// # Fungsi hapus tabel tmp_analisa
// function DelTmpAnlisa($u) {
//   $sql_del = "DELETE FROM tmp_analisa WHERE username='$u'";
//   mysql_query($sql_del);
// }
// }
// # PEMERIKSAAN
// if ($jawaban == "Y") {
  
// //  echo "<meta http-equiv=\"refresh\" content=\"0; url=user_index.php?page=7&act=diagnosa&induk=$kode_gejala\">";
// }


// if ($jawaban == "T") {
//   } 
  



// }


