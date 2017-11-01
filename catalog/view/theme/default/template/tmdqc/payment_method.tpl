<div class="panel panel-default">
    <div class="panel-heading"><?php echo $text_payment_method_title ?></div>
</div>
<?php if($error_warning){ ?>
<div class="alert alert-warning"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?></div>
<?php } ?>
<?php if ($payment_methods) { ?>
<?php foreach ($payment_methods as $payment_method) { ?>
<div class="row">
    <label class="col-sm-12">
        <?php if ($payment_method['code'] == $code || !$code) { ?>
        <?php $code = $payment_method['code']; ?>
        <input type="radio" name="payment_method" value="<?php echo $payment_method['code']; ?>" checked="checked"/>
        <?php } else { ?>
        <input type="radio" name="payment_method" value="<?php echo $payment_method['code']; ?>"/>
        <?php } ?>&nbsp; &nbsp;
        <?php if($payment_method['image']){ ?>
        <img src="<?php echo $payment_method['image']; ?>"/>
        <?php } ?>&nbsp; &nbsp;
        <?php if($tmdqc_payment_label) { ?>
        <?php echo $payment_method['title']; ?>
        <?php } ?>
        <?php if(!empty($payment_method['terms'])){ ?>
        (<?php echo $payment_method['terms']; ?>)
        <?php } ?>
    </label>
</div>
<?php } ?>
<?php } ?>
<div class="row <?php echo $tmdqc_payment_comment ?>">
    <div class="col-sm-12">
        <label class="control-label"><?php echo $text_comments; ?></label>
        <textarea name="comment" rows="8" class="form-control"><?php echo $comment; ?></textarea>
    </div>
</div>
<?php if($text_agree){ ?>
<div class="buttons">
    <div class="pull-right"><?php echo $text_agree; ?>
        <?php if ($agree) { ?>
        <input type="checkbox" name="agree" value="1" checked="checked"/>
        <?php } else { ?>
        <input type="checkbox" name="agree" value="1"/>
        <?php } ?>
        &nbsp;
    </div>
</div>
<?php } ?>
