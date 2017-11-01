<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
    <div class="table-responsive">
        <table class="table table-bordered">
            <thead>
            <tr>
                <th colspan="<?php echo $colspn; ?>" class="text-center"><?php echo $heading_title ?></th>
            </tr>
            </thead>
            <thead>
            <tr>
                <?php if($tmdqc_cart_image_status){ ?>
                <td class="text-center"><?php echo $column_image; ?></td>
                <?php } ?>
                <?php if($tmdqc_cart_name_status){ ?>
                <td class="text-left"><?php echo $column_name; ?></td>
                <?php } ?>
                <?php if($tmdqc_cart_model_status){ ?>
                <td class="text-left"><?php echo $column_model; ?></td>
                <?php } ?>
                <?php if($tmdqc_cart_upc_status){ ?>
                <td class="text-left"><?php echo $column_upc; ?></td>
                <?php } ?>
                <?php if($tmdqc_cart_ean_status){ ?>
                <td class="text-left"><?php echo $column_ean; ?></td>
                <?php } ?>
                <?php if($tmdqc_cart_isbn_status){ ?>
                <td class="text-left"><?php echo $column_isbn; ?></td>
                <?php } ?>
                <?php if($tmdqc_cart_qty_status){ ?>
                <td class="text-left"><?php echo $column_quantity; ?></td>
                <?php } ?>
                <?php if($tmdqc_cart_unitprice_status){ ?>
                <td class="text-right"><?php echo $column_price; ?></td>
                <?php } ?>
                <td class="text-right"><?php echo $column_total; ?></td>
            </tr>
            </thead>
            <tbody>
            <?php foreach ($products as $product) { ?>
            <tr>
                <?php if($tmdqc_cart_image_status){ ?>
                <td class="text-center"><?php if ($product['thumb']) { ?>
                    <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>"
                                                                   alt="<?php echo $product['name']; ?>"
                                                                   title="<?php echo $product['name']; ?>"
                                                                   class="img-thumbnail"/></a>
                    <?php } ?></td>
                <?php } ?>
                <?php if($tmdqc_cart_name_status){ ?>
                <td class="text-left"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
                    <?php if (!$product['stock']) { ?>
                    <span class="text-danger">***</span>
                    <?php } ?>
                    <?php if ($product['option']) { ?>
                    <?php foreach ($product['option'] as $option) { ?>
                    <br/>
                    <small><?php echo $option['name']; ?>: <?php echo $option['value']; ?></small>
                    <?php } ?>
                    <?php } ?>
                    <?php if ($product['reward']) { ?>
                    <br/>
                    <small><?php echo $product['reward']; ?></small>
                    <?php } ?>
                    <?php if ($product['recurring']) { ?>
                    <br/>
                    <span class="label label-info"><?php echo $text_recurring_item; ?></span>
                    <small><?php echo $product['recurring']; ?></small>
                    <?php } ?></td>
                <?php } ?>
                <?php if($tmdqc_cart_model_status){ ?>
                <td class="text-left"><?php echo $product['model']; ?></td>
                <?php } ?>
                <?php if($tmdqc_cart_upc_status){ ?>
                <td class="text-left"><?php echo $product['upc']; ?></td>
                <?php } ?>
                <?php if($tmdqc_cart_ean_status){ ?>
                <td class="text-left"><?php echo $product['ean']; ?></td>
                <?php } ?>
                <?php if($tmdqc_cart_isbn_status){ ?>
                <td class="text-left"><?php echo $product['isbn']; ?></td>
                <?php } ?>
                <?php if($tmdqc_cart_qty_status){ ?>
                <td class="text-left">
                    <div class="input-group btn-block" style="max-width: 200px;">
                        <input type="text" name="quantity[<?php echo $product['cart_id']; ?>]"
                               value="<?php echo $product['quantity']; ?>" size="1" class="form-control"/>
                        <span class="input-group-btn">
                    <button type="submit" data-toggle="tooltip" title="<?php echo $button_update; ?>"
                            class="btn btn-primary"><i class="fa fa-refresh"></i></button>
                    <button type="button" data-toggle="tooltip" title="<?php echo $button_remove; ?>"
                            class="btn btn-danger" onclick="cartremove('<?php echo $product['cart_id']; ?>');"><i
                                class="fa fa-times-circle"></i></button></span></div>
                </td>
                <?php } ?>
                <?php if($tmdqc_cart_unitprice_status){ ?>
                <td class="text-right"><?php echo $product['price']; ?></td>
                <?php } ?>
                <td class="text-right"><?php echo $product['total']; ?></td>
            </tr>
            <?php } ?>
            <?php foreach ($vouchers as $vouchers) { ?>
            <tr>
                <td></td>
                <td class="text-left"><?php echo $vouchers['description']; ?></td>
                <td class="text-left"></td>
                <td class="text-left">
                    <div class="input-group btn-block" style="max-width: 200px;">
                        <input type="text" name="" value="1" size="1" disabled="disabled" class="form-control"/>
                        <span class="input-group-btn"><button type="button" data-toggle="tooltip"
                                                              title="<?php echo $button_remove; ?>"
                                                              class="btn btn-danger"
                                                              onclick="voucher.remove('<?php echo $vouchers['key']; ?>');"><i
                                        class="fa fa-times-circle"></i></button></span></div>
                </td>
                <td class="text-right"><?php echo $vouchers['amount']; ?></td>
                <td class="text-right"><?php echo $vouchers['amount']; ?></td>
            </tr>
            <?php } ?>
            </tbody>
        </table>
    </div>
</form>
<?php if($tmdqc_cart_coupan_status || $tmdqc_cart_gift_status || $permission_reward){ ?>
<div class="panel-group" id="accordion">
    <!--Coupan--->
    <div class="col-sm-4 pull-right">
        <?php if($tmdqc_cart_coupan_status){ ?>
        <div class="form-group">
            <div class="input-group">
                <input type="text" name="coupon" value="<?php echo $coupon; ?>"
                       placeholder="<?php echo $entry_coupon; ?>" id="input-coupon" class="form-control"/>
                <span class="input-group-btn">
								<input type="button" value="<?php echo $button_coupon; ?>" id="button-coupon"
                                       data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary"/>
								</span>
            </div>
        </div>
        <?php } ?>
        <!--coupan End--->
        <!--Voucher Start-->
        <?php if($tmdqc_cart_gift_status){ ?>
        <div class="form-group">
            <div class="input-group">
                <input type="text" name="voucher" value="<?php echo $voucher; ?>"
                       placeholder="<?php echo $entry_voucher; ?>" id="input-voucher" class="form-control"/>
                <span class="input-group-btn">
							<input type="submit" value="<?php echo $button_voucher; ?>" id="button-voucher"
                                   data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary"/>
						</span>
            </div>
        </div>
        <?php } ?>
        <!--Voucher End-->
        <!--Reward Start-->
        <?php if($permission_reward){ ?>
        <div class="form-group">
            <div class="input-group">
                <input type="text" name="reward" value="<?php echo $reward; ?>"
                       placeholder="<?php echo $entry_reward; ?>" id="input-reward" class="form-control"/>
                <span class="input-group-btn">
						<input type="submit" value="<?php echo $button_reward; ?>" id="button-reward"
                               data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary"/>
						</span>
            </div>
        </div>
        <?php } ?>
        <!--Reward End-->
    </div>
</div>
<br/>
<?php } ?>
<?php if($tmdqc_cart_total_status){ ?>
<div class="row">
    <div class="col-sm-4 col-sm-offset-8">
        <table class="table table-bordered">
            <?php foreach ($totals as $total) { ?>
            <tr>
                <td class="text-right"><strong><?php echo $total['title']; ?>:</strong></td>
                <td class="text-right"><?php echo $total['text']; ?></td>
            </tr>
            <?php } ?>
        </table>
    </div>
</div>
<?php  } ?>
<script>
    function cartremove(key) {
        $.ajax({
            url: 'index.php?route=checkout/cart/remove',
            type: 'post',
            data: 'key=' + key,
            dataType: 'json',
            beforeSend: function () {
                $('#cart > button').button('loading');
            },
            complete: function () {
                $('#cart > button').button('reset');
            },
            success: function (json) {
                setTimeout(function () {
                    $('#cart > button').html('<span id="cart-total"><i class="fa fa-shopping-cart"></i> ' + json['total'] + '</span>');
                }, 100);

                if (getURLVar('route') == 'tmdqc/tmdcheckout') {
                    location = 'index.php?route=tmdqc/tmdcheckout';
                } else {
                    $('#cart > ul').load('index.php?route=common/cart/info ul li');
                }
            }
        });
    }
</script>