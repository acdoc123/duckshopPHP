<?php include 'includes/session.php'; ?>
<?php
$slug = $_GET['category'];

$conn = $pdo->open();

try {
	$stmt = $conn->prepare("SELECT * FROM category WHERE cat_slug = :slug");
	$stmt->execute(['slug' => $slug]);
	$cat = $stmt->fetch();
	$catid = $cat['id'];
} catch (PDOException $e) {
	echo "There is some problem in connection: " . $e->getMessage();
}

$pdo->close();

?>
<?php $title = strtoupper($_GET['category']);
include 'includes/header.php'; ?>

<body class="hold-transition skin-blue layout-top-nav">
	<div class="wrapper">

		<?php include 'includes/navbar.php'; ?>

		<div class="content-wrapper">
			<div class="container">

				<!-- Main content -->
				<section class="content">
					<div class="row">
						<div class="col-sm-9">
							<h2 class="page-header"><?php echo $cat['name']; ?></h2>
							<?php

							$conn = $pdo->open();

							$stmt = $conn->prepare("SELECT COUNT(*) as numrows FROM products WHERE category_id = :catid");
							$stmt->execute(['catid' => $catid]);
							$kq = $stmt->fetch();

							//Prepare paging
							$current_page = isset($_GET['page']) ? $_GET['page'] : 1;
							$limit = 9;

							$total_page = ceil($kq['numrows'] / $limit);

							if ($current_page > $total_page) {
								$current_page = $total_page;
							} else if ($current_page < 1) {
								$current_page = 1;
							}

							$start = ($current_page - 1) * $limit;

							try {
								$inc = 3;
								$stmt = $conn->prepare("SELECT * FROM products WHERE category_id = :catid LIMIT $start, $limit");
								$stmt->execute(['catid' => $catid]);

								foreach ($stmt as $row) {
									$image = (!empty($row['photo'])) ? 'images/' . $row['photo'] : 'images/noimage.jpg';
									$inc = ($inc == 3) ? 1 : $inc + 1;
									if ($inc == 1) echo "<div class='row'>";
									echo "
	       							<div class='col-sm-4'>
	       								<div class='box box-solid rounded'>
		       								<div class='box-body prod-body'>
		       									<img src='" . $image . "' width='100%' height='230px' class='thumbnail'>
		       									<h5><a href='product.php?product=" . $row['slug'] . "'>" . $row['name'] . "</a></h5>
		       								</div>
		       								<div class='box-footer'>
		       									<b>&#36; " . number_format($row['price'], 2) . "</b>
		       								</div>
	       								</div>
	       							</div>
	       						";
									if ($inc == 3) echo "</div>";
								}
								if ($inc == 1) echo "<div class='col-sm-4'></div><div class='col-sm-4'></div></div>";
								if ($inc == 2) echo "<div class='col-sm-4'></div></div>";

								//paging
								echo '<ul class="pagination">';

								if ($current_page > 1 && $total_page > 1) {
									echo '<li class="page-item"><a class="page-link" href="category.php?page=' . ($current_page - 1) . '&category=' . $_GET['category'] . '">Prev</a></li> ';
								} else {
									echo '<li class="page-item disabled"><a class="page-link" href="#">Prev</a></li> ';
								}
								for ($i = 1; $i <= $total_page; $i++) {

									if (
										$i == $current_page
									) {
										echo '<li class="page-item  active"><span>' . $i . '</span></li>';
									} else {
										echo '<li class="page-item"><a class="page-link" href="category.php?page=' . $i . '&category=' . $_GET['category'] . '">' . $i . '</a></li>';
									}
								}

								if ($current_page < $total_page && $total_page > 1) {
									echo '<li class="page-item"><a class="page-link" href="category.php?page=' . ($current_page + 1) . '&category=' . $_GET['category'] . '">Next</a></li>';
								} else {
									echo '<li class="page-item disabled"><a class="page-link" href="#">Next</a></li>';
								}
								echo '</ul>';
							} catch (PDOException $e) {
								echo "There is some problem in connection: " . $e->getMessage();
							}

							$pdo->close();

							?>
						</div>
						<div class="col-sm-3">
							<?php include 'includes/sidebar.php'; ?>
						</div>
					</div>
				</section>

			</div>
		</div>

		<?php include 'includes/footer.php'; ?>
	</div>

	<?php include 'includes/scripts.php'; ?>
</body>

</html>