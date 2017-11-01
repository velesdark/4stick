<div class="clearfix">
    <div class="panel panel-default">
        <div class="panel-heading"><?php echo $text_cust ?> <span class="pull-right"><a data-toggle="modal"
                                                                                        data-target="#myModal"
                                                                                        id="tmdqclogin"><?php echo $text_log_in ?></a></span>
        </div>
    </div>
    <div class="col-sm-12 <?php echo $account_type_show ?>">
        <p><?php echo $text_checkout; ?></p>
        <div class="radio">
            <label>
                <?php if ($account == 'register') { ?>
                <input type="radio" name="account" value="register" checked="checked"/>
                <?php } else { ?>
                <input type="radio" name="account" value="register"/>
                <?php } ?>
                <?php echo $text_register; ?></label>
        </div>
        <?php if ($checkout_guest){ ?>
        <?php if ($permision){ ?>
        <div class="radio">
            <label>
                <?php if ($account == 'guest') { ?>
                <input type="radio" name="account" value="guest" checked="checked"/>
                <?php } else { ?>
                <input type="radio" name="account" value="guest"/>
                <?php } ?>
                <?php echo $text_guest; ?></label>
        </div>
        <?php } ?>
        <?php } ?>
    </div>
</div>
<script type="text/javascript"><!--
    $('input[name=\'account\']:checked').trigger('click');
    //--></script>