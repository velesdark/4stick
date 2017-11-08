<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]>
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]>
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<!--<![endif]-->
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title><?php echo $title;  ?></title>
    <base href="<?php echo $base; ?>"/>
    <?php if ($description) { ?>
    <meta name="description" content="<?php echo $description; ?>"/>
    <?php } ?>
    <?php if ($keywords) { ?>
    <meta name="keywords" content="<?php echo $keywords; ?>"/>
    <?php } ?>
    <meta property="og:title" content="<?php echo $title; ?>"/>
    <meta property="og:type" content="website"/>
    <meta property="og:url" content="<?php echo $og_url; ?>"/>
    <?php if ($og_image) { ?>
    <meta property="og:image" content="<?php echo $og_image; ?>"/>
    <?php } else { ?>
    <meta property="og:image" content="<?php echo $logo; ?>"/>
    <?php } ?>
    <meta property="og:site_name" content="<?php echo $name; ?>"/>

    <script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
    <script src='http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.5/jquery-ui.min.js'></script>
        <script src="catalog/view/javascript/jquery.jcarousel.min.js" type="text/javascript"></script>
    <script src="catalog/view/javascript/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="catalog/view/javascript/jquery.formstyler.min.js" type="text/javascript"></script>
    <script src="catalog/view/javascript/jquery.maskedinput.min.js" type="text/javascript"></script>
    <script src="catalog/view/javascript/camera.min.js" type="text/javascript"></script>
    <script src="catalog/view/javascript/zoomsl-3.0.min.js" type="text/javascript"></script>
    <script src="catalog/view/javascript/scripts.js" type="text/javascript"></script>
    <script src="catalog/view/javascript/common.js" type="text/javascript"></script>
    <link href="https://fonts.googleapis.com/css?family=PT+Sans:400,400i,700,700i&amp;subset=cyrillic" rel="stylesheet">

    <link href="catalog/view/theme/nak/stylesheet/jquery.formstyler.css" rel="stylesheet">
    <link href="catalog/view/theme/nak/stylesheet/camera.css" rel="stylesheet">
    <link href="catalog/view/theme/nak/stylesheet/style.css" rel="stylesheet">
    <link href="catalog/view/theme/nak/stylesheet/media.css" rel="stylesheet">
    <?php foreach ($styles as $style) { ?>
    <link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>"
          media="<?php echo $style['media']; ?>"/>
    <?php } ?>

    <?php foreach ($links as $link) { ?>
    <link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>"/>
    <?php } ?>
    <?php foreach ($scripts as $script) { ?>
    <script src="<?php echo $script; ?>" type="text/javascript"></script>
    <?php } ?>
    <?php foreach ($analytics as $analytic) { ?>
    <?php echo $analytic; ?>
    <?php } ?>
</head>
<body>


<div class="main_top_menu">
    <div class="top_menu m_row">
        <div class="top_menu_left">
            <ul>
                <li class="stick parent">
                    <a href="/dlya-doma">Наклейки</a>
                    <ul>
                        <li>
                            <a href="/dlya-doma">Для дома</a>
                        </li>
                        <li>
                            <a href="/dlya-avto">На автомобиль</a>
                        </li>
                        <!--<li>
                            <a href="">Реклама на коммерческий транспорт</a>
                        </li>-->
                        <li>
                            <a href="/reklama">Коммерческое оформление</a>
                        </li>
                        <!--<li>
                            <a href="">Трафареты</a>
                        </li>-->

                    </ul>
                </li>
                <li class="reklama parent">
                    <a href="/shirokoformat">Рекламное производство</a>
                    <ul>
                        <li>
                            <a href="/shirokoformat">Широкоформатная печать</a>
                        </li>
                        <li>
                            <a href="/poligrafiya">Полиграфическая продукция</a>
                        </li>
                        <li>
                            <a href="/makety">Требование к макетам</a>
                        </li>
                    </ul>

                </li>
                <li class="service parent">
                    <a href="">Услуги</a>
                    <ul>
                        <li>
                            <a href="/desiner">Услуги дизайнера</a>
                        </li>
                        <li>
                            <a href="">Услуги монтажника</a>
                        </li>
                        <li>
                            <a href="">Постпечатная обработка</a>
                        </li>
                        <li>
                            <a href="/delivery">Доставка</a>
                        </li>

                    </ul>

                </li>
                <li class="about">
                    <a href="/about_us">О нас</a>
                </li>
                <li class="quest">
                    <a href="/faq">Вопрос ответ</a>
                </li>
                <li class="contact">
                    <a href="/contacts">Контакты</a>
                </li>

            </ul>
        </div>
        <div class="top_menu_right">
            <form>
                <input type="text" placeholder="поиск">
            </form>
        </div>
    </div>
</div>
<div class="header m_row">
    <div class="logo">
        <a href="/"><img src="/catalog/view/theme/nak/images/logo.png"/></a>
    </div>
    <div class="header_phone">
        8 800 123 45 67
        <a class="btn_call call_link">Заказать звонок</a>
    </div>
    <div class="header_adress">
        г. Москва, ул. Высокая 12
    </div>
    <div class="header_mail">
        <a class="call_link">zakaz@4stick.ru</a>
    </div>
    <div class="cart">
        <!--<a href="">Корзина</a>
        <span>5</span>-->
        <?php echo $cart; ?>
    </div>
</div>
<div class="main_content m_row">
