<?php include 'includes/session.php'; ?>
<?php
$title = "Contact Us";
include 'includes/header.php'; ?>

<body class="hold-transition skin-blue layout-top-nav">
    <div class="wrapper">

        <?php include 'includes/navbar.php'; ?>

        <div class="content-wrapper">
            <div class="container">

                <!-- Main content -->
                <section class="content">
                    <div class="row">
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="box box-solid rounded">
                                    <div class="box-header with-border">
                                        <h3 class="box-title"><b>Become a Subscriber</b></h3>
                                    </div>
                                    <div class="box-body">
                                        <p>Get free updates on the latest products and discounts, straight to your inbox.</p>
                                        <form method="POST" action="">
                                            <div class="input-group">
                                                <input type="text" class="form-control">
                                                <span class="input-group-btn">
                                                    <button type="button" class="btn btn-info btn-flat"><i class="fa fa-envelope"></i> </button>
                                                </span>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class='box box-solid rounded'>
                                    <div class='box-header with-border'>
                                        <h3 class='box-title'><b>Follow us on Social Media</b></h3>
                                    </div>
                                    <div class='box-body'>
                                        <a class="btn btn-social-icon btn-facebook"><i class="fa fa-facebook"></i></a>
                                        <a class="btn btn-social-icon btn-twitter"><i class="fa fa-twitter"></i></a>
                                        <a class="btn btn-social-icon btn-instagram"><i class="fa fa-instagram"></i></a>
                                        <a class="btn btn-social-icon btn-google"><i class="fa fa-google-plus"></i></a>
                                        <a class="btn btn-social-icon btn-linkedin"><i class="fa fa-linkedin"></i></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-1">

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