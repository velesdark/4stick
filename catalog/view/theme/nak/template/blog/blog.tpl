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


    <?php echo $description; ?>
    <div class="item_social">
        <span style="float:left; margin-right:10px;">Поделиться </span>
        <!-- Go to www.addthis.com/dashboard to customize your tools -->
        <div class="addthis_inline_share_toolbox" style="float:left;clear:none;"></div>
        <!-- Go to www.addthis.com/dashboard to customize your tools -->
        <script type="text/javascript"
                src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-59e012e9923087cf"></script>
    </div>


</div>

<div class="forms">
    <?php echo $column_right; ?>
</div>
<?php echo $footer; ?>
