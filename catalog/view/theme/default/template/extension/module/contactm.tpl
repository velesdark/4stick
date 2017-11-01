<div class="panel panel-default contactm">
    <div class="panel-heading"><i class="fa fa-envelope-o"></i>  <?php echo $heading_title; ?></div>
    <div class="panel-body">

        <form class="form-horizontal" id="form-contactm">
            <fieldset>
                <div class="form-group required">
                    <label class="col-sm-2 control-label" for="input-name"><?php echo $entry_name; ?></label>
                    <div class="col-sm-10">
                        <input type="text" name="name" value="" id="input-name" class="form-control"/>
                    </div>
                </div>
                <div class="form-group required">
                    <label class="col-sm-2 control-label" for="input-email"><?php echo $entry_email; ?></label>
                    <div class="col-sm-10">
                        <input type="text" name="email" value="" id="input-email" class="form-control"/>
                    </div>
                </div>
                <div class="form-group required">
                    <label class="col-sm-2 control-label" for="input-enquiry"><?php echo $entry_enquiry; ?></label>
                    <div class="col-sm-10">
                        <textarea name="enquiry" rows="10" id="input-enquiry" class="form-control"></textarea>
                    </div>
                </div>

            </fieldset>
            <div class="buttons">
                <div class="pull-right">
                    <input class="btn btn-primary submit" value="<?php echo $button_submit; ?>"/>
                </div>
            </div>
        </form>


    </div>
</div>

<script type="text/javascript"><!--

    $('.contactm .submit').on('click', function () {
        $.ajax({
            url: 'index.php?route=extension/module/contactm/send',
            type: 'post',
            dataType: 'json',
            data: $("#form-contactm").serialize(),
            beforeSend: function () {},
            complete: function () {},
            success: function (json) {
                $('.alert-success, .alert-danger').remove();

                if (json['error']) {
                    $('.buttons').before('<div class="alert alert-danger col-sm-offset-2 col-sm-10  text-center"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
                }

                if (json['success']) {
                    $('.buttons').before('<div class="alert alert-success col-sm-offset-2 col-sm-10  text-center"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');

                }
            }
        });
    });

    //--></script>