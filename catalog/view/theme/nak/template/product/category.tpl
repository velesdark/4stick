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
    <?php echo $description; ?>

</div>

<div class="forms">
    <?php echo $column_right; ?>
</div>
<?php echo $footer; ?>
