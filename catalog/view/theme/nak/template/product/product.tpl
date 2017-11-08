<?php echo $header; ?>
<?php
function cmp($a, $b)
{
    return strcmp($a['name'], $b['name']);
}
?>
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
<div class="content" id="product">
    <div class='bread'>
        <ul class="breadcrumb">
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
        <?php  echo $heading_title; ?>
    </div>

    <?php
/*$query = $this->db->query("SELECT * FROM nak_product");
    print_r($query->rows);*/

    /*
    foreach ($query->rows as $result) {
    $comments[] = $result;
    }*/
    ?>

    <div class="item_main_images">
        <div class="item_all_images">
            <div class="item_images_all_back"></div>
            <?php if($image1_image1||$image1_image2||$image1_image3||$image1_image4) { ?>
            <div class="item_image1 item_image active" data-show="item_th1">
                <?php if($image1_image1) { ?>
                <div class="item_image1_color1 item_image_color">
                    <img src="<? echo $image1_image1; ?>"/>
                </div>
                <?php } ?>
                <?php if($image1_image2) { ?>
                <div class="item_image1_color2 item_image_color">
                    <img src="<? echo $image1_image2; ?>"/>
                </div>
                <?php } ?>
                <?php if($image1_image3) { ?>
                <div class="item_image1_color3 item_image_color">
                    <img src="<? echo $image1_image3; ?>"/>
                </div>
                <?php } ?>
                <?php if($image1_image4) { ?>
                <div class="item_image1_color4 item_image_color">
                    <img src="<? echo $image1_image4; ?>"/>
                </div>
                <?php } ?>


            </div>
            <?php } ?>

            <?php if($image2_image1||$image2_image2||$image2_image3||$image2_image4) { ?>
            <div data-show="item_th2"
                 class="item_image2 item_image <?php if($image1_image1||$image1_image2||$image1_image3||$image1_image4) { } else {echo 'active'; } ?>">
                <?php if($image2_image1) { ?>
                <div class="item_image2_color1 item_image_color">
                    <img src="<? echo $image2_image1; ?>"/>
                </div>
                <?php } ?>
                <?php if($image2_image2) { ?>
                <div class="item_image2_color2 item_image_color">
                    <img src="<? echo $image2_image2; ?>"/>
                </div>
                <?php } ?>
                <?php if($image2_image3) { ?>
                <div class="item_image2_color3 item_image_color">
                    <img src="<? echo $image2_image3; ?>"/>
                </div>
                <?php } ?>
                <?php if($image2_image4) { ?>
                <div class="item_image2_color4 item_image_color">
                    <img src="<? echo $image2_image4; ?>"/>
                </div>
                <?php } ?>


            </div>
            <?php } ?>
            <?php if($popup) { ?>
            <div class="item_image3 item_image <?php if(!$image1_image1&&!$image1_image2&&!$image1_image3&&!$image1_image4&&!$image2_image1&&!$image2_image2&&!$image2_image3&&!$image2_image4) echo ' active'; ?>"
                 data-show="item_th3">
                <img class="img_zoom" src="/image/<?php echo $full_image; ?>"
                     data-large="/image/<?php echo $full_image; ?>" title="<?php echo $heading_title; ?>"
                     alt="<?php echo $heading_title; ?>"/>
            </div>
            <?php } ?>

            <?php if($images) { $k=4;?>
            <?php foreach ($images as $img1) {  ?>
            <div class="item_image<?php echo $k; ?> item_image" data-show="item_th<?php echo $k; ?>">
                <img src="<?php print_r($img1['popup']); ?>"/>
            </div>
            <?php $k++; } ?>
            <?php } ?>

            <ul class="item_all_th">
                <?php if($image1_image1||$image1_image2||$image1_image3||$image1_image4) { ?>
                <li class="item_th1 item_th active" data-show="item_th1">
                    <?php if($image1_image1) { ?>
                    <div class="item_image1_color1 item_image_color">
                        <img src="<? echo $image1_image1; ?>"/>
                    </div>
                    <?php } ?>
                    <?php if($image1_image2) { ?>
                    <div class="item_image1_color2 item_image_color">
                        <img src="<? echo $image1_image2; ?>"/>
                    </div>
                    <?php } ?>
                    <?php if($image1_image3) { ?>
                    <div class="item_image1_color3 item_image_color">
                        <img src="<? echo $image1_image3; ?>"/>
                    </div>
                    <?php } ?>
                    <?php if($image1_image4) { ?>
                    <div class="item_image1_color4 item_image_color">
                        <img src="<? echo $image1_image4; ?>"/>
                    </div>
                    <?php } ?>


                </li>
                <?php } ?>
                <?php if($image2_image1||$image2_image2||$image2_image3||$image2_image4) { ?>

                <li data-show="item_th2"
                    class="item_th2 item_th <?php if($image1_image1||$image1_image2||$image1_image3||$image1_image4) { } else {echo 'active'; } ?>">
                    <?php if($image2_image1) { ?>
                    <div class="item_image2_color1 item_image_color">
                        <img src="<? echo $image2_image1; ?>"/>
                    </div>
                    <?php } ?>
                    <?php if($image2_image2) { ?>
                    <div class="item_image2_color2 item_image_color">
                        <img src="<? echo $image2_image2; ?>"/>
                    </div>
                    <?php } ?>
                    <?php if($image2_image3) { ?>
                    <div class="item_image2_color3 item_image_color">
                        <img src="<? echo $image2_image3; ?>"/>
                    </div>
                    <?php } ?>
                    <?php if($image2_image4) { ?>
                    <div class="item_image2_color4 item_image_color">
                        <img src="<? echo $image2_image4; ?>"/>
                    </div>
                    <?php } ?>


                </li>
                <?php } ?>
                <?php if($popup) { ?>
                <li class="item_th3 item_th <?php if(!$image1_image1&&!$image1_image2&&!$image1_image3&&!$image1_image4&&!$image2_image1&&!$image2_image2&&!$image2_image3&&!$image2_image4) echo ' active'; ?>"
                    data-show="item_th3">
                    <img src="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>"
                         alt="<?php echo $heading_title; ?>"/>
                </li>
                <?php } ?>
                <?php if($images) { $k=4;?>
                <?php foreach ($images as $img1) {  ?>
                <li class="item_th<?php echo $k; ?> item_th " data-show="item_th<?php echo $k; ?>">
                    <img src="<?php print_r($img1['popup']); ?>"/>
                </li>
                <?php $k++; } ?>
                <?php } ?>


            </ul>

        </div>
    </div>
    <div class="item_main_desc">
        <div class="item_main_desc_left">

            <!--<div class="item_short_desc">
                <div class="item_short_desc_in">
                    <?php /* foreach ($attribute_groups as $attribute_group) { ?>
                    <?php foreach ($attribute_group['attribute'] as $attribute) { ?>
                    <?php if($attribute['attribute_id']==13) { ?>
                    <?php echo $attribute['text']; ?>
                    <?php } ?>
                    <?php } ?>
                    <?php } */ ?>
                </div>
            </div>-->
            <div class="sku">
                Арт. <?php echo $model; ?>
            </div>

            <div class="color_title">
                Вид стикера
                <?php
                    $r=array_filter($options,function($a){
                        return $a['option_id']==15;
                    });
                ?>
            </div>

            <div class="item_type">
                <?php foreach ($r as $option) { ?>
                <?php if($option['option_id']==15){
                    usort($option['product_option_value'], "cmp");

                ?>
                <?php foreach ($option['product_option_value'] as $k=>$option_value) { ?>
                <label>
                    <input <?php if($k==0) echo 'checked'; ?> type="radio"
                    name="option[<?php echo $option['product_option_id']; ?>]"
                    value="<?php echo $option_value['product_option_value_id']; ?>" />
                    <?php echo $option_value['name']; ?>
                </label>

                <?php } ?>
                <?php } ?>
                <?php } ?>
            </div>
            <div class="color_title">
                Размер (ш*в), см
            </div>
            <?php
                    $r=array_filter($options,function($a){
                        return $a['option_id']==16;
                    });
                ?>

            <div class="item_size">
                <?php foreach ($r as $option) { //print_r($option['product_option_value']);?>
                <?php if($option['option_id']==16){ usort($option['product_option_value'], "cmp"); ?>
                <?php foreach ($option['product_option_value'] as $k=>$option_value) { ?>
                <label <?if($option_value['name']=="Свой размер") echo 'style="width:105px;"'?>
                data-option-id="<?print_r($option_value['option_value_id']);?>">
                <input <?php if($k==0) echo 'checked'; ?> type="radio"
                name="option[<?php echo $option['product_option_id']; ?>]"
                value="<?php echo $option_value['product_option_value_id']; ?>"
                data-price="<?php echo str_replace(' р.','',$option_value['price']);?>" />
                <?php echo $option_value['name']; ?>
                </label>

                <?php } ?>
                <?php } ?>
                <?php } ?>
            </div>
            <div class="hidden_size">
                <div class="color_title">
                    Свой размер (ш*в), см
                </div>
                <?php
                    $r=array_filter($options,function($a){
                        return $a['option_id']==17;
                    });
                ?>

                <div class="item_size_you">
                    <?php foreach ($r as $option) { ?>
                    <?php if($option['option_id']==17){ ?>
                    <input type="text" data-wi="<?=$option['option_id']?>"
                           name="option[<?php echo $option['product_option_id']; ?>]"
                           value="<?php echo $option['value']; ?>"
                           id="input-option<?php echo $option['product_option_id']; ?>" class="form-control"/>

                    <?php } ?>
                    <?php } ?>
                    <div class="size_sep">x</div>
                    <?php
                    $r=array_filter($options,function($a){
                        return $a['option_id']==18;
                    });
                    ?>

                    <?php foreach ($r as $option) { ?>
                    <?php if($option['option_id']==18){ ?>
                    <input type="text" data-wi="<?=$option['option_id']?>"
                           name="option[<?php echo $option['product_option_id']; ?>]"
                           value="<?php echo $option['value']; ?>"
                           id="input-option<?php echo $option['product_option_id']; ?>" class="form-control"/>

                    <?php } ?>
                    <?php } ?>
                    <div class="size_help"></div>
                </div>
            </div>
            <div class="prices">
                <div class="price">
                    <?php echo str_replace(' р.', ' ₽',$price); ?>
                </div>
                <div id="or_price" style="display:none;"><?php echo str_replace(' р.', '',$price); ?></div>

                <div class="add_cart">
                    <button type="button" id="button-cart" data-loading-text="В корзину"
                            class="btn btn-primary btn-lg btn-block"><?php echo $button_cart; ?></button>
                </div>
                <div class="item_counts">
                    <div class="item_count_minus">-</div>
                    <div class="item_count">
                        <input type="text" name="quantity" value="<?php echo $minimum; ?>" size="2" id="input-quantity"
                               class="form-control"/>
                        <input type="hidden" name="product_id" value="<?php echo $product_id; ?>"/>
                    </div>
                    <div class="item_count_plus">+</div>

                </div>
            </div>


        </div>
        <div class="item_main_desc_right">


            <div class="item_images_colors">
                <div class="color_title">
                    Цвет наклейки:
                </div>
                <div class="tabs">

                    <ul class="tabs__caption">
                        <div class="titles1 titles_colors active">
                            <? if($image1_title1) { ?>
                            <li class="active" data-tab="tab1"><?php echo $image1_title1; ?></li>
                            <?php } ?>
                            <? if($image1_title2) { ?>
                            <li data-tab="tab2"><?php echo $image1_title2; ?></li>
                            <?php } ?>
                            <? if($image1_title3) { ?>
                            <li data-tab="tab3"><?php echo $image1_title3; ?></li>
                            <?php } ?>
                            <? if($image1_title4) { ?>
                            <li data-tab="tab4"><?php echo $image1_title4; ?></li>
                            <?php } ?>
                        </div>
                        <div class="titles2 titles_colors">
                            <? if($image2_title1) { ?>
                            <li data-tab="tab1"><?php echo $image2_title1; ?></li>
                            <?php } ?>
                            <? if($image2_title2) { ?>
                            <li data-tab="tab2"><?php echo $image2_title2; ?></li>
                            <?php } ?>
                            <? if($image2_title3) { ?>
                            <li data-tab="tab3"><?php echo $image2_title3; ?></li>
                            <?php } ?>
                            <? if($image2_title4) { ?>
                            <li data-tab="tab4"><?php echo $image2_title4; ?></li>
                            <?php } ?>
                        </div>

                    </ul>

                    <div class="tabs__content active check_color1 check_color10" id="tab1">
                        <?php
                    $r=array_filter($options,function($a){
                        return $a['option_id']==13;
                    });
                ?>

                        <?php foreach ($r as $option) { ?>
                        <?php if($option['option_id']==13){ ?>
                        <?php foreach ($option['product_option_value'] as $k=>$option_value) {
                        //print_R($option_value);
                        ?>
                        <label class="<?php if($k==0) echo 'active'; ?>"
                               style="background:#<? echo $option_value['name']; ?>"
                               data-color="<? echo $option_value['name']; ?>">
                            <input data-color-name="<?php echo $option_value['name']; ?>" <?php if($k==0) echo 'checked'; ?>
                            type="radio" name="option[<?php echo $option['product_option_id']; ?>]"
                            value="<?php echo $option_value['product_option_value_id']; ?>" />
                            <?php if ($option_value['image']) { ?>
                            <img src="<?php echo $option_value['image']; ?>"
                                 alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>"
                                 class="/image-thumbnail"/>
                            <?php } ?>
                        </label>

                        <?php } ?>
                        <?php } ?>
                        <?php } ?>

                    </div>

                    <div class="tabs__content check_color2 check_color10" id="tab2">
                        <?php
                    $r=array_filter($options,function($a){
                        return $a['option_id']==14;
                    });
                ?>

                        <?php foreach ($r as $option) { ?>
                        <?php if($option['option_id']==14){ ?>
                        <?php foreach ($option['product_option_value'] as $k=>$option_value) {
                        //print_R($option_value);
                        ?>
                        <label class="<?php if($k==0) echo 'active'; ?>"
                               style="background:#<? echo $option_value['name']; ?>"
                               data-color="<? echo $option_value['name']; ?>">
                            <input data-color-name="<?php echo $option_value['name']; ?>" <?php if($k==0) echo 'checked'; ?>
                            type="radio" name="option[<?php echo $option['product_option_id']; ?>]"
                            value="<?php echo $option_value['product_option_value_id']; ?>" />
                            <?php if ($option_value['image']) { ?>
                            <img src="<?php echo $option_value['image']; ?>"
                                 alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>"
                                 class="/image-thumbnail"/>
                            <?php } ?>
                        </label>

                        <?php } ?>
                        <?php } ?>
                        <?php } ?>
                    </div>
                    <div class="tabs__content check_color3 check_color10" id="tab3">
                        <?php
                    $r=array_filter($options,function($a){
                        return $a['option_id']==19;
                    });
                ?>

                        <?php foreach ($r as $option) { ?>
                        <?php if($option['option_id']==19){ ?>
                        <?php foreach ($option['product_option_value'] as $k=>$option_value) {
                        //print_R($option_value);
                        ?>
                        <label class="<?php if($k==0) echo 'active'; ?>"
                               style="background:#<? echo $option_value['name']; ?>"
                               data-color="<? echo $option_value['name']; ?>">
                            <input data-color-name="<?php echo $option_value['name']; ?>" <?php if($k==0) echo 'checked'; ?>
                            type="radio" name="option[<?php echo $option['product_option_id']; ?>]"
                            value="<?php echo $option_value['product_option_value_id']; ?>" />
                            <?php if ($option_value['image']) { ?>
                            <img src="<?php echo $option_value['image']; ?>"
                                 alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>"
                                 class="/image-thumbnail"/>
                            <?php } ?>
                        </label>

                        <?php } ?>
                        <?php } ?>
                        <?php } ?>

                    </div>
                    <div class="tabs__content check_color4 check_color10" id="tab4">
                        <?php
                    $r=array_filter($options,function($a){
                        return $a['option_id']==20;
                    });
                ?>

                        <?php foreach ($r as $option) { ?>
                        <?php if($option['option_id']==20){ ?>
                        <?php foreach ($option['product_option_value'] as $k=>$option_value) {
                        //print_R($option_value);
                        ?>
                        <label class="<?php if($k==0) echo 'active'; ?>"
                               style="background:#<? echo $option_value['name']; ?>"
                               data-color="<? echo $option_value['name']; ?>">
                            <input data-color-name="<?php echo $option_value['name']; ?>" <?php if($k==0) echo 'checked'; ?>
                            type="radio" name="option[<?php echo $option['product_option_id']; ?>]"
                            value="<?php echo $option_value['product_option_value_id']; ?>" />
                            <?php if ($option_value['image']) { ?>
                            <img src="<?php echo $option_value['image']; ?>"
                                 alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>"
                                 class="/image-thumbnail"/>
                            <?php } ?>
                        </label>

                        <?php } ?>
                        <?php } ?>
                        <?php } ?>

                    </div>

                </div><!-- .tabs-->

            </div>
            <div class="item_back_colors">
                <div class="color_title">
                    Цвет вашей стены:
                </div>
                <div class="item_back_colors_block">
                    <div class="item_back_color_block active" data-color="ffffff"></div>
                    <div class="item_back_color_block" data-color="4c4c4c"></div>
                    <div class="item_back_color_block" data-color="757575"></div>
                    <div class="item_back_color_block" data-color="a7a7a7"></div>
                    <div class="item_back_color_block" data-color="000000"></div>
                    <div class="item_back_color_block" data-color="f79d74"></div>
                    <div class="item_back_color_block" data-color="fcba84"></div>
                    <div class="item_back_color_block" data-color="ffca90"></div>
                    <div class="item_back_color_block" data-color="fffa98"></div>
                    <div class="item_back_color_block" data-color="c5e39c"></div>
                    <div class="item_back_color_block" data-color="a7d69e"></div>
                    <div class="item_back_color_block" data-color="84cc9e"></div>
                    <div class="item_back_color_block" data-color="8ccdca"></div>
                    <div class="item_back_color_block" data-color="8dcbfa"></div>
                    <div class="item_back_color_block" data-color="8baadb"></div>


                    <div class="item_back_color_block" data-color="9595ce"></div>
                    <div class="item_back_color_block" data-color="957dbd"></div>
                    <div class="item_back_color_block" data-color="af88bc"></div>
                    <div class="item_back_color_block" data-color="c88fba"></div>
                    <div class="item_back_color_block" data-color="f99dbc"></div>
                    <div class="item_back_color_block" data-color="fb9a99"></div>
                    <div class="item_back_color_block" data-color="ea6945"></div>
                    <div class="item_back_color_block" data-color="f59052"></div>
                    <div class="item_back_color_block" data-color="fbb065"></div>
                    <div class="item_back_color_block" data-color="fdf063"></div>
                    <div class="item_back_color_block" data-color="a9d56d"></div>
                    <div class="item_back_color_block" data-color="75c765"></div>
                    <div class="item_back_color_block" data-color="30b674"></div>
                    <div class="item_back_color_block" data-color="39bfb3"></div>
                    <div class="item_back_color_block" data-color="3cbdf5"></div>

                    <div class="item_back_color_block" data-color="5491c7"></div>
                    <div class="item_back_color_block" data-color="6070ab"></div>
                    <div class="item_back_color_block" data-color="674d96"></div>
                    <div class="item_back_color_block" data-color="9153a4"></div>
                    <div class="item_back_color_block" data-color="aa599d"></div>
                    <div class="item_back_color_block" data-color="ef6ca0"></div>
                    <div class="item_back_color_block" data-color="f16b72"></div>
                    <div class="item_back_color_block" data-color="d60625"></div>
                    <div class="item_back_color_block" data-color="e6670e"></div>
                    <div class="item_back_color_block" data-color="f29f01"></div>
                    <div class="item_back_color_block" data-color="f5f701"></div>
                    <div class="item_back_color_block" data-color="7dc42f"></div>
                    <div class="item_back_color_block" data-color="01b524"></div>
                    <div class="item_back_color_block" data-color="00aa90"></div>
                    <div class="item_back_color_block" data-color="1264b2"></div>
                    <div class="item_back_color_block" data-color="3e0e7c"></div>
                    <div class="item_back_color_block" data-color="63087f"></div>
                    <div class="item_back_color_block" data-color="9a0075"></div>
                    <div class="item_back_color_block" data-color="e5007c"></div>
                    <div class="item_back_color_block" data-color="720002"></div>
                    <div class="item_back_color_block" data-color="9f3b09"></div>
                    <div class="item_back_color_block" data-color="9f6500"></div>
                    <div class="item_back_color_block" data-color="4d820e"></div>
                    <div class="item_back_color_block" data-color="01706e"></div>

                </div>


            </div>
        </div>
        <div class="clear"></div>
        <div class="item_full_desc">

            <div class="title_red">
                Описание
            </div>
            <?php echo $description; ?>


        </div>


    </div>

    <?php if($products) { ?>
    <div class="title_red">
        С этим товаром покупают
    </div>

    <div class="cats">
        <?php foreach ($products as $product) { ?>
        <div class="cat_block">
            <div class="cat_over">
                <a href="<?php echo $product['href']; ?>" class="cat_link"></a>
            </div>

            <img src="<?php echo $product['thumb']; ?>"/>
            <div class="main_cat_title">
                <div class="cat_item_title">
                    <?php echo $product['name']; ?>
                </div>
            </div>
            <div class="cat_price">
                <?php echo str_replace(' р.','',$product['price']); ?>₽
            </div>
        </div>
        <?php } ?>
    </div>
    <?php } ?>


</div>


<script type="text/javascript"><!--
    $('select[name=\'recurring_id\'], input[name="quantity"]').change(function () {
        $.ajax({
            url: 'index.php?route=product/product/getRecurringDescription',
            type: 'post',
            data: $('input[name=\'product_id\'], input[name=\'quantity\'], select[name=\'recurring_id\']'),
            dataType: 'json',
            beforeSend: function () {
                $('#recurring-description').html('');
            },
            success: function (json) {
                $('.alert, .text-danger').remove();

                if (json['success']) {
                    $('#recurring-description').html(json['success']);
                }
            }
        });
    });
    //--></script>
<script type="text/javascript"><!--
    $('#button-cart').on('click', function () {
        $.ajax({
            url: 'index.php?route=checkout/cart/add',
            type: 'post',
            data: $('#product input[type=\'text\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea'),
            dataType: 'json',
            beforeSend: function () {
                $('#button-cart').button('loading');
            },
            complete: function () {
                $('#button-cart').button('reset');
            },
            success: function (json) {
                $('.alert, .text-danger').remove();
                $('.form-group').removeClass('has-error');

                if (json['error']) {
                    if (json['error']['option']) {
                        for (i in json['error']['option']) {
                            var element = $('#input-option' + i.replace('_', '-'));

                            if (element.parent().hasClass('input-group')) {
                                element.parent().after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
                            } else {
                                element.after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
                            }
                        }
                    }

                    if (json['error']['recurring']) {
                        $('select[name=\'recurring_id\']').after('<div class="text-danger">' + json['error']['recurring'] + '</div>');
                    }

                    // Highlight any found errors
                    $('.text-danger').parent().addClass('has-error');
                }

                if (json['success']) {
                    $('#content').before('<div class="alert alert-success">' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');

                    $('#cart > button').html('<span id="cart-total"><i class="fa fa-shopping-cart"></i> ' + json['total'] + '</span>');

                    $('html, body').animate({scrollTop: 0}, 'slow');

                    $('#cart > ul').load('index.php?route=common/cart/info ul li');
                    console.log(json);
                }
            },
            error: function (xhr, ajaxOptions, thrownError) {
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        });
    });
    //--></script>
<script type="text/javascript"><!--
    $('.date').datetimepicker({
        pickTime: false
    });

    $('.datetime').datetimepicker({
        pickDate: true,
        pickTime: true
    });

    $('.time').datetimepicker({
        pickDate: false
    });

    $('button[id^=\'button-upload\']').on('click', function () {
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
                        $('.text-danger').remove();

                        if (json['error']) {
                            $(node).parent().find('input').after('<div class="text-danger">' + json['error'] + '</div>');
                        }

                        if (json['success']) {
                            alert(json['success']);

                            $(node).parent().find('input').val(json['code']);
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
    $('#review').delegate('.pagination a', 'click', function (e) {
        e.preventDefault();

        $('#review').fadeOut('slow');

        $('#review').load(this.href);

        $('#review').fadeIn('slow');
    });

    $('#review').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?>');

    $('#button-review').on('click', function () {
        $.ajax({
            url: 'index.php?route=product/product/write&product_id=<?php echo $product_id; ?>',
            type: 'post',
            dataType: 'json',
            data: $("#form-review").serialize(),
            beforeSend: function () {
                $('#button-review').button('loading');
            },
            complete: function () {
                $('#button-review').button('reset');
            },
            success: function (json) {
                $('.alert-success, .alert-danger').remove();

                if (json['error']) {
                    $('#review').after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
                }

                if (json['success']) {
                    $('#review').after('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');

                    $('input[name=\'name\']').val('');
                    $('textarea[name=\'text\']').val('');
                    $('input[name=\'rating\']:checked').prop('checked', false);
                }
            }
        });
        grecaptcha.reset();
    });

    $(document).ready(function () {
        $('.thumbnails').magnificPopup({
            type: 'image',
            delegate: 'a',
            gallery: {
                enabled: true
            }
        });
    });

    $(document).ready(function () {
        var hash = window.location.hash;
        if (hash) {
            var hashpart = hash.split('#');
            var vals = hashpart[1].split('-');
            for (i = 0; i < vals.length; i++) {
                $('#product').find('select option[value="' + vals[i] + '"]').attr('selected', true).trigger('select');
                $('#product').find('input[type="radio"][value="' + vals[i] + '"]').attr('checked', true).trigger('click');
                $('#product').find('input[type="checkbox"][value="' + vals[i] + '"]').attr('checked', true).trigger('click');
            }
        }
    })


    jQuery(document).ready(function () {
        jQuery('#input-option347').on('change', function () {
            //alert('asdf');
        });

    });

    //--></script>
<div class="forms">
    <?php echo $column_right; ?>
</div>
<?php echo $footer; ?>
