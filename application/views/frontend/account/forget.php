
<!DOCTYPE html>
<html>

    <head>

        <meta charset="UTF-8">

        <title>Learning Game - Log-in</title>


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

    <body><div class="login-logo">
    RESOURCE EFFICIENCY<br/> LEARNING GAME
</div>
<div class="login-card">
    <h1>FORGET PASSWORD</h1><br>
    <?php if (strlen($error) > 0) { ?>
                <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i>  <?php echo $error; ?></div>
            <?php } ?>
    <?= form_open('account/forget/', array('class' => 'form-validate')) ?>
    <input type="text" id="login-email" name="email" placeholder="Email" class="validate[required]">
        <input type="submit" name="login" class="login login-submit" value="Submit">
    </form>
</div>
</body>

</html>