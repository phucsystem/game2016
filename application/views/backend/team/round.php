<?php for ($i = $startNumber; $i <= $roundNumber; $i++) { ?>
    <div class="panel panel-default" id="round<?= $i ?>">
        <div class="panel-heading">
            <h4 class="panel-title">
                <a data-toggle="collapse" data-parent="#accordion" href="#collapse<?= $i; ?>" class="collapsed" aria-expanded="false">
                Round #<?= ($i==0) ? 1 : $i ?></a>
                <a href="javascript:;" class="pull-right" onclick="removeRound('<?= $i ?>')"
                   data-toggle="tooltip" data-placement="top" title="" data-original-title="Remove round"><i class="fa fa-times-circle fa-fw"></i></a>
            </h4>
        </div>
        <div id="collapse<?= $i; ?>" class="panel-collapse collapse" aria-expanded="false" style="height: 0px;">
            <div class="panel-body">

                <!-- Nav tabs -->
			<ul class="nav nav-tabs">
				<li class="active"><a href="#region-tab-<?= $i ?>" data-toggle="tab">Region</a></li>
				<li class=""><a href="#cost-tab-round<?= $i ?>" data-toggle="tab">Manufacturing Cost</a></li>
				<li class=""><a href="#component-tab-round<?= $i ?>" data-toggle="tab">Component</a></li>
				 <li class=""><a href="#recycling-tab-<?= $i ?>" data-toggle="tab">Recycling Method</a></li>
			</ul>

			<!-- Tab panes -->
                <div class="tab-content">
                     <div class="tab-pane fade in active" id="region-tab-<?= $i ?>">
                        <br/>
                        <table class="table table-striped table-bordered table-hover">
                            <thead>
                                <tr>
                                    <th>Factor</th>
                                    <th>Industry country</th>
                                    <th>Emerging country 1</th>
                                    <th>Emerging country 2</th>
                                    <th>Developing country 1</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php foreach ($regionFactors as $rf) {
                                    ?>
                                    <tr >
                                        <td>
                                            <?= $rf['label'] ?>
                                            <input type="hidden" name="" value=""/>
                                        </td>
                                        <td>
                                            <input class="form-control validate[required]" placeholder="" 
                                                   name="round[<?= $i ?>][region][<?= REGION_INDUSTRIAL_COUNTRY ?>][factor][<?= $rf['id'] ?>]"
                                                   value="<?= $regionInfo[$i][REGION_INDUSTRIAL_COUNTRY][$rf['id']]['factor_value'] ?>">
                                        </td>
                                        <td> <input class="form-control validate[required]" placeholder=""
                                                    name="round[<?= $i ?>][region][<?= REGION_EMERGING_COUNTRY_1 ?>][factor][<?= $rf['id'] ?>]]"
                                                    value="<?= $regionInfo[$i][REGION_EMERGING_COUNTRY_1][$rf['id']]['factor_value'] ?>"></td>
                                        <td> <input class="form-control validate[required]" placeholder=""
                                                    name="round[<?= $i ?>][region][<?= REGION_EMERGING_COUNTRY_2 ?>][factor][<?= $rf['id'] ?>]"
                                                    value="<?= $regionInfo[$i][REGION_EMERGING_COUNTRY_2][$rf['id']]['factor_value'] ?>"></td>
                                        <td> <input class="form-control validate[required]" placeholder=""
                                                    name="round[<?= $i ?>][region][<?= REGION_DEVELOPMENT_COUNTRY ?>][factor][<?= $rf['id'] ?>]"
                                                    value="<?= $regionInfo[$i][REGION_DEVELOPMENT_COUNTRY][$rf['id']]['factor_value'] ?>"></td>
                                    </tr>
                                <?php } ?>
                            </tbody>
                        </table>
                    </div>
               
                    <div class="tab-pane fade in" id="cost-tab-round<?= $i ?>">
                        <br/>
                        <div class="col-lg-6">
                            <?php
                            if (!empty($teamFactorsInfo[$i]))
                            {
                                $teamFactorsInfoData = $teamFactorsInfo[$i];
                            } else
                            {
                                $teamFactorsInfoData = $teamFactorsInfo[0];
                            }
                            ?>
                            <?php foreach ($teamManufacturingFactors as $tmfKey => $tmfValue) { ?>
                                <label><?= $tmfValue['label'] ?></label>
                                <div class=" form-group  input-group">
                                    <span class="input-group-addon">$</span>

                                    <input class="form-control validate[required, custom[number]]" placeholder=""
                                           name='round[<?= $i ?>][factor][<?= $tmfKey ?>]' value="<?= $teamFactorsInfoData[$tmfKey]['factor_value'] ?>">
                                </div>
                            <?php } ?>
                        </div>

                    </div>
                    <div class="tab-pane fade in " id="component-tab-round<?= $i ?>">
                        <br/>
                        <table class="table table-striped table-bordered table-hover" id="tblComponents">
                            <thead>
                                <tr>
                                    <th>Name</th>
                                    <th>Material</th>
                                    <th>Price</th>
                                    <th>Range</th>
                                    <th>Design</th>
                                    <th>Reliability</th>
                                    <th class="select-cols">InHouse Manufacturing</th>
                                    <th class="select-cols">Required / Optional</th>
                                    <!--<th class="action-cols">Actions</th>-->
                                </tr>
                            </thead>
                            <tbody>
                                <?php foreach ($components[$i] as $c) { ?>
                                    <?php foreach ($c['materials'] as $key => $cm) { ?>
                                        <tr >
                                            <?php if ($key == 0)
                                            {
                                                ?>
                                                <td rowspan="<?php echo count($c['materials']) ?>">
                                                    <input type="hidden" name='round[<?= $i ?>][component][<?= $c['id'] ?>][factor][id]' value='<?= $c['id'] ?>'/>
                                                    <input type="text" class="form-control" name='round[<?= $i ?>][component][<?= $c['id'] ?>][factor][name]' value='<?= ucfirst($c['name']) ?>'/>
            <?php } ?>
                                            <td>
                                                <input class="form-control" placeholder=""  value="<?php echo ucfirst($cm['name']) ?>"
                                                       name='round[<?= $i ?>][component][<?= $c['id'] ?>][material][<?= $cm['id'] ?>][name]'>
                                                <input type="hidden" class="form-control" placeholder=""  value="<?php echo ($cm['image']) ?>"
                                                       name='round[<?= $i ?>][component][<?= $c['id'] ?>][material][<?= $cm['id'] ?>][image]'>
                                                <input type="hidden" name='round[<?= $i ?>][component][<?= $c['id'] ?>][material][<?= $cm['id'] ?>][id]' value='<?= $cm['id'] ?>'/>
                                            </td>
                                            <td> <input class="form-control" placeholder=""  value="<?php echo $cm['cost'] ?>"
                                                        name='round[<?= $i ?>][component][<?= $c['id'] ?>][material][<?= $cm['id'] ?>][cost]'></td>
                                            <td> <input class="form-control" placeholder=""  value="<?php echo $cm['range'] ?>"
                                                        name='round[<?= $i ?>][component][<?= $c['id'] ?>][material][<?= $cm['id'] ?>][range]'></td>
                                            <td> <input class="form-control" placeholder=""  value="<?php echo $cm['design'] ?>"
                                                        name='round[<?= $i ?>][component][<?= $c['id'] ?>][material][<?= $cm['id'] ?>][design]'></td>
                                            <td> <input class="form-control" placeholder=""  value="<?php echo $cm['reliability'] ?>"
                                                        name='round[<?= $i ?>][component][<?= $c['id'] ?>][material][<?= $cm['id'] ?>][reliability]'></td>
                                                <?php if ($key == 0)
                                                {
                                                    ?>
                                                <td rowspan="<?php echo count($c['materials']) ?>">
                                                    <select class="form-control" id="component-seat" name="round[<?= $i ?>][component][<?= $c['id'] ?>][factor][inhouse_manufacturing]">
                                                        <option value="1" <?php
                                                        if ($c['inhouse_manufacturing'] == 1)
                                                        {
                                                            echo "selected";
                                                        }
                                                        ?>>Possible</option>
                                                        <option value="0" <?php
                                                        if ($c['inhouse_manufacturing'] != 1)
                                                        {
                                                            echo "selected";
                                                        }
                                                        ?>>Not Possible</option>
                                                    </select>
                                                </td>
                                                <td rowspan="<?php echo count($c['materials']) ?>">
                                                    <select class="form-control" id="component-seat" name="round[<?= $i ?>][component][<?= $c['id'] ?>][factor][require]">
                                                        <option value="<?= COMPONENT_REQUIRED ?>" <?php
                                                        if ($c['require'] == COMPONENT_REQUIRED)
                                                        {
                                                            echo "selected";
                                                        }
                                                        ?>>Required</option>
                                                        <option value="<?= COMPONENT_OPTIONAL ?>" <?php
                                                        if ($c['require'] == COMPONENT_OPTIONAL)
                                                        {
                                                            echo "selected";
                                                        }
                                                        ?>>Optional</option>
                                                    </select>
                                                </td>
                                            <?php } ?>
            <!--                                        <td>
            <?php if ($c['is_default'] != 1)
            {
                ?>
                                                        <a class="btn btn-outline btn-danger btn-sm" href="#" onclick='deleteGame("<?= $c['id'] ?>")' data-toggle="tooltip" data-placement="right" title="" data-original-title="Delete material">
                                                            <i class="fa fa-trash fa-fw"></i>
                                                        </a>
            <?php } ?>
            <?php if ($key == 0)
            {
                ?>
                                                   
                                                    <a class="btn btn-outline btn-default btn-sm" href="#" data-toggle="tooltip" data-placement="right" title="" data-original-title="Add new material">
                                                        <i class="fa fa-plus fa-fw"></i>
                                                    </a>
                                        <?php } ?>

                                        </td>-->
                                        </tr>
        <?php } ?>

    <?php } ?>
<!--                                <tr id="btnAddComponentRow">
                                    <td colspan="8" >
                                        <a class="btn btn-outline btn-default" href="javascript:;" onclick="addNewComponent()" id="btnAddComponent">
                                            <i class="fa fa-plus fa-fw"></i> Add new component
                                        </a>
                                    </td>
                                </tr>-->

                            </tbody>
                        </table>
                    </div>
                
                  <div class="tab-pane fade in " id="recycling-tab-<?= $i ?>">
                    <br/>
                        <table class="table table-striped table-bordered table-hover" id='tbl-recycle-method'>
                            <thead>
                                <tr>
                                    <?php foreach ($recycleMethodsList as $rc) { ?>
                                        <th><?= $rc['label'] ?></th>
                                    <?php } ?>
                                    <th class="action-cols">Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php
                                    if (!empty($recycleMethodInfo[$i])) {
                                        $recycleMethodData = $recycleMethodInfo[$i];
                                    } else {
                                        $recycleMethodData = $recycleMethodInfo[0];
                                    }
                                    ?>
                                
                                  <?php foreach ($recycleMethodData as $eckey => $ecinfo) { ?>
                                    <tr id='recycle-row-<?= $eckey ?>' >
                                        <?php foreach ($recycleMethodsList as $rc) { ?>
                                            <td><input class="form-control validate[required]" placeholder="" name="round[<?= $i ?>][recycle][<?= $eckey ?>][factor][<?= $rc['id'] ?>]"
                                                       value="<?= $ecinfo[$rc['id']] ?>">
                                            </td>
                                        <?php } ?>
                                        <td>
                                            <input type='hidden'  name="round[<?= $i ?>][recycle][<?= $eckey ?>][method_code]" value="<?= $eckey ?>"/>

                                            <a class="btn btn-outline btn-danger" href="javascript:;" onclick="removeRecycleMethod('<?= $eckey ?>')" >
                                                <i class="fa fa-trash fa-fw"></i>
                                            </a>
                                        </td>
                                    </tr>

                                <?php } ?>
                             
                                <tr id='add-new-recycle-row-<?= $i ?>' >
                                    <td colspan="11">
                                        <a class="btn btn-outline btn-default" href="javascript:;" onclick='addRecycleMethod("<?= $i ?>")'>
                                            <i class="fa fa-plus fa-fw"></i> Add new recycling methods
                                        </a>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                  </div>
                  
                </div>
            </div>
        </div>
    </div>

    <script>
        roundNumber++;
        recycleMethodNumber = '<?= count($recycleMethodInfo) + 1 ?>';
    </script>

<?php } ?>
