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
        <?php echo $heading_title; ?>
    </div>

    <div class="ch_all">
        <div class="ch_left">
            <div class="ch_block">
                <div class="ch_block_title region">
                    Регион доставки
                </div>
                <div class="ch_block_cont">
                    <div class="ch_block_cont_title">
                        Местоположение<span>*</span>
                    </div>
                    <div class="ch_cities">
                        <div class="ch_city active">Москва</div>
                        <div class="ch_city">Санкт-Петербург</div>
                        <div class="ch_city">Екатеринбург</div>
                        <div class="ch_city">Челябинск</div>

                    </div>

                    <div class="payment-data">
                        <input type="text" id="city-ch" name="city" value="<?php echo $city; ?>"
                               class="form-control large-field">
                        <span class="error"></span>
                    </div>

                </div>
            </div>
            <div class="ch_block">
                <div class="ch_block_title dost">
                    Доставка
                </div>
                <div class="ch_block_cont">
                    <div class="ch_block_cont_title">
                        Вид доставки<span>*</span>
                    </div>
                    <div class="payment-data dost_c">
                        <?php $k=0; foreach ($shippig_methods as $shipping_method) { ?>
                        <label><input type="radio" <?php if($k==0) echo 'checked'; ?> name="shipping_method"
                            id="shipping-method" class="form-control large-field"
                            value='{"title": "<?php echo $shipping_method['title'] ?>", "code": "<?php echo $shipping_method['value'] ?>", "comment":"", "shipping_method":"<?php echo $shipping_method['value'] ?>", "cost":"<?php echo $shipping_method['cost'] ?>","tax_class_id":""}
                            '><?php echo $shipping_method['title'] ?></label>
                        <?php $k++; } ?>
                    </div>

                </div>
            </div>
            <div class="ch_block">
                <div class="ch_block_title pay">
                    Оплата
                </div>
                <div class="ch_block_cont">
                    <div class="ch_block_cont_title">
                        Вид оплаты
                    </div>
                    <div class="payment-data pay_c">
                        <?php $k=0; foreach ($payment_methods as $payment_method) {  ?>
                        <label><input type="radio" <?php if($k==0) echo 'checked'; ?> id="payment_select"
                            name="payment_method" class="form-control large-field"
                            value='{"title": "<?php echo $payment_method['title'] ?>", "code": "<?php echo $payment_method['code'] ?>"}
                            '><?php echo $payment_method['title'] ?></label>
                        <?php $k++; } ?>
                    </div>

                </div>
            </div>
            <div class="ch_block">
                <div class="ch_block_title user">
                    Покупатель
                </div>
                <div class="ch_block_cont user">
                    <div class="ch_block_cont_line">
                        <div class="ch_block_cont_line_left">
                            Ф.И.О.<span>*</span>
                        </div>
                        <div class="ch_block_cont_line_right payment-data">
                            <input type="text" id="firstname-ch" name="firstname" value=""
                                   class="form-control large-field">
                            <span class="error"></span>

                        </div>
                        <div class="ch_block_cont_line_left">
                            Email
                        </div>
                        <div class="ch_block_cont_line_right payment-data">
                            <input type="text" id="email-ch" name="email" value="<?php echo $email; ?>"
                                   class="form-control large-field">
                            <span class="error"></span>

                        </div>
                        <div class="ch_block_cont_line_left">
                            Телефон<span>*</span>
                        </div>
                        <div class="ch_block_cont_line_right payment-data">
                            <input type="tel" id="telephone-ch" name="telephone"
                                   value="<?php echo $telephone; ?>" class="form-control large-field">
                            <span class="error"></span>

                        </div>
                        <div class="ch_block_cont_line_left">
                            Адрес<span>*</span>
                        </div>
                        <div class="ch_block_cont_line_right payment-data">
                            <input type="text" name="address_1" id="address_1" value="<?php echo $address_1 ?>"
                                   class="form-control large-field" placeholder="  <?=$text_delivery_placeholder?>">
                            <span class="error"></span>
                        </div>
                        <div class="ch_block_cont_line_left">

                        </div>
                        <div class="ch_block_cont_line_right payment-data">
                            <input type="text" id="comment_field" class="form-control large-field" name="comment"
                                   value="<?php echo $comment ?>" placeholder="Комментарии к заказу">
                        </div>

                    </div>


                </div>
            </div>


        </div>
        <div class="ch_right">
            <div class="ch_right_top_info ch_w">
                <div class="ch_right_top">
                    Ваш заказ <a href="/index.php?route=checkout/cart">Изменить</a>
                </div>
                <div class="ch_right_center">
                    <?php foreach ($totals as $total) { ?>

                    <?php if($total['title']=='Предварительная стоимость') { ?>
                    <div class="ch_line_total">
                        <div class="ch_line_total_left">
                            Товаров на:
                        </div>
                        <div class="ch_line_total_right">
                            <?php echo $total['text']; ?>
                        </div>
                    </div>
                    <?php } ?>
                    <?php } ?>
                </div>
                <div class="ch_right_bottom">
                    <div class="ch_right_bottom_line">
                        <div class="ch_right_bottom_line_left">
                            Ваш заказ
                        </div>
                        <div class="ch_right_bottom_line_right">
                            <?php foreach ($totals as $total) { ?>
                            <?php if($total['title']=='Итого') { ?>
                            <?php echo $total['text']; ?>
                            <?php } ?>
                            <?php } ?>
                        </div>

                    </div>
                    <div class="clear"></div>
                    <div class="btn_check ajax-button-confirm  btn btn-lg btn-success"><?=$text_confirm?></div>
                </div>
            </div>

        </div>

    </div>

    <div class="ch_all">
        <div class="ch_left">
            <div class="ch_block">
                <div class="ch_block_title ok">
                    Данные о заказе
                </div>
                <div class="ch_block_cont inform">
                    <div class="ch_info_line">
                        <div class="ch_info_line_left">
                            Ф.И.О.
                        </div>
                        <div class="ch_info_line_right t_user">
                        </div>

                    </div>
                    <div class="ch_info_line">
                        <div class="ch_info_line_left">
                            Email
                        </div>
                        <div class="ch_info_line_right t_email">
                        </div>

                    </div>
                    <div class="ch_info_line">
                        <div class="ch_info_line_left">
                            Телефон
                        </div>
                        <div class="ch_info_line_right t_phone">

                        </div>

                    </div>
                    <div class="ch_info_line">
                        <div class="ch_info_line_left">
                            Город
                        </div>
                        <div class="ch_info_line_right t_city">
                        </div>

                    </div>
                    <div class="ch_info_line">
                        <div class="ch_info_line_left">
                            Адрес
                        </div>
                        <div class="ch_info_line_right t_adress">
                        </div>

                    </div>

                    <div class="ch_info_line">
                        <div class="ch_info_line_left">
                            Доставка
                        </div>
                        <div class="ch_info_line_right t_dost">
                        </div>

                    </div>
                    <div class="ch_info_line">
                        <div class="ch_info_line_left">
                            Оплата
                        </div>
                        <div class="ch_info_line_right t_pay">
                        </div>

                    </div>

                </div>
            </div>
            <div class="ch_block">
                <div class="ch_block_title cart_i">
                    Товары в заказе
                </div>
            </div>


        </div>
        <div class="ch_right">

        </div>

    </div>


    <div class="cart_items">

        <table cellspacing=0 cellpadding=0>
            <thead>
            <tr>
                <td class="text-center"></td>
                <td class="text-left">Наименование</td>
                <td class="text-left">Цена</td>
                <td class="text-left">Количество</td>
                <td class="text-right">Сумма</td>

            </tr>
            </thead>
            <tbody>
            <?php foreach ($products as $product) { ?>
            <tr>
                <td>
                    <a href="<?php echo $product['href']; ?>"><img src="/image/<?php echo $product['image']; ?>"
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
                    <?php echo $product['quantity']; ?> шт
                </td>
                <td>
                    <?php echo $product['total']; ?>
                </td>


            </tr>
            <?php } ?>
            </tbody>
        </table>

    </div>

    <div class=" btn_check ajax-button-confirm  btn btn-lg btn-success"><?=$text_confirm?></div>


</div>

<div class="forms">
    <?php echo $column_right; ?>
</div>


<script type="text/javascript"><!--

    function updateShipping(s) {
        shp = JSON.parse(s.value)
        $.ajax({
                url: 'index.php?route=checkout/shipping_method/save',
                type: 'post',
                data: shp,
                dataType: 'json',
                beforeSend: function () {
                    $('#shipping-method').addClass('loading');
                },
                success: function (json) {
                    $('.alert, .text-danger').remove();

                    //if (json['redirect']) {
                    //    location = json['redirect'];
                    //}
                    if (json['error']) {
                        if (json['error']['warning']) {
                            // Error ylanyrkkaan....
                            alert(json['error']['warning']);
                        }
                    } else {
                        $.ajax({
                            url: 'index.php?route=checkout/onepagecheckout/totals',
                            type: 'get',
                            success: function (json) {
                                $('#totals tbody').remove();
                                $('#totals').append('<tbody></tbody');
                                for (t in json['totals']) {
                                    $('#totals tbody').append('<tr class="name subtotal"><td class="name subtotal"><strong>' + json['totals'][t]['title'] + '</strong></td><td class="price">' + json['totals'][t]["text"] + '</td></tr>');
                                }
                            }
                        });
                        // Update Totalsi!
                    }
                    $('#shipping-method').removeClass('loading');
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                }
            }
        ); //ajax
    }

    //alert($('#firstname-ch').val());
    $(document).ready(function () {

        $(' #LoginModal .submit-login-form ').on('click', function () {
            $.ajax({
                    url: 'index.php?route=checkout/onepagecheckout/AjaxLogin',
                    type: 'post',
                    data: $('#LoginModal #input-email, #LoginModal #input-password '),
                    dataType: 'json',
                    beforeSend: function () {

                    },
                    success: function (json) {
                        console.log(json);
                        if (json.errors != 0) {
                            if (typeof json.errors.warning != 'undefined' && json.errors.warning != '')
                                $('#LoginModal .errors-block').html(json.errors.warning);
                            if (typeof json.errors.errors != 'undefined' && json.errors.errors != '')
                                $('#LoginModal .errors-block').append('<br>' + json.errors.error);
                        }
                        else if (json.errors == 0) {
                            $('#firstname-ch').prop('value', json.c_name);
                            $('#city-ch').prop('value', json.city);
                            $('#address_1').prop('value', json.address_1);
                            $('#email-ch').prop('value', json.email);
                            $('#telephone-ch').prop('value', json.telephone);
                            $('#LoginModal').modal('hide');
                            $('#login_warning').html('');
                        }
                    },
                    error: function (xhr, ajaxOptions, thrownError) {
                        alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                    }
                }
            ); //ajax
            return false;
        });

        $('.ajax-button-confirm').on('click', function () {

            $.ajax({
                url: 'index.php?route=checkout/onepagecheckout',
                type: 'post',
                data: $('.payment-data input[type=\'text\'],  .payment-data input[type=\'tel\'],  .payment-data input[type=\'radio\']:checked,  .payment-datainput input[type=\'checkbox\']:checked, .payment-data  select '),
                dataType: 'json',
                beforeSend: function () {
                    $('.ajax-button-confirm').addClass('preloader');

                },
                complete: function () {
                    $('.ajax-button-confirm').removeClass('preloader');

                },
                success: function (json) {
                    console.log(json);

                    if (json.error) {
                        if (json['error']['firstname']) {
                            $('#firstname-ch+.error').html(json['error']['firstname']);
                            $('#firstname-ch+.error').prev().addClass('error');
                        }


                        if (json['error']['email']) {
                            $('#email-ch+.error').html(json['error']['email']);
                        }

                        if (json['error']['telephone']) {
                            $('#telephone-ch+.error').html(json['error']['telephone']);
                        }

                        if (json['error']['address_1']) {
                            $('#address_1+.error').html(json['error']['address_1']);
                        }

                        if (json['error']['city']) {
                            $('#city-ch+.error').html(json['error']['city']);
                        }
                    }

                    else if (json['cod']) {
                        $.ajax({
                            type: 'get',
                            url: 'index.php?route=extension/payment/cod/confirm',
                            cache: false,
                            beforeSend: function () {
                                $('.ajax-button-confirm').button('loading');
                            },
                            complete: function () {
                                $('.ajax-button-confirm').button('reset');
                            },
                            success: function () {
                                //location = '/index.php?route=checkout/success';
                            }
                        });
                    }

                    else if (json['payment']) {
                        $('.hiden_payment_info').html(json['payment']);
                        //console.log(json['payment']);
                        //console.log($('.hiden_payment_info a').attr('href'));
                        //location = $('.hiden_payment_info a').attr('href');
                        location = '/index.php?route=checkout/success';
                        console.log('OK');
                    }
                    else {
                        if (json.credit)
                            credit_confirm('/index.php?route=checkout/part_payment_cart/getResult&from_privat24=true');
                        //else
                        //location = '/index.php?route=checkout/success'

                    }
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                }
            });


        });


    });
    //--></script>

<?php echo $footer; ?>
