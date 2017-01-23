
<div id="page-wrapper">

    <div class="container-fluid">

        <!-- Page Heading -->
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">
                    Player Management
                </h1>

            </div>
        </div>

        <!-- /.row -->

        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title"><i class="fa fa-user fa-fw"></i> Player List</h3>
                    </div>
                    <div class="panel-body">
                        <div class="">
                            <div class="form-group">
                                <a  class="btn btn-outline btn-default " href="<?= site_url('master/player/add') ?>"> <i class="fa fa-plus fa-fw"></i> Create a new player</a>
                            </div>
                            <table class="table table-bordered table-hover table-striped datatable">
                                <thead>
                                    <tr>
                                        <th>ID #</th>
                                        <th>Account</th>
                                        <th>Name</th>
                                        <th>Role</th>
                                        <th>Team</th>
                                        <th>Email</th>
                                        <th class="action-cols">Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php foreach ($players as $p) { ?>
                                        <tr>
                                            <td><?= $p['id'] ?></td>
                                            <td><?= $p['account'] ?></td>
                                            <td><?= $p['name'] ?></td>
                                            <td><?= $p['role'] ?></td>
                                            <td><?= $p['team_name'] ?></td>
                                            <td><?= $p['email'] ?></td>
                                            <td>
                                                
                                                <a class="btn btn-outline btn-primary" href="<?= site_url('master/player/edit') . '/' .$p['id']  ?>">
                                                    <i class="fa fa-edit fa-fw"></i> 
                                                </a>
                                                <a class="btn btn-outline btn-danger" href="#" onclick='deletePlayer("<?= $p['id'] ?>")'>
                                                    <i class="fa fa-trash fa-fw"></i> 
                                                </a></td>
                                        </tr>
<?php } ?>

                                </tbody>
                            </table>
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
<script>
    var successAction = '<?= $successAction?>';
    $(function(){
        switch(successAction){
            case 'add':
                  common.showNotify('Add a new player successfully');
                break;
            case 'delete':
                common.showNotify('Delete a player successfully.');
                break;
            case 'edit':
                common.showNotify('Edit a player successfully.');
                break;
        }
    });
    
    function deletePlayer(id){
        common.confirmDialog('Do you want to delete this player item?', function(){
             $.ajax({
                    url: "<?= site_url('master/player/remove')?>/" + id,
                    method: "POST",
                }).success(function(data) {
                    data = JSON.parse(data);
                    if( data['result'] == true){
                        window.location = '<?= site_url('master/player/success/delete'); ?>'
                    }else{
                        common.showNotify('Fail to delete player.')
                    }
                });
        })
    }
</script>

