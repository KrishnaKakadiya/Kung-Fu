<?php require('includes/config.php');

//if logged in redirect to members page
if( $user->is_logged_in() ){ header('Location: memberpage.php'); }

//if form has been submitted process it
if(isset($_POST['submit'])){

	//very basic validation
	if(strlen($_POST['username']) < 3){
		$error[] = 'Username is too short.';
	} else {
		$stmt = $db->prepare('SELECT username FROM members WHERE username = :username');
		$stmt->execute(array(':username' => $_POST['username']));
		$row = $stmt->fetch(PDO::FETCH_ASSOC);

		if(!empty($row['username'])){
			$error[] = 'Username provided is already in use.';
		}

	}

	if(strlen($_POST['password']) < 3){
		$error[] = 'Password is too short.';
	}

	if(strlen($_POST['passwordConfirm']) < 3){
		$error[] = 'Confirm password is too short.';
	}

	if($_POST['password'] != $_POST['passwordConfirm']){
		$error[] = 'Passwords do not match.';
	}

	//email validation
	if(!filter_var($_POST['email'], FILTER_VALIDATE_EMAIL)){
	    $error[] = 'Please enter a valid email address';
	} else {
		$stmt = $db->prepare('SELECT email FROM members WHERE email = :email');
		$stmt->execute(array(':email' => $_POST['email']));
		$row = $stmt->fetch(PDO::FETCH_ASSOC);

		if(!empty($row['email'])){
			$error[] = 'Email provided is already in use.';
		}

	}


	//if no errors have been created carry on
	if(!isset($error)){

		//hash the password
		$hashedpassword = $user->password_hash($_POST['password'], PASSWORD_BCRYPT);

		//create the activasion code
		$activasion = md5(uniqid(rand(),true));

		try {

			//insert into database with a prepared statement
			$stmt = $db->prepare('INSERT INTO members (username,fullname,password,email,dateofbirth,phonenumber,address1,address2,active) VALUES (:username, :fullname, :password, :email, :dateofbirth, :phonenumber, :address1, :address2, :active)');
			$stmt->execute(array(
				':username' => $_POST['username'],
				':fullname' => $_POST['fullname'],
				':password' => $hashedpassword,
				':email' => $_POST['email'],
				':dateofbirth' => $_POST['dateofbirth'],
				':phonenumber' => $_POST['phonenumber'],
				':address1' => $_POST['address1'],
				':address2' => $_POST['address2'],
				':active' => $activasion
			));
			$id = $db->lastInsertId('memberID');

			//send email
			$to = $_POST['email'];
			$subject = "Registration Confirmation";
			$body = "<p>Thank you for registering at demo site.</p>
			<p>To activate your account, please click on this link: <a href='".DIR."activate.php?x=$id&y=$activasion'>".DIR."activate.php?x=$id&y=$activasion</a></p>
			<p>Regards Site Admin</p>";

			$mail = new Mail();
			$mail->setFrom(SITEEMAIL);
			$mail->addAddress($to);
			$mail->subject($subject);
			$mail->body($body);
			$mail->send();

			//redirect to index page
			header('Location: index.php?action=joined');
			exit;

		//else catch the exception and show the error.
		} catch(PDOException $e) {
		    $error[] = $e->getMessage();
		}

	}

}

//define page title
$title = 'The Kung Fu Club';

//include header template
require('layout/header.php');
?>


<div class="container">

	<div class="row">

	    <div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
			<form role="form" method="post" action="" autocomplete="off">
				<h2>Sign Up for Stephanos Kung Fu Club</h2>
				<center><p>Already a member? <a href='login.php'>Login</a></p></center>
				<hr>

				<?php
				//check for any errors
				if(isset($error)){
					foreach($error as $error){
						echo '<p class="bg-danger">'.$error.'</p>';
					}
				}

				//if action is joined show sucess
				if(isset($_GET['action']) && $_GET['action'] == 'joined'){
					echo "<h2 class='bg-success'>Registration successful, please check your email to activate your account.</h2>";
				}
				?>

				<div class="form-group">
					<label>Username:</label>
					<input type="text" name="username" id="username" class="form-control input-lg" placeholder="" value="<?php if(isset($error)){ echo $_POST['username']; } ?>" tabindex="1">
				</div>
				<div class="form-group">
					<label>Full Name:</label>
					<input type="text" name="fullname" id="fullname" class="form-control input-lg" placeholder="" value="<?php if(isset($error)){ echo $_POST['fullname']; } ?>" tabindex="2">
				</div>
				<div class="form-group">
					<label>Email:</label>
					<input type="email" name="email" id="email" class="form-control input-lg" placeholder="" value="<?php if(isset($error)){ echo $_POST['email']; } ?>" tabindex="3">
				</div>
				<div class="row">
					<div class="col-xs-6 col-sm-6 col-md-6">
						<div class="form-group">
							<label>Password:</label>
							<input type="password" name="password" id="password" class="form-control input-lg" placeholder="" tabindex="4">
						</div>
					</div>
					<div class="col-xs-6 col-sm-6 col-md-6">
						<div class="form-group">
							<label>Confirm Password:</label>
							<input type="password" name="passwordConfirm" id="passwordConfirm" class="form-control input-lg" placeholder="" tabindex="5">
						</div>
					</div>

				</div>

				<div class="form-group">
					<label>Date of Birth:</label>
					<input type="date" name="dateofbirth" id="dateofbirth" class="form-control input-lg" placeholder="" value="<?php if(isset($error)){ echo $_POST['birthdate']; } ?>" tabindex="6">
				</div>

				<div class="form-group">
					<label>Phone Number:</label>
					<input type="text" name="phonenumber" id="phonenumber" class="form-control input-lg" placeholder="" value="<?php if(isset($error)){ echo $_POST['phonenumber']; } ?>" tabindex="7">
				</div>

				<div class="form-group">
					<label>Address Line 1:</label>
					<input type="text" name="address1" id="address1" class="form-control input-lg" placeholder="" value="<?php if(isset($error)){ echo $_POST['address1']; } ?>" tabindex="8">
				</div>

				<div class="form-group">
					<label>Address Line 2:</label>
					<input type="text" name="address2" id="address2" class="form-control input-lg" placeholder="" value="<?php if(isset($error)){ echo $_POST['address2']; } ?>" tabindex="9">
				</div>


				<div class="row">
					<div class="col-md-12"><input type="submit" name="submit" value="Register" class="btn btn-primary btn-block btn-lg" tabindex="10"></div>
				</div>
				<br><br><br>
			</form>
		</div>
	</div>

</div>

<?php
//include header template
require('layout/footer.php');
?>
