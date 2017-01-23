
<div id="page-wrapper">

    <div class="container-fluid">

        <!-- Page Heading -->
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header" style="margin-top: 0px">
                    Region References <small></small>
                </h1>
            </div>
        </div>

        <div class="tab-pane fade in active" id="region-tab-1">
            
          
             <table class="table table-striped table-bordered table-hover">
                <thead>
                    <tr>
                        <th>Factor</th>
                         <?php foreach ($regionList as $rKey => $rValue){ ?>
                             <th> <?= $rValue['label'] ?></th>
                          <?php } ?>
                    </tr>
                </thead>
                <tbody>
                    <?php foreach ($regionFactorList as $rfKey => $rfValue){ ?>
                     <tr>
                        <td><?= $rfValue['label'] ?></td>
                          <?php foreach ($regionList as $rKey => $rValue){   ?>
                            <td><?= $regionInfo[$rKey][$rfKey]['factor_value']?></td>
                          <?php } ?>
                    </tr>
                  <?php } ?>
                   

                </tbody>
            </table>
           
        </div>
        <!-- /.row -->

    </div>
    <!-- /.container-fluid -->

</div>
<!-- /#page-wrapper -->

