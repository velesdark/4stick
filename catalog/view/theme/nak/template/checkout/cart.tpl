<?php echo $header; ?>
<div class="left">
    <?php echo $column_left; ?>


    <div class="left_vk">
        <img src="/image/vk_g.png"/>
    </div>
    <div class="left_social">
        <a href="http://facebook.com" target="_blank"><img src="/image/face.png"/></a>
        <a href="http://twitter.com" target="_blank"><img src="/image/tw.png"/></a>
        <a href="http://vk.com" target="_blank"><img src="/image/vk.png"/></a>
        <a href="http://ok.ru" target="_blank"><img src="/image/ok.png"/></a>
        <a href="http://google.com" target="_blank"><img src="/image/google.png"/></a>
    </div>
</div>
<div class="content">
    <div class='bread'>
        <ul>
            <li class="link">
                <a href="/">Главная</a>
            </li>

            <?php foreach ($breadcrumbs as $k=>$breadcrumb) { ?>
            <?php if($k==count($breadcrumbs)-1) { ?>
            <li>
                <span><?php echo $breadcrumb['text']; ?></span>
            </li>
            <?php } else { ?>
            <li class="link">
                <a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
            </li>

            <?php } ?>

            <?php } ?>

        </ul>
    </div>
    <div class="title_red">
        Корзина заказа
    </div>
    <div class="cart_items">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
            <table cellspacing=0 cellpadding=0>
                <thead>
                <tr>
                    <td class="text-center"></td>
                    <td class="text-left"><?php echo $column_name; ?></td>
                    <td class="text-left">Цена</td>
                    <td class="text-left"><?php echo $column_quantity; ?></td>
                    <td class="text-right">Сумма</td>
                    <td class="text-right"></td>
                </tr>
                </thead>
                <tbody>
                <?php foreach ($products as $product) { ?>
                <tr>
                    <td>
                        <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>"
                                                                       alt="<?php echo $product['name']; ?>"
                                                                       title="<?php echo $product['name']; ?>"
                                                                       class="/image-thumbnail"/></a>
                    </td>
                    <td>
                        <a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
                    </td>
                    <td class="cart_price">
                        Розничная цена<br/>
                        <span><?php echo $product['price']; ?></span>
                    </td>
                    <td class="cart_q">
                        <div class="cart_minus">-</div>
                        <input type="text" name="quantity[<?php echo $product['cart_id']; ?>]"
                               value="<?php echo $product['quantity']; ?>" size="1" class="form-control"/>
                        <div class="cart_plus">+</div>
                        <button type="submit" data-toggle="tooltip" title="<?php echo $button_update; ?>"
                                class="btn btn-primary"><i class="fa fa-refresh"></i></button>
                    </td>
                    <td>
                        <?php echo $product['total']; ?>
                    </td>
                    <td>
                        <button type="button" data-toggle="tooltip" title="<?php echo $button_remove; ?>"
                                class="btn btn-danger del" onclick="cart.remove('<?php echo $product['cart_id']; ?>');">
                            <i class="fa fa-times-circle"></i></button>

                    </td>

                </tr>
                <?php } ?>
                </tbody>
            </table>
        </form>
    </div>
    <div class="cart_total">
        <div class="cart_total_left">
            <label>
                Введите код купона для скидки:
            </label>
            <input type="text" name="coupon" id="input-coupon" class="form-control"/>
            <input type="button" value="Применить" id="button-coupon" data-loading-text="<?php echo $text_loading; ?>"
                   class="btn btn-primary"/>
        </div>
        <div class="cart_total_right">
            <?php foreach ($totals as $total) { ?>
            <div class="cart_totla_line">
                <span><?php echo $total['title']; ?>:</span>
                <?php echo $total['text']; ?>
            </div>
            <?php } ?>

        </div>

    </div>
    <div class="cart_btns">
        <div class="cart_btns_left">
            <a href="/">Продолжить покупки</a><br/>
            <span>Вернуться к выбору товаров</span>
        </div>
        <div class="cart_btns_right">
            <div class="cart_btn_right1">
                <a href="<?php echo $checkout; ?>">Оформить заказ</a><br/>
                <span>Полноценное оформление заказа</span>

            </div>
            <div class="cart_btn_right2">
                <a class="click_link">Быстрый заказ</a><br/>
                <span>Вам потребуется указать только имя и номер</span>

            </div>

        </div>

    </div>

</div>


<div class="forms">
    <?php echo $column_right; ?>
</div>
<?php echo $footer; ?>


<script type="text/javascript"><!--
    $('#button-coupon').on('click', function () {
        $.ajax({
            url: 'index.php?route=extension/total/coupon/coupon',
            type: 'post',
            data: 'coupon=' + encodeURIComponent($('input[name=\'coupon\']').val()),
            dataType: 'json',
            beforeSend: function () {
                $('#button-coupon').button('loading');
            },
            complete: function () {
                $('#button-coupon').button('reset');
            },
            success: function (json) {
                $('.alert').remove();

                if (json['error']) {
                    $('.breadcrumb').after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');

                    $('html, body').animate({scrollTop: 0}, 'slow');
                }

                if (json['redirect']) {
                    location = json['redirect'];
                }
            }
        });
    });
    //--></script>