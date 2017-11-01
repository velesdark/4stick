<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
    <div class="page-header">
        <div class="container-fluid">
            <div class="pull-right">
                <button type="submit" form="form" data-toggle="tooltip" title="<?php echo $button_save; ?>"
                        class="btn btn-primary"><i class="fa fa-save"></i></button>
                <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>"
                   class="btn btn-default"><i class="fa fa-reply"></i></a>
            </div>
            <h1><?php echo $heading_title; ?></h1>
        </div>
    </div>
    <div class="container-fluid">
        <?php if ($error_warning) { ?>
        <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
            <button type="button" class="close" data-dismiss="alert">&times;</button>
        </div>
        <?php } ?>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
            </div>
            <div class="panel-body">
                <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form"
                      class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-field"><?php echo $entry_status; ?></label>
                        <div class="col-sm-10">
                            <select class="form-control" name="courier_status">
                                <?php if ($courier_status) { ?>
                                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                                <option value="0"><?php echo $text_disabled; ?></option>
                                <?php } else { ?>
                                <option value="1"><?php echo $text_enabled; ?></option>
                                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                                <?php } ?>
                            </select>
                        </div>
                    </div>
                    <div class="form-group required">
                        <label class="col-sm-2 control-label" for="input-field">
                            <?php echo $entry_min_total_for_free_delivery; ?>
                        </label>
                        <div class="col-sm-10">
                            <input class="form-control" type="text" name="courier_min_total_for_free_delivery"
                                   value="<?php echo $courier_min_total_for_free_delivery; ?>"/>
                            <?php if ($error_min_total_for_free_delivery) { ?>
                            <div class="text-danger"><?php echo $error_min_total_for_free_delivery; ?></div>
                            <?php } ?>
                        </div>
                    </div>
                    <div class="form-group required">
                        <label class="col-sm-2 control-label" for="input-field">
                            <?php echo $entry_geo_zone; ?>
                        </label>
                        <div class="col-sm-10">
                            <select class="form-control" name="courier_geo_zone">
                                <option value="0"><?php echo $text_select; ?></option>
                                <?php foreach ($geo_zones as $geo_zone) { ?>
                                <?php if ($geo_zone['geo_zone_id'] == $courier_geo_zone) { ?>
                                <option value="<?php echo $geo_zone['geo_zone_id']; ?>"
                                        selected="selected"><?php echo $geo_zone['name']; ?></option>
                                <?php } else { ?>
                                <option value="<?php echo $geo_zone['geo_zone_id']; ?>"><?php echo $geo_zone['name']; ?></option>
                                <?php } ?>
                                <?php } ?>
                            </select>
                            <?php if ($error_geo_zone) { ?>
                            <div class="text-danger"><?php echo $error_geo_zone; ?></div>
                            <?php } ?>
                        </div>
                    </div>
                    <div class="form-group required">
                        <label class="col-sm-2 control-label" for="input-field">
                            <?php echo $entry_city_or_region; ?>
                        </label>
                        <div class="col-sm-10">
                            <input class="form-control" type="text" name="courier_city_or_region"
                                   value="<?php echo $courier_city_or_region; ?>"/>
                            <?php if ($error_city_or_region) { ?>
                            <div class="text-danger"><?php echo $error_city_or_region; ?></div>
                            <?php } ?>
                        </div>
                    </div>
                    <div class="form-group required">
                        <label class="col-sm-2 control-label" for="input-field">
                            <?php echo $entry_delivery_price_region; ?>
                        </label>
                        <div class="col-sm-10">
                            <input class="form-control" type="text" name="courier_delivery_price_region"
                                   value="<?php echo $courier_delivery_price_region; ?>"/>
                            <?php if ($error_delivery_price_region) { ?>
                            <div class="text-danger"><?php echo $error_delivery_price_region; ?></div>
                            <?php } ?>
                        </div>
                    </div>
                    <div class="form-group required">
                        <label class="col-sm-2 control-label" for="input-field">
                            <?php echo $entry_delivery_price_city; ?>
                        </label>
                        <div class="col-sm-10">
                            <input class="form-control" type="text" name="courier_delivery_price_city"
                                   value="<?php echo $courier_delivery_price_city; ?>"/>
                            <?php if ($error_delivery_price_city) { ?>
                            <div class="text-danger"><?php echo $error_delivery_price_city; ?></div>
                            <?php } ?>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-field">
                            <?php echo $entry_sort_order; ?>
                        </label>
                        <div class="col-sm-10">
                            <input class="form-control" type="text" name="courier_sort_order"
                                   value="<?php echo $courier_sort_order; ?>" size="1"/>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<?php echo $footer;