<?php $isSubmit = false; ?>
<div id="page-wrapper">

    <div class="container-fluid">
        <?= form_open('game/sales', array('id' => 'form-sale')) ?>

        <!-- Page Heading -->
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">
                    Sales <small></small>
                </h1>
            </div>
        </div>
        <!-- /.row -->

        <div class="row  ">
            <div class=" col-lg-6">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title"><i class="fa fa-wrench fa-fw"></i> Summary</h3>
                    </div>
                    <div class="panel-body">
                        <div class="form-group ">
                            <label>Money</label>
                            <input class="form-control " placeholder="" disabled value="<?= $teamMoney ?>">
                        </div>
                    </div>
                </div>
            </div>


            <?php foreach ($regionList as $rKey => $rValue) {
                ?>
                <div class=" col-lg-12 ">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title"><i class="fa fa-wrench fa-fw"></i> <?= $rValue['label'] ?></h3>
                        </div>
                        <div class="panel-body">
                            <ul class="nav nav-tabs">
                                <li class="active"><a href="#offer_pro<?= $rKey ?>" data-toggle="tab">Offered Product To Market</a>
                                </li>
                                <li><a href="#new_pro<?= $rKey ?>" data-toggle="tab">New Products In Stock</a>
                                </li>
                            </ul>
                            <!-- Tab panes -->
                            <div class="tab-content">
                                <div class="tab-pane fade in active" id="offer_pro<?= $rKey ?>">
                                    <br/>
                                    <table class="table table-bordered table-hover table-striped">
                                        <thead>
                                            <tr>
                                                <th>Product</th>
                                                <!--<th>ID</th>-->
                                                <th>Quantity Offered</th>
                                                <th>Manufacturing Cost Per Product</th>
                                                <th>Offered Price Per Product</th>
                                                <th>Total Sold Revenue</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <?php
                                            if (isset($product_storage[$rKey]) && is_array($product_storage[$rKey])) {
                                                foreach ($product_storage[$rKey] as $p) {
                                                    if (isset($sale_data[$rValue['id']][$p['item_id']]['quantity'])) {
                                                        $isSubmit = true;
                                                    }
                                                    ?>
                                                    <tr>
                                                        <td>
                                                            <?= $p['product_name'] ?>
                                                            <input type="hidden"  name="sale[<?= $rKey ?>][<?= $p['id'] ?>][id]" value="<?= $p['item_id'] ?>"/>
                                                        </td>
                                                        <!--<td>IDxxxx</td>-->
                                                        <td>
                                                            <input type="hidden" id="sale-<?= $rKey ?>-<?= $p['id'] ?>-instock" value="<?= $p['quantity'] ?>"/>
                                                            <input class="form-control" name="sale[<?= $rKey ?>][<?= $p['id'] ?>][qty]" 
                                                                   id="sale-<?= $rKey ?>-<?= $p['id'] ?>-qty" onchange="updateSold(<?= $rKey ?>,<?= $p['id'] ?>)"
                                                                   value="<?php echo (isset($sale_data[$rValue['id']][$p['item_id']]['quantity']) ? $sale_data[$rValue['id']][$p['item_id']]['quantity'] : '') ?>"/>
                                                        </td>
                                                        <td>
                                                            $<?= $p['price'] ?>
                                                            <input type="hidden"  id="sale-<?= $rKey ?>-<?= $p['id'] ?>-price" value="<?= $p['price'] ?>"/>
                                                        </td>
                                                        <td>
                                                            <input type="text" class="form-control" name="sale[<?= $rKey ?>][<?= $p['id'] ?>][offer]" id="sale-<?= $rKey ?>-<?= $p['id'] ?>-offer" onchange="updateSold(<?= $rKey ?>,<?= $p['id'] ?>)"
                                                                   value="<?php echo (isset($sale_data[$rValue['id']][$p['item_id']]['offer_price']) ? $sale_data[$rValue['id']][$p['item_id']]['offer_price'] : '') ?>"/>
                                                        </td>
                                                        <td>$<span id="sale-<?= $rKey ?>-<?= $p['id'] ?>-sold">
                                                                <?php echo (isset($sale_data[$rValue['id']][$p['item_id']]['offer_price']) ? $sale_data[$rValue['id']][$p['item_id']]['offer_price'] * $sale_data[$rValue['id']][$p['item_id']]['quantity'] : '') ?>
                                                            </span></td>
                                                    </tr>
                                                    <?php
                                                }
                                            } else {
                                                ?>
                                                <tr>
                                                    <td colspan="5" class="text-center">
                                                        No product is available.
                                                    </td>
                                                </tr>
                                            <?php } ?>

                                        </tbody>
                                    </table>

                                </div>

                                <div class="tab-pane fade in " id="new_pro<?= $rKey ?>">
                                    <br/>
                                    <table class="table table-bordered table-hover table-striped">
                                        <thead>
                                            <tr>
                                                <th>Product</th>
                                                <!--<th>ID</th>-->
                                                <th>Quantity In Stock</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <?php
                                            if (isset($product_storage[$rKey]) && is_array($product_storage[$rKey])) {
                                                foreach ($product_storage[$rKey] as $p) {
                                                    ?>
                                                    <tr>
                                                        <td><?= $p['product_name'] ?></td>
                                                        <!--<td>IDxxxx</td>-->
                                                        <td><?= $p['quantity'] ?></td>
                                                    </tr>
                                                    <?php
                                                }
                                            } else {
                                                ?>
                                                <tr>
                                                    <td colspan="5" class="text-center">
                                                        No product is available.
                                                    </td>
                                                </tr>
                                            <?php } ?>
                                        </tbody>
                                    </table>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            <?php } ?>


            <div >
                <button type="button" onclick="endRound()" class="btn btn-default pull-right RbtnMargin">Finish Round</button>
                <button type="button" class="btn btn-primary pull-right " onclick="submitSale()">Sale</button>
            </div>


        </div>
        </form>

    </div>

</div>
<!-- /.container-fluid -->

</div>
<!-- /.container-fluid -->


<!-- /#page-wrapper -->

<script>
    var canSubmit = <?php echo ($isSubmit) ? "true" : "false" ?>;
    function endRound() {
        common.confirmDialog('Do you want to finish round?', function () {
            common.showLoadingModal();
            $.ajax({
                url: "<?= site_url('/game/endround') ?>",
                dataType: 'json'
            }).success(function (data) {
                if (data['result'] == true) {
                    window.location = '<?= site_url('game/dashboard'); ?>'
                }
                common.closeLoadingModal();
            });
        });

    }

    function updateSold(region, item) {
        var qty = parseInt($("#sale-" + region + '-' + item + '-qty').val());
        var instock = parseInt($("#sale-" + region + '-' + item + '-instock').val());
        if (qty <= instock) {
            var price = $("#sale-" + region + '-' + item + '-price').val();
            var offerPrice = $("#sale-" + region + '-' + item + '-offer').val();
            if (qty > 0 && offerPrice > 0) {
                var sold = qty * offerPrice;
                $("#sale-" + region + '-' + item + '-sold').text(sold);
            } else {
                $("#sale-" + region + '-' + item + '-sold').text('');
            }

            common.hidePrompt("#sale-" + region + '-' + item + '-qty');
            canSubmit = true;
        } else {
            common.showPrompt("#sale-" + region + '-' + item + '-qty', 'The offer quantity must be less than or equal to the product\'s stock quantity.');
            canSubmit = false;
        }

    }

    function submitSale() {
        if (canSubmit == true) {
            common.confirmDialog('Do you want to proceed product sale?', function () {
                $('#form-sale').submit();
            });
        }

    }


    var successAction = '<?= $successAction ?>';
    $(function () {
        switch (successAction) {
            case 'sale':
                common.showNotify('You have offered product sales successfully');
                break;
        }

    });
</script>

