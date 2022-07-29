<?php
include 'includes/session.php';

if (isset($_POST['disable'])) {
	$id = $_POST['id'];

	$conn = $pdo->open();

	try {
		$stmt = $conn->prepare("UPDATE users SET status=:status WHERE id=:id");
		$stmt->execute(['status' => 0, 'id' => $id]);
		$_SESSION['success'] = 'User disable successfully';
	} catch (PDOException $e) {
		$_SESSION['error'] = $e->getMessage();
	}

	$pdo->close();
} else {
	$_SESSION['error'] = 'Select user to disable first';
}

header('location: users.php');
