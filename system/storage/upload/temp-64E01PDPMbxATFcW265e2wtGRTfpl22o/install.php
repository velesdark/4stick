<?php

$this->load->model('setting/setting');
$this->load->model('user/user_group');
$this->load->model('design/layout');

$this->model_user_user_group->addPermission($this->user->getGroupId(), 'access', 'blog/article');
$this->model_user_user_group->addPermission($this->user->getGroupId(), 'modify', 'blog/article');
$this->model_user_user_group->addPermission($this->user->getGroupId(), 'access', 'blog/setting');
$this->model_user_user_group->addPermission($this->user->getGroupId(), 'modify', 'blog/setting');

$easy_blog_settings = array(
    'easy_blog_global_article_limit' => '10',
    'easy_blog_home_page_meta_title' => 'Blog',
    'easy_blog_home_page_name' => 'Blog',
    'easy_blog_home_page_meta_description' => '',
    'easy_blog_home_page_meta_keyword' => '',
    'easy_blog_global_status' => '1'
);
$this->model_setting_setting->editSetting('easy_blog', $easy_blog_settings, 0);

$easy_blog_layout = array(
    'name' => 'Easy Blog',
    'layout_route' => array(
        'first_route' => array(
            'store_id' => '0',
            'route' => 'blog/%'
        )
    )
);
$this->model_design_layout->addLayout($easy_blog_layout);

?>