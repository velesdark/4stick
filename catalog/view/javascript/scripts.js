jQuery(document).ready(function () {
    jQuery('.item_image_color').each(function () {
        jQuery(this).css({'margin-left': -jQuery(this).width() / 2 + 'px'});
    });

    jQuery('[name="sob_input[2][Телефон]"],[name="sob_input[2][Телефон *]"]').mask('+7(999)-999-99-99');
    jQuery('.call_link').click(function () {

        jQuery('.over_all').show();
        jQuery('#call_form').show();
    });

    jQuery('#form-sobfeedback36 button[type="submit"]').click(function (e) {

        if (jQuery('[name="sob_input[3][Email]"]').val() == '') {
            e.preventDefault();
            jQuery('[name="sob_input[3][Email]"]').addClass('error');
        }
        else {
            var pattern = /^([a-z0-9_\.-])+@[a-z0-9-]+\.([a-z]{2,4}\.)?[a-z]{2,4}$/i;
            if (pattern.test(jQuery('[name="sob_input[3][Email]"]').val())) {
                jQuery('[name="sob_input[3][Email]"]').removeClass('error');

            } else {
                e.preventDefault();
                jQuery('[name="sob_input[3][Email]"]').addClass('error');
            }

        }
    });

    jQuery('.usl_link').click(function () {

        jQuery('.over_all').show();
        jQuery('#usl_form').show();
    });
    jQuery('.quest_link').click(function () {

        jQuery('.over_all').show();
        jQuery('#quest_form').show();
    });
    jQuery('.click_link').click(function () {
        jQuery('[name="sob_input[5][Заказ]"]').val(jQuery('.cart_items form').html());
        jQuery('.over_all').show();
        jQuery('#click_form').show();
    });

    jQuery('.close, .over_all').click(function () {

        jQuery('.over_all').hide();
        jQuery('.m_form').hide();
    });


    jQuery(window).scroll(function () {
        if (jQuery(this).scrollTop() > 300) {
            jQuery('.scrollup').fadeIn();
        } else {
            jQuery('.scrollup').fadeOut();
        }
    });

    jQuery('.scrollup').click(function () {
        jQuery("html, body").animate({scrollTop: 0}, 600);
        return false;
    });
    jQuery('.faq_block').click(function () {
        if (jQuery(this).children('.faq_answer').css('display') == 'none') {
            jQuery(this).children('.faq_answer').slideDown();
            jQuery(this).addClass('active');
        }
        else {
            jQuery(this).children('.faq_answer').slideUp();
            jQuery(this).removeClass('active');
        }

    });

    getColor();
    jQuery('.item_color label').click(function () {
        getColor();
    });

    jQuery('.item_type input:checked').parent().addClass('active');
    jQuery('.item_type label').click(function () {
        jQuery('.item_type label').removeClass('active');
        jQuery(this).addClass('active');
    });

    jQuery('.item_size input:checked').parent().addClass('active');
    jQuery('.item_size label').click(function () {
        jQuery('.item_size label').removeClass('active');
        jQuery(this).addClass('active');
    });


    jQuery('.item_count_plus').click(function () {

        jQuery('#input-quantity').val(parseInt(jQuery('#input-quantity').val()) + 1);
        jQuery('.prices .price').html(jQuery('.item_size label.active').children('input').attr('data-price') * parseInt(jQuery('[name="quantity"]').val()) + ' ₽');

    });
    jQuery('.item_count_minus').click(function () {
        if (parseInt(jQuery('#input-quantity').val()) > 1) {
            jQuery('#input-quantity').val(parseInt(jQuery('#input-quantity').val()) - 1);
            jQuery('.prices .price').html(jQuery('.item_size label.active').children('input').attr('data-price') * parseInt(jQuery('[name="quantity"]').val()) + ' ₽');
        }

    });
    jQuery('.cart_plus').click(function () {

        jQuery(this).prev('input').val(parseInt(jQuery(this).prev('input').val()) + 1);
        jQuery('button[type="submit"]').click();

    });
    jQuery('.cart_minus').click(function () {
        if (parseInt(jQuery(this).next('input').val()) > 1) {
            jQuery(this).next('input').val(parseInt(jQuery(this).next('input').val()) - 1);
            jQuery('button[type="submit"]').click();
        }

    });
    jQuery('#call_form .form_text').after(jQuery('#form-sobfeedback35'));
    jQuery('#quest_form .form_title').after(jQuery('#form-sobfeedback37'));
    jQuery('#usl_form .form_title').after(jQuery('#form-sobfeedback38'));
    jQuery('#click_form .form_title').after(jQuery('#form-sobfeedback36'));


    jQuery('.ch_city').click(function () {

        jQuery('.ch_city').removeClass('active');
        jQuery(this).addClass('active');
        jQuery('#city-ch').val(jQuery(this).text());
        jQuery('.t_city').text(jQuery('#city-ch').val());
    });
    jQuery('.ch_block input[type="radio"]').styler();

    jQuery('#firstname-ch').change(function () {
        jQuery('.t_user').text(jQuery('#firstname-ch').val());

    });
    jQuery('#firstname-ch').keyup(function () {
        jQuery('.t_user').text(jQuery('#firstname-ch').val());

    });
    jQuery('#email-ch').change(function () {
        jQuery('.t_email').text(jQuery('#email-ch').val());

    });
    jQuery('#email-ch').keyup(function () {
        jQuery('.t_email').text(jQuery('#email-ch').val());

    });

    jQuery('#telephone-ch').change(function () {
        jQuery('.t_phone').text(jQuery('#telephone-ch').val());

    });
    jQuery('#telephone-ch').keyup(function () {
        jQuery('.t_phone').text(jQuery('#telephone-ch').val());

    });
    jQuery('#city-ch').change(function () {
        jQuery('.t_city').text(jQuery('#city-ch').val());

    });
    jQuery('#city-ch').keyup(function () {
        jQuery('.t_city').text(jQuery('#city-ch').val());

    });
    jQuery('#address_1').change(function () {
        jQuery('.t_adress').text(jQuery('#address_1').val());

    });
    jQuery('#address_1').keyup(function () {
        jQuery('.t_adress').text(jQuery('#address_1').val());

    });

    /*jQuery('#shipping-method').change(function(){
        //alert('asd');
        jQuery('.t_dost').text(jQuery('#shipping-method:checked').parent().parent().text());

    });*/

    jQuery('.dost_c label').click(function () {
        jQuery('.t_dost').text(jQuery('.dost_c input:checked').parent().parent().text());

    });
    jQuery('.pay_c label').click(function () {
        jQuery('.t_pay').text(jQuery('.pay_c input:checked').parent().parent().text());

    });
    jQuery('.t_user').text(jQuery('#firstname-ch').val());
    jQuery('.t_email').text(jQuery('#email-ch').val());
    jQuery('.t_city').text(jQuery('#city-ch').val());
    jQuery('.t_phone').text(jQuery('#telephone-ch').val());
    jQuery('.t_dost').text(jQuery('.dost_c input:checked').parent().parent().text());
    jQuery('.t_pay').text(jQuery('.pay_c input:checked').parent().parent().text());
    jQuery('.t_adress').text(jQuery('#address_1').val());


    jQuery(window).scroll(function () {
        if (jQuery(this).scrollTop() > 235) {
            jQuery('.ch_w').addClass('fixed');
            //jQuery('.main_top').addClass('fixed');
            //jQuery('.s_logo').animate({'opacity':1},20);
        }
        else if (jQuery(this).scrollTop() < 235) {
            jQuery('.ch_w').removeClass('fixed');
        }
    });


    maxheight = 0;
    jQuery('.item_all_images img').each(function () {
        //console.log(jQuery(this).height());
        if (jQuery(this).height() >= maxheight)
            maxheight = jQuery(this).height()
    });
    jQuery('.item_all_images').height(maxheight);

    jQuery('.item_th').click(function () {

        jQuery('.item_image').removeClass('active');
        jQuery('.item_image[data-show="' + jQuery(this).attr('data-show') + '"]').addClass('active');
        //jQuery('.titles_colors').removeClass('active');
        //jQuery('.item_images_colors').hide();
        //jQuery('.item_back_colors').hide();
        if (jQuery(this).attr('data-show') == 'item_th1') {
            jQuery('.titles1').addClass('active');
            jQuery('.item_images_colors').show();
            jQuery('.item_back_colors').show();

        }
        if (jQuery(this).attr('data-show') == 'item_th2') {
            jQuery('.titles2').addClass('active');
            jQuery('.item_images_colors').show();
            jQuery('.item_back_colors').show();

        }

        jQuery('.item_th').removeClass('active');
        jQuery(this).addClass('active');

    });

    jQuery('.item_back_color_block').each(function () {
        jQuery(this).css({'background': '#' + jQuery(this).attr('data-color')});
    });
    jQuery('.item_back_color_block').click(function () {
        jQuery('.item_back_color_block').removeClass('active');
        jQuery(this).addClass('active');

        jQuery('.item_images_all_back').css({'background': '#' + jQuery(this).attr('data-color')});
    });
    jQuery('.item_images_all_back').css({'background': '#' + jQuery('.item_back_color_block.active').attr('data-color')});


    jQuery('.tabs__caption li').click(function () {
        jQuery('.tabs__caption li').removeClass('active');
        jQuery(this).addClass('active');
        jQuery('.tabs__content').removeClass('active');
        jQuery('#' + jQuery(this).attr('data-tab')).addClass('active');
    });


    jQuery('.check_color1 label').click(function () {
        jQuery('.check_color10 label').removeClass('active');
        jQuery(this).addClass('active');
        jQuery('.item_image_color .item_image1_color1').attr('data-color', '');
        jQuery('.item_image_color .item_image2_color1').attr('data-color', '');
        jQuery('.item_image1_color1').attr('data-color', jQuery(this).attr('data-color'));
        jQuery('.item_image2_color1').attr('data-color', jQuery(this).attr('data-color'));

    });
    jQuery('.check_color2 label').click(function () {
        jQuery('.check_color10 label').removeClass('active');
        jQuery(this).addClass('active');

        jQuery('.item_image_color .item_image1_color2').attr('data-color', '');
        jQuery('.item_image_color .item_image2_color2').attr('data-color', '');
        jQuery('.item_image1_color2').attr('data-color', jQuery(this).attr('data-color'));
        jQuery('.item_image2_color2').attr('data-color', jQuery(this).attr('data-color'));

    });
    jQuery('.check_color3 label').click(function () {
        jQuery('.check_color10 label').removeClass('active');
        jQuery(this).addClass('active');

        jQuery('.item_image_color .item_image1_color3').attr('data-color', '');
        jQuery('.item_image_color .item_image2_color3').attr('data-color', '');
        jQuery('.item_image1_color3').attr('data-color', jQuery(this).attr('data-color'));
        jQuery('.item_image2_color3').attr('data-color', jQuery(this).attr('data-color'));

    });
    jQuery('.check_color4 label').click(function () {
        jQuery('.check_color10 label').removeClass('active');
        jQuery(this).addClass('active');

        jQuery('.item_image_color .item_image1_color4').attr('data-color', '');
        jQuery('.item_image_color .item_image2_color4').attr('data-color', '');
        jQuery('.item_image1_color4').attr('data-color', jQuery(this).attr('data-color'));
        jQuery('.item_image2_color4').attr('data-color', jQuery(this).attr('data-color'));

    });
    jQuery('.item_image1_color1').attr('data-color', jQuery('.check_color1 label.active').attr('data-color'));
    jQuery('.item_image2_color1').attr('data-color', jQuery('.check_color1 label.active').attr('data-color'));
    jQuery('.item_image1_color2').attr('data-color', jQuery('.check_color2 label.active').attr('data-color'));
    jQuery('.item_image2_color2').attr('data-color', jQuery('.check_color2 label.active').attr('data-color'));
    jQuery('.item_image1_color3').attr('data-color', jQuery('.check_color3 label.active').attr('data-color'));
    jQuery('.item_image2_color3').attr('data-color', jQuery('.check_color3 label.active').attr('data-color'));
    jQuery('.item_image1_color4').attr('data-color', jQuery('.check_color4 label.active').attr('data-color'));
    jQuery('.item_image2_color4').attr('data-color', jQuery('.check_color4 label.active').attr('data-color'));


    jQuery('.item_size label').click(function () {
        jQuery('.hidden_size').hide();
        jQuery('.prices .price').html(jQuery(this).children('input').attr('data-price') * parseInt(jQuery('[name="quantity"]').val()) + ' ₽');
    });

    jQuery('input[data-wi="17"]').bind("change keyup input click", function () {
        if (this.value.match(/[^0-9]/g)) {
            this.value = this.value.replace(/[^0-9]/g, '');
        }
    });
    jQuery('input[data-wi="18"]').bind("change keyup input click", function () {
        if (this.value.match(/[^0-9]/g)) {
            this.value = this.value.replace(/[^0-9]/g, '');
        }
    });

    jQuery('label[data-option-id="93"]').click(function () {

        jQuery('.hidden_size').slideDown();
        if (jQuery('input[data-wi="18"]').val() == '') {
            jQuery('input[data-wi="18"]').val('10');

        }
        if (jQuery('input[data-wi="17"]').val() == '') {
            jQuery('input[data-wi="17"]').val('10');

        }
        jQuery('input[data-wi="17"]').change();

    });

    jQuery(".img_zoom").imagezoomsl({

        zoomrange: [1, 10],
        cursorshadeborder: "2px solid #000",
        magnifiereffectanimate: "fadeIn",
        magnifierpos: "right"
    });
    jQuery('.item_size label:first').trigger('click');
    jQuery('.home_slider').camera({
        time: 3000
    });


});

jQuery(window).load(function () {


    maxheight = 0;
    jQuery('.item_all_images .item_image').each(function () {
        if (jQuery(this).height() >= maxheight)
            maxheight = jQuery(this).height()
    });
    jQuery('.item_all_images').height(maxheight);

    jQuery('.item_th').click(function () {

        jQuery('.item_image').removeClass('active');
        jQuery('.item_image[data-show="' + jQuery(this).attr('data-show') + '"]').addClass('active');
        //jQuery('.titles_colors').removeClass('active');
        //jQuery('.item_images_colors').hide();
        //jQuery('.item_back_colors').hide();
        if (jQuery(this).attr('data-show') == 'item_th1') {
            jQuery('.titles1').addClass('active');
            jQuery('.item_images_colors').show();
            jQuery('.item_back_colors').show();

        }
        if (jQuery(this).attr('data-show') == 'item_th2') {
            jQuery('.titles2').addClass('active');
            jQuery('.item_images_colors').show();
            jQuery('.item_back_colors').show();

        }

        jQuery('.item_th').removeClass('active');
        jQuery(this).addClass('active');

    });

    jQuery('.item_back_color_block').each(function () {
        jQuery(this).css({'background': '#' + jQuery(this).attr('data-color')});
    });
    jQuery('.item_back_color_block').click(function () {
        jQuery('.item_back_color_block').removeClass('active');
        jQuery(this).addClass('active');

        jQuery('.item_images_all_back').css({'background': '#' + jQuery(this).attr('data-color')});
    });
    jQuery('.item_images_all_back').css({'background': '#' + jQuery('.item_back_color_block.active').attr('data-color')});


    jQuery('.tabs__caption li').click(function () {
        jQuery('.tabs__caption li').removeClass('active');
        jQuery(this).addClass('active');
        jQuery('.tabs__content').removeClass('active');
        jQuery('#' + jQuery(this).attr('data-tab')).addClass('active');
    });


    jQuery('.check_color1 label').click(function () {
        jQuery('.check_color10 label').removeClass('active');
        jQuery(this).addClass('active');
        jQuery('.item_image_color .item_image1_color1').attr('data-color', '');
        jQuery('.item_image_color .item_image2_color1').attr('data-color', '');
        jQuery('.item_image1_color1').attr('data-color', jQuery(this).attr('data-color'));
        jQuery('.item_image2_color1').attr('data-color', jQuery(this).attr('data-color'));

    });
    jQuery('.check_color2 label').click(function () {
        jQuery('.check_color10 label').removeClass('active');
        jQuery(this).addClass('active');

        jQuery('.item_image_color .item_image1_color2').attr('data-color', '');
        jQuery('.item_image_color .item_image2_color2').attr('data-color', '');
        jQuery('.item_image1_color2').attr('data-color', jQuery(this).attr('data-color'));
        jQuery('.item_image2_color2').attr('data-color', jQuery(this).attr('data-color'));

    });
    jQuery('.check_color3 label').click(function () {
        jQuery('.check_color10 label').removeClass('active');
        jQuery(this).addClass('active');

        jQuery('.item_image_color .item_image1_color3').attr('data-color', '');
        jQuery('.item_image_color .item_image2_color3').attr('data-color', '');
        jQuery('.item_image1_color3').attr('data-color', jQuery(this).attr('data-color'));
        jQuery('.item_image2_color3').attr('data-color', jQuery(this).attr('data-color'));

    });
    jQuery('.check_color4 label').click(function () {
        jQuery('.check_color10 label').removeClass('active');
        jQuery(this).addClass('active');

        jQuery('.item_image_color .item_image1_color4').attr('data-color', '');
        jQuery('.item_image_color .item_image2_color4').attr('data-color', '');
        jQuery('.item_image1_color4').attr('data-color', jQuery(this).attr('data-color'));
        jQuery('.item_image2_color4').attr('data-color', jQuery(this).attr('data-color'));

    });
    jQuery('.item_image1_color1').attr('data-color', jQuery('.check_color1 label.active').attr('data-color'));
    jQuery('.item_image2_color1').attr('data-color', jQuery('.check_color1 label.active').attr('data-color'));
    jQuery('.item_image1_color2').attr('data-color', jQuery('.check_color2 label.active').attr('data-color'));
    jQuery('.item_image2_color2').attr('data-color', jQuery('.check_color2 label.active').attr('data-color'));
    jQuery('.item_image1_color3').attr('data-color', jQuery('.check_color3 label.active').attr('data-color'));
    jQuery('.item_image2_color3').attr('data-color', jQuery('.check_color3 label.active').attr('data-color'));
    jQuery('.item_image1_color4').attr('data-color', jQuery('.check_color4 label.active').attr('data-color'));
    jQuery('.item_image2_color4').attr('data-color', jQuery('.check_color4 label.active').attr('data-color'));


    jQuery('input[data-wi="17"]').change(function () {

        changeSizeWidth();
        changePrice();
    });
    jQuery('input[data-wi="17"]').keyup(function () {

        changeSizeWidth();
        changePrice();
    });
    jQuery('input[data-wi="18"]').change(function () {

        changeSizeHeight();
        changePrice();
    });
    jQuery('input[data-wi="18"]').keyup(function () {

        changeSizeHeight();
        changePrice();
    });

});

function changeSizeWidth() {
    var w = jQuery('.item_image1_color1 img').width();
    var h = jQuery('.item_image1_color1 img').height();
    var z = h / w;
    //jQuery('.size_help').html('Рекомендуемый размер: ' + jQuery('input[data-wi="17"]').val() + 'x' + Math.round(jQuery('input[data-wi="17"]').val() * z));
    jQuery('input[data-wi="18"]').val(Math.round(jQuery('input[data-wi="17"]').val() * z));
    //jQuery('input[data-wi="18"]').val(jQuery('input[data-wi="17"]').val()*z);
}

function changeSizeHeight() {
    var w = jQuery('.item_image1_color1 img').width();
    var h = jQuery('.item_image1_color1 img').height();
    var z = h / w;
    //jQuery('.size_help').html('Рекомендуемый размер: ' + Math.round(jQuery('input[data-wi="18"]').val() / z) + 'x' + jQuery('input[data-wi="18"]').val());
    //jQuery('input[data-wi="18"]').val(jQuery('input[data-wi="17"]').val()*z);
    jQuery('input[data-wi="17"]').val(Math.round(jQuery('input[data-wi="18"]').val() / z));
}

function changePrice() {


    if (parseInt(jQuery('input[data-wi="18"]').val()) > 0 && parseInt(jQuery('input[data-wi="17"]').val()) > 0) {
        var s = parseInt(jQuery('input[data-wi="18"]').val()) * parseInt(jQuery('input[data-wi="17"]').val());
        var price = 0;

        if (s <= 50) {
            price = s * 1.5;
        }
        if (s > 50 && s <= 100) {
            price = 0.3 * s + 60;
        }
        if (s > 100 && s <= 225) {
            price = 0.4 * s + 50;
        }
        if (s > 225 && s <= 400) {
            price = (8 / 35) * s + (620 / 7);
        }
        if (s > 400 && s <= 625) {
            price = (2 / 15) * s + (380 / 3);
        }
        if (s > 625 && s <= 900) {
            price = (8 / 55) * s + (1310 / 11);
        }
        if (s > 900 && s <= 1600) {
            price = (17 / 70) * s + (220 / 7);
        }
        if (s > 1600 && s <= 2500) {
            price = (13 / 90) * s + (1700 / 9);
        }
        if (s > 2500 && s <= 3600) {
            price = (8 / 55) * s + (2050 / 11);
        }
        if (s > 3600 && s <= 5625) {
            price = (4 / 27) * s + (530 / 3);
        }
        if (s > 5625 && s <= 6400) {
            price = (23 / 155) * s + (5435 / 31);
        }
        if (s > 6400 && s <= 8100) {
            price = (111 / 850) * s + (4917 / 17);
        }
        if (s > 8100 && s <= 10000) {
            price = (253 / 1900) * s + (5100 / 19);
        }
        if (s > 10000 && s <= 13000) {
            price = 0.1 * s + 600;
        }
        if (s > 13000 && s <= 14000) {
            price = 0.08 * s + 860;
        }
        if (s > 14000 && s <= 40000) {
            price = 0.07 * s + 1000;
        }
        if (s > 40000 && s <= 50000) {
            price = 0.075 * s + 800;
        }
        if (s > 50000) {
            price = s * 0.091;
        }


        //jQuery('.prices .price').html(price.toFixed(2)+' ₽');
        price = Math.round(price);
        jQuery.ajax({
            url: 'index.php?route=myqyery/myqyery/updateSubtract&price=' + price.toFixed(2) + '&w=' + jQuery('input[data-wi="17"]').val() + '&h=' + jQuery('input[data-wi="18"]').val() + '&id=' + jQuery('input[name="product_id"]').val(),
            dataType: 'json',
            success: function (json) {
                console.log(json);//alert(json);
                jQuery('.item_size label.active').children('input').attr('data-price', (price.toFixed(2) * parseInt(jQuery('[name="quantity"]').val())))
                jQuery('.prices .price').html(jQuery('.item_size label.active').children('input').attr('data-price') + ' ₽');

            },
            error: function (e) {
                //alert(e)
                console.log(e);
            }
        });

    }
}

(function ($) {
    $(function () {
        var jcarousel = $('.jcarousel');

        jcarousel
            .on('jcarousel:reload jcarousel:create', function () {
                var carousel = $(this),
                    width = carousel.innerWidth();

                width = width;


                carousel.jcarousel('items').css('width', Math.ceil(width) + 'px');
            })
            .jcarousel({
                wrap: 'circular'
            });

        $('.jcarousel-control-prev')
            .jcarouselControl({
                target: '-=1'
            });

        $('.jcarousel-control-next')
            .jcarouselControl({
                target: '+=1'
            });

        $('.jcarousel-pagination')
            .on('jcarouselpagination:active', 'a', function () {
                $(this).addClass('active');
            })
            .on('jcarouselpagination:inactive', 'a', function () {
                $(this).removeClass('active');
            })
            .on('click', function (e) {
                e.preventDefault();
            })
            .jcarouselPagination({
                perPage: 1,
                item: function (page) {
                    return '<a href="#' + page + '">' + '</a>';
                }
            });
    });
})(jQuery);


function getColor() {
    //alert(jQuery('[data-color1="1"]:checked').val());
    jQuery('.m_img0 img').attr('class', '');
    jQuery('.m_img1 img').attr('class', '');
    jQuery('[data-color1="1"]').next('img').removeClass('active');
    jQuery('[data-color2="1"]').next('img').removeClass('active');
    if (jQuery('[data-color1="1"]:checked').attr('data-color-name') == 'Желтый') {
        jQuery('.m_img0 img').addClass('yellow');
        jQuery('[data-color1="1"]:checked').next('img').addClass('active');
    }


    if (jQuery('[data-color2="1"]:checked').attr('data-color-name') == 'Желтый') {
        jQuery('.m_img1 img').addClass('yellow');
        jQuery('[data-color2="1"]:checked').next('img').addClass('active');
    }


    if (jQuery('[data-color1="1"]:checked').attr('data-color-name') == 'Красный') {
        jQuery('.m_img0 img').addClass('red');
        jQuery('[data-color1="1"]:checked').next('img').addClass('active');
    }
    if (jQuery('[data-color2="1"]:checked').attr('data-color-name') == 'Красный') {
        jQuery('.m_img1 img').addClass('red');
        jQuery('[data-color2="1"]:checked').next('img').addClass('active');
    }
}