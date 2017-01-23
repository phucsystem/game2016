<?php echo form_open('master/round/improvement'.'/'.$current_round.'/'.$gameId); ?>
<div class="form-group col-lg-6">
    <label>Team</label>
    <select onchange="selectGame()" class="form-control " name='improvement[team_id]' >
        <?php foreach ($teams as $t) { ?>
            <option value="<?= $t['id']  ?>"><?= $t['name'] ?></option>
        <?php } ?>
    </select>
</div>
<div class="form-group col-lg-6">
    <label>Money</label>
    <input  class="form-control " placeholder=""  value="0" name='improvement[factor][<?= TEAM_MONEY?>]'>
</div>
<div class="form-group col-lg-6">
    <label>ECO Credit</label>
    <input  class="form-control " placeholder=""  value="0" name='improvement[factor][<?= TEAM_ECO_CREDIT ?>]'>
</div>
<div class="form-group col-lg-6">
    <label>SO Credit</label>
    <input  class="form-control " placeholder=""  value="0" name='improvement[factor][<?= TEAM_SO_CREDIT ?>]'>
</div>
<div class="form-group col-lg-6">
    <label>ME Credit</label>
    <input  class="form-control " placeholder=""  value="0" name='improvement[factor][<?= TEAM_ME_CREDIT ?>]'>
</div>
<div class="form-group col-lg-6">
    <label>Factory Capacity</label>
    <input  class="form-control " placeholder=""  value="0" name='improvement[factor][<?= TEAM_FACTORY_CAPACITY ?>]'>
</div>
<div class="form-group col-lg-6">
    <label>Storage Capacity in IC</label>
    <input  class="form-control " placeholder=""  value="0" name='improvement[factor][<?= TEAM_STORAGE_CAPACITY_IC ?>]'>
</div>
<div class="form-group col-lg-6">
    <label>Storage Capacity in EC1</label>
    <input  class="form-control " placeholder=""  value="0" name='improvement[factor][<?= TEAM_STORAGE_CAPACITY_EC1 ?>]'>
</div>
<div class="form-group col-lg-6">
    <label>Storage Capacity in EC2</label>
    <input  class="form-control " placeholder=""  value="0" name='improvement[factor][<?= TEAM_STORAGE_CAPACITY_EC2 ?>]'>
</div>
<div class="form-group col-lg-6">
    <label>Storage Capacity in DC</label>
    <input  class="form-control " placeholder=""  value="0" name='improvement[factor][<?= TEAM_STORAGE_CAPACITY_DC ?>]'>
</div>
<div class="form-group col-lg-12">
    <label>Improvement Note</label>
    <textarea class="form-control" rows="5" name='improvement[note]'></textarea>
</div>
<div class="pull-right">
    <button type="submit" class="btn btn-outline btn-primary pull-right " type="button"><i class="fa fa-arrow-up"></i>   Apply Improvement</button>
</div>
</form>