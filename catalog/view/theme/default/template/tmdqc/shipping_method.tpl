<div class="panel panel-default">
    <div class="panel-heading"><?php echo $text_delivery_method_title ?></div>
</div>
<?php if ($error_warning) { ?>
<div class="alert alert-warning"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?></div>
<?php } ?>
<?php if ($shipping_methods){ ?>
<?php foreach ($shipping_methods as $shipping_method) { ?>
<?php if(!$shipping_method['error']){ ?>
<?php foreach ($shipping_method['quote'] as $quote){ ?>
<div>
    <label class="col-sm-12">
        <?php if($quote['code'] == $code || !$code){ ?>
        <?php $code = $quote['code']; ?>
        <input class="pull-left" type="radio" name="shipping_method" value="<?php echo $quote['code']; ?>"
               checked="checked"/>
        <?php } else { ?>
        <input class="pull-left" type="radio" name="shipping_method" value="<?php echo $quote['code']; ?>"/>
        <?php } ?> &nbsp; &nbsp;
        <?php if($shipping_method['image']){ ?>
        <img class="pull-left" src="<?php echo $shipping_method['image']; ?>"/>
        <?php } ?>
        <?php if($tmdqc_shipping_label) { ?>
        <span class="pull-left">&nbsp; &nbsp; <?php echo $shipping_method['title']; ?></span>
        <?php } ?>
        <span class="pull-right">+<?php echo $quote['text']; ?></span>
    </label>
</div>
<?php } ?>
<?php } else { ?>
<div class="alert alert-danger"><?php echo $shipping_method['error']; ?></div>
<?php } ?>
<?php } ?>
<?php } ?>
<div class="row <?php echo $tmdqc_shipping_comment ?>">
    <div class="col-sm-12">
        <label class="control-label"><?php echo $text_comments; ?></label>
        <textarea name="comment" rows="8" class="form-control"><?php echo $comment; ?></textarea>
    </div>
</div>
