<?php include 'includes/session.php'; ?>
<?php
$title = 'Search for "' . $_GET['keyword'] . '"';
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
							<?php

							$conn = $pdo->open();

							$stmt = $conn->prepare("SELECT COUNT(*) AS numrows FROM products WHERE name LIKE :keyword");
							$stmt->execute(['keyword' => '%' . $_GET['keyword'] . '%']);
							$row = $stmt->fetch();
							if ($row['numrows'] < 1) {
								echo '<h1 class="page-header">No results found for: " <i>' . $_GET['keyword'] . '</i>"</h1>';
							} else {
								echo '<h1 class="page-header">Search results for: " <i>' . $_GET['keyword'] . '</i>"</h1>
									<h4>Found ' . $row['numrows'] . ' results:</h4>	
								';

								//Prepare pageing
								$current_page = isset($_GET['page']) ? $_GET['page'] : 1;
								$limit = 2;

								$total_page = ceil($row['numrows'] / $limit);

								if ($current_page > $total_page) {
									$current_page = $total_page;
								} else if ($current_page < 1) {
									$current_page = 1;
								}

								$start = ($current_page - 1) * $limit;

								try {
									$inc = 3;
									$stmt = $conn->prepare("SELECT * FROM products WHERE name LIKE :keyword LIMIT $start, $limit");
									$stmt->execute(['keyword' => '%' . $_GET['keyword'] . '%']);

									foreach ($stmt as $row) {
										$highlighted = preg_filter('/' . preg_quote($_GET['keyword'], '/') . '/i', '<b>$0</b>', $row['name']);
										$image = (!empty($row['photo'])) ? 'images/' . $row['photo'] : 'images/noimage.jpg';
										$inc = ($inc == 3) ? 1 : $inc + 1;
										if ($inc == 1) echo "<div class='row'>";
										echo "
	       							<div class='col-sm-4'>
	       								<div class='box box-solid rounded'>
		       								<div class='box-body prod-body'>
		       									<img src='" . $image . "' width='100%' height='230px' class='thumbnail'>
		       									<h5><a href='product.php?product=" . $row['slug'] . "'>" . $highlighted . "</a></h5>
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
										echo '<li class="page-item"><a class="page-link" href="search.php?page=' . ($current_page - 1) . '&keyword=' . $_GET['keyword'] . '">Prev</a></li> ';
									} else {
										echo '<li class="page-item disabled"><a class="page-link" href="#">Prev</a></li> ';
									}
									for ($i = 1; $i <= $total_page; $i++) {

										if (
											$i == $current_page
										) {
											echo '<li class="page-item  active"><span>' . $i . '</span></li>';
										} else {
											echo '<li class="page-item"><a class="page-link" href="search.php?page=' . $i . '&keyword=' . $_GET['keyword'] . '">' . $i . '</a></li>';
										}
									}

									if ($current_page < $total_page && $total_page > 1) {
										echo '<li class="page-item"><a class="page-link" href="search.php?page=' . ($current_page + 1) . '&keyword=' . $_GET['keyword'] . '">Next</a></li>';
									} else {
										echo '<li class="page-item disabled"><a class="page-link" href="#">Next</a></li>';
									}
									echo '</ul>';
								} catch (PDOException $e) {
									echo "There is some problem in connection: " . $e->getMessage();
								}
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