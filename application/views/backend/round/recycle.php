<div class="form-group col-lg-6">
    <label>Team</label>
    <select onchange="selectTeamForRecycle()" class="form-control " name="game-id" id="recycle-team-list">
        <option  value="">-- Select Team --</option>
        <?php
        foreach ($teams as $t)
        {
            ?>
            <option value="<?= $t['id'] ?>"><?= $t['name'] ?></option>
<?php } ?>
    </select>
</div>


<div class="form-group col-lg-12 no-padding-left">
<div class="form-group col-lg-6">
    <label>Storage Capacity in IC</label>
    <input id="storage-capacity-ic" class="form-control " placeholder=""  value="0" readonly>
</div>
<div class="form-group col-lg-6">
    <label>Storage Capacity in EC1</label>
    <input id="storage-capacity-ec1" class="form-control " placeholder=""  value="0" readonly>
</div>
</div>

<div class="form-group col-lg-12 no-padding-left">
<div class="form-group col-lg-6">
    <label>Storage Capacity in EC2</label>
    <input id="storage-capacity-ec2" class="form-control " placeholder=""  value="0" readonly>
</div>
<div class="form-group col-lg-6">
    <label>Storage Capacity in DC</label>
    <input id="storage-capacity-dc" class="form-control " placeholder=""  value="0" readonly>
</div>
</div>



<div class="  col-lg-12">
    <table class="table table-bordered table-hover table-striped">
        <thead>
            <tr>
                <th>Product Id</th>
                <th>Product Name</th>
                <th>Round</th>
                <th>Sale Region</th>
                <th>Sale Quantity</th>
                <th>Return Quantity</th>
            </tr>
        </thead>
        <tbody id="recycle-table">
        </tbody>
    </table>
    <div class="pull-right">
        <button onclick="returnProduct()" class="btn btn-outline btn-primary pull-right " type="button"><i class="fa fa-reply-all"></i>   Start Return Product</button>
    </div>

</div>

<div class="  col-lg-12">
    <h4 style="margin-top:0px" class="page-header">
        Return Product History
    </h4>

    <table class="table table-bordered table-hover table-striped dataTable ">
        <thead>
            <tr>
                <th>Product Id</th>
                <th>Product Name</th>
                <th>Round</th>
                <th>Sale Region</th>
                <th>Return Quantity</th>
            </tr>
        </thead>
        <tbody id="recycle-history-content">
        </tbody>
    </table>

</div>

<script>
    function selectTeamForRecycle() {
        var teamId = $('#recycle-team-list').val();
        if (teamId != '') {
            common.showLoadingModal();
            $.ajax({
                url: '<?= site_url('master/round/getusedproduct') ?>/' + teamId,
                method: "GET",
                dataType: 'json',
            }).success(function (data) {
                var recycleContent = '';
                $.each(data.saleHistory, function (index, value) {
                    recycleContent += '<tr><td>' + value.product_id + '</td><td>' + value.product_name + '</td><td>' + value.round_id + '</td><td>' + value.region_name + '</td><td>' + value.remain_qty + '</td>\n\
             <td><input type="text" class="form-control" name="recycle[' + value.id + '][qty]"/>\n\
\n\<input type="hidden" class="form-control" name="recycle[' + value.id + '][product_id]" value="' + value.product_id + '"/>\
            \n\<input type="hidden" class="form-control" name="recycle[' + value.id + '][region_id]" value="' + value.region_id + '"/>\n\
            <input type="hidden" class="form-control" name="recycle[' + value.id + '][game_id]" value="' + value.game_id + '"/></td>\n\
            </tr>';
                });

                $.each(data.store_capacity, function(index, value){
                    switch(index){
                    case '1':
                        $("#storage-capacity-dc").val(value);
                        break;
                    case '2':
                    	$("#storage-capacity-ec1").val(value);
                        break;
                    case '3': 
                    	$("#storage-capacity-ec2").val(value);
                        break;
                    case '4': 
                    	$("#storage-capacity-ic").val(value);
                        break;
                    }
                });

                $('#recycle-table').html(recycleContent);
                common.closeLoadingModal();
            });
            
            getRecycleHistory(teamId);
        }
    }

    function returnProduct() {
        var teamId = $('#recycle-team-list').val();
        if (teamId != '') {
            common.confirmDialog('Do you want to start return product process?', function () {
                $.ajax({
                    url: '<?= site_url('backend/round/returnproduct') ?>/' + teamId,
                    method: "POST",
                    dataType: 'json',
                    data: $("[name^='recycle").serialize(),
                }).success(function (data) {
                    location.href = '<?= site_url('master/round/index') ?>/' + gameId + '/recycle';
                });
            });
        }

    }

    function getRecycleHistory(teamId) {
        $.ajax({
            url: '<?= site_url('master/round/getrecyclehistory') ?>/' + teamId,
            method: "GET",
            dataType: 'json',
        }).success(function (data) {
            var recycleContent = '';
            $.each(data.recycle_history, function (index, value) {
                recycleContent += '<tr><td>' + value.product_id + '</td>\n\
            <td>' + value.product_name + '</td>\n\
            <td>' + value.round_id + '</td>\n\
            <td>' + value.region_name + '</td>\n\
            <td>' + value.qty + '</td>\n\
             <td></td>\n\
            </tr>';
            });

            $('#recycle-history-content').html(recycleContent);
            common.closeLoadingModal();
        });
        
    }
</script>
