
<div id="page-wrapper">

    <div class="container-fluid">
        <?= form_open('master/player/add', array('class' => 'form-validate', 'id' => 'form-add-player')) ?>
        <!-- Page Heading -->
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">
                    Create a new player
                    <div class="pull-right" >
                        <button type="button" class="btn btn-outline btn-default pull-right RbtnMargin" onclick="window.location = '<?= site_url('master/player'); ?>'"><i class="fa fa-reply"></i>  Cancel</button>
                        <button type="button" onclick="checkuser()" class="btn btn-outline btn-primary pull-right " ><i class="fa fa-save"></i>   Add new</button>
                    </div>
                </h1>
            </div>
        </div>
        <!-- /.row -->


        <div class="row">
            <div class="col-lg-6">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title"><i class="fa fa-info-circle fa-fw"></i> Player Information</h3>
                    </div>
                    <div class="panel-body">
                        <div class="form-group">
                            <div class="form-group ">
                                <label>Account</label>
                                <input class="form-control validate[required]" placeholder="" name='account' id="player-name">
                            </div>
                            <div class="form-group ">
                                <label>Name</label>
                                <input class="form-control validate[required]" placeholder="" name='name' >
                            </div>
                            <div class="form-group ">
                                <label>Role</label>
                                <select id="cbnRole" name="role" class="form-control">
                                    <option value="">----</option>
                                    <option value="1">Team Leader</option>
                                    <option value="2">Team Member</option>
                                </select>
                            </div>
                            <div class="form-group ">
                                <label>Team</label>
                                <select  class="form-control "  name="team-id" >
                                    <option value="">----</option>
                                    <?php foreach ($teams as $t) { ?>
                                        <option value="<?= $t['id'] ?>"> <?= $t['name'] ?></option>
                                    <?php } ?>
                                </select>
                            </div>
                            <div class="form-group ">
                                <label>Email</label>
                                <input class="form-control validate[required, custom[email]]" placeholder="" name='email'>
                            </div>
                        </div>
                    </div>


                </div>
            </div>
            <!-- /.row -->


        </div>
        </form>
    </div>

    <!-- /.row -->

</div>
<!-- /.container-fluid -->

</div>
<!-- /#page-wrapper -->

<script>
    function checkuser() {
        var name = $('#player-name').val();
        if (name !== '') {
            $.ajax({
                url: "<?= site_url('master/player/checkuser') ?>/" + name,
                method: "POST",
            }).success(function (data) {
                data = JSON.parse(data);
                if (data.result == true) {
                    common.alertDialog('This account name is already exist. Please input the another one.');
                } else {
                    $("#form-add-player").submit();
                }
            });
        }

    }
</script>