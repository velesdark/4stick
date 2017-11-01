<?php if($cat_id==49) { ?>
<div class="left_idea">
    <div class="left_title">
        <a href="/decor">идеи оформления</a>
    </div>
    <?php if(!empty($posts)){ ?>
    <?php foreach ($posts as $blog) {  //print_R($blog['cat']);?>
    <?php if($blog['cat']==49) { ?>
    <div class="idea_block">
        <div class="idea_date">
            <span><?php echo $blog['date_added_full']; ?></span>
        </div>
        <div class="idea_title">
            <a href="<?php echo $blog['href']; ?>"><?php echo $blog['title']; ?></a>
        </div>
        <div class="idea_img">
            <a href="<?php echo $blog['href']; ?>"><img
                        src="<?php echo str_replace('cache/','',str_replace('-150x150','',$blog['image'])); ?>"/></a>
        </div>
        <div class="idea_desc">
            <?php echo $blog['description']; ?>
        </div>

    </div>
    <?php } ?>
    <?php } ?>
    <?php } ?>
</div>
<?php } else { ?>


<div class="left_rev">
    <div class="left_title">
        отзывы наших клиентов
    </div>

    <div class="jcarousel-wrapper">
        <div class="jcarousel">
            <ul>
                <?php foreach ($posts as $blog) {  ?>
                <li>
                    <div class="rev_block">
                        <div class="rev_top">
                            <div class="rev_top_img">
                                <img src="<?php echo str_replace('cache/','',str_replace('-150x150','',$blog['image'])); ?>"/>
                            </div>
                            <div class="rev_top_title">
                                <?php echo $blog['title']; ?>
                            </div>
                        </div>
                        <div class="rev_text">
                            <?php echo $blog['description']; ?>

                        </div>
                    </div>
                </li>
                <?php } ?>
            </ul>
        </div>
        <p class="jcarousel-pagination"></p>
    </div>


</div>

<?php } ?>