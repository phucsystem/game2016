<?php
for ($i = $startRound; $i <= $roundNumbers; $i++) { ?>

    <div class="panel panel-default" id="round<?= $i ?>">
        <div class="panel-heading">
            <h4 class="panel-title">
                <a  data-toggle="collapse" data-parent="#accordion" href="#collapse<?= $i ?>">Round #<?= $i ?></a>
                <a href="javascript:;" class="pull-right" onclick="removeRound('<?= $i ?>')"
                   data-toggle="tooltip" data-placement="top" title="" data-original-title="Remove round"><i class="fa fa-times-circle fa-fw"></i></a>
            </h4>
        </div>
        <div id="collapse<?= $i ?>" class="panel-collapse collapse ">
            <div class="panel-body">
                <!-- Nav tabs -->
                <ul class="nav nav-tabs">
                <li class="active"><a href="#region-tab-<?= $i ?>" data-toggle="tab">Regions</a></li>
                    <li><a href="#customer-tab-<?= $i ?>" data-toggle="tab">Customers</a></li>
                    <li><a href="#event-tab-<?= $i ?>" data-toggle="tab">Event</a></li>
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
                                                   value="<?= $regionInfo[$i][REGION_INDUSTRIAL_COUNTRY][$rf['id']]['factor_value'] ?>"
                                                   factor-id="<?= $regionInfo[$i][REGION_INDUSTRIAL_COUNTRY][$rf['id']]['id']?>">
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
               
                  <div class="tab-pane fade in" id="recycling-tab-<?= $i ?>">
                      
                    </div>

                    <div class="tab-pane fade in " id="customer-tab-<?= $i ?>">
                        <br/>

                        <div class="row">
                            <?php $regionCount = 0; ?>
                            <?php foreach ($regions as $r) {
                                $regionCount++;
                                ?>
                                <div class="col-lg-6">
                                    <div class="panel panel-info">
                                        <div class="panel-heading">
                                         <?php echo $r['name']; ?>
                                        </div>
                                        <div class="panel-body">

                                            <ul class="nav nav-tabs">
                                                <?php foreach ($customers as $cus) { ?>
                                                    <li class="<?php
                                                        if ($cus['id'] == CUSTOMER_TYPE_POOR_STUDENT) {
                                                            echo 'active';
                                                        }
                                                        ?>"><a href="#customer-<?= $i?>-<?php echo $r['id'] ?>-<?php echo $cus['id'] ?>" data-toggle="tab"><?php echo $cus['label'] ?></a>
                                                    </li>
                                              <?php } ?>
                                            </ul>

                                            <div class="tab-content">
                                                
                                             <?php foreach ($customers as $cus) { ?>
                                                    <div class="tab-pane fade in <?php if ($cus['id'] == CUSTOMER_TYPE_POOR_STUDENT) {
                                                echo 'active';
                                            } ?>" id="customer-<?= $i?>-<?php echo $r['id'] ?>-<?php echo $cus['id'] ?>">
                                                        <br>
                                                   
                                                        <table class="table table-striped table-bordered table-hover">
                                                            <thead>
                                                                <tr>
                                                                    <th>Attributes</th>
                                                                    <th>Value</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                 <?php foreach ($customerFactors1 as $rf) { ?>
                                                                <tr >
                                                                        <td>
                                                                           <?= $rf['label'] ?>
                                                                        </td>
                                                                        <td>
                                                                            <input  class="form-control validate[required]" placeholder=""  name="round[<?= $i ?>][region][<?= $r['id'] ?>][customer][<?= $cus['id'] ?>][factor][<?= $rf['id'] ?>][value][weighting]"  
                                                                                   value="<?= $customerFactorsInfo[$i][$r['id']][$cus['id']][$rf['id']]['factor_weight']; ?>">
                                                                            <input  type="hidden" class="form-control " placeholder=""  name="round[<?= $i ?>][region][<?= $r['id'] ?>][customer][<?= $cus['id'] ?>][factor][<?= $rf['id'] ?>][value][minvalue]"  
                                                                                   value="">
                                                                        </td>
                                                                    </tr>
                                                                <?php } ?>
                                                            </tbody>
                                                        </table>
                                                        <br/>
                                                        <table class="table table-striped table-bordered table-hover">
                                                            <thead>
                                                                <tr>
                                                                    <th>Attributes</th>
                                                                    <th>Weighting</th>
                                                                    <th>Min. value</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                             <?php foreach ($customerFactors as $rf) { ?>
                                                                    <tr >
                                                                        <td>
                                                                           <?= $rf['label'] ?>
                                                                        </td>
                                                                        <td><input class="form-control validate[required]" placeholder=""  name="round[<?= $i ?>][region][<?= $r['id'] ?>][customer][<?= $cus['id'] ?>][factor][<?= $rf['id'] ?>][value][weighting]"  
                                                                                   value="<?= $customerFactorsInfo[$i][$r['id']][$cus['id']][$rf['id']]['factor_weight']; ?>"></td>
                                                                        <td> <input class="form-control validate[required]" placeholder=""  name="round[<?= $i ?>][region][<?= $r['id'] ?>][customer][<?= $cus['id'] ?>][factor][<?= $rf['id'] ?>][value][minvalue]" 
                                                                                    value="<?= $customerFactorsInfo[$i][$r['id']][$cus['id']][$rf['id']]['factor_min_value']; ?>"></td>
                                                                    </tr>
                                                                <?php } ?>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                               <?php } ?>
                                            </div>
                                        </div>
                                    </div>
                                </div>
        <?php if ($regionCount == 2) { ?>
                                </div><br/>
                                <div class="row">
        <?php }
    } ?>


                        </div>


                        <br/>
                    </div>

                      <div class="tab-pane fade" id="event-tab-<?= $i ?>">
                        <br/>
                        
                        <div class="form-group ">
                                <label>Event Title</label>
                                <input name="round[<?= $i ?>][event][title]" value="<?php if(isset($eventInfo[$i]['title'])){ echo $eventInfo[$i]['title'];} ?>" placeholder="" class="form-control ">
                            </div>
                        <div class="form-group ">
                                <label>Event Description</label>
                                <textarea id="eventeditor<?= $i?>" name="round[<?= $i ?>][event][description]" placeholder="" class="htmleditor form-control "
                                          value=""><?php if(isset($eventInfo[$i]['description'])){ echo $eventInfo[$i]['description'];} ?></textarea>
                            </div>
                    </div>

                </div>
            </div>
        </div>
        </div>

        <script>
        </script>

<?php } ?>

