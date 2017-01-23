
<script>
    var tab = '<?= $tab ?>';
    var gameId = '<?= $gameId ?>';
    function stopRound(id) {
        common.confirmDialog('Do you want to stop this team\'s round?', function () {
            common.showLoadingModal();
            $.ajax({
                url: '<?= site_url('master/round/stopround') ?>/' + id,
                method: "GET",
                dataType: 'json',
            }).success(function (data) {
                location.reload();
            });
        });
    }

    function startNewRound() {
        common.confirmDialog('Do you want to start new round of this game?', function () {
            common.showLoadingModal();
            $.ajax({
                url: '<?= site_url('master/round/startnew') ?>/' + gameId,
                method: "GET",
                dataType: 'json',
            }).success(function (data) {
                location.href = '<?= site_url('master/round/index') ?>/' + gameId;
            });
        });
    }

    function finishEvaluation() {
        common.confirmDialog('Do you want to finish evaluation of this round?', function () {
            common.showLoadingModal();
            $.ajax({
                url: '<?= site_url('master/round/finishround') ?>/' + gameId,
                method: "GET",
                dataType: 'json',
            }).success(function (data) {
                location.href = '<?= site_url('master/round/index') ?>/' + gameId;
            });
        });
    }


    $(function () {
        // Open tab
        switch (tab) {
              case 'recycle':
                $('#recycle-tab').click();
                break;
              case 'report':
                  $('#report-tab').click();
                  break;
            case 'sell':
                $('#sell-tab').click();
                break;
            case 'improve':
                $('#improve-tab').click();
                break;
            case 'return':
                $('#return-tab').click();
                break;
        }

    });
</script>

<div id="page-wrapper">

    <div class="container-fluid">

        <!-- Page Heading -->
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">
                    Round Evaluation <small>(Game: <?= $gameInfo['name'] ?> - Round #<?= $gameInfo['current_round'] ?>)</small>
                    <div class="pull-right" >
                        <?php if ($gameInfo['status'] != GAME_ROUND_FINISH_EVALUATION) { ?>
                            <button type="button" class="btn btn-outline btn-success pull-right " onclick="finishEvaluation()"><i class="fa fa-dot-circle-o"></i> Finish Round Evaluation</button>
                        <?php } else { ?>
                        <?php if($gameInfo['current_round'] != $gameInfo['number_of_round'] ){ ?>
                            <button type="button" class="btn btn-outline btn-danger pull-right " onclick="startNewRound()"><i class="fa fa-paper-plane-o"></i>  Start New Round</button>
                        <?php }} ?>
                    </div>
                </h1>
            </div>
        </div>
        <!-- /.row -->

        <div class="row">
            <div class="">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title"><i class="fa fa-trophy fa-fw"></i> Round Management
                        </h3>

                    </div>
                    <div class="panel-body">
                        <!-- Nav tabs -->
                        <ul class="nav nav-tabs">
                            <li class="active"><a data-toggle="tab" href="#progress">Game Progress</a>
                            </li>
                            <li class=""><a data-toggle="tab" href="#report" id="report-tab">Round Report</a>
                            </li>
                            <li><a data-toggle="tab" href="#sellproducts" id="sell-tab">Sell Products</a>
                            </li>
                            <li><a data-toggle="tab" href="#improvement" id="improve-tab">Round Improvement</a>
                            </li>
                            <li><a data-toggle="tab" href="#recycle" id="recycle-tab">Return Used Products</a>
                            </li>
                        </ul>

                        <!-- Tab panes -->
                        <div class="tab-content">
                            <br>
                            <div id="progress" class="tab-pane fade in active">
                                <table class="table table-bordered table-hover table-striped">
                                    <thead>
                                        <tr>
                                            <th>Team Name</th>
                                            <th>Round</th>
                                            <th>Round Status</th>
                                            <th>Current Phase</th>
                                            <th>Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <?php foreach ($teams as $t) {
                                            ?>
                                            <tr>
                                                <td><?= $t['name'] ?></td>
                                                <td><?= $t['current_round'] ?></td>
                                                <td><?= $t['round_status_name'] ?></td>
                                                <td><?= $t['current_round_name'] ?></td>
                                                <td>
                                                    <?php
                                                    if ($t['round_status'] != ROUND_WAIT_FOR_EVALUATE) {
                                                        ?>
                                                        <button class="btn btn-default  RbtnMargin" type="button" onclick="stopRound(<?= $t['id'] ?>)">Stop Round</button>
                                                    <?php } ?>
                                                    &nbsp;
                                                </td>
                                            </tr>
                                        <?php } ?>
                                    </tbody>
                                </table>
                            </div>
                             <div id="report" class="tab-pane fade">
                                <?= $report_view ?>
                            </div>
                            <div id="sellproducts" class="tab-pane fade">
                                <?= $sale_view ?>
                            </div>
                            <div id="recycle" class="tab-pane fade">
                             <?= $recycle_view?>
                            </div>
                            <div id="improvement" class="tab-pane fade">
                                <?= $improvement_view ?>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- /.row -->

    </div>
    <!-- /.container-fluid -->

</div>
<!-- /#page-wrapper -->

