<div id="page-wrapper">
    <div class="container-fluid">
        <!-- Page Heading -->
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">
                    Record Log of <?= $type ?> <small></small>
                </h1>
            </div>
        </div>

        <div class="row ">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title"><i class="fa fa-th-list"></i> Record List</h3>
                    </div>
                    <div class="panel-body">
                        <div class="table-responsive">
                            <table class="table table-bordered table-hover table-striped datatable">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Change Value</th>
                                        <th>New Value</th>
                                        <th>Round</th>
                                        <th>Description</th>
                                        <th>Date</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php if(is_array($records)){
                                        foreach ($records as $rKey=> $rValue){?>
                                    <tr>
                                        <td><?= $rKey+1?></td>
                                        <td><?= $rValue['value'] ?></td>
                                        <td><?= $rValue['new_value'] ?></td>
                                        <td><?= $rValue['round_id'] ?></td>
                                        <td><?= $rValue['description'] ?></td>
                                        <td><?= format_date($rValue['created_date']) ?></td>
                                    </tr>
                                    <?php }}  ?>
                                </tbody>
                            </table>

                        </div>
                        <div >
                            <button type="button" style="margin-right:10px" onclick="location.href = '<?= site_url('game/dashboard') ?>'" class="btn btn-default pull-right RbtnMargin">Back To Daskboard</button>
                        </div>
                    </div>
                </div>

            </div>
        </div>




    </div>
</div>