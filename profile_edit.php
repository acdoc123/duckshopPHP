<?php
include 'includes/session.php';

$conn = $pdo->open();

if (isset($_POST['edit'])) {
	$curr_password = $_POST['curr_password'];
	$email = $_POST['email'];
	$password = $_POST['password'];
	$firstname = $_POST['firstname'];
	$lastname = $_POST['lastname'];
	$contact = $_POST['contact'];
	$address = $_POST['address'];
	$photo = $_FILES['photo']['name'];
	// Validate password strength
	//$uppercase = preg_match('@[A-Z]@', $password);
	//$lowercase = preg_match('@[a-z]@', $password);
	$number    = preg_match('@[0-9]@', $password);

	if (!$number || strlen($password) < 8) {
		$_SESSION['error'] = 'Password should be at least 8 characters in length and should include at least one number.';
		header('location: signup.php');
	} else {
		if (password_verify($curr_password, $user['password'])) {
			if (!empty($photo)) {
				move_uploaded_file($_FILES['photo']['tmp_name'], 'images/' . $photo);
				$filename = $photo;
			} else {
				$filename = $user['photo'];
			}

			if ($password == $user['password']) {
				$password = $user['password'];
			} else {
				$password = password_hash($password, PASSWORD_DEFAULT);
			}

			try {
				$stmt = $conn->prepare("UPDATE users SET email=:email, password=:password, firstname=:firstname, lastname=:lastname, contact_info=:contact, address=:address, photo=:photo WHERE id=:id");
				$stmt->execute(['email' => $email, 'password' => $password, 'firstname' => $firstname, 'lastname' => $lastname, 'contact' => $contact, 'address' => $address, 'photo' => $filename, 'id' => $user['id']]);

				$_SESSION['success'] = 'Account updated successfully';
			} catch (PDOException $e) {
				$_SESSION['error'] = $e->getMessage();
			}
		} else {
			$_SESSION['error'] = 'Incorrect password';
		}
	}
} else {
	$_SESSION['error'] = 'Fill up edit form first';
}

$pdo->close();

header('location: profile.php');
