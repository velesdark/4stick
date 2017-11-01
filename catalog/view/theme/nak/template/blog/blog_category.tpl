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
    <?php if($blogs){ ?>
    <?php foreach ($blogs as $blog) { ?>
    <div class="i_block">
        <div class="i_block_img">
            <a href="<?php echo $blog['href']; ?>">
                <img src="<?php echo str_replace('cache/','',str_replace('-848x424','',$blog['image'])); ?>"/>
            </a>

        </div>
        <div class="i_block_desc">
            <div class="i_block_desc_date">
                <?php echo $blog['date_added_full']; ?>
            </div>
            <div class="i_block_desc_title">
                <a href="<?php echo $blog['href']; ?>">
                    <?php echo $blog['title']; ?>
                </a>
            </div>
            <div class="i_block_desc_text">
                <?php echo $blog['short_description']; ?>
            </div>

        </div>
        <div class="clear"></div>
    </div>

    <?php } ?>
    <?php } ?>


</div>

<div class="forms">
    <?php echo $column_right; ?>
</div>
<?php echo $footer; ?>
