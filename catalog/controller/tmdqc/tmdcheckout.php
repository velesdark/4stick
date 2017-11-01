<?php

class ControllertmdqcTmdcheckout extends Controller
{
    public function index()
    {
        if ($this->config->get('tmdqc_status')) {
            $this->load->language('tmdqc/tmdcheckout');

            $heading_title = $this->language->get('heading_title');
            $button_shopping = $this->language->get('button_shopping');
            $button_order = $this->language->get('button_order');
            if ($this->config->get('tmdqc_title')) {
                $tmdqc_title = $this->config->get('tmdqc_title');
                $heading_title = (!empty($tmdqc_title['heading_title'][$this->config->get('config_language_id')])) ? $tmdqc_title['heading_title'][$this->config->get('config_language_id')] : $this->language->get('heading_title');

                $button_shopping = (!empty($tmdqc_title['continue_shopping_title'][$this->config->get('config_language_id')])) ? $tmdqc_title['continue_shopping_title'][$this->config->get('config_language_id')] : $this->language->get('button_shopping');

                $button_order = (!empty($tmdqc_title['order_title'][$this->config->get('config_language_id')])) ? $tmdqc_title['order_title'][$this->config->get('config_language_id')] : $this->language->get('button_order');
            }

            $this->document->setTitle($heading_title);
            $data['breadcrumbs'] = array();

            $data['breadcrumbs'][] = array(
                'text' => $this->language->get('text_home'),
                'href' => $this->url->link('common/home')
            );

            $data['breadcrumbs'][] = array(
                'text' => $heading_title,
                'href' => $this->url->link('tmdqc/tmdcheckout', '', 'SSL')
            );
            if ($this->cart->hasProducts() || !empty($this->session->data['vouchers'])) {

                if (!empty($this->session->data['shipping_address']['country_id'])) {
                    $this->session->data['shipping_address']['country_id'] = $this->session->data['shipping_address']['country_id'];
                } else {
                    $this->session->data['shipping_address']['country_id'] = $this->config->get('tmdqc_country_id');
                }

                if (!empty($this->session->data['shipping_address']['zone_id'])) {
                    $this->session->data['shipping_address']['zone_id'] = $this->session->data['shipping_address']['country_id'];
                } else {
                    $this->session->data['shipping_address']['zone_id'] = $this->config->get('tmdqc_zone_id');
                }

                if (!empty($this->session->data['payment_address']['zone_id'])) {
                    $this->session->data['payment_address']['zone_id'] = $this->session->data['payment_address']['country_id'];
                } else {
                    $this->session->data['payment_address']['zone_id'] = $this->config->get('tmdqc_zone_id');
                }

                if (!empty($this->session->data['payment_address']['country_id'])) {
                    $this->session->data['payment_address']['country_id'] = $this->session->data['payment_address']['country_id'];
                } else {
                    $this->session->data['payment_address']['country_id'] = $this->config->get('tmdqc_country_id');
                }

                $products = $this->cart->getProducts();

                foreach ($products as $product) {
                    $product_total = 0;

                    foreach ($products as $product_2) {
                        if ($product_2['product_id'] == $product['product_id']) {
                            $product_total += $product_2['quantity'];
                        }
                    }

                    if ($product['minimum'] > $product_total) {
                        $this->response->redirect($this->url->link('checkout/cart'));
                    }
                }

                // Content Color
                $data['tmdqc_content_background'] = ($this->config->get('tmdqc_content_background')) ? $this->config->get('tmdqc_content_background') : '';
                $data['tmdqc_content_heading_color'] = ($this->config->get('tmdqc_content_heading_color')) ? $this->config->get('tmdqc_content_heading_color') : '';

                // My Cart Color
                $data['tmdqc_cart_heading_color'] = ($this->config->get('tmdqc_cart_heading_color')) ? $this->config->get('tmdqc_cart_heading_color') : '';
                $data['tmdqc_cart_heading_background'] = ($this->config->get('tmdqc_cart_heading_background')) ? $this->config->get('tmdqc_cart_heading_background') : '';
                $data['tmdqc_cart_table_color'] = ($this->config->get('tmdqc_cart_table_color')) ? $this->config->get('tmdqc_cart_table_color') : '';
                $data['tmdqc_cart_table_background'] = ($this->config->get('tmdqc_cart_table_background')) ? $this->config->get('tmdqc_cart_table_background') : '';
                $data['tmdqc_cart_table_border'] = ($this->config->get('tmdqc_cart_table_border')) ? $this->config->get('tmdqc_cart_table_border') : '';


                // Buttons Color
                $data['tmdqc_primary_button_color'] = ($this->config->get('tmdqc_primary_button_color')) ? $this->config->get('tmdqc_primary_button_color') : '';
                $data['tmdqc_primary_button_background'] = ($this->config->get('tmdqc_primary_button_background')) ? $this->config->get('tmdqc_primary_button_background') : '';
                $data['tmdqc_primary_button_background_hover'] = ($this->config->get('tmdqc_primary_button_background_hover')) ? $this->config->get('tmdqc_primary_button_background_hover') : '';
                $data['tmdqc_primary_button_border'] = ($this->config->get('tmdqc_primary_button_border')) ? $this->config->get('tmdqc_primary_button_border') : '';

                $data['tmdqc_danger_button_color'] = ($this->config->get('tmdqc_danger_button_color')) ? $this->config->get('tmdqc_danger_button_color') : '';
                $data['tmdqc_danger_button_background'] = ($this->config->get('tmdqc_danger_button_background')) ? $this->config->get('tmdqc_danger_button_background') : '';
                $data['tmdqc_danger_button_background_hover'] = ($this->config->get('tmdqc_danger_button_background_hover')) ? $this->config->get('tmdqc_danger_button_background_hover') : '';
                $data['tmdqc_danger_button_border'] = ($this->config->get('tmdqc_danger_button_border')) ? $this->config->get('tmdqc_danger_button_border') : '';
                $data['tmdqc_logintextcolor'] = ($this->config->get('tmdqc_logintextcolor')) ? $this->config->get('tmdqc_logintextcolor') : '';
                // Input Color
                $data['tmdqc_input_background'] = ($this->config->get('tmdqc_input_background')) ? $this->config->get('tmdqc_input_background') : '';
                $data['tmdqc_input_color'] = ($this->config->get('tmdqc_input_color')) ? $this->config->get('tmdqc_input_color') : '';
                $data['tmdqc_input_border'] = ($this->config->get('tmdqc_input_border')) ? $this->config->get('tmdqc_input_border') : '';
                $data['tmdqc_label_color'] = ($this->config->get('tmdqc_label_color')) ? $this->config->get('tmdqc_label_color') : '';

                //Sub content
                $data['tmdqc_sub_content_background'] = ($this->config->get('tmdqc_sub_content_background')) ? $this->config->get('tmdqc_sub_content_background') : '';
                $data['tmdqc_sub_content_border'] = ($this->config->get('tmdqc_sub_content_border')) ? $this->config->get('tmdqc_sub_content_border') : '';
                $data['tmdqc_block_heading_color'] = ($this->config->get('tmdqc_block_heading_color')) ? $this->config->get('tmdqc_block_heading_color') : '';
                $data['tmdqc_block_heading_background'] = ($this->config->get('tmdqc_block_heading_background')) ? $this->config->get('tmdqc_block_heading_background') : '';
                $data['tmdqc_block_heading_border'] = ($this->config->get('tmdqc_block_heading_border')) ? $this->config->get('tmdqc_block_heading_border') : '';


                $this->document->addScript('catalog/view/javascript/jquery/datetimepicker/moment.js');
                $this->document->addScript('catalog/view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.js');
                $this->document->addStyle('catalog/view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.css');

                // Required by klarna
                if ($this->config->get('klarna_account') || $this->config->get('klarna_invoice')) {
                    $this->document->addScript('http://cdn.klarna.com/public/kitt/toc/v1.0/js/klarna.terms.min.js');
                }


                $data['heading_title'] = $heading_title;

                $data['text_loading'] = $this->language->get('text_loading');

                $data['continue'] = $this->url->link('common/home');
                $data['button_shopping'] = $button_shopping;
                $data['button_order'] = $button_order;


                if (!$this->cart->hasStock() && (!$this->config->get('config_stock_checkout') || $this->config->get('config_stock_warning'))) {
                    $data['error_warning'] = $this->language->get('error_stock');
                } elseif (isset($this->session->data['error'])) {
                    $data['error_warning'] = $this->session->data['error'];
                    unset($this->session->data['error']);
                } else {
                    $data['error_warning'] = '';
                }

                $data['logged'] = $this->customer->isLogged();

                if (isset($this->session->data['account'])) {
                    $data['account'] = $this->session->data['account'];
                } else {
                    $data['account'] = '';
                }

                $data['shipping_required'] = $this->cart->hasShipping();

                ////Admin Control Varibale
                $layout = $this->config->get('tmdqc_layout_description');
                if ($layout) {
                    $find = array(
                        '[main]',
                        '[/main]',
                        '[col-12]',
                        '[/col-12]',
                        '[col-6]',
                        '[/col-6]',
                        '[col-4]',
                        '[col-4]',
                        '{account}',
                        '{cart}',
                        '{register}',
                        '{billing_detail}',
                        '{delivery_detail}',
                        '{shipping_method}',
                        '{payment_method}',
                        '{confirmation}',
                    );

                    $replace = array(
                        '<div class="row">',
                        '</div>',
                        '<div class="col-lg-12 col-md-12 col-sm-12 ">',
                        '</div>',
                        '<div class="col-lg-6 col-md-6 col-sm-6 ">',
                        '</div>',
                        '<div class="col-lg-4 col-md-4 col-sm-4 ">',
                        '</div>',
                        '<div id="tmd_login"><div id="typeaccount"></div><div id="accountcontent"></div></div>',
                        '<div id="tmd_cart"></div>',
                        '<div id="tmd_register"></div>',
                        '<div id="tmd_billing_address"></div>',
                        '<div id="tmd_delivery_address"></div>',
                        '<div id="tmd_shipping_method"></div>',
                        '<div id="tmd_payment_method"></div>',
                        '<div id="tmd_confirmation"></div>',
                    );
                    $data['content_layout'] = str_replace(array("\r\n", "\r", "\n"), '', preg_replace(array("/\s\s+/", "/\r\r+/", "/\n\n+/"), '', trim(str_replace($find, $replace, $layout))));
                }

                $data['column_left'] = $this->load->controller('common/column_left');
                $data['column_right'] = $this->load->controller('common/column_right');
                $data['content_top'] = $this->load->controller('common/content_top');
                $data['content_bottom'] = $this->load->controller('common/content_bottom');
                $data['footer'] = $this->load->controller('common/footer');
                $data['header'] = $this->load->controller('common/header');

                $this->response->setOutput($this->load->view('tmdqc/tmdcheckout', $data));
            } else {
                $data['heading_title'] = $heading_title;

                $data['text_error'] = $this->language->get('text_empty');

                $data['button_continue'] = $this->language->get('button_continue');

                $data['continue'] = $this->url->link('common/home');

                unset($this->session->data['success']);

                $data['column_left'] = $this->load->controller('common/column_left');
                $data['column_right'] = $this->load->controller('common/column_right');
                $data['content_top'] = $this->load->controller('common/content_top');
                $data['content_bottom'] = $this->load->controller('common/content_bottom');
                $data['footer'] = $this->load->controller('common/footer');
                $data['header'] = $this->load->controller('common/header');

                $this->response->setOutput($this->load->view('error/not_found', $data));
            }
        } else {
            $this->response->redirect($this->url->link('checkout/checkout'));
        }
    }


    public function accounttype()
    {
        $this->load->language('tmdqc/tmdcheckout');
        $text_cust = $this->language->get('text_cust');
        $text_log_in = $this->language->get('text_log_in');
        $chekout_option_title = $this->language->get('text_chekout');
        $text_register = $this->language->get('text_register');
        $text_guest = $this->language->get('text_guest');
        if ($this->config->get('tmdqc_title')) {
            $tmdqc_title = $this->config->get('tmdqc_title');
            $text_cust = (!empty($tmdqc_title['custmer_title'][$this->config->get('config_language_id')])) ? $tmdqc_title['custmer_title'][$this->config->get('config_language_id')] : $this->language->get('text_cust');
            $text_log_in = (!empty($tmdqc_title['login_title'][$this->config->get('config_language_id')])) ? $tmdqc_title['login_title'][$this->config->get('config_language_id')] : $this->language->get('text_log_in');


            $chekout_option_title = (!empty($tmdqc_title['chekout_option_title'][$this->config->get('config_language_id')])) ? $tmdqc_title['chekout_option_title'][$this->config->get('config_language_id')] : $this->language->get('text_chekout');

            $text_register = (!empty($tmdqc_title['register_title'][$this->config->get('config_language_id')])) ? $tmdqc_title['register_title'][$this->config->get('config_language_id')] : $this->language->get('text_register');
            $text_guest = (!empty($tmdqc_title['guest_title'][$this->config->get('config_language_id')])) ? $tmdqc_title['guest_title'][$this->config->get('config_language_id')] : $this->language->get('text_guest');
        }

        $data['text_cust'] = $text_cust;
        $data['text_log_in'] = $text_log_in;
        $data['text_checkout'] = $chekout_option_title;
        $data['text_register'] = $text_register;
        $data['text_guest'] = $text_guest;


        $data['checkout_guest'] = ($this->config->get('config_checkout_guest') && !$this->config->get('config_customer_price') && !$this->cart->hasDownload());

        if ($this->config->get('tmdqc_account_option')) {
            $data['account'] = $this->config->get('tmdqc_account_option');
            $data['account_type_show'] = '';
        } else {
            $data['account'] = 'register';
            $data['account_type_show'] = '';
        }

        $data['forgotten'] = $this->url->link('account/forgotten', '', 'SSL');

        if (isset($this->request->get['guest'])) {
            $data['permision'] = false;
        } else {
            $data['permision'] = true;
        }


        $this->response->setOutput($this->load->view('tmdqc/accounttype', $data));
    }

    public function country()
    {
        $json = array();

        $this->load->model('localisation/country');

        $country_info = $this->model_localisation_country->getCountry($this->request->get['country_id']);

        if ($country_info) {
            $this->load->model('localisation/zone');

            $json = array(
                'country_id' => $country_info['country_id'],
                'name' => $country_info['name'],
                'iso_code_2' => $country_info['iso_code_2'],
                'iso_code_3' => $country_info['iso_code_3'],
                'address_format' => $country_info['address_format'],
                'postcode_required' => $country_info['postcode_required'],
                'zone' => $this->model_localisation_zone->getZonesByCountryId($this->request->get['country_id']),
                'status' => $country_info['status']
            );
        }

        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($json));
    }

    public function customfield()
    {
        $json = array();

        $this->load->model('account/custom_field');

        // Customer Group
        if (isset($this->request->get['customer_group_id']) && is_array($this->config->get('config_customer_group_display')) && in_array($this->request->get['customer_group_id'], $this->config->get('config_customer_group_display'))) {
            $customer_group_id = $this->request->get['customer_group_id'];
        } else {
            $customer_group_id = $this->config->get('tmdqc_customer_group_id');
        }

        $custom_fields = $this->model_account_custom_field->getCustomFields($customer_group_id);

        foreach ($custom_fields as $custom_field) {
            $json[] = array(
                'custom_field_id' => $custom_field['custom_field_id'],
                'required' => $custom_field['required']
            );
        }

        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($json));
    }

    public function edit()
    {
        $this->load->language('checkout/cart');

        $json = array();

        // Update
        if (!empty($this->request->post['quantity'])) {
            foreach ($this->request->post['quantity'] as $key => $value) {
                $this->cart->update($key, $value);
            }

            unset($this->session->data['shipping_method']);
            unset($this->session->data['shipping_methods']);
            unset($this->session->data['payment_method']);
            unset($this->session->data['payment_methods']);
            unset($this->session->data['reward']);

            $this->response->redirect($this->url->link('tmdqc/tmdcheckout'));
        }

        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($json));
    }

    public function remove()
    {
        $this->load->language('checkout/cart');

        $json = array();

        // Remove
        if (isset($this->request->post['key'])) {
            $this->cart->remove($this->request->post['key']);

            unset($this->session->data['vouchers'][$this->request->post['key']]);

            $this->session->data['success'] = $this->language->get('text_remove');

            unset($this->session->data['shipping_method']);
            unset($this->session->data['shipping_methods']);
            unset($this->session->data['payment_method']);
            unset($this->session->data['payment_methods']);
            unset($this->session->data['reward']);

            // Totals
            $this->load->model('extension/extension');

            $totals = array();
            $taxes = $this->cart->getTaxes();
            $total = 0;

            // Because __call can not keep var references so we put them into an array.
            $total_data = array(
                'totals' => &$totals,
                'taxes' => &$taxes,
                'total' => &$total
            );

            // Display prices
            if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
                $sort_order = array();

                $results = $this->model_extension_extension->getExtensions('total');

                foreach ($results as $key => $value) {
                    $sort_order[$key] = $this->config->get($value['code'] . '_sort_order');
                }

                array_multisort($sort_order, SORT_ASC, $results);

                foreach ($results as $result) {
                    if ($this->config->get($result['code'] . '_status')) {
                        $this->load->model('total/' . $result['code']);

                        // We have to put the totals in an array so that they pass by reference.
                        $this->{'model_total_' . $result['code']}->getTotal($total_data);
                    }
                }

                $sort_order = array();

                foreach ($totals as $key => $value) {
                    $sort_order[$key] = $value['sort_order'];
                }

                array_multisort($sort_order, SORT_ASC, $totals);
            }

            $data['totals'] = array();

            foreach ($totals as $total) {
                $data['totals'][] = array(
                    'title' => $total['title'],
                    'text' => $this->currency->format($total['value'], $this->session->data['currency'])
                );
            }

            $json['total'] = sprintf($this->language->get('text_items'), $this->cart->countProducts() + (isset($this->session->data['vouchers']) ? count($this->session->data['vouchers']) : 0), $this->currency->format($total, $this->session->data['currency']));
        }

        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($json));
    }
}