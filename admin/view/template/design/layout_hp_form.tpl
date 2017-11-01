<?php echo $header; ?><?php echo $column_left; ?>
<div id="content" class="">
    <div class="page-header">
        <div class="container-fluid">
            <div class="pull-right">
                <button type="submit" form="form-layout" data-toggle="tooltip" title="<?php echo $button_save; ?>"
                        class="btn btn-primary"><i class="fa fa-save"></i></button>
                <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>"
                   class="btn btn-default"><i class="fa fa-reply"></i></a></div>
            <h1><?php echo $heading_title; ?></h1>
            <ul class="breadcrumb">
                <?php foreach ($breadcrumbs as $breadcrumb) { ?>
                <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
                <?php } ?>
            </ul>
        </div>
    </div>
    <div class="container-fluid  h-editor">
        <?php if ($error_warning) { ?>
        <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
            <button type="button" class="close" data-dismiss="alert">&times;</button>
        </div>
        <?php } ?>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_form; ?></h3>
            </div>
            <div class="panel-body">
                <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-layout"
                      class="form-horizontal">
                    <fieldset>
                        <legend><?php echo $text_route; ?></legend>
                        <div class="form-group required">
                            <label class="col-sm-2 control-label" for="input-name"><?php echo $entry_name; ?></label>
                            <div class="col-sm-10">
                                <input type="text" name="name" value="<?php echo $name; ?>"
                                       placeholder="<?php echo $entry_name; ?>" id="input-name" class="form-control"/>
                                <?php if ($error_name) { ?>
                                <div class="text-danger"><?php echo $error_name; ?></div>
                                <?php } ?>
                            </div>
                        </div>
                        <table id="route" class="table table-striped table-bordered table-hover">
                            <thead>
                            <tr>
                                <td class="text-left"><?php echo $entry_store; ?></td>
                                <td class="text-left"><?php echo $entry_route; ?></td>
                                <td></td>
                            </tr>
                            </thead>
                            <tbody>
                            <?php $route_row = 0; ?>
                            <?php foreach ($layout_routes as $layout_route) { ?>
                            <tr id="route-row<?php echo $route_row; ?>">
                                <td class="text-left"><select name="layout_route[<?php echo $route_row; ?>][store_id]"
                                                              class="form-control">
                                        <option value="0"><?php echo $text_default; ?></option>
                                        <?php foreach ($stores as $store) { ?>
                                        <?php if ($store['store_id'] == $layout_route['store_id']) { ?>
                                        <option value="<?php echo $store['store_id']; ?>"
                                                selected="selected"><?php echo $store['name']; ?></option>
                                        <?php } else { ?>
                                        <option value="<?php echo $store['store_id']; ?>"><?php echo $store['name']; ?></option>
                                        <?php } ?>
                                        <?php } ?>
                                    </select></td>
                                <td class="text-left"><input type="text"
                                                             name="layout_route[<?php echo $route_row; ?>][route]"
                                                             value="<?php echo $layout_route['route']; ?>"
                                                             placeholder="<?php echo $entry_route; ?>"
                                                             class="form-control"/></td>
                                <td class="text-center">
                                    <button type="button" onclick="$('#route-row<?php echo $route_row; ?>').remove();"
                                            data-toggle="tooltip" title="<?php echo $button_remove; ?>"
                                            class="btn btn-danger"><i class="fa fa-minus-circle"></i></button>
                                </td>
                            </tr>
                            <?php $route_row++; ?>
                            <?php } ?>
                            </tbody>
                            <tfoot>
                            <tr>
                                <td colspan="2"></td>
                                <td class="text-center">
                                    <button type="button" onclick="addRoute();" data-toggle="tooltip"
                                            title="<?php echo $button_route_add; ?>" class="btn btn-primary"><i
                                                class="fa fa-plus-circle"></i></button>
                                </td>
                            </tr>
                            </tfoot>
                        </table>
                    </fieldset>
                    <fieldset>
                        <legend><?php echo $text_module; ?>&emsp;
                            <a target="_blank" data-toggle="tooltip" title=""
                               data-original-title="<?php echo $hp_name_titles; ?>" class="btn btn-danger"
                               href="https://opencartforum.com/files/file/3588-hyper-positions-71-modulnaya-poziciya-24-bloka/"
                               role="button">
                                <i class="fa fa-cogs" aria-hidden="true"></i>&nbsp; <?php echo $hp_name; ?></a>
                        </legend>
                        <?php $module_row = 0; ?>
                        <div class="row hyper-positions">
                            <div class="col-sm-12 pos-sliders">
                                <div class="col-sm-12 text-center positions-name"><?php echo $text_pos_sliders; ?></div>
                                <table id="module-pos-sliders" class="table table-striped table-bordered table-hover">
                                    <thead>
                                    <tr>
                                        <td class="text-center"></td>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <?php foreach ($layout_modules as $layout_module) { ?>
                                    <?php if ($layout_module['position'] == 'pos_sliders') { ?>
                                    <tr id="module-row<?php echo $module_row; ?>">
                                        <td class="text-left">
                                            <div class="input-group">
                                                <select name="layout_module[<?php echo $module_row; ?>][code]"
                                                        class="form-control input-sm">
                                                    <?php foreach ($extensions as $extension) { ?>
                                                    <optgroup label="<?php echo $extension['name']; ?>">
                                                        <?php if (!$extension['module']) { ?>
                                                        <?php if ($extension['code'] == $layout_module['code']) { ?>
                                                        <option value="<?php echo $extension['code']; ?>"
                                                                selected="selected"><?php echo $extension['name']; ?></option>
                                                        <?php } else { ?>
                                                        <option value="<?php echo $extension['code']; ?>"><?php echo $extension['name']; ?></option>
                                                        <?php } ?>
                                                        <?php } else { ?>
                                                        <?php foreach ($extension['module'] as $module) { ?>
                                                        <?php if ($module['code'] == $layout_module['code']) { ?>
                                                        <option value="<?php echo $module['code']; ?>"
                                                                selected="selected"><?php echo $module['name']; ?></option>
                                                        <?php } else { ?>
                                                        <option value="<?php echo $module['code']; ?>"><?php echo $module['name']; ?></option>
                                                        <?php } ?>
                                                        <?php } ?>
                                                        <?php } ?>
                                                    </optgroup>
                                                    <?php } ?>
                                                </select>
                                                <input type="hidden"
                                                       name="layout_module[<?php echo $module_row; ?>][position]"
                                                       value="<?php echo $layout_module['position']; ?>"/>
                                                <input type="hidden"
                                                       name="layout_module[<?php echo $module_row; ?>][sort_order]"
                                                       value="<?php echo $layout_module['sort_order']; ?>"/>
                                                <div class="input-group-btn"><a
                                                            href="<?php echo $layout_module['edit']; ?>" type="button"
                                                            data-toggle="tooltip" title="<?php echo $button_edit; ?>"
                                                            target="_blank" class="btn btn-primary btn-sm"><i
                                                                class="fa fa-pencil"></i></a>
                                                    <button type="button"
                                                            onclick="$('#module-row<?php echo $module_row; ?>').remove();"
                                                            data-toggle="tooltip" title="<?php echo $button_remove; ?>"
                                                            class="btn btn-danger btn-sm"><i
                                                                class="fa fa fa-minus-circle"></i></button>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    <?php $module_row++; ?>
                                    <?php } ?>
                                    <?php } ?>
                                    </tbody>
                                    <tfoot>
                                    <tr>
                                        <td class="text-left">
                                            <div class="input-group">
                                                <select class="form-control input-sm">
                                                    <?php foreach ($extensions as $extension) { ?>
                                                    <optgroup label="<?php echo $extension['name']; ?>">
                                                        <?php if (!$extension['module']) { ?>
                                                        <option value="<?php echo $extension['code']; ?>"><?php echo $extension['name']; ?></option>
                                                        <?php } else { ?>
                                                        <?php foreach ($extension['module'] as $module) { ?>
                                                        <option value="<?php echo $module['code']; ?>"><?php echo $module['name']; ?></option>
                                                        <?php } ?>
                                                        <?php } ?>
                                                    </optgroup>
                                                    <?php } ?>
                                                </select>
                                                <div class="input-group-btn">
                                                    <button type="button" onclick="addModule('pos-sliders');"
                                                            data-toggle="tooltip"
                                                            title="<?php echo $button_module_add; ?>"
                                                            class="btn btn-primary btn-sm"><i
                                                                class="fa fa-plus-circle"></i></button>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    </tfoot>
                                </table>
                            </div>
                            <div class="col-sm-12 pos-content">
                                <div class="row">
                                    <div class="text-center col-sm-12">
                                        <div class="col-sm-12 positions-name"><?php echo $text_content_pos; ?></div>
                                    </div>
                                    <div class="col-lg-3 col-md-4 col-sm-12">
                                        <table id="module-column-left"
                                               class="table table-striped table-bordered table-hover">
                                            <thead>
                                            <tr>
                                                <td class="text-center"><?php echo $text_column_left; ?></td>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <?php foreach ($layout_modules as $layout_module) { ?>
                                            <?php if ($layout_module['position'] == 'column_left') { ?>
                                            <tr id="module-row<?php echo $module_row; ?>">
                                                <td class="text-left">
                                                    <div class="input-group">
                                                        <select name="layout_module[<?php echo $module_row; ?>][code]"
                                                                class="form-control input-sm">
                                                            <?php foreach ($extensions as $extension) { ?>
                                                            <optgroup label="<?php echo $extension['name']; ?>">
                                                                <?php if (!$extension['module']) { ?>
                                                                <?php if ($extension['code'] == $layout_module['code']) { ?>
                                                                <option value="<?php echo $extension['code']; ?>"
                                                                        selected="selected"><?php echo $extension['name']; ?></option>
                                                                <?php } else { ?>
                                                                <option value="<?php echo $extension['code']; ?>"><?php echo $extension['name']; ?></option>
                                                                <?php } ?>
                                                                <?php } else { ?>
                                                                <?php foreach ($extension['module'] as $module) { ?>
                                                                <?php if ($module['code'] == $layout_module['code']) { ?>
                                                                <option value="<?php echo $module['code']; ?>"
                                                                        selected="selected"><?php echo $module['name']; ?></option>
                                                                <?php } else { ?>
                                                                <option value="<?php echo $module['code']; ?>"><?php echo $module['name']; ?></option>
                                                                <?php } ?>
                                                                <?php } ?>
                                                                <?php } ?>
                                                            </optgroup>
                                                            <?php } ?>
                                                        </select>
                                                        <input type="hidden"
                                                               name="layout_module[<?php echo $module_row; ?>][position]"
                                                               value="<?php echo $layout_module['position']; ?>"/>
                                                        <input type="hidden"
                                                               name="layout_module[<?php echo $module_row; ?>][sort_order]"
                                                               value="<?php echo $layout_module['sort_order']; ?>"/>
                                                        <div class="input-group-btn"><a
                                                                    href="<?php echo $layout_module['edit']; ?>"
                                                                    type="button" data-toggle="tooltip"
                                                                    title="<?php echo $button_edit; ?>" target="_blank"
                                                                    class="btn btn-primary btn-sm"><i
                                                                        class="fa fa-pencil"></i></a>
                                                            <button type="button"
                                                                    onclick="$('#module-row<?php echo $module_row; ?>').remove();"
                                                                    data-toggle="tooltip"
                                                                    title="<?php echo $button_remove; ?>"
                                                                    class="btn btn-danger btn-sm"><i
                                                                        class="fa fa fa-minus-circle"></i></button>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <?php $module_row++; ?>
                                            <?php } ?>
                                            <?php } ?>
                                            </tbody>
                                            <tfoot>
                                            <tr>
                                                <td class="text-left">
                                                    <div class="input-group">
                                                        <select class="form-control input-sm">
                                                            <?php foreach ($extensions as $extension) { ?>
                                                            <optgroup label="<?php echo $extension['name']; ?>">
                                                                <?php if (!$extension['module']) { ?>
                                                                <option value="<?php echo $extension['code']; ?>"><?php echo $extension['name']; ?></option>
                                                                <?php } else { ?>
                                                                <?php foreach ($extension['module'] as $module) { ?>
                                                                <option value="<?php echo $module['code']; ?>"><?php echo $module['name']; ?></option>
                                                                <?php } ?>
                                                                <?php } ?>
                                                            </optgroup>
                                                            <?php } ?>
                                                        </select>
                                                        <div class="input-group-btn">
                                                            <button type="button" onclick="addModule('column-left');"
                                                                    data-toggle="tooltip"
                                                                    title="<?php echo $button_module_add; ?>"
                                                                    class="btn btn-primary btn-sm"><i
                                                                        class="fa fa-plus-circle"></i></button>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                            </tfoot>
                                        </table>
                                    </div>
                                    <div class="col-lg-6 col-md-4 col-sm-12">
                                        <table id="module-content-top"
                                               class="table table-striped table-bordered table-hover">
                                            <thead>
                                            <tr>
                                                <td class="text-center"><?php echo $text_content_top; ?></td>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <?php foreach ($layout_modules as $layout_module) { ?>
                                            <?php if ($layout_module['position'] == 'content_top') { ?>
                                            <tr id="module-row<?php echo $module_row; ?>">
                                                <td class="text-left">
                                                    <div class="input-group">
                                                        <select name="layout_module[<?php echo $module_row; ?>][code]"
                                                                class="form-control input-sm">
                                                            <?php foreach ($extensions as $extension) { ?>
                                                            <optgroup label="<?php echo $extension['name']; ?>">
                                                                <?php if (!$extension['module']) { ?>
                                                                <?php if ($extension['code'] == $layout_module['code']) { ?>
                                                                <option value="<?php echo $extension['code']; ?>"
                                                                        selected="selected"><?php echo $extension['name']; ?></option>
                                                                <?php } else { ?>
                                                                <option value="<?php echo $extension['code']; ?>"><?php echo $extension['name']; ?></option>
                                                                <?php } ?>
                                                                <?php } else { ?>
                                                                <?php foreach ($extension['module'] as $module) { ?>
                                                                <?php if ($module['code'] == $layout_module['code']) { ?>
                                                                <option value="<?php echo $module['code']; ?>"
                                                                        selected="selected"><?php echo $module['name']; ?></option>
                                                                <?php } else { ?>
                                                                <option value="<?php echo $module['code']; ?>"><?php echo $module['name']; ?></option>
                                                                <?php } ?>
                                                                <?php } ?>
                                                                <?php } ?>
                                                            </optgroup>
                                                            <?php } ?>
                                                        </select>
                                                        <input type="hidden"
                                                               name="layout_module[<?php echo $module_row; ?>][position]"
                                                               value="<?php echo $layout_module['position']; ?>"/>
                                                        <input type="hidden"
                                                               name="layout_module[<?php echo $module_row; ?>][sort_order]"
                                                               value="<?php echo $layout_module['sort_order']; ?>"/>
                                                        <div class="input-group-btn"><a
                                                                    href="<?php echo $layout_module['edit']; ?>"
                                                                    type="button" data-toggle="tooltip"
                                                                    title="<?php echo $button_edit; ?>" target="_blank"
                                                                    class="btn btn-primary btn-sm"><i
                                                                        class="fa fa-pencil"></i></a>
                                                            <button type="button"
                                                                    onclick="$('#module-row<?php echo $module_row; ?>').remove();"
                                                                    data-toggle="tooltip"
                                                                    title="<?php echo $button_remove; ?>"
                                                                    class="btn btn-danger btn-sm"><i
                                                                        class="fa fa fa-minus-circle"></i></button>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <?php $module_row++; ?>
                                            <?php } ?>
                                            <?php } ?>
                                            </tbody>
                                            <tfoot>
                                            <tr>
                                                <td class="text-left">
                                                    <div class="input-group">
                                                        <select class="form-control input-sm">
                                                            <?php foreach ($extensions as $extension) { ?>
                                                            <optgroup label="<?php echo $extension['name']; ?>">
                                                                <?php if (!$extension['module']) { ?>
                                                                <option value="<?php echo $extension['code']; ?>"><?php echo $extension['name']; ?></option>
                                                                <?php } else { ?>
                                                                <?php foreach ($extension['module'] as $module) { ?>
                                                                <option value="<?php echo $module['code']; ?>"><?php echo $module['name']; ?></option>
                                                                <?php } ?>
                                                                <?php } ?>
                                                            </optgroup>
                                                            <?php } ?>
                                                        </select>
                                                        <div class="input-group-btn">
                                                            <button type="button" onclick="addModule('content-top');"
                                                                    data-toggle="tooltip"
                                                                    title="<?php echo $button_module_add; ?>"
                                                                    class="btn btn-primary btn-sm"><i
                                                                        class="fa fa-plus-circle"></i></button>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                            </tfoot>
                                        </table>
                                        <table id="module-content-bottom"
                                               class="table table-striped table-bordered table-hover">
                                            <thead>
                                            <tr>
                                                <td class="text-center"><?php echo $text_content_bottom; ?></td>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <?php foreach ($layout_modules as $layout_module) { ?>
                                            <?php if ($layout_module['position'] == 'content_bottom') { ?>
                                            <tr id="module-row<?php echo $module_row; ?>">
                                                <td class="text-left">
                                                    <div class="input-group">
                                                        <select name="layout_module[<?php echo $module_row; ?>][code]"
                                                                class="form-control input-sm">
                                                            <?php foreach ($extensions as $extension) { ?>
                                                            <optgroup label="<?php echo $extension['name']; ?>">
                                                                <?php if (!$extension['module']) { ?>
                                                                <?php if ($extension['code'] == $layout_module['code']) { ?>
                                                                <option value="<?php echo $extension['code']; ?>"
                                                                        selected="selected"><?php echo $extension['name']; ?></option>
                                                                <?php } else { ?>
                                                                <option value="<?php echo $extension['code']; ?>"><?php echo $extension['name']; ?></option>
                                                                <?php } ?>
                                                                <?php } else { ?>
                                                                <?php foreach ($extension['module'] as $module) { ?>
                                                                <?php if ($module['code'] == $layout_module['code']) { ?>
                                                                <option value="<?php echo $module['code']; ?>"
                                                                        selected="selected"><?php echo $module['name']; ?></option>
                                                                <?php } else { ?>
                                                                <option value="<?php echo $module['code']; ?>"><?php echo $module['name']; ?></option>
                                                                <?php } ?>
                                                                <?php } ?>
                                                                <?php } ?>
                                                            </optgroup>
                                                            <?php } ?>
                                                        </select>
                                                        <input type="hidden"
                                                               name="layout_module[<?php echo $module_row; ?>][position]"
                                                               value="<?php echo $layout_module['position']; ?>"/>
                                                        <input type="hidden"
                                                               name="layout_module[<?php echo $module_row; ?>][sort_order]"
                                                               value="<?php echo $layout_module['sort_order']; ?>"/>
                                                        <div class="input-group-btn"><a
                                                                    href="<?php echo $layout_module['edit']; ?>"
                                                                    type="button" data-toggle="tooltip"
                                                                    title="<?php echo $button_edit; ?>" target="_blank"
                                                                    class="btn btn-primary btn-sm"><i
                                                                        class="fa fa-pencil"></i></a>
                                                            <button type="button"
                                                                    onclick="$('#module-row<?php echo $module_row; ?>').remove();"
                                                                    data-toggle="tooltip"
                                                                    title="<?php echo $button_remove; ?>"
                                                                    class="btn btn-danger btn-sm"><i
                                                                        class="fa fa fa-minus-circle"></i></button>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <?php $module_row++; ?>
                                            <?php } ?>
                                            <?php } ?>
                                            </tbody>
                                            <tfoot>
                                            <tr>
                                                <td class="text-left">
                                                    <div class="input-group">
                                                        <select class="form-control input-sm">
                                                            <?php foreach ($extensions as $extension) { ?>
                                                            <optgroup label="<?php echo $extension['name']; ?>">
                                                                <?php if (!$extension['module']) { ?>
                                                                <option value="<?php echo $extension['code']; ?>"><?php echo $extension['name']; ?></option>
                                                                <?php } else { ?>
                                                                <?php foreach ($extension['module'] as $module) { ?>
                                                                <option value="<?php echo $module['code']; ?>"><?php echo $module['name']; ?></option>
                                                                <?php } ?>
                                                                <?php } ?>
                                                            </optgroup>
                                                            <?php } ?>
                                                        </select>
                                                        <div class="input-group-btn">
                                                            <button type="button" onclick="addModule('content-bottom');"
                                                                    data-toggle="tooltip"
                                                                    title="<?php echo $button_module_add; ?>"
                                                                    class="btn btn-primary btn-sm"><i
                                                                        class="fa fa-plus-circle"></i></button>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                            </tfoot>
                                        </table>
                                    </div>
                                    <div class="col-lg-3 col-md-4 col-sm-12">
                                        <table id="module-column-right"
                                               class="table table-striped table-bordered table-hover">
                                            <thead>
                                            <tr>
                                                <td class="text-center"><?php echo $text_column_right; ?></td>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <?php foreach ($layout_modules as $layout_module) { ?>
                                            <?php if ($layout_module['position'] == 'column_right') { ?>
                                            <tr id="module-row<?php echo $module_row; ?>">
                                                <td class="text-left">
                                                    <div class="input-group">
                                                        <select name="layout_module[<?php echo $module_row; ?>][code]"
                                                                class="form-control input-sm">
                                                            <?php foreach ($extensions as $extension) { ?>
                                                            <optgroup label="<?php echo $extension['name']; ?>">
                                                                <?php if (!$extension['module']) { ?>
                                                                <?php if ($extension['code'] == $layout_module['code']) { ?>
                                                                <option value="<?php echo $extension['code']; ?>"
                                                                        selected="selected"><?php echo $extension['name']; ?></option>
                                                                <?php } else { ?>
                                                                <option value="<?php echo $extension['code']; ?>"><?php echo $extension['name']; ?></option>
                                                                <?php } ?>
                                                                <?php } else { ?>
                                                                <?php foreach ($extension['module'] as $module) { ?>
                                                                <?php if ($module['code'] == $layout_module['code']) { ?>
                                                                <option value="<?php echo $module['code']; ?>"
                                                                        selected="selected"><?php echo $module['name']; ?></option>
                                                                <?php } else { ?>
                                                                <option value="<?php echo $module['code']; ?>"><?php echo $module['name']; ?></option>
                                                                <?php } ?>
                                                                <?php } ?>
                                                                <?php } ?>
                                                            </optgroup>
                                                            <?php } ?>
                                                        </select>
                                                        <input type="hidden"
                                                               name="layout_module[<?php echo $module_row; ?>][position]"
                                                               value="<?php echo $layout_module['position']; ?>"/>
                                                        <input type="hidden"
                                                               name="layout_module[<?php echo $module_row; ?>][sort_order]"
                                                               value="<?php echo $layout_module['sort_order']; ?>"/>
                                                        <div class="input-group-btn"><a
                                                                    href="<?php echo $layout_module['edit']; ?>"
                                                                    data-toggle="tooltip"
                                                                    title="<?php echo $button_edit; ?>" target="_blank"
                                                                    class="btn btn-primary btn-sm"><i
                                                                        class="fa fa-pencil"></i></a>
                                                            <button type="button"
                                                                    onclick="$('#module-row<?php echo $module_row; ?>').remove();"
                                                                    data-toggle="tooltip"
                                                                    title="<?php echo $button_remove; ?>"
                                                                    class="btn btn-danger btn-sm"><i
                                                                        class="fa fa fa-minus-circle"></i></button>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <?php $module_row++; ?>
                                            <?php } ?>
                                            <?php } ?>
                                            </tbody>
                                            <tfoot>
                                            <tr>
                                                <td class="text-left">
                                                    <div class="input-group">
                                                        <select class="form-control input-sm">
                                                            <?php foreach ($extensions as $extension) { ?>
                                                            <optgroup label="<?php echo $extension['name']; ?>">
                                                                <?php if (!$extension['module']) { ?>
                                                                <option value="<?php echo $extension['code']; ?>"><?php echo $extension['name']; ?></option>
                                                                <?php } else { ?>
                                                                <?php foreach ($extension['module'] as $module) { ?>
                                                                <option value="<?php echo $module['code']; ?>"><?php echo $module['name']; ?></option>
                                                                <?php } ?>
                                                                <?php } ?>
                                                            </optgroup>
                                                            <?php } ?>
                                                        </select>
                                                        <div class="input-group-btn">
                                                            <button type="button" onclick="addModule('column-right');"
                                                                    data-toggle="tooltip"
                                                                    title="<?php echo $button_module_add; ?>"
                                                                    class="btn btn-primary btn-sm"><i
                                                                        class="fa fa-plus-circle"></i></button>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                            </tfoot>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-12 pos-map">
                                <div class="row">
                                    <div class="text-center col-sm-12">
                                        <div class="col-sm-12 positions-name"><?php echo $text_map_pos; ?></div>
                                    </div>
                                    <div class="col-sm-12">
                                        <table id="module-map-center"
                                               class="table table-striped table-bordered table-hover">
                                            <thead>
                                            <tr>
                                                <td class="text-center"><?php echo $text_pos_center; ?></td>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <?php foreach ($layout_modules as $layout_module) { ?>
                                            <?php if ($layout_module['position'] == 'map_center') { ?>
                                            <tr id="module-row<?php echo $module_row; ?>">
                                                <td class="text-left">
                                                    <div class="input-group">
                                                        <select name="layout_module[<?php echo $module_row; ?>][code]"
                                                                class="form-control input-sm">
                                                            <?php foreach ($extensions as $extension) { ?>
                                                            <optgroup label="<?php echo $extension['name']; ?>">
                                                                <?php if (!$extension['module']) { ?>
                                                                <?php if ($extension['code'] == $layout_module['code']) { ?>
                                                                <option value="<?php echo $extension['code']; ?>"
                                                                        selected="selected"><?php echo $extension['name']; ?></option>
                                                                <?php } else { ?>
                                                                <option value="<?php echo $extension['code']; ?>"><?php echo $extension['name']; ?></option>
                                                                <?php } ?>
                                                                <?php } else { ?>
                                                                <?php foreach ($extension['module'] as $module) { ?>
                                                                <?php if ($module['code'] == $layout_module['code']) { ?>
                                                                <option value="<?php echo $module['code']; ?>"
                                                                        selected="selected"><?php echo $module['name']; ?></option>
                                                                <?php } else { ?>
                                                                <option value="<?php echo $module['code']; ?>"><?php echo $module['name']; ?></option>
                                                                <?php } ?>
                                                                <?php } ?>
                                                                <?php } ?>
                                                            </optgroup>
                                                            <?php } ?>
                                                        </select>
                                                        <input type="hidden"
                                                               name="layout_module[<?php echo $module_row; ?>][position]"
                                                               value="<?php echo $layout_module['position']; ?>"/>
                                                        <input type="hidden"
                                                               name="layout_module[<?php echo $module_row; ?>][sort_order]"
                                                               value="<?php echo $layout_module['sort_order']; ?>"/>
                                                        <div class="input-group-btn"><a
                                                                    href="<?php echo $layout_module['edit']; ?>"
                                                                    type="button" data-toggle="tooltip"
                                                                    title="<?php echo $button_edit; ?>" target="_blank"
                                                                    class="btn btn-primary btn-sm"><i
                                                                        class="fa fa-pencil"></i></a>
                                                            <button type="button"
                                                                    onclick="$('#module-row<?php echo $module_row; ?>').remove();"
                                                                    data-toggle="tooltip"
                                                                    title="<?php echo $button_remove; ?>"
                                                                    class="btn btn-danger btn-sm"><i
                                                                        class="fa fa fa-minus-circle"></i></button>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <?php $module_row++; ?>
                                            <?php } ?>
                                            <?php } ?>
                                            </tbody>
                                            <tfoot>
                                            <tr>
                                                <td class="text-left">
                                                    <div class="input-group">
                                                        <select class="form-control input-sm">
                                                            <?php foreach ($extensions as $extension) { ?>
                                                            <optgroup label="<?php echo $extension['name']; ?>">
                                                                <?php if (!$extension['module']) { ?>
                                                                <option value="<?php echo $extension['code']; ?>"><?php echo $extension['name']; ?></option>
                                                                <?php } else { ?>
                                                                <?php foreach ($extension['module'] as $module) { ?>
                                                                <option value="<?php echo $module['code']; ?>"><?php echo $module['name']; ?></option>
                                                                <?php } ?>
                                                                <?php } ?>
                                                            </optgroup>
                                                            <?php } ?>
                                                        </select>
                                                        <div class="input-group-btn">
                                                            <button type="button" onclick="addModule('map-center');"
                                                                    data-toggle="tooltip"
                                                                    title="<?php echo $button_module_add; ?>"
                                                                    class="btn btn-primary btn-sm"><i
                                                                        class="fa fa-plus-circle"></i></button>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                            </tfoot>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </fieldset>
                </form>
            </div>
        </div>
    </div>
    <script type="text/javascript"><!--
        var route_row =
        <
            ? php echo
        $route_row;
            ?
        >
        ;

        function addRoute() {
            html = '<tr id="route-row' + route_row + '">';
            html += '  <td class="text-left"><select name="layout_route[' + route_row + '][store_id]" class="form-control">';
            html += '  <option value="0"><?php echo $text_default; ?></option>';
        <
                ? php foreach($stores as $store)
            {
                    ?
            >
                html += '<option value="<?php echo $store['
                store_id
                ']; ?>"><?php echo addslashes($store['
                name
                ']); ?></option>';
            <
                    ? php
            }
                ?
        >
            html += '  </select></td>';
            html += '  <td class="text-left"><input type="text" name="layout_route[' + route_row + '][route]" value="" placeholder="<?php echo $entry_route; ?>" class="form-control" /></td>';
            html += '  <td class="text-left"><button type="button" onclick="$(\'#route-row' + route_row + '\').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>';
            html += '</tr>';

            $('#route tbody').append(html);

            route_row++;
        }

        var module_row =
        <
            ? php echo
        $module_row;
            ?
        >
        ;

        function addModule(type) {
            html = '<tr id="module-row' + module_row + '">';
            html += '  <td class="text-left"><div class="input-group"><select name="layout_module[' + module_row + '][code]" class="form-control input-sm">';
        <
                ? php foreach($extensions as $extension)
            {
                    ?
            >
                html += '    <optgroup label="<?php echo addslashes($extension['
                name
                ']); ?>">';
            <
                    ? php
                if (!$extension['module']) {
                        ?
                >
                    html += '      <option value="<?php echo $extension['
                    code
                    ']; ?>"><?php echo addslashes($extension['
                    name
                    ']); ?></option>';
                <
                        ? php
                } else {
                        ?
                >
                <
                        ? php foreach($extension['module'] as $module)
                    {
                            ?
                    >
                        html += '      <option value="<?php echo $module['
                        code
                        ']; ?>"><?php echo addslashes($module['
                        name
                        ']); ?></option>';
                    <
                            ? php
                    }
                        ?
                >
                <
                        ? php
                }
                    ?
            >
                html += '    </optgroup>';
            <
                    ? php
            }
                ?
        >
            html += '  </select>';
            html += '  <input type="hidden" name="layout_module[' + module_row + '][position]" value="' + type.replace('-', '_') + '" />';
            html += '  <input type="hidden" name="layout_module[' + module_row + '][sort_order]" value="" />';
            html += '  <div class="input-group-btn"><a href="" target="_blank" type="button" data-toggle="tooltip" title="<?php echo $button_edit; ?>" class="btn btn-primary btn-sm"><i class="fa fa-pencil"></i></a><button type="button" onclick="$(\'#module-row' + module_row + '\').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger btn-sm"><i class="fa fa fa-minus-circle"></i></button></div></div></td>';
            html += '</tr>';

            $('#module-' + type + ' tbody').append(html);

            $('#module-' + type + ' tbody select[name=\'layout_module[' + module_row + '][code]\']').val($('#module-' + type + ' tfoot select').val());

            $('#module-' + type + ' select[name*=\'code\']').trigger('change');

            $('#module-' + type + ' tbody input[name*=\'sort_order\']').each(function (i, element) {
                $(element).val(i);
            });

            module_row++;
        }

        $('#module-pos-sliders, #module-column-left, #module-column-right, #module-content-top, #module-content-bottom, #module-map-center').delegate('select[name*=\'code\']', 'change', function () {
            var part = this.value.split('.');

            if (!part[1]) {
                $(this).parent().find('a').attr('href', 'index.php?route=extension/module/' + part[0] + '&token=<?php echo $token; ?>');
            } else {
                $(this).parent().find('a').attr('href', 'index.php?route=extension/module/' + part[0] + '&token=<?php echo $token; ?>&module_id=' + part[1]);
            }
        });

        $('#module-pos-sliders, #module-column-left, #module-column-right, #module-content-top, #module-content-bottom, #module-map-center').trigger('change');
        //--></script>
    <script type="text/javascript"><!--

        function initSwitcher() {
            $('.bootstrap-switcher').bootstrapSwitch({
                onInit: function (event, state) {
                    switcher(event, state, this);
                },
                onSwitchChange: function (event, state) {
                    switcher(event, state, this);
                }
            });
        }


        function switcher(event, state, $this) {
            if (state == true) {
                $($this).parent().parent().parent().parent().find('a').attr("disabled", "true");
                $($this).parent().parent().parent().parent().find('a').attr("onclick", "return false");
            } else {
                $($this).parent().parent().parent().parent().find('a').removeAttr("disabled");
                $($this).parent().parent().parent().parent().find('a').removeAttr("onclick");
            }
        }

        $(document).ready(function () {
            $('body').addClass('hyper-position hd-switch');

            initSwitcher();

        });

        //--></script>
</div>
<style type="text/css">
    .hyper-positions > div {
        background-color: ghostwhite;
        border: 2px solid rgba(1, 125, 255, 0.55);
        margin-bottom: 10px;
        padding-top: 10px;
    }

    .hyper-positions .form-control {
        padding: 0;
    }

    .hyper-positions > div:nth-child(2n+1) {
        background-color: rgba(1, 125, 255, 0.1);
    }

    legend .btn-danger {
        color: #f8f8f8;
        font-size: 14px;
        font-weight: 600;
    }

    .positions-name {
        background-color: #f8f8f8;
        box-shadow: 0 0 3px #bdbdbd;
        color: #0068a6;
        font-size: 16px;
        font-weight: 600;
        line-height: 1.7;
        margin-bottom: 10px;
        padding: 10px;
    }

    .pos-content {
        border: 2px solid rgba(0, 0, 0, 0.45) !important;
    }

    .pos-contents {
        border: 2px solid rgba(0, 0, 0, 0.25) !important;
    }

    .pos-content .positions-name {
        color: teal;
    }

    .pos-contents .positions-name, .pos-header .positions-name {
        color: #c2c2c2;
    }

    .pos-header .positions-name {
        line-height: 1.6;
        padding: 5px 10px;
        margin-bottom: 0;
        box-shadow: 0 0 1px #bdbdbd;
    }

    .pos-header .positions-name + .positions-name {
        line-height: 4;
        margin-bottom: 0;
    }

    .pos-header .positions-name + .positions-name + .positions-name {
        line-height: 1.6;
        margin-bottom: 10px;
        padding: 10px;
    }

    .pos-footer3 + .pos-contents .positions-name {
        line-height: 4;
    }
</style>
<?php echo $footer; ?>