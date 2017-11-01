<div class="panel panel-default">
    <div class="panel-heading">Delivery Address</div>
</div>

<form class="form-horizontal clearfix block">
    <?php if ($shipping_required){ ?>
    <div class="checkbox">
        <label>
            <input type="checkbox" name="shipping_address" value="1" checked="checked"/>
            <?php echo $entry_shipping; ?></label>
    </div>
    <?php } ?>
    <div id="guestform" class="hide col-sm-12">
        <?php
	foreach($tmdqc_deliveryaddresses as $form) {
		echo createformbysort($form['feild'],$form['label'][$language_id],$form['required'],$form['status'],$alldata);
	}
?>
        <?php foreach ($custom_fields as $custom_field) { ?>
        <?php if ($custom_field['location'] == 'address') { ?>
        <?php if ($custom_field['type'] == 'select') { ?>
        <div class="form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field"
             data-sort="<?php echo $custom_field['sort_order']; ?>">
            <label class="control-label"
                   for="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
            <select name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]"
                    id="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>"
                    class="form-control">
                <option value=""><?php echo $text_select; ?></option>
                <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
                <?php if (isset($address_custom_field[$custom_field['custom_field_id']]) && $custom_field_value['custom_field_value_id'] == $address_custom_field[$custom_field['custom_field_id']]) { ?>
                <option value="<?php echo $custom_field_value['custom_field_value_id']; ?>"
                        selected="selected"><?php echo $custom_field_value['name']; ?></option>
                <?php } else { ?>
                <option value="<?php echo $custom_field_value['custom_field_value_id']; ?>"><?php echo $custom_field_value['name']; ?></option>
                <?php } ?>
                <?php } ?>
            </select>
        </div>
        <?php } ?>
        <?php if ($custom_field['type'] == 'radio') { ?>
        <div class="form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field"
             data-sort="<?php echo $custom_field['sort_order']; ?>">
            <label class="control-label"><?php echo $custom_field['name']; ?></label>
            <div id="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>">
                <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
                <div class="radio">
                    <?php if (isset($address_custom_field[$custom_field['custom_field_id']]) && $custom_field_value['custom_field_value_id'] == $address_custom_field[$custom_field['custom_field_id']]) { ?>
                    <label>
                        <input type="radio" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]"
                               value="<?php echo $custom_field_value['custom_field_value_id']; ?>" checked="checked"/>
                        <?php echo $custom_field_value['name']; ?></label>
                    <?php } else { ?>
                    <label>
                        <input type="radio" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]"
                               value="<?php echo $custom_field_value['custom_field_value_id']; ?>"/>
                        <?php echo $custom_field_value['name']; ?></label>
                    <?php } ?>
                </div>
                <?php } ?>
            </div>
        </div>
        <?php } ?>
        <?php if ($custom_field['type'] == 'checkbox') { ?>
        <div class="form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field"
             data-sort="<?php echo $custom_field['sort_order']; ?>">
            <label class="control-label"><?php echo $custom_field['name']; ?></label>
            <div id="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>">
                <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
                <div class="checkbox">
                    <?php if (isset($address_custom_field[$custom_field['custom_field_id']]) && in_array($custom_field_value['custom_field_value_id'], $address_custom_field[$custom_field['custom_field_id']])) { ?>
                    <label>
                        <input type="checkbox" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>][]"
                               value="<?php echo $custom_field_value['custom_field_value_id']; ?>" checked="checked"/>
                        <?php echo $custom_field_value['name']; ?></label>
                    <?php } else { ?>
                    <label>
                        <input type="checkbox" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>][]"
                               value="<?php echo $custom_field_value['custom_field_value_id']; ?>"/>
                        <?php echo $custom_field_value['name']; ?></label>
                    <?php } ?>
                </div>
                <?php } ?>
            </div>
        </div>
        <?php } ?>
        <?php if ($custom_field['type'] == 'text') { ?>
        <div class="form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field"
             data-sort="<?php echo $custom_field['sort_order']; ?>">
            <label class="control-label"
                   for="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>

            <input type="text" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]"
                   value="<?php echo (isset($address_custom_field[$custom_field['custom_field_id']]) ? $address_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>"
                   placeholder="<?php echo $custom_field['name']; ?>"
                   id="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>"
                   class="form-control"/>
        </div>
        <?php } ?>
        <?php if ($custom_field['type'] == 'textarea') { ?>
        <div class="form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field"
             data-sort="<?php echo $custom_field['sort_order']; ?>">
            <label class="control-label"
                   for="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
            <textarea name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" rows="5"
                      placeholder="<?php echo $custom_field['name']; ?>"
                      id="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>"
                      class="form-control"><?php echo (isset($address_custom_field[$custom_field['custom_field_id']]) ? $address_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?></textarea>
        </div>
        <?php } ?>
        <?php if ($custom_field['type'] == 'file') { ?>
        <div class="form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field"
             data-sort="<?php echo $custom_field['sort_order']; ?>">
            <label class="control-label"><?php echo $custom_field['name']; ?></label>
            <button type="button" id="button-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>"
                    data-loading-text="<?php echo $text_loading; ?>" class="btn btn-default"><i
                        class="fa fa-upload"></i> <?php echo $button_upload; ?></button>
            <input type="hidden" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]"
                   value="<?php echo (isset($address_custom_field[$custom_field['custom_field_id']]) ? $address_custom_field[$custom_field['custom_field_id']] : ''); ?>"/>
        </div>
        <?php } ?>
        <?php if ($custom_field['type'] == 'date') { ?>
        <div class="form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field"
             data-sort="<?php echo $custom_field['sort_order']; ?>">
            <label class="control-label"
                   for="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
            <div class="input-group date">
                <input type="text" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]"
                       value="<?php echo (isset($address_custom_field[$custom_field['custom_field_id']]) ? $address_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>"
                       placeholder="<?php echo $custom_field['name']; ?>" data-date-format="YYYY-MM-DD"
                       id="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>"
                       class="form-control"/>
                <span class="input-group-btn">
        <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
        </span></div>
        </div>
        <?php } ?>
        <?php if ($custom_field['type'] == 'time') { ?>
        <div class="form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field"
             data-sort="<?php echo $custom_field['sort_order']; ?>">
            <label class="control-label"
                   for="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
            <div class="input-group time">
                <input type="text" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]"
                       value="<?php echo (isset($address_custom_field[$custom_field['custom_field_id']]) ? $address_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>"
                       placeholder="<?php echo $custom_field['name']; ?>" data-date-format="HH:mm"
                       id="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>"
                       class="form-control"/>
                <span class="input-group-btn">
        <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
        </span></div>
        </div>
        <?php } ?>
        <?php if ($custom_field['type'] == 'datetime') { ?>
        <div class="form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field"
             data-sort="<?php echo $custom_field['sort_order']; ?>">
            <label class="control-label"
                   for="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
            <div class="input-group datetime">
                <input type="text" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]"
                       value="<?php echo (isset($address_custom_field[$custom_field['custom_field_id']]) ? $address_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>"
                       placeholder="<?php echo $custom_field['name']; ?>" data-date-format="YYYY-MM-DD HH:mm"
                       id="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>"
                       class="form-control"/>
                <span class="input-group-btn">
        <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
        </span></div>
        </div>
        <?php } ?>
        <?php } ?>
        <?php } ?>
    </div>
</form>
<script type="text/javascript"><
    !--
        $('#tmd_delivery_address input[name="shipping_address"]').on('click', function () {
            var val = $('#tmd_delivery_address input[name="shipping_address"]:checked').val();
            if (val) {
                $('#guestform').addClass('hide');
            } else {
                $('#guestform').removeClass('hide');
            }
        });


</script>
<script type="text/javascript"><!--
    // Sort the custom fields
    $('#tmd_delivery_address .form-group[data-sort]').detach().each(function () {
        if ($(this).attr('data-sort') >= 0 && $(this).attr('data-sort') <= $('#tmd_delivery_address .form-group').length) {
            $('#tmd_delivery_address .form-group').eq($(this).attr('data-sort')).before(this);
        }

        if ($(this).attr('data-sort') > $('#tmd_delivery_address .form-group').length) {
            $('#tmd_delivery_address .form-group:last').after(this);
        }

        if ($(this).attr('data-sort') < -$('#tmd_delivery_address .form-group').length) {
            $('#tmd_delivery_address .form-group:first').before(this);
        }
    });
    //--></script>
<script type="text/javascript"><!--
    $('#tmd_delivery_address button[id^=\'button-shipping-custom-field\']').on('click', function () {
        var node = this;

        $('#form-upload').remove();

        $('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>');

        $('#form-upload input[name=\'file\']').trigger('click');

        if (typeof timer != 'undefined') {
            clearInterval(timer);
        }

        timer = setInterval(function () {
            if ($('#form-upload input[name=\'file\']').val() != '') {
                clearInterval(timer);

                $.ajax({
                    url: 'index.php?route=tool/upload',
                    type: 'post',
                    dataType: 'json',
                    data: new FormData($('#form-upload')[0]),
                    cache: false,
                    contentType: false,
                    processData: false,
                    beforeSend: function () {
                        $(node).button('loading');
                    },
                    complete: function () {
                        $(node).button('reset');
                    },
                    success: function (json) {
                        $(node).parent().find('.text-danger').remove();

                        if (json['error']) {
                            $(node).parent().find('input[name^=\'custom_field\']').after('<div class="text-danger">' + json['error'] + '</div>');
                        }

                        if (json['success']) {
                            alert(json['success']);

                            $(node).parent().find('input[name^=\'custom_field\']').attr('value', json['file']);
                        }
                    },
                    error: function (xhr, ajaxOptions, thrownError) {
                        alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                    }
                });
            }
        }, 500);
    });
    //--></script>
<script type="text/javascript"><!--
    $('.date').datetimepicker({
        pickTime: false
    });

    $('.time').datetimepicker({
        pickDate: false
    });

    $('.datetime').datetimepicker({
        pickDate: true,
        pickTime: true
    });
    //--></script>
<script type="text/javascript"><!--
    $('#tmd_delivery_address select[name=\'country_id\']').on('change', function () {
        $.ajax({
            url: 'index.php?route=tmdqc/tmdcheckout/country&country_id=' + this.value,
            dataType: 'json',
            beforeSend: function () {
                $('#tmd_delivery_address select[name=\'country_id\']').after(' <i class="fa fa-circle-o-notch fa-spin"></i>');
            },
            complete: function () {
                $('.fa-spin').remove();
            },
            success: function (json) {
                if (json['postcode_required'] == '1') {
                    $('#tmd_delivery_address input[name=\'postcode\']').parent().parent().addClass('required');
                } else {
                    $('#tmd_delivery_address input[name=\'postcode\']').parent().parent().removeClass('required');
                }

                html = '<option value=""><?php echo $text_select; ?></option>';

                if (json['zone'] && json['zone'] != '') {
                    for (i = 0; i < json['zone'].length; i++) {
                        html += '<option value="' + json['zone'][i]['zone_id'] + '"';

                        if (json['zone'][i]['zone_id'] == '<?php echo $zone_id; ?>') {
                            html += ' selected="selected"';
                        }

                        html += '>' + json['zone'][i]['name'] + '</option>';
                    }
                } else {
                    html += '<option value="0" selected="selected"><?php echo $text_none; ?></option>';
                }

                $('#tmd_delivery_address select[name=\'zone_id\']').html(html);
            },
            error: function (xhr, ajaxOptions, thrownError) {
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        });
    });

    $('#tmd_delivery_address select[name=\'country_id\']').trigger('change');
    //--></script>

<?php 
function createformbysort($feild,$label,$required,$status,$alldata) {
	$required = ($required ? ' required' : '');
	$status   = ($status ? '' : ' hide'); 
	if($feild=='tmdqc_deliveryaddress_firstname'){
		$newfelid =  '<div class="form-group'.$required.$status.'">
<label class="control-label" for="input-shipping-firstname">'.$label .'</label>
<input type="text" name="firstname" value="'.$alldata['firstname'].'" placeholder="'.$label .'"
       id="input-shipping-firstname" class="form-control"/>
</div>';
return $newfelid;
}

if($feild=='tmdqc_deliveryaddress_lastname'){
$newfelid =  '
<div class="form-group'.$required.$status.'">
    <label class="control-label" for="input-shipping-lastname">'.$label .'</label>
    <input type="text" name="lastname" value="'.$alldata['lastname'].'" placeholder="'.$label .'"
           id="input-shipping-lastname" class="form-control"/>
</div>';
return $newfelid;
}

if($feild=='tmdqc_deliveryaddress_lastname'){
$newfelid =  '
<div class="form-group'.$required.$status.'">
    <label class="control-label" for="input-shipping-lastname">'.$label .'</label>
    <input type="text" name="lastname" value="'.$alldata['lastname'].'" placeholder="'.$label .'"
           id="input-shipping-lastname" class="form-control"/>
</div>';
return $newfelid;
}

if($feild=='tmdqc_deliveryaddress_company'){
$newfelid =  '
<div class="form-group'.$required.$status.'">
    <label class="control-label" for="input-shipping-company">'.$label .'</label>
    <input type="text" name="company" value="'.$alldata['company'].'" placeholder="'.$label .'"
           id="input-shipping-company" class="form-control"/>
</div>';
return $newfelid;
}

if($feild=='tmdqc_deliveryaddress_address1'){
$newfelid =  '
<div class="form-group'.$required.$status.'">
    <label class="control-label" for="input-shipping-address-1">'.$label .'</label>
    <input type="text" name="address_1" value="'.$alldata['address_1'].'" placeholder="'.$label .'"
           id="input-shipping-address-1" class="form-control"/>
</div>';
return $newfelid;
}

if($feild=='tmdqc_deliveryaddress_address2'){
$newfelid =  '
<div class="form-group'.$required.$status.'">
    <label class="control-label" for="input-shipping-address-2">'.$label .'</label>
    <input type="text" name="address_2" value="'.$alldata['address_2'].'" placeholder="'.$label .'"
           id="input-shipping-address-2" class="form-control"/>
</div>';
return $newfelid;
}

if($feild=='tmdqc_deliveryaddress_city'){
$newfelid =  '
<div class="form-group'.$required.$status.'">
    <label class="control-label" for="input-shipping-city">'.$label .'</label>
    <input type="text" name="city" value="'.$alldata['city'].'" placeholder="'.$label .'" id="input-shipping-city"
           class="form-control"/>
</div>';
return $newfelid;
}

if($feild=='tmdqc_deliveryaddress_postal_code'){
$newfelid =  '
<div class="form-group'.$required.$status.'">
    <label class="control-label" for="input-shipping-postcode">'.$label .'</label>
    <input type="text" name="postcode" value="'.$alldata['postcode'].'" placeholder="'.$label .'"
           id="input-shipping-postcode" class="form-control"/>
</div>';
return $newfelid;
}


if($feild=='tmdqc_deliveryaddress_country'){
$newfelid =    '
<div class="form-group '.$required.$status.'"><label class="control-label"
                                                     for="input-shipping-country">'.$label.'</label><select
            name="country_id" id="input-shipping-country" class="form-control">
        <option value="">'. $alldata['text_select'] .'</option>
        ';
        foreach ($alldata['countries'] as $country){
        if ($country['country_id'] == $alldata['country_id']) {
        $newfelid .='
        <option value="'.$country['country_id'].'" selected="selected">'.$country['name'].'</option>
        ';
        } else {
        $newfelid .='
        <option value="'.$country['country_id'].'">'.$country['name'].'</option>
        ';
        }
        }
        $newfelid .='</select>';
    $newfelid .='
</div>';
return $newfelid;
}

if($feild=='tmdqc_deliveryaddress_state'){
$newfelid = '
<div class="form-group '.$required.$status.'">
    <label class="control-label" for="input-shipping-zone">'.$label.'</label>
    <select name="zone_id" id="input-shipping-zone" class="form-control"></select>
</div>';
return $newfelid;
}
}
?>