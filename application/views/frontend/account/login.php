<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8"/>
        <title>Resource Efficiency Learning Game - LogIn</title>

        <?= script_tag('assets/js/jquery.js') ?>
        <?= script_tag('assets/js/bootstrap.min.js') ?>
        <?= link_tag('assets/css/bootstrap.min.css') ?>
        <?= link_tag('assets/font-awesome/css/font-awesome.min.css') ?>

        <?= script_tag('assets/js/validation-engine/languages/jquery.validationEngine-en.js') ?>
        <?= script_tag('assets/js/validation-engine/jquery.validationEngine.js') ?>
        <?= link_tag('assets/js/validation-engine/validationEngine.jquery.css') ?>


        <?= script_tag('assets/js/qtip2/jquery.qtip.js') ?>
        <?= script_tag('assets/js/qtip2/imagesloaded.pkg.min.js') ?>
        <?= link_tag('assets/js/qtip2/jquery.qtip.css') ?>

        <?= link_tag('assets/css/page-login.css') ?>
        <?= link_tag('http://codepen.io/assets/libs/fullpage/jquery-ui.css') ?>
        <?= script_tag('assets/js/page-login.js') ?>



    </head>

    <body>
        <div class="login-logo"><?php echo img(array('src' => 'assets/imgs/logo.gif', 'class' => 'logo-image')) ?></div>
        <div class="login-card">
            <h1>LOGIN FORM</h1><br>
            <?php if (strlen($error) > 0) { ?>
                <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i>  <?php echo $error; ?></div>
            <?php } ?>
            <?= form_open('account/login', array('id' => 'login-form')) ?>
            <input type="text" id="login-username" name="username" placeholder="Username" class="validate[required]">
            <input type="password" id="login-pass" name="password" placeholder="Password" class="validate[required]">
            <input type="submit" id="login-username" name="login" class="login login-submit" value="Log in" onclick="validateLogin()">
            </form>

            <div class="login-help">
                <a href="<?= site_url('master/forget') ?>">Forgot Password</a> |
                <i class="fa fa-question-circle" title="Contact for Support<br/>Need help? Save time by starting your support request online and we'll connect you to an expert. "></i>
            </div>
        </div>

    </body>

</html>
