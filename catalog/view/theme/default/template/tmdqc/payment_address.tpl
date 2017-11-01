<div class="panel panel-default">
    <div class="panel-heading"><?php echo $customer_title;?></div>
</div>
<form class="form-horizontal clearfix block">
    <!-- /***** Changes Starts *****/ -->
    <?php if (true) { ?>
    <!-- /***** Changes Ends *****/ -->
    <div id="payment-existing" class="col-sm-12">
        <div class="form-group">
            <label class="control-label" for="input-payment-address"><?php echo $entry_selectaddress; ?></label>
            <select name="address_id" class="form-control">
                <?php foreach ($addresses as $address) { ?>
                <?php if ($address['address_id'] == $address_id) { ?>
                <option value="<?php echo $address['address_id']; ?>"
                        selected="selected"><?php echo $address['firstname']; ?> <?php echo $address['lastname']; ?>
                    , <?php echo $address['address_1']; ?>, <?php echo $address['city']; ?>
                    , <?php echo $address['zone']; ?>, <?php echo $address['country']; ?></option>
                <?php } else { ?>
                <option value="<?php echo $address['address_id']; ?>"><?php echo $address['firstname']; ?> <?php echo $address['lastname']; ?>
                    , <?php echo $address['address_1']; ?>, <?php echo $address['city']; ?>
                    , <?php echo $address['zone']; ?>, <?php echo $address['country']; ?></option>
                <?php } ?>
                <?php } ?>
                <option value="new"><?php echo $text_address_new; ?></option>
            </select>
        </div>
    </div>
    <?php } ?>
    <div id="payment-new" class="col-sm-12">
    </div>
</form>
<script type="text/javascript"><!--
    /***** Changes Starts *****/
    $('#payment-existing select[name=\'address_id\']').on('change', function () {
        $('#payment-new').html('');
        if ($(this).val() == 'new') {
            $('#payment-new').load('index.php?route=tmdqc/payment_address/loadform');
        }

    <
            ? php
        if ($shipping_required) {
                ?
        >
            var payment_address_id = $('#payment-existing select[name="address_id"]').val();
            if (payment_address_id) {
                $('#shipping-existing select[name="address_id"]').val(payment_address_id);
            } else {
                $('#shipping-existing select[name="address_id"]').val('new');
            }
            $.ajax({
                url: 'index.php?route=tmdqc/payment_address/save',
                type: 'post',
                data: $('#accountcontent input[type=\'text\'], #accountcontent input[type=\'date\'], #accountcontent input[type=\'datetime-local\'], #accountcontent input[type=\'time\'], #accountcontent input[type=\'password\'], #accountcontent input[type=\'checkbox\']:checked, #accountcontent input[type=\'radio\']:checked, #accountcontent input[type=\'hidden\'], #accountcontent textarea, #accountcontent select'),
                dataType: 'json',
                success: function (json) {
                    $('.form-group').removeClass('has-error');
                    $('.alert, .text-danger').remove();

                    if (json['error']) {
                        $('.loader').addClass('hide');
                        if (json['error']['warning']) {
                            $('#typeaccount').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error']['warning'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
                        }

                        for (i in json['error']) {
                            var element = $('#input-payment-' + i.replace('_', '-'));
                            if ($(element).parent().hasClass('input-group')) {
                                $(element).parent().after('<div class="text-danger">' + json['error'][i] + '</div>');
                            } else {
                                $(element).after('<div class="text-danger">' + json['error'][i] + '</div>');
                            }
                        }

                        // Highlight any found errors
                        $('.text-danger').parent().addClass('has-error');
                    } else {
                        $('#shipping_method_load').trigger('click');
                    }
                }
            });
        <
                ? php
        }
            ?
    >
    });

    $('#payment-existing select[name=\'address_id\']').trigger('change');
    /***** Changes Ends *****/
    //--></script>
