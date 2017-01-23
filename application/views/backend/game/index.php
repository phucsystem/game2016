
<div id="page-wrapper">

    <div class="container-fluid">

        <!-- Page Heading -->
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">
                    Game Management
                </h1>
            </div>
        </div>
        <!-- /.row -->

        <div class="row">
            <div class="">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title"><i class="fa fa-trophy fa-fw"></i> Game List</h3>
                    </div>
                    <div class="panel-body">
                        <div class="">
                            <div class="form-group">
                                <a  class="btn btn-outline btn-default " href="<?= site_url('master/game/add') ?>"> <i class="fa fa-plus fa-fw"></i> Create a new game</a>
                                 <a  class="btn btn-outline btn-default " href="<?= site_url('master/game/edit_default') ?>"> <i class="fa fa-pencil "></i> Edit game's default setting</a>
                            </div>
                            <table class="table table-bordered table-hover table-striped datatable">
                                <thead>
                                    <tr>
                                        <th class='dataTable-defaultSort'>ID #</th>
                                        <th>Game Name</th>
                                        <th>Number Of Rounds</th>
                                        <th>Current Round</th>
                                        <!--<th>Status</th>-->
                                        <th>Created By</th>
                                        <th>Created Date</th>
                                        <th class="action-cols">Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php foreach ($games as $g) { ?>
                                        <tr>
                                            <td><?= $g['id'] ?></td>
                                            <td><?= $g['name'] ?></td>
                                            <td><?= $g['number_of_round'] ?></td>
                                            <td><?= $g['current_round'] ?></td>
<!--                                            <td>
                                                <?php if ($g['status'] == GAME_ACTIVE) {
                                                    echo '<span class="label label-success">Active</span>';
                                                }else{
                                                    echo '<span class="label label-default">DeActive</span>';
                                                    
                                                } ?></td>-->
                                            <td><?= $g['created_by_user'] ?></td>
                                            <td><?= format_date($g['created_date']) ?></td>
                                            <td>
                                                   <?php
                                                   // if ($g['status'] == GAME_ROUND_FINISH) {?>
                                                   <?php if(!empty($g['team'])){?>
                                                <a class = "btn btn-outline btn-success" href = "<?= site_url('master/round/index/'. $g['id']) ?>">
                                                          <i class = "fa fa-check fa-fw"></i>
                                                        </a>
                                                        <?php }?>
                                                <a class="btn btn-outline btn-primary" href="<?= site_url('master/game/edit/'. $g['id'])?>">
                                                    <i class="fa fa-edit fa-fw"></i> 
                                                </a>
                                                <a class="btn btn-outline btn-danger" href="#" onclick='deletePlayer("<?= $g['id'] ?>")'>
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
                  common.showNotify('Add a new game successfully');
                break;
            case 'delete':
                common.showNotify('Delete a game successfully.');
                break;
                case 'edit':
                common.showNotify('Edit a game successfully');
                break;
        }
    });
    
    function deletePlayer(id){
        common.confirmDialog('Do you want to delete this player item?', function(){
             $.ajax({
                    url: "<?= site_url('master/game/remove')?>/" + id,
                    method: "POST",
                    dataType : 'json'
                }).success(function(data) {
                    if( data['result'] == true){
                        window.location = '<?= site_url('master/game/success/delete'); ?>'
                    }else{
                        common.showNotify('Fail to delete game.')
                    }
                });
        })
    }
</script>
