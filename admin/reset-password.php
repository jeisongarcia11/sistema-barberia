<?php
session_start();
error_reporting(0);
include('includes/dbconnection.php');

// if(isset($_POST['submit']))
//   {
//     $contactno=$_SESSION['contactno'];
//     $email=$_SESSION['email'];
//     $password=md5($_POST['newpassword']);

//         $query=mysqli_query($con,"update tbladmin set Password='$password'  where  Email='$email' && MobileNumber='$contactno' ");
//    if($query)
//    {
// echo "<script>alert('Password successfully changed');</script>";
// session_destroy();
//    }
  
//   }
if (isset($_POST['submit'])) {
    $adminId = $_SESSION['bpmsaid'];
    $currentPasswordInput = $_POST['currentpassword'];
    $newPassword = $_POST['newpassword'];

    if (!$adminId) {
        echo "<script>alert('No has iniciado sesión.'); window.location.href='logout.php';</script>";
        exit();
    }

    // Obtener la contraseña actual desde la base de datos
    $query = mysqli_query($con, "SELECT Password FROM tbladmin WHERE ID = '$adminId'");
    $row = mysqli_fetch_array($query);

    if ($row) {
        $storedPassword = $row['Password'];
        $isVerified = false;

        // Detectar tipo de hash (md5 o password_hash)
        if (strlen($storedPassword) == 32) {
            // Se asume que es un md5 hash
            if (md5($currentPasswordInput) === $storedPassword) {
                $isVerified = true;
            }
        } else {
            // Se asume que es password_hash
            if (password_verify($currentPasswordInput, $storedPassword)) {
                $isVerified = true;
            }
        }

        if ($isVerified) {
            // Migrar a password_hash() y actualizar con la nueva contraseña
            $hashedNewPassword = password_hash($newPassword, PASSWORD_DEFAULT);
            $update = mysqli_query($con, "UPDATE tbladmin SET Password = '$hashedNewPassword' WHERE ID = '$adminId'");

            if ($update) {
                echo "<script>alert('Contraseña actualizada correctamente'); window.location.href='dashboard.php';</script>";
                exit();
            } else {
                echo "<script>alert('Error al actualizar la contraseña.');</script>";
            }
        } else {
            echo "<script>alert('La contraseña actual es incorrecta.');</script>";
        }
    } else {
        echo "<script>alert('Usuario no encontrado.');</script>";
    }
}
  ?>
<!DOCTYPE HTML>
<html>
<head>
<title>BPMS | Reset Page </title>

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
		
		<!-- main content start-->
		<div id="page-wrapper">
			<div class="main-page login-page ">
				<h3 class="title1">Reset Page</h3>
				<div class="widget-shadow">
					<div class="login-top">
						<h4>Welcome back to BPMS AdminPanel ! </h4>
					</div>
					<div class="login-body">
						<form role="form" method="post" action="" name="changepassword" onsubmit="return checkpass();">
							<p style="font-size:16px; color:red" align="center"> <?php if($msg){
    echo $msg;
  }  ?> </p>
							<input type="password" name="newpassword" class="lock" placeholder="New Password" required="true">
							
							<input type="password" name="confirmpassword" class="lock" placeholder="Confirm Password" required="true">
							
							<input type="submit" name="submit" value="Reset">
							<div class="forgot-grid">
								
								<div class="forgot">
									<a href="index.php">Already have an account</a>
								</div>
								<div class="clearfix"> </div>
							</div>
						</form>
					</div>
				</div>
				
				
			</div>
		</div>
		
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