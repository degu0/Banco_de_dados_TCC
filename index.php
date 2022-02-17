<?php  
include(ConexaoComBancosDeDados/Conexao.php);

$consulta = "SELECT * FROM Professor";
$con = $mysqli ->query($consulta) or die ($mysqli->error);
?>

<!DOCTYPE html>
<html lang="en">
  <head>
      <meta charset="UTF-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>Document</title>
  </head>
  <body>
        <table>
            <tr>
                <td>Nome</td>
                <td>AulasTrablahadas</td>
                <td>AulasNaoTrabalhadas</td>
                <td>NomeDaTurma</td>
                <td>NomeDaDisciplina</td>
            </tr>
            <?php  while($dado = $con->fetch_array()){  ?>
            <tr>
                <td><?php echo $dado ["Pro_Nome"]; ?>/td>
                <td><><?php echo $dado ["Pro_AulasTrabalhadas"]; ?></td>
                <td>><?php echo $dado ["Pro_AulasNaoTrabalhadas"]; ?></td>
                <td>><?php echo $dado ["Pro_NomeDaTurma"]; ?></td>
                <td>><?php echo $dado ["Pro_fNomeDaDisciplina"]; ?></td>
            </tr>
            <?php } ?>
        </table>

  </body>
</html>
