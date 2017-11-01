<div class="panel panel-default">
    <div class="panel-heading"><?php echo $text_dilevery_address ?></div>
</div>
<form class="form-horizontal clearfix block">
    <?php if ($shipping_required){ ?>
    <div class="checkbox">
        <label>
            <input type="checkbox" name="shipping_address" value="1" checked="checked"/>
            <?php echo $entry_shipping; ?></label>
    </div>
    <?php } ?>
    <!-- /***** Changes Starts *****/ -->
    <?php if (true) { ?>
    <!-- /***** Changes Ends *****/ -->
    <div id="shipping-existing" class="hide col-sm-12">
        <div class="form-group">
            <label class="control-label" for="input-shipping-address"><?php echo $text_select_address ?></label>
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
    <div id="shipping-new" class="hide col-sm-12"></div>
</form>
<script type="text/javascript"><!--
    /***** Changes Starts *****/
    $('#tmd_delivery_address input[name="shipping_address"]').on('click', function () {
        var val = $('#tmd_delivery_address input[name="shipping_address"]:checked').val();
        var payment_address_id = $('#payment-existing select[name="address_id"]').val();
        if (payment_address_id) {
            $('#shipping-existing select[name="address_id"]').val(payment_address_id);
        } else {
            $('#shipping-existing select[name="address_id"]').val('new');
        }
        if (val) {
            $('#shipping-existing').addClass('hide');
            $('#shipping-new').addClass('hide');
        } else {
            $('#shipping-existing').removeClass('hide');
            $('#shipping-new').removeClass('hide');
        }
        $('#shipping_method_load').trigger('click');
    });

    $('#tmd_delivery_address select[name=\'address_id\']').on('change', function () {
        var address_id = $(this).val();
        $('#shipping-new').html('');
        if ($(this).val() == 'new') {
            $('#shipping-new').load('index.php?route=tmdqc/shipping_address/loadform&address_id=' + address_id);
        }
        $('#shipping_method_load').trigger('click');
    });
    $('#tmd_delivery_address select[name=\'address_id\']').trigger('change');
    $('#shipping_method_load').trigger('click');
    /***** Changes Ends *****/
    //--></script>
<button type="button" class="hide" id="shipping_method_load">shipping_method_load</button>
<script type="text/javascript"><!--
    $('#shipping_method_load').on('click', function () {
    <
            ? php
        if ($shipping_required) {
                ?
        >
            $.ajax({
                url: 'index.php?route=tmdqc/shipping_address/save',
                type: 'post',
                data: $('#tmd_delivery_address input[type=\'text\'], #tmd_delivery_address input[type=\'date\'], #tmd_delivery_address input[type=\'datetime-local\'], #tmd_delivery_address input[type=\'time\'], #tmd_delivery_address input[type=\'password\'], #tmd_delivery_address input[type=\'checkbox\']:checked, #tmd_delivery_address input[type=\'radio\']:checked, #tmd_delivery_address textarea, #tmd_delivery_address select'),
                dataType: 'json',
                success: function (json) {
                    $('.form-group').removeClass('has-error');
                    $('.alert, .text-danger').remove();

                    if (json['error']) {
                        $('.loader').addClass('hide');
                        if (json['error']['warning']) {
                            $('#tmd_delivery_address .panel-body').prepend('<div class="alert alert-warning">' + json['error']['warning'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
                        }

                        for (i in json['error']) {
                            var element = $('#input-shipping-' + i.replace('_', '-'));

                            if ($(element).parent().hasClass('input-group')) {
                                $(element).parent().after('<div class="text-danger">' + json['error'][i] + '</div>');
                            } else {
                                $(element).after('<div class="text-danger">' + json['error'][i] + '</div>');
                            }
                        }
                        // Highlight any found errors
                        $('.text-danger').parent().addClass('has-error');
                    } else {
                        $.ajax({
                            url: 'index.php?route=tmdqc/shipping_method',
                            dataType: 'html',
                            success: function (html) {
                                $('#tmd_shipping_method').html(html);
                                $.ajax({
                                    url: 'index.php?route=tmdqc/shipping_method/save',
                                    type: 'post',
                                    data: $('#tmd_shipping_method input[type=\'radio\']:checked, #tmd_shipping_method textarea'),
                                    dataType: 'json',
                                    success: function (json) {
                                        $('.alert, .text-danger').remove();

                                        if (json['error']) {
                                            if (json['error']['warning']) {
                                                $('#warning').prepend('<div class="alert alert-warning">' + json['error']['warning'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
                                            }
                                        }
                                    }
                                });
                            }
                        });
                    }
                }
            });
        <
                ? php
        }
            ?
    >
    });
    //--></script>