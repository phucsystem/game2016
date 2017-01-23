
<div id="page-wrapper">

	<div class="container-fluid">
        <?= form_open('game/transport', array('id' => 'form-transport'))?>

        <!-- Page Heading -->
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">
					Transport <small></small>
				</h1>
			</div>
		</div>
		<!-- /.row -->

		<div class="row ">
			<div class=" col-lg-6 ">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">
							<i class="fa fa-wrench fa-fw"></i> Summary
						</h3>
					</div>
					<div class="panel-body">
						<div class="form-group ">
							<label>Money</label> <input class="form-control " placeholder=""
								disabled value="<?= $teamMoney ?>">
						</div>
					</div>
				</div>
			</div>

            <?php foreach ($regionList as $rKey => $rValue) { ?>
                <div class=" col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">
							<i class="fa fa-wrench fa-fw"></i> <?= $rValue['label'] ?></h3>
					</div>
					<div class="panel-body">

						<div class=" col-lg-12 no-padding-left">
							<div class=" col-lg-3 no-padding-left">
								<div class="form-group ">
									<label>Full Capacity</label> <input class="form-control "
										placeholder="" disabled value="<?= $store_capacity[$rKey] ?>">
								</div>
							</div>

							<div class=" col-lg-3 no-padding-left">
								<div class="form-group ">
									<label>Available Capacity</label> <input class="form-control "
										placeholder="" disabled
										value="<?= $available_capacity[$rKey] ?>">
								</div>
							</div>
						</div>
						<ul class="nav nav-tabs">
							<li class="active"><a href="#ic-new<?= $rKey ?>"
								data-toggle="tab">New Products</a></li>
							<li><a href="#ic-old<?= $rKey ?>" data-toggle="tab">Used Products</a>
							</li>
						</ul>
						<!-- Tab panes -->
						<div class="tab-content">
							<div class="tab-pane fade in active" id="ic-new<?= $rKey ?>">
								<br />
								<table class="table table-bordered table-hover table-striped">
									<thead>
										<tr>
											<th>ID</th>
											<th>Product</th>
											<th>Quantity In Stock</th>
											<th>Quantity to Transport</th>
											<th>Destination</th>
											<th>Transport Cost</th>
										</tr>
									</thead>
									<tbody>
                                            <?php
													if (isset ( $product_storage [$rKey] ) && is_array ( $product_storage [$rKey] )) {
														foreach ( $product_storage [$rKey] as $p ) {
															if ($p ['quantity'] > 0) {
																?>
                                                    <tr>
											<td>
                                                            <?= $p['item_id']?>
                                                            <input
												type='hidden'
												name='transport[<?= $rKey ?>][<?= $p['item_id'] ?>][item-id]'
												value='<?= $p['item_id'] ?>' />
											</td>
											<td><?= $p['product_name'] ?></td>
											<td>
                                                            <?= $p['quantity']?>
                                                            <input
												type='hidden'
												id='storage-qty-<?= $rKey ?>-<?= $p['item_id'] ?>'
												value='<?= $p['quantity'] ?>' />
											</td>
											<td><input class="form-control"
												id="qty-<?= $rKey ?>-<?= $p['item_id'] ?>"
												name='transport[<?= $rKey ?>][<?= $p['item_id'] ?>][qty]'
												onchange="updateTransportCost('<?= $rKey ?>','<?= $p['item_id'] ?>', 'new')" /></td>
											<td><select class="form-control "
												id="transportRegion-<?= $rKey ?>-<?= $p['item_id'] ?>"
												name='transport[<?= $rKey ?>][<?= $p['item_id'] ?>][to-region]'
												onchange="updateTransportCost(<?= $rKey ?>,<?= $p['item_id'] ?>, 'new')">
													<option value="">-----</option>
                                                                <?php foreach ($transport_region[$rKey] as $tr) { ?>
                                                                    <option
														transport-cost="<?= $transport_cost[$rKey][$tr['id']] ?>"
														value="<?= $tr['id'] ?>"><?= $tr['label'] ?></option>
                                                                <?php } ?>
                                                            </select></td>
											<td>$<span id="cost-<?= $rKey ?>-<?= $p['item_id'] ?>"
												name="transport[<?= $rKey ?>][<?= $p['item_id'] ?>]">0.0</span>
												<input
												id="hidden-cost-<?= $rKey ?>-<?= $p['item_id'] ?>-new"
												type='hidden'
												name='transport[<?= $rKey ?>][<?= $p['item_id'] ?>][transport-cost]'
												value='<?= $p['item_id'] ?>' />

											</td>
										</tr>
                                                    <?php
															}
														}
													} else {
														?>
                                                <tr>
											<td colspan="6" class="text-center">No product is available.
											</td>
										</tr>   
                                            <?php } ?>
                                        </tbody>
								</table>
							</div>
							<div class="tab-pane fade in " id="ic-old<?= $rKey ?>">
								<br />
								<table class="table table-bordered table-hover table-striped">
									<thead>
										<tr>
											<th>ID</th>
											<th>Product</th>
											<th>Quantity In Stock</th>
											<th>Quantity to Transport</th>
											<th>Destination</th>
											<th>Transport Cost</th>
										</tr>
									</thead>
									<tbody>
                                         <?php
													if (isset ( $used_product_storage [$rKey] ) && is_array ( $used_product_storage [$rKey] )) {
														foreach ( $used_product_storage [$rKey] as $p ) {
															if ($p ['quantity'] > 0) {
																?>
                                                    <tr>
											<td>
                                                            <?= $p['item_id']?>
                                                            <input
												type='hidden'
												name='usedtransport[<?= $rKey ?>][<?= $p['item_id'] ?>][item-id]'
												value='<?= $p['item_id'] ?>' />
											</td>
											<td><?= $p['product_name'] ?></td>
											<td>
                                                            <?= $p['quantity']?>
                                                            <input
												type='hidden' id='storage-qty-<?= $rKey ?>-<?= $p['id'] ?>'
												value='<?= $p['quantity'] ?>' />
											</td>
											<td><input class="form-control"
												id="qty-<?= $rKey ?>-<?= $p['id'] ?>"
												name='usedtransport[<?= $rKey ?>][<?= $p['item_id'] ?>][qty]'
												onchange="updateTransportCost('<?= $rKey ?>','<?= $p['id'] ?>', 'used')" /></td>
											<td><select class="form-control "
												id="transportRegion-<?= $rKey ?>-<?= $p['id'] ?>"
												name='usedtransport[<?= $rKey ?>][<?= $p['item_id'] ?>][to-region]'
												onchange="updateTransportCost(<?= $rKey ?>,<?= $p['id'] ?>, 'used')">
													<option value="">-----</option>
                                                                <?php foreach ($transport_region[$rKey] as $tr) { ?>
                                                                    <option
														transport-cost="<?= $transport_cost[$rKey][$tr['id']]/2 ?>"
														value="<?= $tr['id'] ?>"><?= $tr['label'] ?></option>
                                                                <?php } ?>
                                                            </select></td>
											<td>$<span id="cost-<?= $rKey ?>-<?= $p['id'] ?>"
												name="usedtransport[<?= $rKey ?>][<?= $p['item_id'] ?>]">0.0</span>
												<input
												id="hidden-cost-<?= $rKey ?>-<?= $p['id'] ?>-used"
												type='hidden'
												name='usedtransport[<?= $rKey ?>][<?= $p['item_id'] ?>][transport-cost]'
												value='<?= $p['item_id'] ?>' />

											</td>
										</tr>
                                                    <?php
															}
														}
													} else {
														?>
                                                <tr>
											<td colspan="6" class="text-center">No product is available.
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

            <div>
				<button type="button" onclick="moveToNextStep('<?= STEP_SALE ?>')"
					class="btn btn-default pull-right RbtnMargin">Next Phase</button>
				<button type="button" class="btn btn-primary pull-right "
					onclick="transportProduct()">Transport</button>
			</div>
		</div>

		</form>
	</div>

</div>
<!-- /.container-fluid -->

</div>
<!-- /#page-wrapper -->

<script>
    var canSubmit = false;
    function updateTransportCost(fromRegion, itemId, status) {
        var Qty = parseInt($("#qty-" + fromRegion + "-" + itemId).val());
        var Cost = $("#transportRegion-" + fromRegion + '-' + itemId).find(":selected").attr('transport-cost');
        var storeQty = parseInt($('#storage-qty-' + fromRegion + '-' + itemId).val());
        if (Qty > storeQty) {
            common.showPrompt("#qty-" + fromRegion + "-" + itemId, 'The transport quantity can not exceed the store quantity!');
            canSubmit = false;
            return;
        } else {
            common.hidePrompt("#qty-" + fromRegion + "-" + itemId);
        }
        

        if (Qty > 0 && Cost > 0) {
            var totalCost = Qty * Cost;
            $("#cost-" + fromRegion + "-" + itemId).text(totalCost);
            $("#hidden-cost-" + fromRegion + "-" + itemId +'-'+ status).val(totalCost);
         

            canSubmit = true;
        }
    }

    function transportProduct() {
        if (canSubmit == true) {
            common.confirmDialog('Do you want to proceed product transport?', function () {
                $('#form-transport').submit();
            });
        }
    }
    
      var successAction = '<?= $successAction ?>';
    $(function () {
        switch (successAction) {
            case 'transport':
                common.showNotify('You have proceeded product transport successfully');
                break;
        }

    });
</script>
