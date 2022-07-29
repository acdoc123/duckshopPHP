<?php
include 'includes/session.php';

if (isset($_POST['signup'])) {
	$firstname = $_POST['firstname'];
	$lastname = $_POST['lastname'];
	$email = $_POST['email'];
	$password = $_POST['password'];
	$repassword = $_POST['repassword'];

	$_SESSION['firstname'] = $firstname;
	$_SESSION['lastname'] = $lastname;
	$_SESSION['email'] = $email;

	// Validate password strength
	//$uppercase = preg_match('@[A-Z]@', $password);
	//$lowercase = preg_match('@[a-z]@', $password);
	$number    = preg_match('@[0-9]@', $password);

	if (!$number || strlen($password) < 8) {
		$_SESSION['error'] = 'Password should be at least 8 characters in length and should include at least one number.';
		header('location: signup.php');
	} else {
		if ($password != $repassword) {
			$_SESSION['error'] = 'Passwords did not match';
			header('location: signup.php');
		} else {
			$conn = $pdo->open();

			$stmt = $conn->prepare("SELECT COUNT(*) AS numrows FROM users WHERE email=:email");
			$stmt->execute(['email' => $email]);
			$row = $stmt->fetch();
			if ($row['numrows'] > 0) {
				$_SESSION['error'] = 'Email already taken';
				header('location: signup.php');
			} else {
				$now = date('Y-m-d');
				$password = password_hash($password, PASSWORD_DEFAULT);

				//generate code
				$set = '123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
				$code = substr(str_shuffle($set), 0, 12);

				try {
					$stmt = $conn->prepare("INSERT INTO users (email, password, firstname, lastname, status, activate_code, created_on) VALUES (:email, :password, :firstname, :lastname,:status, :code, :now)");
					$stmt->execute(['email' => $email, 'password' => $password, 'firstname' => $firstname, 'lastname' => $lastname, 'status' => 1, 'code' => $code, 'now' => $now]);
					$userid = $conn->lastInsertId();
				} catch (PDOException $e) {
					$_SESSION['error'] = $e->getMessage();
					header('location: signup.php');
				}
				$pdo->close();
				$_SESSION['success'] = "Create your account successfull! ";
				header('location: signup.php');
			}
		}
	}
}
