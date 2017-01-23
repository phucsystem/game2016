
<script>

    function addNewComponent() {
        $('<tr> <td> <input class="form-control validate[required]" placeholder="" name="name">  </td><td> <input class="form-control validate[required]" placeholder="" name="name"> </td><td> <input class="form-control validate[required]" placeholder="" name="name"></td><td> <input class="form-control validate[required]" placeholder="" name="name"></td><td> <input class="form-control validate[required]" placeholder="" name="name"></td><td> <input class="form-control validate[required]" placeholder="" name="name"></td><td> <select class="form-control " id="component-seat" name="component-seat" in-house="1"> <option value="100">Possible</option> <option value="150">Impossible</option> </select> </td><td> <a class="btn btn-outline btn-danger btn-sm" href="#" onclick="deleteGame(&quot;24&quot;)" data-toggle="tooltip" data-placement="right" title="" data-original-title="Delete material"> <i class="fa fa-trash fa-fw"></i> </a> <a class="btn btn-outline btn-default btn-sm" href="#" data-toggle="tooltip" data-placement="right" title="" data-original-title="Add new material"> <i class="fa fa-plus fa-fw"></i> </a> </td></tr>')
                .insertBefore($("#btnAddComponentRow"))
    }

    function addNewMaterial() {

    }

    function addRound() {
        common.showLoadingModal();
        setTimeout(function () {
            var addRoundNumber = $('#round-number-input').val();
            for (i = 0; i < addRoundNumber; i++) {
                roundNumber++;
                $.ajax({
                    url: "<?= site_url('master/game/round') ?>/" + roundNumber,
                    method: "POST",
                    dataType: 'json',
                    async: false
                }).success(function (data) {
                    if (data['view'] !== '') {
                        $('#roundAccordions').append(data['view']);
                        $('#number-of-round').val(parseInt($('#number-of-round').val()) + 1);
                        CKEDITOR.replace('eventeditor' + (roundNumber));
                    }

                });
            }
            common.closeLoadingModal();
        }, 100);


    }

    function removeRound(id) {
        common.confirmDialog('Do you want to remove this round?', function () {
            roundNumber--;
            $('#number-of-round').val(roundNumber);
            $("#round" + id).remove();
        });

    }



    function checkAndSubmit() {
        common.showLoadingModal();
        setTimeout(function () {
            // Update ck editor element
            for (instance in CKEDITOR.instances) {
                CKEDITOR.instances[instance].updateElement();
            }

            if ($("#number-of-round").val() == 0) {
                common.alertDialog("No round is available. Please add new round.");
                common.closeLoadingModal();
            } else {
                if ($("#form-add-game").validationEngine('validate')) {
                    checkAndSaveGame();
                } else {
                    common.closeLoadingModal();
                }
            }
        }, 100);

    }

    function checkAndSaveGame() {
        $.ajax({
            url: "<?php echo site_url('master/game/add') ?>",
            method: "POST",
            dataType: 'json',
            data: {
                'name': $('#game-name').val(),
                'number_of_round': $('#number-of-round').val(),
                'recycle_round': $('#recycle-round').val()

            },
        }).success(function (data) {
            if (data.result == true) {
                var gameId = data.gameid;
                for (var n = 1; n <= roundNumber; n++) {
                    checkAndSaveRound(gameId, n);
                    /*
                     * Close loading popup
                     */
                    if (n == roundNumber) {
                        window.location = '<?= $success_add_link ?>';
                    }
                }
            }
        });
    }

    function checkAndSaveRound(gameId, roundId) {
        $.ajax({
            url: '<?php echo site_url('master/game/add_round/gameid') ?>/' + gameId,
            type: 'post',
            data: $("[name^='round[" + roundId + "]").serialize(),
            async: false,
            success: function (data) {

            }
        });
    }



    var roundNumber = 1;
    var recycleMethodNumber = 0;

    // Init page
    $(function () {
        //   $("#collapse" + roundNumber).collapse("show");
        CKEDITOR.replace('eventeditor1');
    })
</script>



<div id="page-wrapper">

    <div class="container-fluid">
        <?= form_open('master/game/add', array('class' => 'form-validate', 'id' => 'form-add-game')); ?>
        <!-- Page Heading -->
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">
                    Create a new game
                    <div class="pull-right" >
                        <button type="button" class="btn btn-outline btn-default pull-right RbtnMargin" onclick="window.location = '<?= site_url('master/game'); ?>'"><i class="fa fa-reply"></i>  Cancel</button>
                        <button type="button" class="btn btn-outline btn-primary pull-right " onclick='checkAndSubmit()'><i class="fa fa-save"></i>   Add new</button>
                    </div>
                </h1>
            </div>
        </div>
        <!-- /.row -->

        <div class="row">
            <div class="col-lg-6">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title"><i class="fa fa-info-circle fa-fw"></i> Game Information</h3>
                    </div>
                    <div class="panel-body">
                        <div class="">
                            <div class="form-group ">
                                <label>Game Name</label>
                                <input class="form-control validate[required]" placeholder="" name='name' id="game-name" >
                                <input type="hidden" name="number_of_round" value="1" id="number-of-round" >
                            </div>
                            <div class="form-group ">
                                <label>Recycle Round</label>
                                <input class="form-control validate[required,custom[number]]" placeholder="" name='recycle_round' id="recycle-round" value="1" >
                            </div>
                        </div>
                    </div>

                </div>
            </div>

        </div>
    </div>
    <!-- /.row -->

    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title"><i class="fa fa-wrench fa-fw"></i> Rounds Settings</h3>
                </div>
                <div class="panel-body">
                    <div>
                        <div class="panel-group" id="roundAccordions">
                            <?php echo $roundView; ?>
                        </div>
                    </div>
                    <div>
                        <input type="text" class="form-control input-sm" id="round-number-input" style="width: 50px; display: inline" value="1">
                        <button type="button" class="btn btn-outline btn-default "   onclick="addRound()"> <i class="fa fa-plus-circle fa-fw"></i> Add round</button>
                    </div>
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


