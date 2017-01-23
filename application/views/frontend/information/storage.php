
<div id="page-wrapper">

    <div class="container-fluid">

        <!-- Page Heading -->
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header" style="margin-top: 0px">
                    Storage References <small></small>
                </h1>
            </div>
        </div>

        <div class="tab-pane fade in active" id="region-tab-1">
            <h4>Component Storage</h4>
            <table class="table table-striped table-bordered table-hover">
                <thead>
                    <tr>
                        <th style="width:120px">Name</th>
                        <th>Material</th>
                        <th>Region</th>
                        <th>Quantity</th>
                    </tr>
                </thead>
                <tbody>
                    <?php foreach ($components as $c) { ?>
                     <?php foreach ($c['materials'] as $key => $cm) { ?>
                    <tr>
                         <?php if ($key == 0) { ?>
                        <td rowspan="<?php echo count($c['materials']) ?>">
                            <?php echo ucfirst($c['name']) ?>
                        <?php } ?>
                        <td>
                            <?= $cm['name']?>
                        <td>
                            <?= (isset($cm['region_id'])) ? $regionList[$cm['region_id']]['label']: '' ?>
                        </td>
                        <td>
                            <?= (isset($cm['storage_qty'])) ? $cm['storage_qty'] : 0 ?>
                        </td>
                    </tr>
                    <?php }} ?>
                </tbody>
            </table>
            
            <h4>Product Storage</h4>
             <table class="table table-striped table-bordered table-hover">
                <thead>
                    <tr>
                        <th style="width:120px">Product Name</th>
                        <th>Status</th>
                        <th>Region</th>
                        <th>Quantity</th>
                    </tr>
                </thead>
                <tbody>
                    <?php foreach ($product_storage as $pr){
                    if($pr['quantity']>0){?>
                        <tr>
                            <td><?= $pr['product_name'] ?></td>
                            <td><?= ($pr['status'] == PRODUCT_STATUS_NEW) ? "New" : "Used" ?></td>
                            <td><?= $pr['region_name'] ?></td>
                            <td><?= $pr['quantity'] ?></td>
                        </tr>
                    <?php }}?>
                </tbody>
            </table>
            
             <h4>Storage Capacity</h4>
             <table class="table table-striped table-bordered table-hover">
                <thead>
                    <tr>
                        <th >Region</th>
                        <th>Remain Storage Capacity</th>
                    </tr>
                </thead>
                <tbody>
                    <?php foreach ($storage_capacity as $stKey => $stValue){?>
                        <tr>
                            <td><?= $stKey ?></td>
                            <td><?= $stValue ?></td>
                        </tr>
                        <?php } ?>
                </tbody>
            </table>


        </div>
        <!-- /.row -->

    </div>
    <!-- /.container-fluid -->

</div>
<!-- /#page-wrapper -->

