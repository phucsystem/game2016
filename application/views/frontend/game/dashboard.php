
<div id="page-wrapper" >

    <div class="container-fluid">
        <!-- Page Heading -->
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">
                    Dashboard <small></small>
                </h1>
            </div>
        </div>
        
        <div class="col-lg-12 no-padding-left no-padding-right" >
                <div class="panel panel-default">
                    <div class="panel-heading" >
                        <h3 class="panel-title"><i class="fa fa-compass fa-fw"></i> Round Status</h3>
                    </div>
                    <div class="panel-body" style="">
                        <div class="col-lg-6">
                            <div class="form-group">
                                <div class="col-lg-6"><b>Game </b></div>
                                <div class="col-lg-6">
                                    <?= $this->data['gameName'] ?>
                                </div>
                            </div><br/>

                            <div class="form-group">
                                <div class="col-lg-6"><b>Company</b></div>
                                <div class="col-lg-6">
                                    <?= $this->data['teamInfo']['name'] ?>
                                </div>
                            </div><br/>

                            <div class="form-group">
                                <div class="col-lg-6"><b>Color</b></div>
                                <div class="col-lg-6">
                                    <i class="fa fa-star fa-fw" style="color: #<?= $this->data['teamInfo']['color'] ?>; font-size: 20px"></i>
                                </div>
                            </div><br/>

                            <div class="form-group">
                                <div class="col-lg-6"><b>Team Leader</b></div>
                                <div class="col-lg-6">
                                    <?= (!empty($teamInfo['leader']['name'])) ? $teamInfo['leader']['name'] : '' ?>
                                </div>
                            </div><br/>
                        </div>
                        <div class="col-lg-6">

                        <div class="form-group">
                            <div class="col-lg-6"><b>Factory Location</b></div>
                            <div class="col-lg-6">
                                <?= $this->data['teamInfo']['region'] ?>
                            </div>
                        </div><br/>

                        <div class="form-group">
                            <div class="col-lg-6"><b>Round</b></div>
                            <div class="col-lg-6">
                                <?= $this->data['teamInfo']['current_round'] ?>   
                            </div>
                        </div><br/>

                        <div class="form-group">
                            <div class="col-lg-6"><b>Round Status</b></div>
                            <div class="col-lg-6">
                                <?= $this->data['teamInfo']['round_status_name'] ?>
                            </div>
                        </div><br/>

                        <div class="form-group">
                            <div class="col-lg-6"><b>Current Phase</b></div>
                            <div class="col-lg-6">
                                <?= $this->data['teamInfo']['current_step_name'] ?>   
                            </div>
                        </div>
                        </div>

                        <div class="form-group">
                            <form action="" method="POST" id="round-form">
                                <div class="col-lg-12 no-padding-left no-padding-right" style="">
                                    <?php if ($this->data['teamInfo']['round_status'] != ROUND_WAIT_FOR_EVALUATE) { ?>
                                        <?php if ($this->data['teamInfo']['current_step'] == STEP_DASHBOARD) { ?>
                                            <button type="button" class="btn btn-primary col-lg-6 pull-right" style="margin-left: 0" onclick="startRound();"><i style="font-size: 20px;" class="fa fa-play-circle "></i> Start New Round</button>
                                        <?php } else { ?>
                                            <button type="button" class="btn btn-primary col-lg-6 pull-right" style="margin-left: 0" onclick="window.location = '<?= $redirectUrl ?>';"><i style="font-size: 20px;" class="fa fa-play-circle "></i> Continue</button>
                                        <?php } ?>
                                    <?php } ?>
                                </div>
                                <input type="hidden" name="action" id="round-action">
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        
        <!-- /.row -->
        <div class="row">
            <div class="col-lg-12">
                <ol class="breadcrumb">
                    <li class="active">
                        <i class="fa fa-flag"></i> Credit Points
                    </li>
                </ol>
            </div>
        </div>
        <!-- /.row -->


        <div class="row">
            <div class="col-lg-3 col-md-6">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-xs-3">
                                <i class="fa fa-dollar fa-5x"></i>
                            </div>
                            <div class="col-xs-9 text-right">
                                <div class="huge"><?= format_currency($teamFactorsInfo[TEAM_MONEY]['factor_value']) ?></div>
                                <div>Money</div>
                            </div>
                        </div>
                    </div>
                    <a href="<?= site_url('record/detail/money') ?>">
                        <div class="panel-footer">
                            <span class="pull-left">View Details</span>
                            <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                            <div class="clearfix"></div>
                        </div>
                    </a>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="panel panel-green">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-xs-3">
                                <i class="fa fa-leaf fa-5x"></i>
                            </div>
                            <div class="col-xs-9 text-right">
                                <div class="huge"><?= $teamFactorsInfo[TEAM_ECO_CREDIT]['factor_value'] ?></div>
                                <div>ECO Credits</div>
                            </div>
                        </div>
                    </div>
                    <a href="<?= site_url('record/detail/economic') ?>">
                        <div class="panel-footer">
                            <span class="pull-left">View Details</span>
                            <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                            <div class="clearfix"></div>
                        </div>
                    </a>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="panel panel-yellow">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-xs-3">
                                <i class="fa fa-group fa-5x"></i>
                            </div>
                            <div class="col-xs-9 text-right">
                                <div class="huge"><?= $teamFactorsInfo[TEAM_SO_CREDIT]['factor_value'] ?></div>
                                <div>SO Credits</div>
                            </div>
                        </div>
                    </div>
                    <a href="<?= site_url('record/detail/social') ?>">
                        <div class="panel-footer">
                            <span class="pull-left">View Details</span>
                            <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                            <div class="clearfix"></div>
                        </div>
                    </a>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="panel panel-red">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-xs-3">
                                <i class="fa  fa-cogs fa-5x"></i>
                            </div>
                            <div class="col-xs-9 text-right">
                                <div class="huge"><?= $teamFactorsInfo[TEAM_ME_CREDIT]['factor_value'] ?></div>
                                <div>ME Credits</div>
                            </div>
                        </div>
                    </div>
                    <a href="<?= site_url('record/detail/me') ?>">
                        <div class="panel-footer">
                            <span class="pull-left">View Details</span>
                            <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                            <div class="clearfix"></div>
                        </div>
                    </a>
                </div>
            </div>
        </div>
        
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title"><i class="fa fa-bar-chart-o fa-fw"></i> Credit Record</h3>
                    </div>
                    <div class="panel-body">
                        <div id="morris-area-chart"></div>
                    </div>
                </div>
            </div>
        </div>
              <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title"><i class="fa fa-bar-chart-o fa-fw"></i> Money Record</h3>
                    </div>
                    <div class="panel-body">
                        <div id="morris-line-chart"></div>
                    </div>
                </div>
            </div>
           
        </div>
        <!-- /.row -->
        
 

    </div>
    <!-- /.container-fluid -->

</div>
<!-- /#page-wrapper -->

<textarea  id="event-description" class="hidden"><?= "<h4>" . $eventInfo['title'] . "<h4/><br/>" . $eventInfo['description'] ?></textarea>

<script>
    var teamRecords = '<?php echo json_encode($teamInfo['teamFactorsRecord']); ?>';

    $(function () {
<?php if (!empty($eventInfo['title'])) { ?>
            if ($('#event-description').val() != '') {
                common.showEvent($('#event-description').val());
            }
<?php } ?>
    });

    function startRound() {
        common.showLoadingModal();
        $.ajax({
            url: "<?= site_url('/game/startround') ?>",
            dataType: 'json'
        }).success(function (data) {
            if (data['result'] == true) {
                window.location = '<?= site_url('game/products'); ?>'
            }
            common.closeLoadingModal();
        });
    }
</script>