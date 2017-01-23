<div class="form-group col-lg-12">
    <h4 class="page-header" style="margin-top:0px">
        Customer Share Report
    </h4>
    <div class="form-group col-lg-12">
    <div id="morris-report-chart123"></div>
    </div>
</div>

<div class="form-group col-lg-12">
    <h4 class="page-header" style="margin-top:0px">
       Sale Report
    </h4>
    <div class="form-group col-lg-12">
     <table class="table table-bordered table-hover table-striped  ">
        <thead>
            <tr>
                <th>Team</th>
                <?php foreach($regionList as $r){?>
                <th><?php echo $r['label']?></th>
                <?php } ?>
            </tr>
        </thead>
        <tbody >
        <?php foreach($reportTeams as $t){?>
        	<tr>
        	<td><?php echo $t['name'] ?></td>
        	<?php foreach($regionList as $r){?>
                <td><?php echo (!empty( $teamSale[$t['id']][$r['id']]))?$teamSale[$t['id']][$r['id']]:"0"?></td>
                <?php } ?>
        	</tr>
        	<?php }?>
        </tbody>
    </table>
    
    </div>
</div>

<div class="form-group col-lg-12">
    <h4 class="page-header" style="margin-top:0px">
       Team Factors Report
    </h4>
    <div class="form-group col-lg-12">
      <table class="table table-bordered table-hover table-striped  ">
        <thead>
            <tr>
                <th>Factors</th>
                <?php foreach($reportTeams as $r){?>
                <th><?php echo $r['name']?></th>
                <?php } ?>
            </tr>
        </thead>
        <tbody id="sale-content">
        <?php foreach($teamFactors as $fKey => $fValue){?>
        <tr>
        <td><?php echo $fValue['label']?></td>
        <?php foreach($reportTeams as $r){?>
              <td><?php echo $reportTeams[$r['id']]['factors'][$fKey]['factor_value'] ?></td>
                <?php } ?>
        </tr>
        <?php } ?>
        </tbody>
    </table>
    </div>
</div>

<div class="form-group col-lg-12">
    <h4 class="page-header" style="margin-top:0px">
       Market Share (%)
    </h4>
    <div class="form-group col-lg-12">
    <?php foreach($regionList as $rKey => $rValue){?>
    
	    <div class="form-group col-lg-3">
	    <h5 class="chart-label"><?php echo $rValue['label']?></h5>	
	    	<div id="morris-report-marketshare-<?php echo $rKey ?>" ></div>
	    </div>
	    <?php  } ?>
    </div>
</div>

<script>
var customerReportData = '<?php echo $customerMarketShare; ?>';

var icMarketData = '<?php echo json_encode($saleShare[REGION_INDUSTRIAL_COUNTRY])?>';
var ec1MarketData = '<?php echo json_encode($saleShare[REGION_EMERGING_COUNTRY_1])?>';
var ec2MarketData = '<?php echo json_encode($saleShare[REGION_EMERGING_COUNTRY_2])?>';
var dcMarketData = '<?php echo json_encode($saleShare[REGION_DEVELOPMENT_COUNTRY])?>';

$(function(){
	 setTimeout(function(){
		  $(window).trigger('resize');
	  }, 1000);
});
</script>