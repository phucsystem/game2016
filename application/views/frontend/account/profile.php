
<div id="page-wrapper">

    <div class="container-fluid">

        <!-- Page Heading -->
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">
                    Profile <small> </small>
                </h1>
            </div>
        </div>
        
        <div class="row">
            <?= form_open('account/profile', array('class'=>'form-validate'))?>
            <div class="col-lg-6">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title"><i class="fa fa-user fa-fw"></i> Basic Information</h3>
                    </div>
                    <div class="panel-body">
                            <div class="form-group col-lg-12">
                                <label>Account Name</label>
                                <input class="form-control validate[required]" placeholder="" value="<?= $userDetails['account']?>" name="account" disabled>
                            </div>
                            <div class="form-group col-lg-12 ">
                                <label>Email</label>
                                <input class="form-control validate[required, custom[email]]" placeholder="" value="<?= $userDetails['email']?>" name="email">
                            </div>
                            <div class="form-group col-lg-12">
                                <label>Player's Name</label>
                                <input class="form-control validate[required]" placeholder="" value="<?= $userDetails['name']?>" name="name">
                            </div>
                    </div>
                </div>
                    <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title"><span class="glyphicon glyphicon-lock"></span> Change Password</h3>
                    </div>
                    <div class="panel-body">
                        <div class="form-group col-lg-12">
                            <label>New Password</label>
                            <input class="form-control validate[minSize[6],maxSize[20]]" placeholder="" type="password" name="password" id="password" value="<?= $userDetails['password']?>">
                        </div>
                          <div class="form-group col-lg-12">
                            <label>Re-Enter New Password</label>
                            <input class="form-control validate[minSize[6],maxSize[20],equals[password]]" placeholder=""  type="password" name="repassword" id="repassword" value="<?= $userDetails['password']?>">
                        </div>
                    </div>
                </div>
                <div class="form-group col-lg-12">
                    <a href="<?= site_url('game') ?>" class="btn btn-default pull-right RbtnMargin" role="button">Cancel</a>
                    <button type="submit" class="btn btn-primary pull-right ">Update Profile</button>
                </div>
            </div>
        </div>
        <!-- /.row -->
     
    </div>
    <!-- /.container-fluid -->

</div>
<!-- /#page-wrapper -->

<script>
   $(function() {
       var isSuccess = '<?= $isSuccess?>';
       if(isSuccess !== ''){
           common.showNotify('Your profile is updated successfully.')
       }
   });
</script>

