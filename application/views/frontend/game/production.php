
<div id="page-wrapper">

    <div class="container-fluid">
        <?= form_open('game/production', array('id' => 'form-production')) ?>
        <!-- Page Heading -->
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">
                    Production <small> </small>
                </h1>
            </div>
        </div>
        <!-- /.row -->
        <div class="row col-lg-12 no-padding-right no-margin-right">
            <?php if(!empty($err_msg)){ ?>
              <div class=" col-lg-12 no-padding-left ">
                  <div class="alert alert-danger" role="alert">
                      <i class="fa fa-times-circle"></i> <strong>Alert:</strong> <?php echo $err_msg; ?>
                      <ul>
                         <?php if(!empty($lack_components)){ 
                         foreach ($lack_components as $c){?>
                          <li><?= $c['component_name']?></li>
                       <?php }}?></ul>
                  </div>
            </div>
            <?php } ?>
          
            <div class=" col-lg-6 no-padding-left ">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title"><i class="fa fa-wrench fa-fw"></i> Summary</h3>
                    </div>
                    <div class="panel-body">
                        <div class="form-group  col-lg-12">
                            <label>Money</label>
                            <input class="form-control " placeholder="" disabled value="<?= $teamMoney ?>">
                        </div>
                        <div class="form-group col-lg-12">
                            <label>Capacity Left</label>
                            <input class="form-control " placeholder="" readonly="" value="<?= $remain_capacity ?>">
                        </div>
                    </div>
                </div>
            </div>
            <div class=" col-lg-6 no-padding-left no-padding-right">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title"><i class="fa fa-wrench fa-fw"></i> Production Info</h3>
                    </div>
                    <div class="panel-body">
                        <div class="form-group col-lg-12">
                            <label>Product Name</label>
                            <select class="form-control" id="product-name"  name="production[product-id]" onchange="updateProductionCost()">
                                <?php foreach ($developedProduct as $product) { ?>
                                    <option value="<?= $product['id'] ?>" manu-cost="<?= $product['manufacturing_cost'] ?>"><?= $product['name'] ?></option>
                                <?php } ?>
                            </select>
                        </div>
                        <div class="form-group col-lg-12">
                            <label>Quantity</label>
                            <input class="form-control " placeholder="" id="production-qty" name="production[qty]" onchange="updateProductionCost()">
                        </div>
                        <div class="form-group col-lg-12">
                            <label>Cost</label>
                            <input class="form-control " placeholder="" readonly="" id="production-cost" name="production[cost]">
                        </div>

                    </div>
                </div>

            </div>
        </div>

        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title"><i class="fa fa-cogs fa-fw"></i> Production Records</h3>
                    </div>
                    <div class="panel-body">
                        <div class="table-responsive">
                            <table class="table table-bordered table-hover table-striped">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Product</th>
                                        <th>Quantity</th>
                                        <th>Cost</th>
                                        <th>Total Cost</th>
                                        <th>Date</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php
                                    $index = 1;
                                    if (isset($productionRecord) && is_array($productionRecord))
                                    {
                                        foreach ($productionRecord as $r) {
                                            ?>
                                            <tr>
                                                <td><?= $index ?></td>
                                                <td><?= $r['product_name'] ?></td>
                                                <td><?= $r['value'] ?></td>
                                                <td><?= $r['price'] ?></td>
                                                <td><?= $r['total_cost'] ?></td>
                                                <td><?= format_date($r['created_date']) ?></td>

                                            </tr>
        <?php $index++;
    }
} ?>
                                </tbody>
                            </table>

                        </div>
                        <div >
                            <button type="button" onclick="moveToNextStep('<?= STEP_TRANSPORT ?>')" class="btn btn-default pull-right RbtnMargin">Next Phase</button>
                            <button type="button" onclick="startProduction()" class="btn btn-primary pull-right ">Start Production</button>
                        </div>
                    </div>
                </div>

            </div>
        </div>



        </form>

    </div>
    <!-- /.container-fluid -->

</div>
<!-- /#page-wrapper -->

<script>
    var totalCost = 0;
    var regionCostFactor = <?= $regionCostFactor ?>;
    function updateProductionCost() {
        var manufactureCost = $('#product-name').find(":selected").attr('manu-cost');
        var productionQty = $('#production-qty').val();
        if (productionQty > 0 && productionQty > 0) {
            totalCost = manufactureCost * productionQty * regionCostFactor;
            totalCost = totalCost.toFixed(0);
            $('#production-cost').val(totalCost);
        }

    }

    function startProduction() {
        common.confirmDialog('Do you want to proceed production?', function () {
            var teamMoney = <?= $teamMoney ?>;
            var teamManufactureCapacity = <?= $remain_capacity ?>;
            var productionQty = $('#production-qty').val();

            if (totalCost > teamMoney) {
                common.alertDialog('The total production amount is exceed team\'s current  money!');
                return;
            }

            if (productionQty > teamManufactureCapacity) {
                common.alertDialog('The total production quantity is exceed factory\'s current  capacity!');
                return;
            }

            $("#form-production").submit();
        });
    }

    var successAction = '<?= $successAction ?>';
    $(function () {
        switch (successAction) {
            case 'produce':
                common.showNotify('You have manufacture the new products successfully.');
                break;
        }


    });
</script>