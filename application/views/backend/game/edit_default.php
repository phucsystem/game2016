
<script>
    function addNewComponent() {
        $('<tr> <td> <input class="form-control" placeholder="" name="name">  </td><td> <input class="form-control" placeholder="" name="name"> </td><td> <input class="form-control" placeholder="" name="name"></td><td> <input class="form-control" placeholder="" name="name"></td><td> <input class="form-control" placeholder="" name="name"></td><td> <input class="form-control" placeholder="" name="name"></td><td> <select class="form-control " id="component-seat" name="component-seat" in-house="1"> <option value="100">Possible</option> <option value="150">Impossible</option> </select> </td><td> <a class="btn btn-outline btn-danger btn-sm" href="#" onclick="deleteGame(&quot;24&quot;)" data-toggle="tooltip" data-placement="right" title="" data-original-title="Delete material"> <i class="fa fa-trash fa-fw"></i> </a> <a class="btn btn-outline btn-default btn-sm" href="#" data-toggle="tooltip" data-placement="right" title="" data-original-title="Add new material"> <i class="fa fa-plus fa-fw"></i> </a> </td></tr>')
                .insertBefore($("#btnAddComponentRow"))
    }

    function addNewMaterial() {

    }

    function addRound() {
        common.showLoadingModal();
        $.ajax({
            url: "<?= site_url('master/game/round') ?>/" + roundNumber,
            method: "POST",
            dataType: 'json'
        }).success(function (data) {
            if (data['view'] !== '') {
                $('#roundAccordions').append(data['view']);
                $('#number-of-round').val(parseInt($('#number-of-round').val()) + 1);
            }
            common.closeLoadingModal();
        });
    }

    function removeRound(id) {
        common.confirmDialog('Do you want to remove this round?', function () {
            roundNumber--;
            $('#number-of-round').val(roundNumber);
            $("#round" + id).remove();
        });

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

    function checkAndSubmit() {
        common.showLoadingModal();
        if ($("#number-of-round").val() == 0) {
            // Update ckeditor element
            for (instance in CKEDITOR.instances) {
                CKEDITOR.instances[instance].updateElement();
            }
            common.alertDialog("No round is available. Please add new round.");
            common.closeLoadingModal();
        } else {
            if ($("#form-add-game").validationEngine('validate')) {
                saveGame();
            } else {
                common.closeLoadingModal();
            }
        }
    }

    function saveGame() {
        for (var n = 1; n <= roundNumber; n++) {
            saveRound(editGameId, n);
            /*
             * Close loading popup
             */
            if (n == roundNumber) {
                window.location = '<?= $success_edit_link ?>';
            }
        }
    }

    function saveRound(gameId, roundId) {
        $.ajax({
            url: '<?php echo site_url('master/game/edit_round/gameid') ?>/' + gameId,
            type: 'post',
            data: $("[name^='round[" + roundId + "]").serialize(),
            async: false,
            success: function (data) {

            }
        });
    }


    var roundNumber = 1;
    var recycleMethodNumber = 0;
    var editGameId = <?= $gameId ?>;

    // Init page
    $(function () {
        common.showLoadingModal();
        for (i = 1; i <= roundNumber; i++) {
            CKEDITOR.replace('eventeditor' + i);
        }

        setTimeout(function () {
            common.closeLoadingModal();
        }, 2000);
    });


</script>



<div id="page-wrapper">
    <div class="container-fluid">
        <?= form_open('master/game/edit/' . $gameId, array('class' => 'form-validate', 'id' => 'form-add-game')); ?>
        <!-- Page Heading -->
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">
                    Edit Game Default Setting
                    <div class="pull-right" >
                        <button type="button" class="btn btn-outline btn-default pull-right RbtnMargin" onclick="window.location = '<?= site_url('master/game'); ?>'"><i class="fa fa-reply"></i>  Cancel</button>
                        <button type="button" class="btn btn-outline btn-primary pull-right " onclick='checkAndSubmit()'><i class="fa fa-save"></i>   Save Change</button>
                    </div>
                </h1>
            </div>
        </div>
        <!-- /.row -->
        <!-- /.row -->

        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title"><i class="fa fa-wrench fa-fw"></i> Rounds Settings</h3>
                    </div>
                    <div class="panel-body">
                        <div class="panel-group" id="roundAccordions">
                            <?php echo $roundView; ?>
                        </div>
<!--                        <button type="button" class="btn btn-outline btn-default " onclick="addRound()"> <i class="fa fa-plus-circle fa-fw"></i> Add new round</button>-->

                    </div>

                </div>



            </div>
        </div>
        </form>
        <!-- /.row -->

    </div>
    <!-- /.container-fluid -->

</div>
<!-- /#page-wrapper -->


