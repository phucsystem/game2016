<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Resource Efficiency Learning Game</title>

         <!-- Bootstrap Core CSS -->
        <?= link_tag('assets/css/bootstrap.min.css') ?>
        <!-- Custom CSS -->
        <?= link_tag('assets/css/sb-admin.css') ?>
        <?= link_tag('assets/css/sb-admin-2.css') ?>
        <?= link_tag('assets/js/plugins/nprogress/nprogress.css') ?>


        <!-- Morris Charts CSS -->
        <?= link_tag('assets/css/plugins/morris.css') ?>
        <!-- Jquery Plugins CSS-->
        <?= link_tag('assets/js/validation-engine/validationEngine.jquery.css') ?>
        <?= link_tag('assets/js/qtip2/jquery.qtip.css') ?>
        <?= link_tag('assets/js/bootstrap-notify/Animate.css') ?>
        <?= link_tag('assets/js/plugins/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.css')?>
        <?= link_tag('assets/js/plugins/datatables-responsive/css/dataTables.responsive.css')?>
         <?= link_tag('assets/js/plugins/tagsinput/bootstrap-tagsinput.css') ?>
         <?= link_tag('assets/js/plugins/select2/css/select2.min.css') ?>
        <?= link_tag('assets/js/plugins/select2/css/select2-bootstrap.css') ?>


        <!-- Custom Fonts -->
        <?= link_tag('assets/font-awesome/css/font-awesome.min.css') ?>
        <?= link_tag('assets/css/styles.css') ?>
     
        
        
        <!-- jQuery -->
        <?= script_tag('assets/js/jquery.js') ?>
        <!-- Bootstrap Core JavaScript -->
        <?= script_tag('assets/js/bootstrap.js') ?>
          <?= script_tag('assets/js/plugins/nprogress/nprogress.js') ?>
        <!-- Morris Charts JavaScript -->
        <?= script_tag('assets/js/plugins/morris/raphael.min.js') ?>
        <?= script_tag('assets/js/plugins/morris/morris.js') ?>
        <?= script_tag('assets/js/plugins/morris/morris-data.js') ?>
        
        <?= script_tag('assets/js/validation-engine/languages/jquery.validationEngine-en.js') ?>
        <?= script_tag('assets/js/validation-engine/jquery.validationEngine.js') ?>
        
        <?= script_tag('assets/js/qtip2/jquery.qtip.js') ?>
        <?= script_tag('assets/js/qtip2/imagesloaded.pkg.min.js') ?>
         <?= script_tag('assets/js/bootstrap-notify/bootstrap-notify.min.js') ?>
         <?= script_tag('assets/js/bootbox.min.js') ?>
        
         <?= script_tag('assets/js/plugins/datatables/media/js/jquery.dataTables.min.js') ?>
         <?= script_tag('assets/js/plugins/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.min.js') ?>
        
        <?= script_tag('assets/js/plugins/jscolor/jscolor.js') ?>
         <?= script_tag('assets/js/plugins/tagsinput/bootstrap-tagsinput.js') ?>
         <?= script_tag('assets/js/plugins/select2/js/select2.full.min.js') ?>
        <?= script_tag('assets/js/jquery.wait.js') ?>
          <?= script_tag('assets/js/plugins/jquery.slimscroll.min.js');?>

        <!-- Ck Editor -->
         <?= script_tag('assets/js/plugins/ckeditor/ckeditor.js') ?>

       
        
        <?= script_tag('assets/js/sb-admin-2.js') ?>
        <?= script_tag('assets/js/common.js') ?>
        <?= script_tag('assets/js/admin_common.js') ?>
        
        <link rel="icon" type="image/ico" href="<?= site_url('assets/imgs/favicon.ico') ?>">
        


    </head>

    <body>

        <div id="wrapper">

            <!-- Navigation -->
            <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="" href="<?= site_url('master'); ?>"><?php echo img(array('src' => 'assets/imgs/logo.gif', 'class' => 'logo-image')) ?></a>
                </div>
                <!-- Top Menu Items -->
                 <ul class="nav navbar-right top-nav">
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> <?php echo $userData['userName']?><b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li>
                                <a href="<?= site_url('master/account/profile') ?>"><i class="fa fa-fw fa-user"></i> Profile</a>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <a href="<?php echo site_url('master/logout') ?>"><i class="fa fa-fw fa-power-off"></i> Log Out</a>
                            </li>
                        </ul>
                    </li>
                </ul>
                <!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
                <div class="collapse navbar-collapse navbar-ex1-collapse">
                   
                    <ul class="nav navbar-nav side-nav">
<!--                        <li class=" <?php if($curr_step == STEP_MASTER_DASHBOARD ) { echo "active";} ?> ">
                            <a href="<?php echo site_url('master/dashboard'); ?>" class="nav-anchor"><i class="fa fa-fw fa-dashboard nav-icon"></i> <br/>Dashboard</a>
                        </li>-->
                        <li class=" <?php if($curr_step == STEP_MASTER_GAME ) { echo "active";} ?>">
                            <a href="<?php echo site_url('master/game'); ?>" class="nav-anchor"><i class="fa fa-fw fa-trophy nav-icon"></i> <br/>Game Management</a>
                        </li >
                        <li class=" <?php if($curr_step == STEP_MASTER_TEAM) { echo "active";} ?>">
                            <a href="<?php echo site_url('master/team'); ?>" class="nav-anchor"><i class="fa fa-fw fa-users nav-icon"></i> <br/>Team Management</a>
                        </li>
                        <li class=" <?php if($curr_step == STEP_MASTER_PLAYER) { echo "active";} ?>">
                            <a href="<?php echo site_url('master/player'); ?>" class="nav-anchor"><i class="fa fa-fw fa-user nav-icon"></i> <br/>Players Management</a>
                        </li>
                    </ul>
                </div>
                <!-- /.navbar-collapse -->
            </nav>
