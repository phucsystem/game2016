
<div id="page-wrapper">

    <div class="container-fluid">

        <!-- Page Heading -->
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">
                    Team Management
                </h1>

            </div>
        </div>

        <!-- /.row -->

        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title"><i class="fa fa-users fa-fw"></i> Team List</h3>
                    </div>
                    <div class="panel-body">
                        <div class="">
                            <div class="form-group">
                                <a  class="btn btn-outline btn-default " href="<?= site_url('master/team/add') ?>"> <i class="fa fa-plus fa-fw"></i> Create a new team</a>
                                <a  class="btn btn-outline btn-default " href="<?= site_url('master/team/edit_default') ?>"> <i class="fa fa-pencil "></i> Edit team's default setting</a>

                            </div>
                            <table class="table table-bordered table-hover table-striped datatable">
                                <thead>
                                    <tr>
                                        <th>ID #</th>
                                        <th>Team Name</th>
                                        <th>Color</th>
                                        <th>Region</th>
                                        <th>Game</th>

                                        <th class="action-cols">Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php foreach ($teams as $g) { ?>
                                        <tr>
                                            <td><?= $g['id'] ?></td>
                                            <td><?= $g['name'] ?></td>
                                            <td>
                                                <i class="fa fa-star fa-fw" style="color: #<?= $g['color'] ?>; font-size: 20px"></i>
                                            </td>
                                            <td><?= $g['region_name'] ?></td>
                                            <td><?= $g['game_name'] ?></td>

                                            <td>

                                                <a class="btn btn-outline btn-primary" href="<?= site_url('master/team/edit') . '/' . $g['id'] ?>">
                                                    <i class="fa fa-edit fa-fw"></i> 
                                                </a>
                                                <a class="btn btn-outline btn-danger" href="#" onclick='deleteTeam("<?= $g['id'] ?>")'>
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
    var successAction = '<?= $successAction ?>';
    $(function () {
        switch (successAction) {
            case 'add':
                common.showNotify('Add a new team successfully');
                break;
            case 'delete':
                common.showNotify('Delete a team successfully.');
                break;
            case 'edit':
                common.showNotify('Edit a team successfully.');
                break;
        }
    });

    function deleteTeam(id) {
        common.confirmDialog('Do you want to delete this team item?', function () {
            $.ajax({
                url: "<?= site_url('master/team/remove') ?>/" + id,
                method: "POST",
                dataType: 'json'
            }).success(function (data) {
                if (data['result'] == true) {
                    window.location = '<?= site_url('master/team/success/delete'); ?>'
                } else {
                    common.showNotify('Fail to delete game.')
                }
            });
        })
    }

</script>