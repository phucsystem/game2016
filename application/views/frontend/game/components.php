
<div id="page-wrapper">

    <div class="container-fluid">

        <!-- Page Heading -->
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">
                    Components <small></small>
                </h1>
            </div>
        </div>

        <div class="row">
            <div class="col-lg-6">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title"><i class="fa fa-pencil fa-fw"></i> Summary</h3>
                    </div>
                    <div class="panel-body">
                        <div class="form-group ">
                            <label>Money</label>
                            <input class="form-control " placeholder="" disabled value='<?= $teamMoney ?>'>
                        </div>
                    </div>
                </div>
            </div>
        </div>



        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title"><i class="fa fa-dropbox fa-fw"></i> Component Summary</h3>
                    </div>
                    <div class="panel-body">
                        <div class="panel-body">
                            <!-- Nav tabs -->
                            <ul class="nav nav-tabs">
                                <li class="active"><a href="#component_storage" data-toggle="tab">Component Storage</a>
                                </li>
                                <li><a href="#product_component" data-toggle="tab">Product</a>
                                </li>
                            </ul>

                            <!-- Tab panes -->
                            <div class="tab-content">
                                <div class="tab-pane fade in active" id="component_storage" name="component-storage">
                                    <?= form_open('game/components', array('id' => 'form-purchase-component')) ?>
                                    <br/>
                                    <table class="table table-bordered table-hover table-striped">
                                        <div class="col-lg-3 no-padding-left">
                                            <div class="form-group ">
                                                <label>Total purchasing cost</label>
                                                <input id="total-purchase-cost" class="form-control " placeholder="" readonly="" value="0">

                                            </div>
                                        </div>
                                        <div class="col-lg-3 no-padding-left">
                                            <div class="form-group ">
                                                <button type="button" onclick="fastPurchase()" class="btn btn-success pull-left RbtnMargin" style="margin-top:24px;"><i style="font-size: 20px;" class="fa fa-bolt "></i>   Fast Purchase</button>
                                            </div>
                                        </div>
                                        <thead>
                                            <tr>
                                                <th>Component</th>
                                                <th>Type</th>
                                                <th>Price per unit</th>
                                                <th>Storage quantity </th>
                                                <th>Purchasing quantity </th>
                                                <th>Purchasing costs </th>
                                            </tr>
                                        </thead>
                                        <tbody>

                                            <?php foreach ($this->data['components'] as $key => $value) { ?>
                                                <tr>
                                                    <td>
                                                        <?= ucfirst($value['name']) ?>
                                                        <input type="hidden" name="component[<?= $value['id'] ?>][id]" value="<?= $value['id'] ?>"
                                                    </td>
                                                    <td>
                                                        <select name="component[<?= $value['id'] ?>][material]" index="component<?= $value['id'] ?>" onchange="selectComponent(<?= $key ?>)" class="form-control component-select"
                                                                id="component<?= $key ?>" name="component<?= $key ?>" in-house="1" >
                                                            <option value="">-----</option>
                                                            <?php foreach ($value['materials'] as $mKey => $mValue) { ?>
                                                                <option value="<?= $mValue['id'] ?>" price="<?= $mValue['cost'] ?>"
                                                                        range="<?= $mValue['range'] ?>" design="<?= $mValue['design'] ?>"
                                                                        reliability="<?= $mValue['reliability'] ?>" storage_qty="<?= (int) $mValue['storage_qty'] ?>"><?= ucfirst($mValue['name']) ?></option>
                                                                    <?php } ?>
                                                        </select>
                                                    </td>
                                                    <td>
                                                        $<span id="component<?= $key ?>-price">0.0</span>
                                                        <input id="component<?= $key ?>-cost" type="hidden" name="component[<?= $value['id'] ?>][cost]" value="0"/>

                                                    </td>
                                                    <td><span type=""  id="<?= $key ?>-storeQty" >0</span></td>
                                                    <td><input name="component[<?= $value['id'] ?>][qty]" type="" class="form-control" id="<?= $key ?>-purchaseQty" onchange="updatePurchaseCost(<?= $key ?>)" value="0"/></td>
                                                    <td>$<span type="" id="<?= $key ?>-purchaseCost" >0.0</span></td>
                                                </tr>
                                            <?php } ?>
                                        </tbody>
                                    </table>
                                    <div >
                                        <button type="button" onclick="moveToNextStep('<?= STEP_RECYCLING ?>')"class="btn btn-default pull-right RbtnMargin">Next Phase</button>
                                        <button type="button"  onclick="purchaseComponent()" class="btn btn-primary pull-right RbtnMargin">Purchase Components</button>
                                    </div>
                                    </form>
                                </div>

                                <div class="tab-pane fade" id="product_component" name="product-component">
                                    <br/>
                                    <table class="table table-bordered table-hover table-striped">

                                        <div class="form-group col-lg-3 no-padding-left">
                                            <label>Product Name</label>
                                            <select class="form-control" id="product-name"  name="product[id]" onchange="loadProduct()">
                                                <?php foreach ($developedProduct as $product) { ?>
                                                    <option value="<?= $product['id'] ?>"><?= $product['name'] ?></option>
                                                <?php } ?>
                                            </select>
                                        </div>
                                        <thead>
                                            <tr>
                                                <th>Component</th>
                                                <th>Material</th>
                                                <th>Quantity Per Product</th>
                                            </tr>
                                        </thead>
                                        <tbody id='tbl-product-components'>
                                        </tbody>
                                    </table>
                                    <div >

                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- /.row -->

        <!-- /.row -->

    </div>
    <!-- /.container-fluid -->

</div>
<!-- /#page-wrapper -->
<script>
    var selectComponents = [];
    var totalCostPurchase = 0;
    function loadProduct() {
        var productId = $('#product-name').val();
        if (productId > 0) {
            $('#tbl-product-components').html('');
            common.showLoadingModal();
            $.ajax({
                url: "<?= site_url('/game/getproduct') ?>/" + productId,
                dataType: 'json'
            }).success(function (data) {
                var componentHtml = '';
                $.each(data.info.component, function (key, value) {
                    $('#component' + key).val(value.material_id);
                    componentHtml += '<tr><td>' + value.component_name + '</td><td>' + value.material_name + '</td><td>' + parseInt(value.quantity_per_product) + '</td></tr>';
                    // Update product point
                });
                $('#tbl-product-components').html(componentHtml);
                common.closeLoadingModal();
            });
        }

    }

    function selectComponent(id) {
        var cPrice = $('#component' + id).find(":selected").attr('price');
        var cQty = $('#component' + id).find(":selected").attr('storage_qty');

        for (var i = 1; i < selectComponents.length; i++) {
            if (selectComponents[i].id == id) {
                selectComponents.splice(i, 1);
                break;
            }
        }
        var component = {};
        component['id'] = id;
        component['price'] = cPrice;
        component['qty'] = cQty;

        selectComponents.push(component);

        $('#component' + id + '-price').text(cPrice);
        $('#component' + id + '-cost').val(cPrice);
        $('#' + id + '-storeQty').text(cQty);
        updatePurchaseCost(id);
    }


    function updatePurchaseCost(id) {
        totalCostPurchase = 0;
        var cPrice = $('#component' + id).find(":selected").attr('price');
        var purchaseQty = $('#' + id + '-purchaseQty').val();

        // Update total purchase cost
        for (var i = 0; i < selectComponents.length; i++) {
            if (selectComponents[i] != null && selectComponents[i].id == id) {
                selectComponents[i].qty = purchaseQty;
            }
            if (selectComponents[i].qty > 0 && selectComponents[i].price > 0) {

                totalCostPurchase += selectComponents[i].qty * selectComponents[i].price;
            }
        }
        $('#total-purchase-cost').val(totalCostPurchase);

        if (cPrice > 0 && purchaseQty > 0) {
            var purchaseCost = cPrice * purchaseQty;
            $('#' + id + '-purchaseCost').text(purchaseCost);
            //  updateStoreQty(id);
        }
    }

    function updateStoreQty(id) {
        var purchastQty = $('#' + id + '-purchaseQty').val();
        var storeQty = purchastQty;
        $('#' + id + '-storeQty').text(storeQty);

    }
    ;

    function purchaseComponent() {
        var currMoney = '<?= $teamMoney ?>';
        if (totalCostPurchase > parseInt(currMoney)) {
            common.alertDialog('The total purchase amount is exceed team\'s current  money!');
            return;
        }
        common.confirmDialog('Do you want to purchase selected items?', function () {
            $('#form-purchase-component').submit();
        });
    }
    
    function fastPurchase (){
         bootbox.dialog({
            size: 'medium',
            title: "Fast Purchase",
            message: '<div class="row">  ' +
                    '<div class="col-md-12"> ' +
                    '<form class="form-horizontal" action=""> ' +
                    '<div class="col-md-12"><div class="col-md-12 no-padding-left"> ' +
                    '<div class="form-group"><label>Select product</label><select id="fp-product-id" class="form-control">'+
                    <?php foreach ($developedProduct as $product) { ?>
                         '<option value="<?= $product['id'] ?>"><?= $product['name'] ?></option>'+
                    <?php } ?>
                    '</select></div>'+
                    '<div class="form-group"><label>Quantity of product</label><input id="fp-product-qty" class="form-control">'+
                    '</div>' +
                    '</form> </div>  </div>',
            buttons: {
                danger: {
                    label: "Cancel",
                    className: "btn-default",
                },
                success: {
                    label: "Purchase",
                    className: "btn-primary",
                    callback: selectFastPurchaseProd
                },
                
            }
        }
        );
    }
    
    function selectFastPurchaseProd(){
        var productId = $("#fp-product-id").val();
        var productQty = $("#fp-product-qty").val();
        if (productId > 0) {
            common.showLoadingModal();
            $.ajax({
                url: "<?= site_url('/game/getproduct') ?>/" + productId,
                dataType: 'json'
            }).success(function (data) {
                $.each(data.info.component, function (key, value) {
                    $( "input[name*='component[" + value.component_id +"][qty]']" ).val( value.quantity_per_product * productQty );
                    $('*[index="component' +   value.component_id +'"]').val(value.material_id ).change();
                });
                common.closeLoadingModal();
            });
        }
    }


    var successAction = '<?= $successAction ?>';
    $(function () {
        switch (successAction) {
            case 'purchase':
                common.showNotify('You have purchased components successfully');
                break;
        }

        loadProduct();
});
</script>
    
