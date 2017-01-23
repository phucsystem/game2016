<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>Resource Efficiency Learning Game</title>
        <meta name="description" content="">
        <meta name="author" content="">

        <?= script_tag('assets/js/jquery.js') ?>
        <!-- Le styles -->
        <?= link_tag('assets/css/bootstrap.min.css') ?>

        <?= script_tag('assets/js/validation-engine/languages/jquery.validationEngine-en.js') ?>
        <?= script_tag('assets/js/validation-engine/jquery.validationEngine.js') ?>
        <?= link_tag('assets/js/validation-engine/validationEngine.jquery.css') ?>

        <?= script_tag('assets/js/qtip2/jquery.qtip.js') ?>
        <?= script_tag('assets/js/qtip2/imagesloaded.pkg.min.js') ?>
        <?= link_tag('assets/js/qtip2/jquery.qtip.css') ?>

        <?= script_tag('assets/js/page-login.js') ?>
        <style type="text/css">
            .panel-heading {
                padding: 5px 15px;
            }

            .panel-footer {
                padding: 1px 15px;
                color: #A0A0A0;
            }

            .profile-img {
                width: 96px;
                height: 96px;
                margin: 0 auto 10px;
                display: block;
                -moz-border-radius: 50%;
                -webkit-border-radius: 50%;
                border-radius: 50%;
            }

            .logo-image{
                width:360px;
                margin-bottom: 20px;
            }
        </style>

    </head>
    <body>
        <div class="container" style="margin-top:50px">
            <div class="row">
                <div class="col-sm-4"></div>
                <div class="col-sm-4">
                    <div class="login-logo"><?php echo img(array('src' => 'assets/imgs/logo.gif', 'class' => 'logo-image')) ?></div>
                    <div class="panel panel-default">

                        <div class="panel-heading">
                            <strong> Welcome to Game Master page</strong>
                        </div>

                        <div class="panel-body">

                            <fieldset>
                                <div class="row">
                                    <div class="center-block">
                                        <?php echo img(array('src' => 'assets/imgs/admin_ava.png', 'class' => 'profile-img')); ?>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-sm-12 col-md-10  col-md-offset-1 ">
                                        <?php if (strlen($error) > 0) { ?>
                                            <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i>  <?php echo $error; ?></div>
                                        <?php } ?>
                                        <?= form_open('master/login', array('id' => 'login-form')) ?>
                                        <div class="form-group">
                                            <div class="input-group">
                                                <span class="input-group-addon">
                                                    <i class="glyphicon glyphicon-user"></i>
                                                </span> 
                                                <input class="form-control validate[required]" placeholder="Username" name="username" type="text" autofocus >
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="input-group">
                                                <span class="input-group-addon">
                                                    <i class="glyphicon glyphicon-lock"></i>
                                                </span>
                                                <input class="form-control validate[required]" placeholder="Password" name="password" type="password" value="">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <input type="submit" class="btn btn-lg btn-primary btn-block" value="Sign in">
                                        </div>
                                        </form>
                                    </div>
                                </div>
                            </fieldset>
                        </div>
                        <div class="panel-footer ">
                            <a href="<?php echo site_url('master/forget') ?>" onClick=""> Forget password </a>
                        </div>
                    </div>
                </div>
                <div class="col-sm-4"></div>
            </div>
        </div>
    </body>
</html>