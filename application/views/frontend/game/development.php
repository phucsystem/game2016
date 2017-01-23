<div id="page-wrapper">

    <div class="container-fluid">
        <?= form_open('game/development', array('class' => 'form-validate', 'id' => 'form-game-development')); ?>

        <!-- Page Heading -->
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">
                    Develop new product  <small>  </small>
                </h1>
            </div>
        </div>
        <!-- /.row -->
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title"><i class="fa fa-bicycle fa-fw"></i> Product Summary</h3>
                    </div>
                    <div class="panel-body ">
                        <div class='col-lg-6'>
                            <?= img(array('src' => 'assets/imgs/scooter.png', 'class' => 'product-image')) ?>
                        </div>
                        <div class='col-lg-6'>
                            <div class="form-group col-lg-12">
                                <label>Product Name</label>
                                <input class="form-control validate[required]" placeholder="" id="product-name"  name="product[name]">
                            </div>
                            <div class="form-group col-lg-6">
                                <label>Sum Cost</label>
                                <input class="form-control " placeholder="" readonly id="product-summary-cost" name="product[selling_cost]">
                            </div>
                            <div class="form-group col-lg-6">
                                <label>Design</label>
                                <input class="form-control " placeholder="" readonly id="product-summary-design" name="product[design]">
                            </div>
                            <div class="form-group col-lg-6">
                                <label>Reliability</label>
                                <input class="form-control " placeholder="" readonly id="product-summary-reliability" name="product[reliability]">
                            </div>
                            <div class="form-group col-lg-6">
                                <label>Range</label>
                                <input class="form-control " placeholder="" readonly id="product-summary-range" name="product[range]"> 
                            </div>
                            <div class="form-group col-lg-12">
                                <label>Bill Of Components</label>
                                <div id="component-list">

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title"><i class="fa fa-pencil fa-fw"></i> Cost Summary</h3>
                    </div>
                    <div class="panel-body">
                        <div class="form-group col-lg-6">
                            <label>Money</label>
                            <input class="form-control " placeholder="" readonly value="<?= $teamMoney ?>">
                        </div>

                        <div class="form-group col-lg-6">
                            <label>Development Cost</label>
                            <input class="form-control " placeholder="" readonly id="product-development-cost" value="<?= $developmentCost ?>">
                        </div>

                        <div class="form-group col-lg-6">
                            <label>Total Component Cost</label>
                            <input class="form-control " placeholder="" readonly id="product-component-cost" value="0.0">
                        </div>

                        <div class="form-group col-lg-6">
                            <label>Manufacturing Costs</label>
                            <input name="product[manufacture_cost]" class="form-control " placeholder="" readonly id="product-manufacturing-cost" value ="<?= $manufacturingCost ?>">
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- /.row -->

        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title"><i class="fa fa-cogs fa-fw"></i> Product Selection</h3>
                    </div>
                    <div class="panel-body">
                        <div class="table-responsive">
                            <table class="table table-bordered table-hover table-striped">
                                <thead>
                                    <tr>
                                        <th>Component</th>
                                        <th>Material</th>
                                        <th>In House Manufacturing</th>
                                        <th>Required / Optional</th>
                                        <th>Qty Per Product</th>
                                        <th>Cost</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php foreach ($this->data['components'] as $key => $value) { ?>

                                        <tr>
                                            <td><?= ucfirst($value['name']) ?></td>
                                            <td>
                                                <select name="product[component][<?= $value['id'] ?>]" onchange="selectComponent(<?= $key ?>, <?= $value['inhouse_manufacturing'] ?>)" class="form-control custom-select <?php
                                                if ($value['require'] == COMPONENT_REQUIRED) {
                                                    echo "validate[required]";
                                                }
                                                ?>" 
                                                        id="component<?= $key ?>" name="component<?= $key ?>" onchange="updateCost('component-seat')">
                                                    <option value="">-----</option>
                                                    <?php foreach ($value['materials'] as $mKey => $mValue) { ?>
                                                        <option value="<?= $mValue['id'] ?>" price="<?= $mValue['cost'] ?>"
                                                                range="<?= $mValue['range'] ?>" design="<?= $mValue['design'] ?>"
                                                                reliability="<?= $mValue['reliability'] ?>"   component="<?= ucfirst($value['name']) ?>" 
                                                                image="<?= $mValue['image'] ?>"><?= ucfirst($mValue['name']) ?></option>
                                                            <?php } ?>
                                                </select>
                                            </td>
                                            <td>
                                                <?php
                                                if ($value['inhouse_manufacturing'] == 1) {
                                                    echo "Possible";
                                                } else {
                                                    echo "Not Possible";
                                                }
                                                ?>
                                            </td>
                                            <td>
                                                <?php
                                                if ($value['require'] == COMPONENT_REQUIRED) {
                                                    echo "Required";
                                                } else {
                                                    echo "Optional";
                                                }
                                                ?>
                                            </td>
                                            <td><span id="component<?= $key ?>-qty">1</span></td>
                                            <td>$<span id="component<?= $key ?>-price">0.0</span></td>
                                        </tr>
                                            <?php } ?>
                                </tbody>
                            </table>
                            <div >
                                <button type="button" onclick="document.location.href = '<?= site_url('game/products') ?>'" class="btn btn-default pull-right RbtnMargin">Cancel</button>
                                <button type="button" onclick="developProduct()" class="btn btn-primary pull-right ">Develop</button>

                            </div>

                        </div>
                    </div>
                </div>

            </div>
        </div>
        <!-- /.row -->


    </div>
</form>
<!-- /.container-fluid -->

</div>
<!-- /#page-wrapper -->

<script>
    var productTotalComponentCost = 0;
    var productRange = 0;
    var productDesign = 0;
    var productReliability = 0;
    var selectComponents = [];
    var productTotalCost = 0;
    var productDevelopmentCost = <?= $developmentCost ?>;
    var productManufacturingCost = <?= $manufacturingCost ?>;
    var inhouseManufacturingCost = <?= $inhouseManuCost ?>;
    var qualityFactor = <?= $qualityFactor ?>;


    function selectComponent(id, inhouse) {
        var componentName = $('#component' + id).find(":selected").attr('component');
        var cName = $('#component' + id).find(":selected").text();
        var cPrice = $('#component' + id).find(":selected").attr('price');
        var cRange = $('#component' + id).find(":selected").attr('range');
        var cDesign = $('#component' + id).find(":selected").attr('design');
        var cImage = $('#component' + id).find(":selected").attr('image');
        var cReliability = $('#component' + id).find(":selected").attr('reliability');

        for (var i = 0; i < selectComponents.length; i++) {
            if (selectComponents[i].id == id) {
                selectComponents.splice(i, 1);
                break;
            }
        }

        if (cPrice > 0) {

            var component = {};
            component['id'] = id;
            component['name'] = cName;
            component['price'] = cPrice;
            component['range'] = cRange;
            component['design'] = cDesign;
            component['reliability'] = cReliability;
            component['inhouse'] = inhouse;
            component['image'] = cImage;
            component['component'] = componentName;
            selectComponents.push(component);

            $('#component' + id + '-price').text(cPrice);

        }
        updateProductCost();
        updateComponentList();

    }

    function updateComponentList() {
        // Clear container
        $("#component-list").html('');
        var compomentHtml = '';

        // sort list of component
        selectComponents.sort(function (a, b) {
            if (a.id < b.id)
                return -1;
            if (a.id > b.id)
                return 1;
            return 0;
        });

        for (i = 0; i < selectComponents.length; i++) {
            compomentHtml += '<div class="col-lg-3 component-container" ><div class="component-thumb-container"><img class="component-thumb" align="middle" src="' + selectComponents[i].image + '"/></div><div class="component-label-container"><span class="component-label col-lg-12">' + selectComponents[i].name + '</span></div></div>';
        }
        $("#component-list").html(compomentHtml);
    }


    function updateProductCost() {
        productTotalComponentCost = 0;
        productRange = 0;
        productReliability = 0;
        productTotalCost = 0;
        productDesign = 0;
        productTotalManufactureCost = productManufacturingCost;
        for (i = 0; i < selectComponents.length; i++) {
            productTotalComponentCost += parseInt(selectComponents[i].price);
            console.log(selectComponents[i]);
            productRange += parseInt(selectComponents[i].range);
            productReliability += parseInt(selectComponents[i].reliability);
            productDesign += parseInt(selectComponents[i].design);
            if (selectComponents[i].inhouse == 1) {
                productTotalManufactureCost += inhouseManufacturingCost;
            }
        }
        productRange *= qualityFactor;
        productReliability *= qualityFactor;
        productDesign *= qualityFactor;

        productRange = productRange.toFixed(2);
        productReliability = productReliability.toFixed(2);
        productDesign = productDesign.toFixed(2);

        productTotalCost = productTotalComponentCost + productTotalManufactureCost + productDevelopmentCost;

        $("#product-component-cost").val(productTotalComponentCost);
        $("#product-summary-range").val(productRange);
        $("#product-summary-design").val(productDesign);
        $("#product-summary-reliability").val(productReliability);
        $("#product-summary-cost").val(productTotalCost);
        $("#product-manufacturing-cost").val(productTotalManufactureCost);

    }

    function developProduct() {
        common.confirmDialog('Do you want to develop this product?', function () {
            $('#form-game-development').submit();
        });
    }

    var successAction = '<?= $successAction ?>';
    $(function () {
        switch (successAction) {
            case 'add':
                common.showNotify('Add a new product successfully');
                break;
            case 'edit':
                common.showNotify('Edit a product successfully');
                break;
        }
    });
</script>

