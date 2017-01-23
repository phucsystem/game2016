<div class="form-group col-lg-12">
    <h4 class="page-header" style="margin-top:0px">
        Filter Options
    </h4>
    <div class="form-group col-lg-6">
        <label>Region</label>
        <select class="form-control " id="sale-team-id" onchange='updateMarketVolume()'>
            <?php foreach ($regionList as $r) { ?>
                <option  value="<?= $r['id'] ?>"><?= $r['label'] ?></option>
            <?php } ?>
        </select>
    </div>

    <div class="form-group col-lg-6 ">
        <label>Customer</label>
        <select name='sale[customer]'  class="form-control " name="game-id" id="sale-customer-id" onchange='updateMarketVolume()'>
            <?php foreach ($customerList as $c) { ?>
                <option  value="<?= $c['id'] ?>"><?= $c['label'] ?></option>
            <?php } ?>
        </select>
    </div>
    <div class="form-group col-lg-6">
        <label>Remain Market Volume</label>
        <input id="total-available-market" class="form-control " placeholder=""  value="0" readonly="">
    </div>  

    <div class="form-group col-lg-6">
        <label></label><br/><br/>
        <button class="btn btn-outline btn-default pull-right "  type="button" onclick="filterSale()"><i class="fa fa-filter"></i>   Filter Data</button>
    </div>  
</div>

<div class="  col-lg-12">
    <h4 class="page-header"  style="margin-top:0px">
        Accepted Sale Data  
    </h4>

    <table class="table table-bordered table-hover table-striped dataTable ">
        <thead>
            <tr>
                <th>Team Name</th>
                <th>Product Id</th>
                <th>Product Name</th>
                <th>Product Total Weight</th>
                <th>Offered Quantity</th>
                <th>Offered Price Per Product</th>
                <th>Sale Quantity</th>
                <th>Total Payment</th>
            </tr>
        </thead>
        <tbody id="sale-content-body">
        </tbody>
    </table>

    <div class="pull-right">
        <button onclick="startSale()" class="btn btn-outline btn-primary pull-right " type="button"><i class="fa fa-shopping-cart"></i>   Start Sale</button>
    </div>
</div>


<div class="  col-lg-12">
    <h4 class="page-header">
        Rejected Sale Data
    </h4>
    <table class="table table-bordered table-hover table-striped dataTable">
        <thead>
            <tr>
                <th>Team Name</th>
                <th>Product Id</th>
                <th>Product Name</th>
                <th>Offered Quantity</th>
                <th>Offered Price Per Product</th>
            </tr>
        </thead>
        <tbody id="rejected-content">
        </tbody>
    </table>
</div>

<div class="  col-lg-12">
    <h4 class="page-header"  style="margin-top:50px">
        Sale History  
    </h4>

    <table class="table table-bordered table-hover table-striped dataTable ">
        <thead>
            <tr>
                <th>Round</th>
                <th>Team Name</th>
                <th>Product Name</th>
                <th>Region</th>
                <th>Customer</th>
                <th>Sale Quantity</th>
                <th>Offered Price Per Product</th>
                <th>Total Payment</th>
            </tr>
        </thead>
        <tbody id="sale-history-content">
            <?php foreach ($saleHistory as $sh) { ?>
                <tr>
                    <td><?= $sh['round_id'] ?></td>
                    <td><?= $sh['team_name'] ?></td>
                    <td><?= $sh['product_name'] ?></td>
                    <td><?= $sh['region_name'] ?></td>
                    <td><?= $sh['customer'] ?></td>
                    <td><?= $sh['qty'] ?></td>
                    <td><?= $sh['offer_price'] ?></td>
                    <td><?= $sh['qty'] * $sh['offer_price'] ?></td>
                </tr>
            <?php } ?>
        </tbody>
    </table>

</div>

<script>
var soldVolumne = [];

var availableMarket = 0;
<?php foreach ($saleHistory as $sh) { ?>
if(soldVolumne_<?= $sh['region_id'] ?>_<?= $sh['customer_id'] ?> == undefined){
	var soldVolumne_<?= $sh['region_id'] ?>_<?= $sh['customer_id'] ?> = 0;
}
soldVolumne_<?= $sh['region_id'] ?>_<?= $sh['customer_id'] ?> += parseInt('<?= $sh['qty'] ?>');
<?php } ?>

	var market_volumne_<?php echo REGION_INDUSTRIAL_COUNTRY?> = '<?php echo $saleVolume[REGION_INDUSTRIAL_COUNTRY]?>';
	var market_volumne_<?php echo REGION_EMERGING_COUNTRY_1?> = '<?php echo $saleVolume[REGION_EMERGING_COUNTRY_1]?>';
	var market_volumne_<?php echo REGION_EMERGING_COUNTRY_2?> = '<?php echo $saleVolume[REGION_EMERGING_COUNTRY_2]?>';
	var market_volumne_<?php echo REGION_DEVELOPMENT_COUNTRY?> = '<?php echo $saleVolume[REGION_DEVELOPMENT_COUNTRY]?>';

	var market_share_<?php echo REGION_INDUSTRIAL_COUNTRY?>_<?php echo CUSTOMER_TYPE_POOR_STUDENT?> = '<?php echo $marketShare[REGION_INDUSTRIAL_COUNTRY][CUSTOMER_TYPE_POOR_STUDENT]?>';
	var market_share_<?php echo REGION_INDUSTRIAL_COUNTRY?>_<?php echo CUSTOMER_TYPE_HEAVY_USER?> = '<?php echo $marketShare[REGION_INDUSTRIAL_COUNTRY][CUSTOMER_TYPE_HEAVY_USER]?>';
	var market_share_<?php echo REGION_INDUSTRIAL_COUNTRY?>_<?php echo CUSTOMER_TYPE_ECO_HIPSTER?> = '<?php echo $marketShare[REGION_INDUSTRIAL_COUNTRY][CUSTOMER_TYPE_ECO_HIPSTER]?>';

	var market_share_<?php echo REGION_EMERGING_COUNTRY_1?>_<?php echo CUSTOMER_TYPE_POOR_STUDENT?> = '<?php echo $marketShare[REGION_EMERGING_COUNTRY_1][CUSTOMER_TYPE_POOR_STUDENT]?>';
	var market_share_<?php echo REGION_EMERGING_COUNTRY_1?>_<?php echo CUSTOMER_TYPE_HEAVY_USER?> = '<?php echo $marketShare[REGION_EMERGING_COUNTRY_1][CUSTOMER_TYPE_HEAVY_USER]?>';
	var market_share_<?php echo REGION_EMERGING_COUNTRY_1?>_<?php echo CUSTOMER_TYPE_ECO_HIPSTER?> = '<?php echo $marketShare[REGION_EMERGING_COUNTRY_1][CUSTOMER_TYPE_ECO_HIPSTER]?>';

	var market_share_<?php echo REGION_EMERGING_COUNTRY_2?>_<?php echo CUSTOMER_TYPE_POOR_STUDENT?> = '<?php echo $marketShare[REGION_EMERGING_COUNTRY_2][CUSTOMER_TYPE_POOR_STUDENT]?>';
	var market_share_<?php echo REGION_EMERGING_COUNTRY_2?>_<?php echo CUSTOMER_TYPE_HEAVY_USER?> = '<?php echo $marketShare[REGION_EMERGING_COUNTRY_2][CUSTOMER_TYPE_HEAVY_USER]?>';
	var market_share_<?php echo REGION_EMERGING_COUNTRY_2?>_<?php echo CUSTOMER_TYPE_ECO_HIPSTER?> = '<?php echo $marketShare[REGION_EMERGING_COUNTRY_2][CUSTOMER_TYPE_ECO_HIPSTER]?>';

	var market_share_<?php echo REGION_DEVELOPMENT_COUNTRY?>_<?php echo CUSTOMER_TYPE_POOR_STUDENT?> = '<?php echo $marketShare[REGION_DEVELOPMENT_COUNTRY][CUSTOMER_TYPE_POOR_STUDENT]?>';
	var market_share_<?php echo REGION_DEVELOPMENT_COUNTRY?>_<?php echo CUSTOMER_TYPE_HEAVY_USER?> = '<?php echo $marketShare[REGION_DEVELOPMENT_COUNTRY][CUSTOMER_TYPE_HEAVY_USER]?>';
	var market_share_<?php echo REGION_DEVELOPMENT_COUNTRY?>_<?php echo CUSTOMER_TYPE_ECO_HIPSTER?> = '<?php echo $marketShare[REGION_DEVELOPMENT_COUNTRY][CUSTOMER_TYPE_ECO_HIPSTER]?>';
	
    var isSubmit = false;
    function filterSale() {
        var teamId = $('#sale-team-id').val();
        var customerId = $('#sale-customer-id').val();
         common.showLoadingModal();
        $.ajax({
            url: '<?= site_url('/backend/round/filtersale') ?>/' + gameId + '/' + teamId + '/' + customerId,
            method: "GET",
            dataType: 'json',
        }).success(function (data) {
            var saleHtml = '';
            var rejectHtml = '';

            $('#sale-content-body').html('');
            $('#rejected-content').html('');

            $.each(data.saleData, function (index, value) {
                if(value.quantity > 0){
                saleHtml += '<tr><td>' + value.team_name + '</td><td>' + value.product_id + '</td><td>' + value.product_name + '</td><td>' + value.product_summary + '</td><td>' + value.quantity + '</td><td id="sale-' + value.id + '-price">'
                        + value.offer_price + '</td><td> <input  id="sale-' + value.id + '-qty" name="sale[' + value.id + '][sell_qty]" class="form-control sellqty" style=" display:table-row; margin-right:20px" onchange="updateTotalAmount(' + value.id + ')"/></td>'
                        + '<td>$<span id="sale-' + value.id + '-total"></span>'
                        + '<input type="hidden"  id="sale-' + value.id + '-offer-qty" name="sale[' + value.id + '][offer_qty]" value="' + value.quantity + '"/>'
                        + '<input type="hidden"  id="sale-' + value.id + '-team-id" name="sale[' + value.id + '][team_id]" value="' + value.team_id + '"/>'
                        + '<input type="hidden"  id="sale-' + value.id + '-offer-price" name="sale[' + value.id + '][offered_price]" value="' + value.offer_price + '"/>'
                        + '<input type="hidden"  id="sale-' + value.id + '-region-id" name="sale[' + value.id + '][region_id]" value="' + value.region_id + '"/>'
                        + '<input type="hidden"  id="sale-' + value.id + '-product-id" name="sale[' + value.id + '][product_id]" value="' + value.product_id + '"/></td></tr>';
                }
            });
            $('#sale-content-body').html(saleHtml);

            $.each(data.rejectedData, function (index, value) {
            	if(value.quantity > 0){
                rejectHtml += '<tr><td>' + value.team_name + '</td><td>' + value.product_id + '</td><td>' + value.product_name + '</td><td>' + value.quantity + '</td><td>' + value.offer_price + '</td></tr>'
            	}
            });
            $('#rejected-content').html(rejectHtml);
             common.closeLoadingModal();
        });
    }

    function startSale() {
		var saleItem = $(".sellqty");
		var totalSaleQty = 0;
		$.each(saleItem, function(index, value){
			if($(value).val()!==''){
				totalSaleQty += parseInt($(value).val());
			}
			
		});
		if(totalSaleQty > availableMarket){
			common.alertDialog('Your input quantity exceed the available market volumne. Please check again!!!');
			return;
		}
	
		
        if (isSubmit == true) {
            common.confirmDialog('Do you want to start sale process?', function () {
                 common.showLoadingModal();
                $.ajax({
                    url: '<?= site_url('backend/round/sale') ?>/' + gameId,
                    method: "POST",
                    dataType: 'json',
                    data: $("[name^='sale").serialize(),
                }).success(function (data) {
                    location.href = '<?= site_url('master/round/index') ?>/' + gameId + '/sell';
                });
            });
        }

    }

    function updateTotalAmount(id) {
        var price = $("#sale-" + id + "-price").text();
        var qty = $("#sale-" + id + "-qty").val();
        var offer_qty = $("#sale-" + id + "-offer-qty").val();
        qty = parseInt(qty);
        offer_qty = parseInt(offer_qty);
        if (price > 0 && qty > 0) {
            if (qty > offer_qty) {
                isSubmit = false;
                common.showPrompt("#sale-" + id + "-qty", 'The sale quantity is exceed the offered quantity!');
                return;
            } else {
                isSubmit = true;
                common.hidePrompt("#sale-" + id + "-qty");
            }
            $("#sale-" + id + "-total").text(price * qty);
        }
    }

    function updateMarketVolume(){

        var selectedRegion = $('#sale-team-id').val();
        var selectedCustomer = $('#sale-customer-id').val();

        var regionMarketVolumne = eval('market_volumne_' + selectedRegion);
        var customerMarketShare = eval('market_share_' + selectedRegion+ '_' + selectedCustomer);

        var totalMarketShare = regionMarketVolumne*customerMarketShare/100;
       
        	if (typeof window['soldVolumne_' + selectedRegion+ '_' + selectedCustomer] === "undefined"){
            soldVolume = 0;
        }else{
        	 var soldVolume = eval('soldVolumne_' + selectedRegion+ '_' + selectedCustomer);
        }
        	availableMarket = totalMarketShare - soldVolume;
        $('#total-available-market').val(availableMarket);
       
    }
$(function(){
	updateMarketVolume();
});
</script>
