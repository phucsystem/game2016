<script>
    var roundNumber = 1;
    var componentNumber = 0;
    var gameRoundNumber = 0;
    var successEditLink = '<?= $success_edit_link ?>';

    var recycleMethodNumber = 0;
 
    
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

    function addRecycleMethod(round) {
        recycleMethodNumber++;
        $("#add-new-recycle-row-" + round).before('<tr id="recycle-row-' + recycleMethodNumber + '"><td><input class="form-control" placeholder="" name="round[' + round + '][recycle][' + recycleMethodNumber + '][factor][<?= RECYCLE_METHOD_NAME ?>]"></td>'
                + '<td><input class="form-control" placeholder="" name="round[' + round + '][recycle][' + recycleMethodNumber + '][factor][<?= RECYCLE_METHOD_COST ?>]"></td>'
                + '<td> <input class="form-control" placeholder="" name="round[' + round + '][recycle][' + recycleMethodNumber + '][factor][<?= RECYCLE_METHOD_RETURN_MONEY ?>]"></td>'
                + '<td> <input class="form-control" placeholder="" name="round[' + round + '][recycle][' + recycleMethodNumber + '][factor][<?= RECYCLE_METHOD_COMPONENT ?>]"></td>'
                + '<td> <input class="form-control" placeholder="" name="round[' + round + '][recycle][' + recycleMethodNumber + '][factor][<?= RECYCLE_METHOD_COMPONENT1 ?>]"></td>'
                + '<td> <input class="form-control" placeholder="" name="round[' + round + '][recycle][' + recycleMethodNumber + '][factor][<?= RECYCLE_METHOD_COMPONENT2 ?>]"></td>'
                + '<td> <input class="form-control" placeholder="" name="round[' + round + '][recycle][' + recycleMethodNumber + '][factor][<?= RECYCLE_METHOD_COMPONENT3 ?>]"></td>'
                + '<td> <input class="form-control" placeholder="" name="round[' + round + '][recycle][' + recycleMethodNumber + '][factor][<?= RECYCLE_METHOD_ECO_CREDIT ?>]"></td>'
                + '<td> <input class="form-control" placeholder="" name="round[' + round + '][recycle][' + recycleMethodNumber + '][factor][<?= RECYCLE_METHOD_SO_CREDIT ?>]"></td>'
                + '<td> <input class="form-control" placeholder="" name="round[' + round + '][recycle][' + recycleMethodNumber + '][factor][<?= RECYCLE_METHOD_ME_CREDIT ?>]"></td>'
                + ' <td><a class="btn btn-outline btn-danger" href="javascript:;" onclick="removeRecycleMethod(' + recycleMethodNumber + ')"><i class="fa fa-trash fa-fw"></i></a></td></tr>');
    }


    function removeRecycleMethod(recycleMethodNumber) {
        $("#recycle-row-" + recycleMethodNumber).remove();
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
         checkAndSaveRound(0, 0);
    }

    function checkAndSaveRound(id, roundId) {
        $.ajax({
            url: '<?= site_url('master/team/edit_round') ?>/' + id,
            method: 'POST',
            dataType: 'json',
            async: false,
            data: $("[name^='round[" + roundId + "]").serialize(),
        }).success(function (data) {
              location.href='<?= site_url('backend/team/index') ?>';
        });
    }
    $(function () {
        gameRoundNumber = $("#gameList option:selected").attr('number-of-round');
    });
</script>
<div id="page-wrapper">
    <div class="container-fluid">
        <!-- Page Heading -->
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">
                    Edit Team Default Setting
                    <div class="pull-right" >
                        <button type="button" class="btn btn-outline btn-default pull-right RbtnMargin" onclick="window.location = '<?= site_url('master/team'); ?>'"><i class="fa fa-reply"></i>  Cancel</button>
                        <button type="button" onclick='checkAndSaveTeam()' class="btn btn-outline btn-primary pull-right " ><i class="fa fa-save"></i>  Save Change</button>
                    </div>
                </h1>

            </div>
        </div>
        <!-- /.row -->

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

        <!-- /.row -->

    </div>
    <!-- /.container-fluid -->

</div>
<!-- /#page-wrapper -->