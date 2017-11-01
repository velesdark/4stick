<?php echo $header; ?>
<div class="left">
    <?php echo $column_left; ?>


    <div class="left_idea">
        <div class="left_title">
            идеи оформления
        </div>
        <div class="idea_block">
            <div class="idea_date">
                <span>12.04.2017</span>
            </div>
            <div class="idea_title">
                <a href="">Декор интерьера ванной комнаты</a>
            </div>
            <div class="idea_img">
                <a href=""><img src="/image/i1.png"/></a>
            </div>
            <div class="idea_desc">
                Советы, способствующие экономии.
            </div>
        </div>
        <div class="idea_block">
            <div class="idea_date">
                <span>12.04.2017</span>
            </div>
            <div class="idea_title">
                <a href="">Декор кухни</a>
            </div>
            <div class="idea_img">
                <a href=""><img src="/image/i2.png"/></a>
            </div>
            <div class="idea_desc">
                Декор кухни своими руками.
            </div>
        </div>
        <div class="idea_block">
            <div class="idea_date">
                <span>12.04.2017</span>
            </div>
            <div class="idea_title">
                <a href="">Декор интерьера ванной комнаты</a>
            </div>
            <div class="idea_img">
                <a href=""><img src="/image/i1.png"/></a>
            </div>
            <div class="idea_desc">
                Советы, способствующие экономии.
            </div>
        </div>

    </div>
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


    <p class="suc">Ваш заказ <strong>№<?php print_r($test);?></strong> успешно создан.</p>

</div>

<div class="forms">
    <?php echo $column_right; ?>
</div>
<?php echo $footer; ?>
