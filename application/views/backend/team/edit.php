<script>
    var roundNumber = 1;
    var componentNumber = 0;
    var gameRoundNumber = 0;
    var teamId = <?= $teamInfo['id'] ?>;
    var successEditLink = '<?= $success_edit_link ?>';
    function addRound() {
        $.ajax({
            url: "<?= site_url('master/team/round') ?>/" + roundNumber,
            method: "POST",
            dataType: 'json'
        }).success(function (data) {
            if (data['view'] !== '') {
                $('#roundAccordions').append(data['view']);
                $('#number-of-round').val(parseInt($('#number-of-round').val()) + 1);
            }
        });
    }

    function addTeamMember() {
        var playerId = $("#member-id option:selected").val();
        var playerName = $("#member-id option:selected").text();
        if (playerId != 0) {
            $('#player-tags').tagsinput('add', {id: playerId, label: playerName});
        }

    }

    function selectGame() {
        gameRoundNumber = $("#gameList option:selected").attr('number-of-round');
        if (gameRoundNumber > 0) {
            common.showLoadingModal();
            removeAllRound();
            for (var n = 0; n < gameRoundNumber; n++) {
                (function (n) {
                    setTimeout(function () {
                        addRound();
                        /*
                         * Close loading popup
                         */
                        if (n == gameRoundNumber - 1) {
                            common.closeLoadingModal();
                        }
                    }, 1000 * n);
                }(n));
            }
        }
    }

    function removeAllRound() {
        $("#roundAccordions").html('');
        roundNumber = 1;
    }

    function checkAndSaveTeam() {
        if ($('#form-team').validationEngine('validate')) {
            common.showLoadingModal();
            $.ajax({
                url: '<?= site_url('master/team/edit') ?>/' + teamId,
                method: 'POST',
                dataType: 'json',
                data: {
                    'name': $('#team-name').val(),
                    'region-id': $('#regionList').val(),
                    'game-id': $('#gameList').val(),
                    'color': $('#my-color').val(),
                    'factors': $("[name^='factor").serialize()
                }
            }).success(function (data) {
                if (data.result == true) {
                    for (var n = 1; n <= gameRoundNumber; n++) {
                        checkAndSaveRound(teamId, n);
                    }
                    window.location = successEditLink;
                }
            });
        }
    }

    function checkAndSaveRound(id, roundId) {
        $.ajax({
            url: '<?= site_url('master/team/edit_round') ?>/' + id,
            method: 'POST',
            dataType: 'json',
            async: false,
            data: $("[name^='round[" + roundId + "]").serialize(),
        }).success(function (data) {

        });
    }
    $(function () {
        gameRoundNumber = $("#gameList option:selected").attr('number-of-round');
    });
</script>
<div id="page-wrapper">
    <div class="container-fluid">
        <?= form_open('master/team/edit/' . $this->data['teamInfo']['id'], array('id' => 'form-team', 'class' => 'form-validate')) ?>
        <!-- Page Heading -->
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">
                    Edit Team
                    <div class="pull-right" >
                        <button type="button" class="btn btn-outline btn-default pull-right RbtnMargin" onclick="window.location = '<?= site_url('master/team'); ?>'"><i class="fa fa-reply"></i>  Cancel</button>
                        <button type="button" onclick='checkAndSaveTeam()' class="btn btn-outline btn-primary pull-right " ><i class="fa fa-save"></i>  Save Change</button>
                    </div>
                </h1>

            </div>
        </div>
        <!-- /.row -->


        <div class="row">
            <div class="col-lg-6">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title"><i class="fa fa-info-circle fa-fw"></i> Team Information</h3>
                    </div>
                    <div class="panel-body">
                        <div class="form-group ">
                            <label>Game</label>
                            <select id="gameList" name="game-id" class="form-control " onchange="selectGame()" >
                                <option value="">----</option>
                                <?php foreach ($games as $g) { ?>
                                    <option value="<?= $g['id'] ?>" number-of-round="<?= $g['number_of_round'] ?>"
                                    <?php
                                    if ($g['id'] == $teamInfo['game_id'])
                                    {
                                        echo 'selected';
                                    }
                                    ?>> <?= $g['name'] ?></option>
                                        <?php } ?>
                            </select>
                        </div>
                        <div class="form-group ">

                            <label>Region</label>
                            <select id="regionList"  name="region-id" class="form-control "   >
                                <option value="">----</option>
                                <?php foreach ($regions as $r) { ?>
                                    <option value="<?= $r['id'] ?>"   <?php
                                    if ($r['id'] == $teamInfo['region_id'])
                                    {
                                        echo 'selected';
                                    }
                                    ?>>  <?= $r['name'] ?></option>
                                        <?php } ?>
                            </select>
                        </div>
                        <div class="form-group">
                            <label>Team Name</label>
                            <input class="form-control validate[required]" placeholder="" name='name' value="<?= $teamInfo['name'] ?>"  id="team-name">
                        </div><div class="form-group ">
                            <label>Color</label>
                            <input class=" form-control color  {valueElement:'my-color'}" readonly style="background-color: #<?= $teamInfo['color'] ?>">
                            <input type="hidden" id="my-color" name="color" value="<?= $teamInfo['color'] ?>" >
                        </div>
                    </div>
                </div>
            </div>


            <div class="col-lg-6">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title"><i class="fa fa-wrench fa-fw"></i> Team Setting</h3>
                    </div>
                    <div class="panel-body">
                        <!-- Nav tabs -->
                        <div class="col-lg-12">
                            <!-- Tab panes -->
                            <?php foreach ($teamFactors as $tf) { ?>
                                <div class="form-group">
                                    <label><?= $tf['label'] ?></label>
                                    <input class="form-control validate[required]" placeholder="" 
                                           name='factor[<?= $tf['id'] ?>]' value="<?= $teamFactorInfo[$tf['id']]['factor_value'] ?>">
                                </div>
                            <?php }; ?>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title"><i class="fa fa-wrench fa-fw"></i> Round settings</h3>
                    </div>
                    <div class="panel-body">
                        <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
                            <div class="panel panel-default" id="roundAccordions">
                                <?= $roundView; ?>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <!-- /.row -->

        </form>
        <!-- /.row -->

    </div>
    <!-- /.container-fluid -->

</div>
<!-- /#page-wrapper -->