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
