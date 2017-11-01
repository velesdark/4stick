<style>
    #quick-checkout #warning {
        padding: 10px;
    }

    .loader {
        position: fixed;
        top: 30%;
        z-index: 999;
        width: 100%;
        margin: 0 auto;
        text-align: center;
    }

    #quick-checkout #content {

    <
    ?
    php

    if
    (
    $
    tmdqc_content_background

    )
    {
        ? >
        background: < ? php echo $ tmdqc_content_background
    ;
        ? >
    ;
        < ? php
    }
    ?
    >
    padding:

    15
    px

    ;
    }

    #quick-checkout #content > h1 {

    <
    ?
    php

    if
    (
    $
    tmdqc_content_heading_color

    )
    {
        ? >
        color: < ? php echo $ tmdqc_content_heading_color
    ;
        ? >
    ;
        < ? php
    }
    ?
    >

    }

    #quick-checkout #tmd_cart table tr th {

    <
    ?
    php

    if
    (
    $
    tmdqc_cart_heading_color

    )
    {
        ? >
        color: < ? php echo $ tmdqc_cart_heading_color
    ;
        ? >
    ;
        < ? php
    }
    ?
    >
    <

    ?
    php

    if
    (
    $
    tmdqc_cart_heading_background

    )
    {
        ? >
        background: < ? php echo $ tmdqc_cart_heading_background
    ;
        ? >
    ;
        < ? php
    }
    ?
    >
    text-transform: uppercase

    ;
    }

    #quick-checkout #tmd_cart table tr {

    <
    ?
    php

    if
    (
    $
    tmdqc_cart_table_color

    )
    {
        ? >
        color: < ? php echo $ tmdqc_cart_table_color
    ;
        ? >
    ;
        < ? php
    }
    ?
    >
    <

    ?
    php

    if
    (
    $
    tmdqc_cart_table_background

    )
    {
        ? >
        background: < ? php echo $ tmdqc_cart_table_background
    ;
        ? >
    ;
        < ? php
    }
    ?
    >

    }
    #quick-checkout #tmd_cart table tr td, #quick-checkout #tmd_cart table tr th, #quick-checkout #tmd_cart .table-bordered {

    <
    ?
    php

    if
    (
    $
    tmdqc_cart_table_border

    )
    {
        ? >
        border-color: < ? php echo $ tmdqc_cart_table_border
    ;
        ? > !important
    ;
        < ? php
    }
    ?
    >

    }
    #quick-checkout .panel {
        border: none;

    <
    ?
    php

    if
    (
    $
    tmdqc_block_heading_background

    )
    {
        ? >
        border-top: solid 1px < ? php echo $ tmdqc_block_heading_border
    ;
        ? >
    ;
        border-bottom: solid 1px < ? php echo $ tmdqc_block_heading_border
    ;
        ? >
    ;
        < ? php
    }
    ?
    >

    }
    #quick-checkout .panel-heading {

    <
    ?
    php

    if
    (
    $
    tmdqc_block_heading_color

    )
    {
        ? >
        color: < ? php echo $ tmdqc_block_heading_color
    ;
        ? >
    ;
        < ? php
    }
    ?
    >
    <

    ?
    php

    if
    (
    $
    tmdqc_block_heading_background

    )
    {
        ? >
        background: < ? php echo $ tmdqc_block_heading_background
    ;
        ? >
    ;
        < ? php
    }
    ?
    >
    border:none

    ;
    }
    #quick-checkout .buttons .btn-primary, #quick-checkout .btn-primary {

    <
    ?
    php

    if
    (
    $
    tmdqc_primary_button_background

    )
    {
        ? >
        background: < ? php echo $ tmdqc_primary_button_background
    ;
        ? > !important
    ;
        < ? php
    }
    ?
    >
    <

    ?
    php

    if
    (
    $
    tmdqc_primary_button_border

    )
    {
        ? >
        border-color: < ? php echo $ tmdqc_primary_button_border
    ;
        ? >
    ;
        < ? php
    }
    ?
    >
    <

    ?
    php

    if
    (
    $
    tmdqc_primary_button_color

    )
    {
        ? >
        color: < ? php echo $ tmdqc_primary_button_color
    ;
        ? >
    ;
        < ? php
    }
    ?
    >

    }
    #quick-checkout .buttons .btn-primary:hover, #quick-checkout .btn-primary:hover {

    <
    ?
    php

    if
    (
    $
    tmdqc_primary_button_background_hover

    )
    {
        ? >
        background: < ? php echo $ tmdqc_primary_button_background_hover
    ;
        ? > !important
    ;
        < ? php
    }
    ?
    >

    }
    #quick-checkout .btn-danger {

    <
    ?
    php

    if
    (
    $
    tmdqc_danger_button_color

    )
    {
        ? >
        color: < ? php echo $ tmdqc_danger_button_color
    ;
        ? >
    ;
        < ? php
    }
    ?
    >
    <

    ?
    php

    if
    (
    $
    tmdqc_danger_button_background

    )
    {
        ? >
        background: < ? php echo $ tmdqc_danger_button_background
    ;
        ? >
    ;
        < ? php
    }
    ?
    >
    <

    ?
    php

    if
    (
    $
    tmdqc_danger_button_border

    )
    {
        ? >
        border-color: < ? php echo $ tmdqc_danger_button_border
    ;
        ? >
    ;
        < ? php
    }
    ?
    >

    }
    #quick-checkout .btn-danger:hover {

    <
    ?
    php

    if
    (
    $
    tmdqc_danger_button_background_hover

    )
    {
        ? >
        background: < ? php echo $ tmdqc_danger_button_background_hover
    ;
        ? >
    ;
        < ? php
    }
    ?
    >

    }
    #warning .form-control, .modal-content .form-control {
        color: < ? php echo $ tmdqc_input_color;
        ? >;
        background-color: < ? php echo $ tmdqc_input_background;
        ? >;
        border: 1px solid < ? php echo $ tmdqc_input_border;
        ? >;
    }

    #warning label {
        color: < ? php echo $ tmdqc_label_color;
        ? >;
    }

    #accountcontent {
        background: < ? php echo $ tmdqc_sub_content_background;
        ? >;
        border: 1px solid < ? php echo $ tmdqc_sub_content_border;
        ? >;
    }

    #tmd_payment_method {
        padding: 10px 5px 35px;
        margin-top: 15px;
        background: < ? php echo $ tmdqc_sub_content_background;
        ? >;
        border: 1px solid < ? php echo $ tmdqc_sub_content_border;
        ? >;
    }

    #tmd_shipping_method {
        padding: 10px;
        background: < ? php echo $ tmdqc_sub_content_background;
        ? >;
        border: 1px solid < ? php echo $ tmdqc_sub_content_border;
        ? >;
    }

    #tmd_delivery_address {
        padding: 10px;
        margin-bottom: 15px;
        background: < ? php echo $ tmdqc_sub_content_background;
        ? >;
        border: 1px solid < ? php echo $ tmdqc_sub_content_border;
        ? >;
    }

    .block {
        padding: 10px;
        border: 1px solid #eee;
    }

    .btn-primary:hover, .btn-primary:active, .btn-primary.active, .btn-primary.disabled, .btn-primary[disabled]{background-position:0 -32px}
#typeaccount a{cursor:pointer;color:<?php echo $tmdqc_cart_heading_color; ?>} #tmd_cart .form-control{height:31px;} #accountcontent .buttons

    {padding:0px 15px;}
</style>