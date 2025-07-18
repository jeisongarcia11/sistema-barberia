<?php
session_start();
include('includes/dbconnection.php');
error_reporting(0);

// if (strlen($_SESSION['bpmsaid']==0)) {
//   header('location:logout.php');
//   } else{
// if(isset($_POST['submit']))
// {
// $adminid=$_SESSION['bpmsaid'];
// $cpassword=md5($_POST['currentpassword']);
// $newpassword=md5($_POST['newpassword']);
// $query=mysqli_query($con,"select ID from tbladmin where ID='$adminid' and   Password='$cpassword'");
// $row=mysqli_fetch_array($query);
// if($row>0){
// $ret=mysqli_query($con,"update tbladmin set Password='$newpassword' where ID='$adminid'");
// $msg= "Su contraseña ha cambiado exitosamente"; 
// } else {

// $msg="Tu contraseña actual es incorrecta";
// }
// }

if (strlen($_SESSION['bpmsaid']) == 0) {
    header('location:logout.php');
    exit();
} else {
    if (isset($_POST['submit'])) {
        $adminid = $_SESSION['bpmsaid'];
        $currentPassword = $_POST['currentpassword'];
        $newPassword = $_POST['newpassword'];

        // Obtención de la contraseña actual de la BD
        $query = mysqli_query($con, "SELECT Password FROM tbladmin WHERE ID='$adminid'");
        $row = mysqli_fetch_array($query);

        if ($row) {
            $storedPassword = $row['Password'];
            $isValid = false;

            // Verificación si es md5 o password_hash
            if (strlen($storedPassword) == 32) {
                if (md5($currentPassword) === $storedPassword) {
                    $isValid = true;
                }
            } else {
                if (password_verify($currentPassword, $storedPassword)) {
                    $isValid = true;
                }
            }

            if ($isValid) {
                // Generar hash seguro para nueva contraseña
                $hashedNewPassword = password_hash($newPassword, PASSWORD_DEFAULT);
                $ret = mysqli_query($con, "UPDATE tbladmin SET Password='$hashedNewPassword' WHERE ID='$adminid'");

                if ($ret) {
                    $msg = "Tu contraseña ha sido cambiada exitosamente.";
                } else {
                    $msg = "Error al actualizar la contraseña.";
                }
            } else {
                $msg = "Tu contraseña actual es incorrecta.";
            }
        } else {
            $msg = "Usuario no encontrado.";
        }
    }

  
?>
<!DOCTYPE HTML>
<html>
<head>
<title>Barbería | Cambiar Contraseña</title>

<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
<!-- Custom CSS -->
<link href="css/style.css" rel='stylesheet' type='text/css' />
<!-- font CSS -->
<!-- font-awesome icons -->
<link href="css/font-awesome.css" rel="stylesheet"> 
<!-- //font-awesome icons -->
 <!-- js-->
<script src="js/jquery-1.11.1.min.js"></script>
<script src="js/modernizr.custom.js"></script>
<!--webfonts-->
<link href='//fonts.googleapis.com/css?family=Roboto+Condensed:400,300,300italic,400italic,700,700italic' rel='stylesheet' type='text/css'>
<!--//webfonts--> 
<!--animate-->
<link href="css/animate.css" rel="stylesheet" type="text/css" media="all">
<script src="js/wow.min.js"></script>
	<script>
		 new WOW().init();
	</script>
<!--//end-animate-->
<!-- Metis Menu -->
<script src="js/metisMenu.min.js"></script>
<script src="js/custom.js"></script>
<link href="css/custom.css" rel="stylesheet">
<!--//Metis Menu -->
<script type="text/javascript">
function checkpass()
{
if(document.changepassword.newpassword.value!=document.changepassword.confirmpassword.value)
{
alert('New Password and Confirm Password field does not match');
document.changepassword.confirmpassword.focus();
return false;
}
return true;
} 

</script>
</head> 
<body class="cbp-spmenu-push">
	<div class="main-content">
		<!--left-fixed -navigation-->
		 <?php include_once('includes/sidebar.php');?>
		<!--left-fixed -navigation-->
		<!-- header-starts -->
	 <?php include_once('includes/header.php');?>
		<!-- //header-ends -->
		<!-- main content start-->
		<div id="page-wrapper">
			<div class="main-page">
				<div class="forms">
					<h3 class="title1">Cambiar Contraseña</h3>
					<div class="form-grids row widget-shadow" data-example-id="basic-forms"> 
						<div class="form-title">
							<h4>Cambiar tu Contraseña :</h4>
						</div>
						<div class="form-body">
							<form method="post" name="changepassword" onsubmit="return checkpass();" action="">
								<p style="font-size:16px; color:red" align="center"> <?php if($msg){
    echo $msg;
  }  ?> </p>

  <?php
$adminid=$_SESSION['bpmsaid'];
$ret=mysqli_query($con,"select * from tbladmin where ID='$adminid'");
$cnt=1;
while ($row=mysqli_fetch_array($ret)) {

?>
							 <div class="form-group"> <label for="exampleInputEmail1">Contraseña Actual</label> <input type="password" name="currentpassword" class="form-control" required= "true" value=""> </div> <div class="form-group"> <label for="exampleInputPassword1">Nueva Contraseña</label> <input type="password" name="newpassword" class="form-control" value="" required="true"> </div>
							 <div class="form-group"> <label for="exampleInputPassword1">Confirmar Contraseña</label> <input type="password" name="confirmpassword" class="form-control" value="" required="true"> </div>
							  
							  <button type="submit" name="submit" class="btn btn-default">Cambiar tu Contraseña</button> </form> 
						</div>
						<?php } ?>
					</div>
				
				
			</div>
		</div>
		 <?php include_once('includes/footer.php');?>
	</div>
	<!-- Classie -->
		<script src="js/classie.js"></script>
		<script>
			var menuLeft = document.getElementById( 'cbp-spmenu-s1' ),
				showLeftPush = document.getElementById( 'showLeftPush' ),
				body = document.body;
				
			showLeftPush.onclick = function() {
				classie.toggle( this, 'active' );
				classie.toggle( body, 'cbp-spmenu-push-toright' );
				classie.toggle( menuLeft, 'cbp-spmenu-open' );
				disableOther( 'showLeftPush' );
			};
			
			function disableOther( button ) {
				if( button !== 'showLeftPush' ) {
					classie.toggle( showLeftPush, 'disabled' );
				}
			}
		</script>
	<!--scrolling js-->
	<script src="js/jquery.nicescroll.js"></script>
	<script src="js/scripts.js"></script>
	<!--//scrolling js-->
	<!-- Bootstrap Core JavaScript -->
   <script src="js/bootstrap.js"> </script>
</body>
</html>
<?php } ?>