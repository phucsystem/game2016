
<div id="page-wrapper">

    <div class="container-fluid">

        <!-- Page Heading -->
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">
                    Edit Player
                </h1>
            </div>
        </div>
        <!-- /.row -->

        <?= form_open('master/player/edit/' . $id, array('class' => 'form-validate')) ?>
        <div class="row">
            <div class="col-lg-6">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title"><i class="fa fa-money fa-fw"></i> Player List</h3>
                    </div>
                    <div class="panel-body">
                        <div class="">


                            <tbody>
                               
                            <div class="panel-body">
                                <div class="form-group ">
                                    <label>Account</label>
                                    <input class="form-control validate[required]" placeholder="" name='account' value='<?= $currPlayer['account']?>'>
                                </div>
                                <div class="form-group ">
                                    <label>Name</label>
                                    <input class="form-control validate[required]" placeholder="" name='name' value='<?= $currPlayer['name']?>'>
                                </div>
                                <div class="form-group ">
                                    <label>Role </label>
                                    <select id="cbnRole" name="role" class="form-control">
                                        <option value="<?= PLAYER_LEADER ?>" <?php if( $currPlayer['role'] == PLAYER_LEADER ){ echo 'selected=""';}?>>Team Leader</option>
                                        <option value="<?= PLAYER_MEMBER ?>" <?php if( $currPlayer['role'] == PLAYER_MEMBER ){ echo 'selected=""';}?>>Team Member</option>
                                    </select>
                                </div>
                                <div class="form-group ">
                                    <label>Team</label>
                                    <select  class="form-control "  name="team-id" >
                                        <option value="">----</option>
                                        <?php foreach ($teams as $t) { ?>
                                            <option value="<?= $t['id'] ?>" <?php if( $currPlayer['team_id'] == $t['id'] ){ echo 'selected=""';}?>> <?= $t['name'] ?></option>
                                        <?php } ?>
                                    </select>
                                </div>
                                <div class="form-group ">
                                    <label>Email</label>
                                    <input class="form-control validate[required, custom[email]]" placeholder="" name='email'value='<?= $currPlayer['email']?>'>
                                </div>
                            </div>
                            </tbody>

                        </div>
                    </div>
                </div>
                <div >
               
                    <button type="button" class="btn btn-outline btn-default pull-right RbtnMargin" onclick="window.location = '<?= site_url('master/player') ?>'">Cancel</button>
                    <button type="submit" class="btn btn-outline btn-primary pull-right " href="master/player">Save</button>
                </div>
            </div>
             
        </div>
    </form>
        <!-- /.row -->

    </div>
    <!-- /.container-fluid -->

</div>
<!-- /#page-wrapper -->

