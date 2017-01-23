
<div id="page-wrapper">

	<div class="container-fluid">
 <?= form_open('game/recycling', array('id' => 'form-recycling')) ?>
		<!-- Page Heading -->
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">
					Recycling <small> </small>
				</h1>
			</div>
		</div>
		<!-- /.row -->

		<div class="row">
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
			<div class="col-lg-6">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">
							<i class="fa fa-pencil fa-fw"></i> Summary
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
		</div>

		<div class="row">
			<div class="col-lg-6">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">
							<i class="fa  fa-refresh fa-fw"></i> Recycle Selection
						</h3>
					</div>
					<div class="panel-body">
						<div class="form-group ">
							<label>Region</label> 
							<input value="<?php echo $regionName ?>" disabled  class="form-control " />							
						</div>
						<div class="form-group ">
							<label>Used Product</label> <select class="form-control "
								id="used-product" onchange="selectRecycleItem('component-seat')" name="recycle[product_id]">
								<option value="0">-----</option>
								<?php foreach ($usedProducts as $u){?>
								<option qty="<?php echo $u['quantity']?>" value="<?php echo $u['item_id']?>"><?php echo $u['product_name']?></option>
								<?php } ?>
							</select>
						</div>
						<div class="form-group ">
							<label>Storage Quantity</label> 
							<input class="form-control " id="used-products-storage"
								placeholder="" value="" readonly>
						</div>
						<div class="form-group ">
							<label>Recycle Method</label> <select class="form-control "
								id="recycle-method" name="recycle[method]" in-house="1"
								onchange="updateRecycleCost()">
								<option value="0">-----</option>
								<?php foreach ($reycleMethods as $r){
								?>
								<option recycle-cost="<?php echo $r['cost']?>" 
								return-money ="<?php echo $r['return_money']?>"
								return-handlebar ="<?php echo $r['return_handlebar']?>"
								return-frame ="<?php echo $r['return_frame']?>"
								return-casing ="<?php echo $r['return_casing']?>"
								return-motor ="<?php echo $r['return_motor']?>"
								
								return-eco ="<?php echo $r['eco_credit']?>"
								return-me ="<?php echo $r['so_credit']?>"
								return-so ="<?php echo $r['me_credit']?>"
								
								value="<?php echo $r[0]['factor_value']?>"><?php echo $r[0]['factor_value']?></option>
								<?php } ?>
							</select>
						</div>
						<div class="form-group ">
							<label>Quantity</label> <input class="form-control "
								placeholder="" onchange="updateRecycleCost()" id="recycle-qty" name="recycle[qty]">
						</div>
						<div class="form-group ">
							<label>Cost</label> <input id="total-recycle-cost" class="form-control " placeholder=""
								readonly name="recycle[cost]">
								<input type="hidden" id="return-eco" name="recycle[return_eco]"/>
								<input type="hidden" id="return-me" name="recycle[return_me]"/>
								<input type="hidden" id="return-so" name="recycle[return_so]"/>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-6">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">
							<i class="fa fa-arrow-circle-right fa-fw"></i> Return Result
						</h3>
					</div>
					<div class="panel-body">

						<div class="form-group ">
							<label>Return Money</label> <input id="input-return-money" class="form-control " placeholder="" readonly name="recycle[return_money]">
						</div>
						<div class="form-group ">
							<label>Handlebars</label> <input id="input-return-handlebar" class="form-control "
								placeholder="" readonly name="recycle[return_handlebar]">
						</div>
						<div class="form-group ">
							<label>Frame</label> <input id="input-return-frame" class="form-control " placeholder=""
								readonly name="recycle[return_frame]">
						</div>
						<div class="form-group ">
							<label>Casing</label> <input id="input-return-casing" class="form-control " placeholder=""
								readonly name="recycle[return_casing]">
						</div>
						<div class="form-group ">
							<label>Motor</label> <input id="input-return-motor" class="form-control " placeholder=""
								readonly name="recycle[return_motor]">
						</div>

					</div>
				</div>
				<div>
					<button  type="button" onclick="moveToNextStep('<?= STEP_PRODUCTION ?>')"
						class="btn btn-default pull-right RbtnMargin">Next Phase</button>
					<button type="button" class="btn btn-primary pull-right " onclick="submitRecycle()">Recycle</button>
				</div>
			</div>

		</div>
</form>
	</div>
	<!-- /.container-fluid -->

</div>
<!-- /#page-wrapper -->

<script>
    var teamId = '<?= $teamInfo['id'] ?>';
    var successAction = '<?php echo $successAction;?>';
    var canSubmit = false;
        
    function checkRecycle() {
        common.showLoadingModal();
        $.ajax({
            url: '<?= site_url('game/checkrecycle') ?>/' + teamId,
            method: "GET",
            dataType: 'json',
        }).success(function (data) {
            common.closeLoadingModal();
            if (data.recycle_data.length > 0) {
                showSelectRecycle(data.recycle_data);
            } else {
//                 common.alertDialog('No used product is returned in this round.');
            }
        });
    }
    ;
    function showSelectRecycle(data) {
        recycleContent = '<table class="table table-bordered table-hover table-striped"><thead>\n\
                        <tr><th>Product Id</th>\n\
                        <th>Product Name</th>\n\
                        <th>Region</th>\n\
                        <th>Available Capacity</th>\n\
                        \n\<th>Offered Qty</th>\n\
                        \n\<th>Approve Qty</th>\n\
                        </tr></thead><tbody id="recycle-table">';
        $.each(data, function (key, value) {
            recycleContent += '<tr><td>' + value.product_id + '</td>\n\
                                <td>' + value.product_name + '</td>\n\
                                <td>' + value.region_name + '</td>\n\
                                <td>' + value.available_capacity + '</td>\n\
                                <td>' + value.qty + '</td>\n\
                                \n\<td><input name="recycle_data['+ value.id +'][qty]" class="form-control" style="width:100px"/>'
                                +'<input type="hidden" name=recycle_data['+ value.id +'][product_id] value="'+ value.product_id +'"/><input type="hidden" name=recycle_data['+ value.id +'][region_id] value="'+ value.region_id +'"/></td></tr>';
        });
        recycleContent += '</tbody></table>';
        bootbox.dialog({
            size: 'large',
            title: "Recycle Form",
            message: '<div class="row">  ' +
                    '<div class="col-md-12"> ' +
                    '<form class="form-horizontal" action="<?= site_url('game/receiveproduct') ?>"> ' +
                    '<div class="col-md-12"><div class="col-md-12 no-padding-left"> ' +
                    recycleContent +
                    '</div>' +
                    '</form> </div>  </div>',
            buttons: {
                danger: {
                    label: "Reject",
                    className: "btn-danger",
                    callback: rejectRecycle
                },
                success: {
                    label: "Approve",
                    className: "btn-primary",
                    callback: approveRecycle
                },
            }
        }
        );
    }
    
    function rejectRecycle(){
    		  $.ajax({
		            url: '<?= site_url('game/rejectrecycle') ?>/' + teamId,
		            method: "GET",
		            dataType: 'json',
		        }).success(function (data) {
		            location.reload();
		        });
    	return;
    			
        
    }
    
    function approveRecycle(){
    			 $.ajax({
    		            url: '<?= site_url('game/approverecycle') ?>/' + teamId,
    		            method: "POST",
    		            dataType: 'json',
    		            data:$("[name^='recycle_data").serialize(),
    		        }).success(function (data) {
    		        	 location.href = "<?php echo site_url('game/recycling').'/success/receive'?>"
    		        });
    	return;
     
    }

    function selectRecycleItem(){
        var qty = $("#used-product option:selected").attr('qty');
        if(qty>0){
            $("#used-products-storage").val(qty);
        }else{
        	$("#used-products-storage").val(0);
        }
    }

    function updateRecycleCost(){
        var recycle_qty = $("#recycle-qty").val();
        var storage_qty = $("#used-products-storage").val();
         
        if(recycle_qty > 0 ){
        	canSubmit = true;
			if(parseInt(recycle_qty) > parseInt(storage_qty)){
				 canSubmit = false;
			}
			
            var recycle_cost = $("#recycle-method option:selected").attr('recycle-cost');

            var return_money = $("#recycle-method option:selected").attr('return-money')*recycle_qty;
            var return_handlebar = Math.floor($("#recycle-method option:selected").attr('return-handlebar')*recycle_qty);
            var return_frame = Math.floor($("#recycle-method option:selected").attr('return-frame')*recycle_qty);
            var return_casing = Math.floor($("#recycle-method option:selected").attr('return-casing')*recycle_qty);
            var return_motor = Math.floor($("#recycle-method option:selected").attr('return-motor')*recycle_qty);

            var return_eco = $("#recycle-method option:selected").attr('return-eco')*recycle_qty;
            var return_so = $("#recycle-method option:selected").attr('return-so')*recycle_qty;
            var return_me = $("#recycle-method option:selected").attr('return-me')*recycle_qty;

            $("#return-eco").val(return_eco);
            $("#return-me").val(return_so);
            $("#return-so").val(return_me);

			$("#input-return-money").val(return_money);
			$("#input-return-handlebar").val(return_handlebar);
			$("#input-return-frame").val(return_frame);
			$("#input-return-casing").val(return_casing);
			$("#input-return-motor").val(return_motor);
            
			if(recycle_cost>0){
	            var totalRecycleCost = recycle_cost*recycle_qty;
	            $("#total-recycle-cost").val(totalRecycleCost);
			}
            
        }
    }

    function submitRecycle(){
        if(!canSubmit){
            common.alertDialog('The recycle quantity exceed the used product storage quantity!!!');
        }else{
            common.confirmDialog('Do you want to excute recycling process?', function(){
            	$('#form-recycling').submit();
            });
            
        }
    }
    
    $(function () {
     
            switch(successAction){
            case 'receive':
            	 common.showNotify('Receive used product successfully');
                break;
            case 'recycle':
            	 common.showNotify('Excute recycling successfully');
                break;
            default:
            	 checkRecycle();
                 break;
            }
    });

    

</script>
