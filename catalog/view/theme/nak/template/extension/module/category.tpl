<div class="left_cat">
    <div class="left_cat_title">
        Категории
    </div>
    <div class="left_cat_content">
        <ul>
            <?php foreach ($categories as $category) { ?>
            <li>
                <a href="<?php echo $category['href']; ?>"><span><?php echo $category['name']; ?></span></a>
            </li>

            <?php } ?>


        </ul>
    </div>
</div>

