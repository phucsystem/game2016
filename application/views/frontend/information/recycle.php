
<div id="page-wrapper">

    <div class="container-fluid">

        <!-- Page Heading -->
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header" style="margin-top: 0px">
                    Recycle Method References <small></small>
                </h1>
            </div>
        </div>

        <div class="tab-pane fade in active" id="region-tab-1">
            
          
             <table class="table table-striped table-bordered table-hover">
                <thead>
                    <tr>
                         <?php foreach ($recycleMethodsList as $rmKey => $rmValue){ ?>
                             <th> <?= $rmValue['label'] ?></th>
                          <?php } ?>
                    </tr>
                </thead>
                <tbody>
                    <?php foreach ($recycleMethodInfo as $rKey => $rValue){    ?>
                     <tr>
                          <?php foreach ($rValue as $rfKey => $rfValue){    ?>
                            <td><?= $rfValue?></td>
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

