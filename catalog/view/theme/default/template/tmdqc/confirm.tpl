<?php if (!isset($redirect)) { ?>
<?php echo $payment; ?>
<?php } else { ?>
<script type="text/javascript"><!--
    location = '<?php echo $redirect; ?>';
    //--></script>
<?php } ?>
<script type="text/javascript"><!--
    $('.loader').addClass('hide');
    //--></script>
