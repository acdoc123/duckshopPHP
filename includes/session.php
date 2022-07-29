<?php
include 'includes/conn.php';
session_start();

if (isset($_SESSION['admin'])) {
	header('location: admin/home.php');
}

if (isset($_SESSION['user'])) {
	$conn = $pdo->open();

	try {
		$stmt = $conn->prepare("SELECT * FROM users WHERE id=:id");
		$stmt->execute(['id' => $_SESSION['user']]);
		$user = $stmt->fetch();
	} catch (PDOException $e) {
		echo "There is some problem in connection: " . $e->getMessage();
	}

	$pdo->close();
}
// if (!isset($_SESSION['start'])) {

// 	//Set the session start time

// 	$_SESSION['start'] = time();
// }


// //Check the session is expired or not

// if (isset($_SESSION['start']) && (time() - $_SESSION['start'] > 600)) {

// 	//Unset the session variables

// 	session_unset();

// 	//Destroy the session

// 	session_destroy();

// 	//Notify
// 	session_start();
// 	$_SESSION['error'] = "Session Expired!";
// }
