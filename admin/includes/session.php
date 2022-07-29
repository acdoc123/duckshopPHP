<?php
include '../includes/conn.php';
if (session_id() == "") {
	session_start();
}


if (!isset($_SESSION['admin']) || trim($_SESSION['admin']) == '') {
	header('location: ../index.php');
	exit();
}

$conn = $pdo->open();

$stmt = $conn->prepare("SELECT * FROM users WHERE id=:id");
$stmt->execute(['id' => $_SESSION['admin']]);
$admin = $stmt->fetch();

$pdo->close();

if (!isset($_SESSION['start'])) {

	//Set the session start time

	$_SESSION['start'] = time();
}


//Check the session is expired or not

if (isset($_SESSION['start']) && (time() - $_SESSION['start'] > 600)) {

	//Unset the session variables

	session_unset();

	//Destroy the session

	session_destroy();

	//Notify
	session_start();
	$_SESSION['error'] = "Session Expired!";
}
