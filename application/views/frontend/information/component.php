
<div id="page-wrapper">

    <div class="container-fluid">

        <!-- Page Heading -->
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header" style="margin-top: 0px">
                    Component References <small></small>
                </h1>
            </div>
        </div>

        <div class="tab-pane fade in active" id="region-tab-1">
            
          
             <table class="table table-striped table-bordered table-hover">
                <thead>
                    <tr>
                        <th style="width:120px">Name</th>
                        <th>Material</th>
                        <th>Price</th>
                        <th>Range</th>
                        <th>Design</th>
                        <th>Reliability</th>
                        <th class="select-cols">InHouse Manufacturing</th>
                        <th class="select-cols">Required / Optional</th>
                    </tr>
                </thead>
                <tbody>
                        <?php foreach ($components as $c) { ?>
                                <?php foreach ($c['materials'] as $key => $cm) { ?>
                                    <tr >
                                        <?php if ($key == 0) { ?>
                                            <td rowspan="<?php echo count($c['materials']) ?>">
                                                <?php echo ucfirst($c['name']) ?>
                                            <?php } ?>
                                        <td>
                                            <?php echo ucfirst($cm['name']) ?>
                                        </td>
                                        <td> <?php echo $cm['cost'] ?></td>
                                        <td> <?php echo $cm['range'] ?></td>
                                        <td> <?php echo $cm['design'] ?></td>
                                        <td> <?php echo $cm['reliability'] ?></td>
                                        <?php if ($key == 0) { ?>
                                        <td rowspan="<?php echo count($c['materials']) ?>">
                                            <?php
                                                if ($c['inhouse_manufacturing'] == 1) {
                                                    echo "Possible";
                                                }else{
                                                    echo "Not Possible";
                                                }
                                                ?>
                                        </td>
                                        <td rowspan="<?php echo count($c['materials']) ?>">
                                            <?php
                                                if ($c['require'] == COMPONENT_REQUIRED) {
                                                    echo "Required";
                                                }else{
                                                    echo "Optional";
                                                }
                                                ?>
                                        </td>
                                        
                                         <?php } ?>
                                    </tr>
    <?php } ?>

<?php } ?>
                   

                </tbody>
            </table>
           
        </div>
        <!-- /.row -->

    </div>
    <!-- /.container-fluid -->

</div>
<!-- /#page-wrapper -->

