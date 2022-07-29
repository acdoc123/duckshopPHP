<?php
include 'includes/session.php';

$conn = $pdo->open();

$output = array('error' => false);
$id = $_POST['id'];

if (isset($_SESSION['user'])) {
	try {
		$stmt = $conn->prepare("DELETE FROM cart WHERE id=:id");
		$stmt->execute(['id' => $id]);
		//$output['message'] = 'Deleted';
		$_SESSION['success'] = 'Product deleted from cart';
	} catch (PDOException $e) {
		//$output['message'] = $e->getMessage();
		$_SESSION['error'] = $e->getMessage();
	}
} else {
	foreach ($_SESSION['cart'] as $key => $row) {
		if ($row['productid'] == $id) {
			unset($_SESSION['cart'][$key]);
			$_SESSION['success'] = 'Product deleted from cart';
			//$output['message'] = 'Deleted';
		}
	}
}

$pdo->close();
header('location: cart_view.php');
