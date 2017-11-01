<?php

class ControllerShippingcourier extends Controller
{

    private $error = array();

    public function index()
    {
        $this->load->language('shipping/courier');
        $this->document->setTitle($this->language->get('heading_title'));
        $this->load->model('setting/setting');

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && ($this->validate())) {
            $this->model_setting_setting->editSetting('courier', $this->request->post);
            $this->session->data['success'] = $this->language->get('text_success');
            $this->response->redirect(HTTPS_SERVER . 'index.php?route=extension/shipping&token=' . $this->session->data['token']);
        }

        $data['heading_title'] = $this->language->get('heading_title');
        $data['text_edit'] = $this->language->get('text_edit');
        $data['text_enabled'] = $this->language->get('text_enabled');
        $data['text_disabled'] = $this->language->get('text_disabled');
        $data['text_select'] = $this->language->get('text_select');
        $data['entry_status'] = $this->language->get('entry_status');
        $data['entry_sort_order'] = $this->language->get('entry_sort_order');
        $data['entry_geo_zone'] = $this->language->get('entry_geo_zone');
        $data['entry_city_or_region'] = $this->language->get('entry_city_or_region');
        $data['entry_min_total_for_free_delivery'] = $this->language->get('entry_min_total_for_free_delivery');
        $data['entry_delivery_price_city'] = $this->language->get('entry_delivery_price_city');
        $data['entry_delivery_price_region'] = $this->language->get('entry_delivery_price_region');
        $data['button_save'] = $this->language->get('button_save');
        $data['button_cancel'] = $this->language->get('button_cancel');
        $data['admin_language_id'] = $this->config->get('config_admin_language');

        if (isset($this->error['warning'])) {
            $data['error_warning'] = $this->error['warning'];
        } else {
            $data['error_warning'] = '';
        }

        if (isset($this->error['min_total_for_free_delivery'])) {
            $data['error_min_total_for_free_delivery'] = $this->error['min_total_for_free_delivery'];
        } else {
            $data['error_min_total_for_free_delivery'] = '';
        }

        if (isset($this->error['geo_zone'])) {
            $data['error_geo_zone'] = $this->error['geo_zone'];
        } else {
            $data['error_geo_zone'] = '';
        }

        if (isset($this->error['city_or_region'])) {
            $data['error_city_or_region'] = $this->error['city_or_region'];
        } else {
            $data['error_city_or_region'] = '';
        }

        if (isset($this->error['delivery_price_city'])) {
            $data['error_delivery_price_city'] = $this->error['delivery_price_city'];
        } else {
            $data['error_delivery_price_city'] = '';
        }

        if (isset($this->error['delivery_price_region'])) {
            $data['error_delivery_price_region'] = $this->error['delivery_price_region'];
        } else {
            $data['error_delivery_price_region'] = '';
        }

        $this->document->breadcrumbs = array();

        $this->document->breadcrumbs[] = array(
            'href' => HTTPS_SERVER . 'index.php?route=common/home&token=' . $this->session->data['token'],
            'text' => $this->language->get('text_home'),
            'separator' => FALSE
        );

        $this->document->breadcrumbs[] = array(
            'href' => HTTPS_SERVER . 'index.php?route=extension/shipping&token=' . $this->session->data['token'],
            'text' => $this->language->get('text_shipping'),
            'separator' => ' :: '
        );

        $this->document->breadcrumbs[] = array(
            'href' => HTTPS_SERVER . 'index.php?route=shipping/courier&token=' . $this->session->data['token'],
            'text' => $this->language->get('heading_title'),
            'separator' => ' :: '
        );

        $data['action'] = HTTPS_SERVER . 'index.php?route=shipping/courier&token=' . $this->session->data['token'];
        $data['cancel'] = HTTPS_SERVER . 'index.php?route=extension/shipping&token=' . $this->session->data['token'];

        if (isset($this->request->post['courier_min_total_for_free_delivery'])) {
            $data['courier_min_total_for_free_delivery'] = $this->request->post['courier_min_total_for_free_delivery'];
        } else {
            $data['courier_min_total_for_free_delivery'] = $this->config->get('courier_min_total_for_free_delivery');
        }

        if (isset($this->request->post['courier_geo_zone'])) {
            $data['courier_geo_zone'] = $this->request->post['courier_geo_zone'];
        } else {
            $data['courier_geo_zone'] = $this->config->get('courier_geo_zone');
        }

        if (isset($this->request->post['courier_city_or_region'])) {
            $data['courier_city_or_region'] = $this->request->post['courier_city_or_region'];
        } else {
            $data['courier_city_or_region'] = $this->config->get('courier_city_or_region');
        }

        if (isset($this->request->post['courier_delivery_price_city'])) {
            $data['courier_delivery_price_city'] = $this->request->post['courier_delivery_price_city'];
        } else {
            $data['courier_delivery_price_city'] = $this->config->get('courier_delivery_price_city');
        }

        if (isset($this->request->post['courier_delivery_price_region'])) {
            $data['courier_delivery_price_region'] = $this->request->post['courier_delivery_price_region'];
        } else {
            $data['courier_delivery_price_region'] = $this->config->get('courier_delivery_price_region');
        }

        if (isset($this->request->post['courier_status'])) {
            $data['courier_status'] = $this->request->post['courier_status'];
        } else {
            $data['courier_status'] = $this->config->get('courier_status');
        }

        if (isset($this->request->post['courier_sort_order'])) {
            $data['courier_sort_order'] = $this->request->post['courier_sort_order'];
        } else {
            $data['courier_sort_order'] = $this->config->get('courier_sort_order');
        }

        $this->load->model('localisation/geo_zone');
        $data['geo_zones'] = $this->model_localisation_geo_zone->getGeoZones();

        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');

        $this->response->setOutput($this->load->view('shipping/courier.tpl', $data));
    }

    private function validate()
    {
        if (!$this->user->hasPermission('modify', 'shipping/courier')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }

        if (!$this->request->post['courier_min_total_for_free_delivery']) {
            $this->error['min_total_for_free_delivery'] = $this->language->get('error_min_total_for_free_delivery');
        }

        if (!$this->request->post['courier_geo_zone']) {
            $this->error['geo_zone'] = $this->language->get('error_geo_zone');
        }

        if (!$this->request->post['courier_city_or_region']) {
            $this->error['city_or_region'] = $this->language->get('error_city_or_region');
        }

        if (!$this->request->post['courier_delivery_price_city']) {
            $this->error['delivery_price_city'] = $this->language->get('error_delivery_price_city');
        }

        if (!$this->request->post['courier_delivery_price_region']) {
            $this->error['delivery_price_region'] = $this->language->get('error_delivery_price_region');
        }

        return !$this->error;

    }
}