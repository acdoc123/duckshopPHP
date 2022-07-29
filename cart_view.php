<?php include 'includes/session.php'; ?>
<?php
$title = "Your Cart";
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
							if (isset($_SESSION['success'])) {
								echo "
	        					<div class='alert alert-success'>
	        						" . $_SESSION['success'] . "
	        					</div>
	        				";
								unset($_SESSION['success']);
							}
							if (isset($_SESSION['error'])) {
								echo "
	        					<div class='alert alert-danger'>
	        						" . $_SESSION['error'] . "
	        					</div>
	        				";
								unset($_SESSION['error']);
							}
							?>
							<h2 class="page-header">YOUR CART</h2>
							<div class="box box-solid">
								<div class="box-body">
									<table class="table table-bordered">
										<thead>
											<th>Photo</th>
											<th>Name</th>
											<th>Price</th>
											<th width="20%">Quantity
											</th>
											<th>
												<h5 id='demo' class='alert-danger'></h5>
											</th>
											<th>Subtotal</th>
										</thead>
										<tbody id="tbody">
										</tbody>
									</table>
								</div>

							</div>

							<?php
							if (isset($_SESSION['user'])) {
								echo "
								<h4 class='page-title'><b>SHIPPING TO:</b></h4>
							<div class='box box-solid'>
								<div class='box-body'>
									<div class='col-sm'>
										<div class='row'>
											<div class='col-sm-3'>
												<h5><b>Name:</b></h5>
												<h5><b>Address:</b></h5>
												<h5><b>Phone Number:</b></h5>
											</div>
											<div class='col-sm-9'>
												<h4>" . $user['firstname'] . " " . $user['lastname'] . "
													<span class='pull-right'>
														<a href='#edit' class='btn btn-warning btn-flat btn-sm rounded' data-toggle='modal'><i class='fa fa-edit'></i> Edit</a>
													</span>
												</h4>
												<h4>" . (!empty($user['address']) ? $user['address'] : 'N/a') . "</h4>
												<h4>" . (!empty($user['contact_info']) ? $user['contact_info'] : 'N/a') . " </h4>
											</div>
										</div>
									</div>
								</div>
							</div>
	        				";
								if (!empty($user['address']) || !empty($user['contact_info'])) {
									echo "<div id='paypal-button'></div>";
								} else {
									echo "
									<div class='col-sm-6 alert alert-danger'>
	        						<h5>You need to fill Address and Phone number to checkout!</h5>
	        						</div>
	        					";
								}
							} else {
								echo "
	        					<h4>You need to <a href='login.php'>Login</a> to checkout.</h4>
	        				";
							}
							?>
						</div>
						<div class="col-sm-3">
							<?php include 'includes/sidebar.php'; ?>
						</div>
					</div>
				</section>

			</div>
		</div>
		<?php $pdo->close(); ?>
		<?php include 'includes/footer.php'; ?>
		<?php include 'includes/cart_modal.php';
		?>
		<?php include 'includes/profile_modal.php'; ?>

	</div>

	<?php include 'includes/scripts.php'; ?>
	<script>
		var total = 0;
		$(function() {
			// $(document).on('click', '.delete', function(e) {
			// 	e.preventDefault();
			// 	var id = $(this).data('id');
			// 	$.ajax({
			// 		type: 'POST',
			// 		url: 'cart_delete.php',
			// 		data: {
			// 			id: id
			// 		},
			// 		dataType: 'json',
			// 		success: function(response) {
			// 			if (!response.error) {
			// 				getDetails();
			// 				getCart();
			// 				getTotal();
			// 			}
			// 		}
			// 	});
			// });

			$(document).on('click', '.cart_delete', function(e) {
				e.preventDefault();
				$('#delete').modal('show');
				var id = $(this).data('id');
				getRow(id);
			});

			function getRow(id) {
				$.ajax({
					type: 'POST',
					url: 'cart_row.php',
					data: {
						id: id
					},
					dataType: 'json',
					success: function(response) {
						$('.cartid').val(response.cartid);
						//$('.userid').val(response.user_id);
						$('.productname').html(response.name);
						//$('#edit_quantity').val(response.quantity);
					}
				});
			}
			$(document).on('click', '.minus', function(e) {
				e.preventDefault();
				var id = $(this).data('id');
				var qty = $('#qty_' + id).val();
				if (qty > 1) {
					qty--;
				}
				$('#qty_' + id).val(qty);
				$.ajax({
					type: 'POST',
					url: 'cart_update.php',
					data: {
						id: id,
						qty: qty,
					},
					dataType: 'json',
					success: function(response) {
						if (!response.error) {
							getDetails();
							getCart();
							getTotal();
						}
					}
				});
			});

			$(document).on('click', '.add', function(e) {
				e.preventDefault();
				var id = $(this).data('id');
				var stock = $(this).data('stock');
				var qty = $('#qty_' + id).val();
				if (qty < stock) {
					qty++;
					document.getElementById('demo').innerHTML = "";
				} else {
					document.getElementById('demo').innerHTML = "Max Quantity";
				}
				$('#qty_' + id).val(qty);
				$.ajax({
					type: 'POST',
					url: 'cart_update.php',
					data: {
						id: id,
						qty: qty,
					},
					dataType: 'json',
					success: function(response) {
						if (!response.error) {
							getDetails();
							getCart();
							getTotal();
						}
					}
				});
			});

			getDetails();
			getTotal();

		});


		function getDetails() {
			$.ajax({
				type: 'POST',
				url: 'cart_details.php',
				dataType: 'json',
				success: function(response) {
					$('#tbody').html(response);
					getCart();
				}
			});
		}


		function getTotal() {
			$.ajax({
				type: 'POST',
				url: 'cart_total.php',
				dataType: 'json',
				success: function(response) {
					total = response;
				}
			});
		}
	</script>
	<!-- Paypal Express -->
	<script>
		paypal.Button.render({
			env: 'sandbox', // change for production if app is live,

			client: {
				sandbox: 'ASlTfh8j_Qegd50goBkyOs8jonX0p2PGRgxvVTmMjzsTwBPbWWPfjhe_zFAT5xfa-IsnJb-mdbB5o5fR',
				//production: 'AdP2Ed7Y3WsKgiCrNfhrO3MOvZgxPP1Rs7fcLD86CAgY0VShgwTEpyTIiweFNGVZ4Du1l3FUHbY2S03Z'
			},

			commit: true, // Show a 'Pay Now' button

			style: {
				color: 'gold',
				size: 'medium'
			},

			payment: function(data, actions) {
				return actions.payment.create({
					payment: {
						transactions: [{
							//total purchase
							amount: {
								total: total,
								currency: 'USD'
							}
						}]
					}
				});
			},

			onAuthorize: function(data, actions) {
				return actions.payment.execute().then(function(payment) {
					window.location = 'sales.php?pay=' + payment.id;
				});
			},

		}, '#paypal-button');
	</script>
</body>

</html>