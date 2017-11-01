<div class="modal-dialog">
    <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h2 class="modal-title text-center"><i><?php echo $text_log_in ?></i></h4>
        </div>
        <div class="modal-body">
            <div class="row">
                <div class="col-sm-12">
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="form-group">
                                <label class="control-label" for="input-email"><?php echo $entry_email; ?></label>
                                <input type="text" name="email" value="" placeholder="<?php echo $entry_email; ?>"
                                       id="input-email" class="form-control"/>
                            </div>
                            <div class="form-group">
                                <label class="control-label" for="input-password"><?php echo $entry_password; ?></label>
                                <input type="password" name="password" value=""
                                       placeholder="<?php echo $entry_password; ?>" id="input-password"
                                       class="form-control"/>
                                <a href="<?php echo $forgotten; ?>"><?php echo $text_forgotten; ?></a></div>
                            <input type="button" value="<?php echo $button_login; ?>" id="button-login"
                                   data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary col-sm-6"/>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<style>
    .modal-dialog .btn{font-size:23px;} .modal-dialog label{font-size:16px} .modal-dialog .form-control

    {height:45px;}

</style>	