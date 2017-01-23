<script>
    var roundNumber = 1;
    var componentNumber = 0;
    var gameRoundNumber = 0;

    function addRound() {
        $.ajax({
            url: "<?= site_url('master/team/round') ?>/" + roundNumber,
            method: "POST",
            dataType: 'json',
            async: false
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
                addRound();
                /*
                 * Close loading popup
                 */
                if (n == gameRoundNumber - 1) {
                    common.closeLoadingModal();
                }
            }
        }
    }

    function addRecycleMethod(round) {
        recycleMethodNumber++;
        $("#add-new-recycle-row-" + round).before('<tr id="recycle-row-' + recycleMethodNumber + '"><td><input class="form-control validate[required]" placeholder="" name="round[' + round + '][recycle][' + recycleMethodNumber + '][factor][<?= RECYCLE_METHOD_NAME ?>]"></td>'
                + '<td><input class="form-control validate[required]" placeholder="" name="round[' + round + '][recycle][' + recycleMethodNumber + '][factor][<?= RECYCLE_METHOD_COST ?>]"></td>'
                + '<td> <input class="form-control validate[required]" placeholder="" name="round[' + round + '][recycle][' + recycleMethodNumber + '][factor][<?= RECYCLE_METHOD_RETURN_MONEY ?>]"></td>'
                + '<td> <input class="form-control validate[required]" placeholder="" name="round[' + round + '][recycle][' + recycleMethodNumber + '][factor][<?= RECYCLE_METHOD_COMPONENT ?>]"></td>'
                + '<td> <input class="form-control validate[required]" placeholder="" name="round[' + round + '][recycle][' + recycleMethodNumber + '][factor][<?= RECYCLE_METHOD_COMPONENT1 ?>]"></td>'
                + '<td> <input class="form-control validate[required]" placeholder="" name="round[' + round + '][recycle][' + recycleMethodNumber + '][factor][<?= RECYCLE_METHOD_COMPONENT2 ?>]"></td>'
                + '<td> <input class="form-control validate[required]" placeholder="" name="round[' + round + '][recycle][' + recycleMethodNumber + '][factor][<?= RECYCLE_METHOD_COMPONENT3 ?>]"></td>'
                + '<td> <input class="form-control validate[required]" placeholder="" name="round[' + round + '][recycle][' + recycleMethodNumber + '][factor][<?= RECYCLE_METHOD_ECO_CREDIT ?>]"></td>'
                + '<td> <input class="form-control validate[required]" placeholder="" name="round[' + round + '][recycle][' + recycleMethodNumber + '][factor][<?= RECYCLE_METHOD_SO_CREDIT ?>]"></td>'
                + '<td> <input class="form-control validate[required]" placeholder="" name="round[' + round + '][recycle][' + recycleMethodNumber + '][factor][<?= RECYCLE_METHOD_ME_CREDIT ?>]"></td>'
                + ' <td><a class="btn btn-outline btn-danger" href="javascript:;" onclick="removeRecycleMethod(' + recycleMethodNumber + ')"><i class="fa fa-trash fa-fw"></i></a></td></tr>');
        resetValidateForm();
    }


    function removeRecycleMethod(recycleMethodNumber) {
        $("#recycle-row-" + recycleMethodNumber).remove();
    }

    function removeAllRound() {
        $("#roundAccordions").html('');
        roundNumber = 1;
    }

    function checkAndSaveTeam() {
        if ($('#form-team').validationEngine('validate')) {
            common.showLoadingModal();

            $.ajax({
                url: "<?= site_url('master/team/add') ?>",
                method: "POST",
                data: {
                    'name': $('#team-name').val(),
                    'region-id': $('#regionList').val(),
                    'game-id': $('#gameList').val(),
                    'color': $('#my-color').val(),
                    'factors': $("[name^='factor").serialize()
                },
                dataType: 'json',
            }).success(function (data) {
                if (data.result == true){
                    for (var n = 1; n <= gameRoundNumber; n++) {
                        checkAndSaveRound(data.team_id, n);
                    }
                     window.location = '<?= $success_add_link ?>';
                }
            });
        }

    }

    function checkAndSaveRound(teamId, roundId) {
        $.ajax({
            url: "<?= site_url('master/team/add_round') ?>/" + teamId,
            method: "POST",
            dataType: 'json',
            async:false,
            data: $("[name^='round[" + roundId + "]").serialize(),
        }).success(function (data) {
        });
    }
</script>
<div id="page-wrapper">
    <div class="container-fluid">
        <?= form_open('master/team/add', array('id' => 'form-team', 'class' => 'form-validate')) ?>
        <!-- Page Heading -->
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">
                    Create a new team
                    <div class="pull-right" >
                        <button type="button" class="btn btn-outline btn-default pull-right RbtnMargin" onclick="window.location = '<?= site_url('master/team'); ?>'"><i class="fa fa-reply"></i>  Cancel</button>
                        <button type="button" onclick="checkAndSaveTeam()" class="btn btn-outline btn-primary pull-right " ><i class="fa fa-save"></i>   Add new</button>
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
                                    <option value="<?= $g['id'] ?>" number-of-round="<?= $g['number_of_round'] ?>"> <?= $g['name'] ?></option>
                                <?php } ?>
                            </select>
                        </div>
                        <div class="form-group ">

                            <label>Region</label>
                            <select id="regionList"  name="region-id" class="form-control "   >
                                <option value="">----</option>
                                <?php foreach ($regions as $r) { ?>
                                    <option value="<?= $r['id'] ?>"> <?= $r['name'] ?></option>
                                <?php } ?>
                            </select>
                        </div>
                        <div class="form-group">
                            <label>Team Name</label>
                            <input class="form-control validate[required]" placeholder="" name='name' id="team-name">
                        </div><div class="form-group ">
                            <label>Color</label>
                            <input class=" form-control color  {valueElement:'my-color'}" readonly>
                            <input type="hidden" id="my-color" name="color" >
                        </div>
                    </div>
                </div>

                <!--                <div class="panel panel-default ">
                                    <div class="panel-heading">
                                        <h3 class="panel-title"><i class="fa fa-wrench fa-fw"></i> Team Members</h3>
                                    </div>
                                    <div class="panel-body">
                                         Nav tabs 
                                        <div class="col-lg-12">
                                             Tab panes 
                                            <div class="form-group ">
                                                <label>Players List</label>
                                                
                                                <select id="member-id" class="form-control   select2"  onchange="addTeamMember()" >
                                                    <option value="">----</option>
                <?php foreach ($players as $p) { ?>
                                                                                <option value="<?= $p['id'] ?>"> <?= $p['name'] ?></option>
                <?php } ?>
                                                </select>
                                                    
                                            </div>
                
                                            <div class="form-group">
                                                <label>Team's Members List</label><br/>
                                                <input class="form-control tagsinput" id="player-tags" name="players-list" value=""/>
                                            </div>
                                        </div>
                                    </div>
                                </div>-->
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
                                    <input class="form-control validate[required]" placeholder="" name='factor[<?= $tf['id'] ?>]' value="<?= $teamFactorInfo[$tf['id']]['factor_value'] ?>">
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