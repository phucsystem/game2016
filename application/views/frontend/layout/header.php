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
        <!-- Morris Charts CSS -->
        <?= link_tag('assets/css/plugins/morris.css') ?>
        <!-- Jquery Plugins CSS-->
        <?= link_tag('assets/js/validation-engine/validationEngine.jquery.css') ?>
        <?= link_tag('assets/js/qtip2/jquery.qtip.css') ?>
        <?= link_tag('assets/js/bootstrap-notify/Animate.css') ?>
        <?= link_tag('assets/js/plugins/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.css') ?>

        <?= link_tag('assets/js/select2-4.0.0/dist/css/select2.min.css') ?>
        <!-- Custom Fonts -->
        <?= link_tag('assets/font-awesome/css/font-awesome.min.css') ?>
        <?= link_tag('assets/css/styles.css') ?>


        <!-- jQuery -->
        <?= script_tag('assets/js/jquery.js') ?>
        <!-- Bootstrap Core JavaScript -->
        <?= script_tag('assets/js/bootstrap.min.js') ?>
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
        <?= script_tag('assets/js/plugins/jquery.slimscroll.min.js'); ?>

        <?= script_tag('assets/js/select2-4.0.0/dist/js/select2.full.min.js') ?>

        <?= script_tag('assets/js/sb-admin-2.js') ?>
        <?= script_tag('assets/js/common.js') ?>
        <?= script_tag('assets/js/frontend_common.js') ?>

        <link rel="icon" type="image/ico" href="<?= site_url('assets/imgs/favicon.ico') ?>">

        <script>
            var moveToNextStep = function (id) {
                common.confirmDialog('Do you want to move to the next step?', function () {
                    common.showLoadingModal();
                    $.ajax({
                        url: "<?= site_url('game/nextstep') ?>/" + id,
                        dataType: 'json'
                    }).success(function (data) {
                        if (data['result'] == true) {
                            window.location = data['url']
                        }
                        common.closeLoadingModal();
                    });
                });
            };

            var enableInput = '<?= $enableInput ?>';
            $(function () {
                if (enableInput != 1) {
                    $('body').find('input, textarea, button, select').attr('disabled','disabled');
                }
            });

        </script>


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
                    <a class="" href="<?php echo site_url('game') ?>"><?php echo img(array('src' => 'assets/imgs/logo.gif', 'class' => 'logo-image')) ?></a>
                </div>
                <!-- Top Menu Items -->
                <ul class="nav navbar-right top-nav">
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> <?php echo $userData['userName'] ?><b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li>
                                <a href="<?= site_url('account/profile') ?>"><i class="fa fa-fw fa-user"></i> Profile</a>
                            </li>
                            <!--                            <li>
                                                            <a href="#"><i class="fa fa-fw fa-gear"></i> Settings</a>
                                                        </li>-->
                            <li class="divider"></li>
                            <li>
                                <a href="<?php echo site_url('account/logout') ?>"><i class="fa fa-fw fa-power-off"></i> Log Out</a>
                            </li>
                        </ul>
                    </li>
                </ul>
                <!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
                <div class="collapse navbar-collapse navbar-ex1-collapse ">

                    <ul class="nav navbar-nav side-nav ">
                        <li class=" <?php
                        if ($curr_step == STEP_DASHBOARD) {
                            echo "active";
                        }
                        ?> ">
                            <a href="<?php echo site_url('game/dashboard'); ?>" class="nav-anchor"><i class="fa fa-fw fa-dashboard nav-icon"></i> <br/>Dashboard</a>
                        </li>
                        <li class=" <?php
                        if ($curr_step == STEP_DEVELOPMENT) {
                            echo "active";
                        }
                        ?>">
                            <a href="<?php echo site_url('game/products'); ?>" class="nav-anchor"><i class="fa fa-fw fa-bicycle nav-icon"></i> <br/>Product Development</a>
                        </li >
                        <li class=" <?php
                            if ($curr_step == STEP_COMPONENTS) {
                                echo "active";
                            }
                            ?>">
                            <a href="<?php echo site_url('game/components'); ?>" class="nav-anchor"><i class="fa fa-fw fa-shopping-cart nav-icon"></i> <br/>Components</a>
                        </li>
                        <?php if ($showRecycle) {
                            ?>
                            <li class=" <?php
                        if ($curr_step == STEP_RECYCLING) {
                            echo "active";
                        }
                            ?>">
                                <a href="<?php echo site_url('game/recycling'); ?>" class="nav-anchor"><i class="fa fa-fw fa-recycle nav-icon"></i> <br/>Recycling</a>
                            </li>
                            <?php } ?>
                        <li class=" <?php
                            if ($curr_step == STEP_PRODUCTION) {
                                echo "active";
                            }
                            ?>">
                            <a href="<?php echo site_url('game/production'); ?>" class="nav-anchor"><i class="fa fa-fw fa-wrench nav-icon"></i> <br/>Production</a>
                        </li>
                        <li class=" <?php
                            if ($curr_step == STEP_TRANSPORT) {
                                echo "active";
                            }
                            ?>">
                            <a href="<?php echo site_url('game/transport'); ?>" class="nav-anchor"><i class="fa fa-fw fa-truck nav-icon"></i> <br/>Transport</a>
                        </li>
                        <li class=" <?php
                        if ($curr_step == STEP_SALE) {
                            echo "active";
                        }
                        ?>">
                            <a href="<?php echo site_url('game/sales'); ?>" class="nav-anchor"><i class="fa fa-fw fa-user nav-icon"></i> <br/>Sales</a>
                        </li>
                        <li class=" <?php
                                if ($curr_step == STEP_INFORMATION) {
                                    echo "active";
                                }
                                ?>">
                            <a class="nav-anchor" href="javascript:;" data-toggle="collapse" data-target="#demo"><i class="fa fa-fw fa-info nav-icon"></i> <br/>Information <i class="fa fa-fw fa-caret-down"></i></a>
                            <ul id="demo" class="collapse " >
                                <li class=" <?php
                                    if ($curr_sub_step == STEP_INFORMATION_STORAGE) {
                                        echo "active";
                                    }
                                    ?>">
                                    <a class="" href="javascript:;" onclick="common.openWindow('<?= site_url('information/storage') ?>')"><i class="fa fa-fw fa-dropbox"></i>Storage</a>
                                </li >
                                <li class=" <?php
                                if ($curr_sub_step == STEP_INFORMATION_REGION) {
                                    echo "active";
                                }
                                    ?>">
                                    <a class="" href="javascript:;" onclick="common.openWindow('<?= site_url('information/region') ?>')"><i class="fa fa-fw fa-flag-o"></i>Region</a>
                                </li >
                                <li class=" <?php
                                if ($curr_sub_step == STEP_INFORMATION_COMPONENT) {
                                    echo "active";
                                }
                                    ?>">
                                    <a class="" href="javascript:;" onclick="common.openWindow('<?= site_url('information/component') ?>')"><i class="fa fa-fw fa-gear "></i>Component</a>

                                </li>
                                <li class=" <?php
                                if ($curr_sub_step == STEP_INFORMATION_RECYCLE) {
                                    echo "active";
                                }
                                    ?>">
                                    <a class="" href="javascript:;" onclick="common.openWindow('<?= site_url('information/recycle') ?>')"><i class="fa fa-fw fa-refresh "></i>Recycle Method</a>
                                </li>
                                <li class=" <?php
                                if ($curr_sub_step == STEP_INFORMATION_CUSTOMER) {
                                    echo "active";
                                }
                                ?>">
                                    <a class="" href="javascript:;" onclick="common.openWindow('<?= site_url('information/customer') ?>')"><i class="fa fa-fw fa-users "></i>Customer</a>
                                </li>
                                <li class=" <?php
                                    if ($curr_sub_step == STEP_INFORMATION_EVENT) {
                                        echo "active";
                                    }
                                ?>">
                                    <a class="" href="javascript:;" onclick="common.openWindow('<?= site_url('information/event') ?>')" ><i class="fa fa-fw fa-envelope-o "></i>Event</a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>
                <!-- /.navbar-collapse -->
            </nav>
