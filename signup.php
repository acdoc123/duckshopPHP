<?php include 'includes/session.php'; ?>
<?php
if (isset($_SESSION['user'])) {
  header('location: cart_view.php');
}

if (isset($_SESSION['captcha'])) {
  $now = time();
  if ($now >= $_SESSION['captcha']) {
    unset($_SESSION['captcha']);
  }
}

?>
<?php
$title = "Register";
include 'includes/header.php'; ?>

<body class="hold-transition register-page">
  <div class="register-box">
    <?php
    if (isset($_SESSION['error'])) {
      echo "
          <div class='callout callout-danger text-center'>
            <p>" . $_SESSION['error'] . "</p> 
          </div>
        ";
      unset($_SESSION['error']);
    }

    if (isset($_SESSION['success'])) {
      echo "
          <div class='callout callout-success text-center'>
            <p>" . $_SESSION['success'] . "</p><a href='login.php'>Login</a> 
          </div>
        ";
      unset($_SESSION['success']);
    }
    ?>
    <div class="register-box-body rounded">
      <H2 class="login-box-msg">Register</H2>

      <form action="register.php" method="POST">
        <div class="form-group has-feedback">
          <input type="text" class="form-control rounded" name="firstname" placeholder="Firstname" value="<?php echo (isset($_SESSION['firstname'])) ? $_SESSION['firstname'] : '' ?>" required>
          <span class="glyphicon glyphicon-user form-control-feedback"></span>
        </div>
        <div class="form-group has-feedback">
          <input type="text" class="form-control rounded" name="lastname" placeholder="Lastname" value="<?php echo (isset($_SESSION['lastname'])) ? $_SESSION['lastname'] : '' ?>" required>
          <span class="glyphicon glyphicon-user form-control-feedback"></span>
        </div>
        <div class="form-group has-feedback">
          <input type="email" class="form-control rounded" name="email" placeholder="Email" value="<?php echo (isset($_SESSION['email'])) ? $_SESSION['email'] : '' ?>" required>
          <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
        </div>
        <div class="form-group has-feedback">
          <input type="password" class="form-control rounded" name="password" placeholder="Password" required>
          <span class="glyphicon glyphicon-lock form-control-feedback"></span>
        </div>
        <div class="form-group has-feedback">
          <input type="password" class="form-control rounded" name="repassword" placeholder="Retype password" required>
          <span class="glyphicon glyphicon-log-in form-control-feedback"></span>
        </div>
        <?php
        // if (!isset($_SESSION['captcha'])) {
        //   echo '
        //         <di class="form-group" style="width:100%;">
        //           <div class="g-recaptcha" data-sitekey="6LevO1IUAAAAAFX5PpmtEoCxwae-I8cCQrbhTfM6"></div>
        //         </di>
        //       ';
        // }
        ?>
        <hr>
        <div class="row">
          <div class="col-xs-4">
            <button type="submit" class="btn btn-1 btn-block btn-flat rounded" name="signup"><i class="fa fa-pencil"></i> Sign Up</button>
          </div>
        </div>
      </form>
      <br>
      <a href="login.php">I already have a membership</a><br>
      <a href="index.php"><i class="fa fa-home"></i> Home</a>
    </div>
  </div>

  <?php include 'includes/scripts.php' ?>
</body>

</html>