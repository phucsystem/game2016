
<div id="page-wrapper">

    <div class="container-fluid">

        <!-- Page Heading -->
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header" style="margin-top: 0px">
                    Market References <small></small>
                </h1>
            </div>
        </div>

        <div >
            <?php foreach ($regionList as $r) { ?>
                <h4><?= $r['label'] ?></h4> 
                <table class="table table-striped table-bordered table-hover">
                    <thead>
                        <tr>
                            <th rowspan="2">Factor</th>
                            <?php foreach ($customerList as $c) { ?>
                            <th colspan="2"> <?= $c['label'] ?></th>
                            <?php } ?>
                        </tr>
                        <tr>
                            <td><b>Weighting</b></td>
                            <td><b>Min. Value</b></td>
                            
                            <td><b>Weighting</b></td>
                            <td><b>Min. Value</b></td>
                            
                            <td><b>Weighting</b></td>
                            <td><b>Min. Value</b></td>
                        </tr>
                    </thead>
                    <tbody>
                        <?php foreach ($customerFactorList as $cf) { ?>
                            <tr>
                                <td><?= $cf['label'] ?></td>
                                  <?php foreach ($customerList as $c) {?>
                                  <td><?= $customerFactorsInfo[$r['id']][$c['id']][$cf['id']]['factor_weight'] ?></td>
                                    <td><?= $customerFactorsInfo[$r['id']][$c['id']][$cf['id']]['factor_min_value'] ?></td>

                                  <?php } ?>
                            </tr>
                        <?php } ?>

                    </tbody>
                </table>
            <?php } ?>
           
        </div>
        <!-- /.row -->

    </div>
    <!-- /.container-fluid -->

</div>
<!-- /#page-wrapper -->

