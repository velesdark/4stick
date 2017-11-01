<?php

class ControllertmdqcShippingAddress extends Controller
{
    public function index()
    {
        $this->load->language('tmdqc/tmdcheckout');


        $text_dilevery_address = $this->language->get('text_dilevery_address');
        if ($this->config->get('tmdqc_title')) {
            $tmdqc_title = $this->config->get('tmdqc_title');
            $text_dilevery_address = (!empty($tmdqc_title['delivery_details_title'][$this->config->get('config_language_id')])) ? $tmdqc_title['delivery_details_title'][$this->config->get('config_language_id')] : $this->language->get('text_dilevery_address');
        }

        $data['text_dilevery_address'] = $text_dilevery_address;
        $data['text_select_address'] = $this->language->get('text_select_address');
        $data['text_address_existing'] = $this->language->get('text_address_existing');
        $data['text_address_new'] = $this->language->get('text_address_new');
        $data['text_select'] = $this->language->get('text_select');
        $data['text_none'] = $this->language->get('text_none');
        $data['text_loading'] = $this->language->get('text_loading');


        $data['entry_shipping'] = $this->language->get('entry_shipping');
        $data['entry_firstname'] = $this->language->get('entry_firstname');
        $data['entry_lastname'] = $this->language->get('entry_lastname');
        $data['entry_company'] = $this->language->get('entry_company');
        $data['entry_address_1'] = $this->language->get('entry_address_1');
        $data['entry_address_2'] = $this->language->get('entry_address_2');
        $data['entry_postcode'] = $this->language->get('entry_postcode');
        $data['entry_city'] = $this->language->get('entry_city');
        $data['entry_country'] = $this->language->get('entry_country');
        $data['entry_zone'] = $this->language->get('entry_zone');

        $data['shipping_required'] = $this->cart->hasShipping();

        $data['button_continue'] = $this->language->get('button_continue');
        $data['button_upload'] = $this->language->get('button_upload');

        if (isset($this->session->data['shipping_address']['address_id'])) {
            $data['address_id'] = $this->session->data['shipping_address']['address_id'];
        } else {
            $data['address_id'] = $this->customer->getAddressId();
        }

        $this->load->model('account/address');

        $data['addresses'] = $this->model_account_address->getAddresses();

        if (isset($this->session->data['shipping_address']['postcode'])) {
            $data['postcode'] = $this->session->data['shipping_address']['postcode'];
        } else {
            $data['postcode'] = '';
        }

        if (isset($this->session->data['shipping_address']['country_id'])) {
            $data['country_id'] = $this->session->data['shipping_address']['country_id'];
        } else {
            $data['country_id'] = $this->config->get('config_country_id');
        }

        if (isset($this->session->data['shipping_address']['zone_id'])) {
            $data['zone_id'] = $this->session->data['shipping_address']['zone_id'];
        } else {
            $data['zone_id'] = '';
        }

        $this->load->model('localisation/country');

        $data['countries'] = $this->model_localisation_country->getCountries();

        // Custom Fields
        $this->load->model('account/custom_field');

        $data['custom_fields'] = $this->model_account_custom_field->getCustomFields($this->config->get('tmdqc_customer_group_id'));

        if (isset($this->session->data['shipping_address']['custom_field'])) {
            $data['shipping_address_custom_field'] = $this->session->data['shipping_address']['custom_field'];
        } else {
            $data['shipping_address_custom_field'] = array();
        }

        $data['shipping_required'] = $this->cart->hasShipping();

        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/tmdqc/shipping_address')) {
            $this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/tmdqc/shipping_address', $data));
        } else {
            $this->response->setOutput($this->load->view('tmdqc/shipping_address', $data));
        }
    }

    public function loadform()
    {
        $this->load->language('tmdqc/tmdcheckout');


        /* TMD Quick Checkout Delivery Address Starts */

        $data['language_id'] = $this->config->get('config_language_id');

        $this->load->model('setting/setting');
        $results = $this->model_setting_setting->getSetting('tmdqc');

        $tmdqc_deliveryaddress = array();

        if (!empty($results['tmdqc_deliveryaddress_firstname'])) {
            $tmdqc_deliveryaddress['tmdqc_deliveryaddress_firstname'] = $results['tmdqc_deliveryaddress_firstname'];
        }


        if (!empty($results['tmdqc_deliveryaddress_lastname'])) {
            $tmdqc_deliveryaddress['tmdqc_deliveryaddress_lastname'] = $results['tmdqc_deliveryaddress_lastname'];
        }

        if (!empty($results['tmdqc_deliveryaddress_state'])) {
            $tmdqc_deliveryaddress['tmdqc_deliveryaddress_state'] = $results['tmdqc_deliveryaddress_state'];
        }

        if (!empty($results['tmdqc_deliveryaddress_country'])) {
            $tmdqc_deliveryaddress['tmdqc_deliveryaddress_country'] = $results['tmdqc_deliveryaddress_country'];
        }
        if (!empty($results['tmdqc_deliveryaddress_company'])) {
            $tmdqc_deliveryaddress['tmdqc_deliveryaddress_company'] = $results['tmdqc_deliveryaddress_company'];
        }

        if (!empty($results['tmdqc_deliveryaddress_postal_code'])) {
            $tmdqc_deliveryaddress['tmdqc_deliveryaddress_postal_code'] = $results['tmdqc_deliveryaddress_postal_code'];
        }

        if (!empty($results['tmdqc_deliveryaddress_city'])) {
            $tmdqc_deliveryaddress['tmdqc_deliveryaddress_city'] = $results['tmdqc_deliveryaddress_city'];
        }

        if (!empty($results['tmdqc_billaddress_company'])) {
            $tmdqc_deliveryaddress['tmdqc_billaddress_company'] = $results['tmdqc_billaddress_company'];
        }

        if (!empty($results['tmdqc_deliveryaddress_address1'])) {
            $tmdqc_deliveryaddress['tmdqc_deliveryaddress_address1'] = $results['tmdqc_deliveryaddress_address1'];
        }

        if (!empty($results['tmdqc_deliveryaddress_address2'])) {
            $tmdqc_deliveryaddress['tmdqc_deliveryaddress_address2'] = $results['tmdqc_deliveryaddress_address2'];
        }
        $data['tmdqc_deliveryaddresses'] = array();
        foreach ($tmdqc_deliveryaddress as $key => $tmdqc_delivery) {
            $tmdqc_delivery['sort_order'] = (!empty($tmdqc_delivery['sort_order'])) ? $tmdqc_delivery['sort_order'] : 1;

            $data['tmdqc_deliveryaddresses'][] = array(
                'label' => (!empty($tmdqc_delivery['label'])) ? $tmdqc_delivery['label'] : '',
                'required' => (!empty($tmdqc_delivery['required'])) ? $tmdqc_delivery['required'] : 0,
                'status' => (!empty($tmdqc_delivery['status'])) ? $tmdqc_delivery['status'] : '',
                'sort_order' => $tmdqc_delivery['sort_order'],
                'feild' => $key
            );
        }

        function sortByOrder($a, $b)
        {
            return $a['sort_order'] - $b['sort_order'];
        }

        usort($data['tmdqc_deliveryaddresses'], 'sortByOrder');
        /* TMD Quick Checkout Delivery Address Ends */

        // echo "<pre>";
        // print_r($data['tmdqc_deliveryaddresses']); die();


        $data['entry_firstname'] = $this->language->get('entry_firstname');
        $data['entry_lastname'] = $this->language->get('entry_lastname');
        $data['entry_company'] = $this->language->get('entry_company');
        $data['entry_address_1'] = $this->language->get('entry_address_1');
        $data['entry_address_2'] = $this->language->get('entry_address_2');
        $data['entry_postcode'] = $this->language->get('entry_postcode');
        $data['entry_city'] = $this->language->get('entry_city');
        $data['entry_country'] = $this->language->get('entry_country');
        $data['entry_zone'] = $this->language->get('entry_zone');

        $data['text_select'] = $this->language->get('text_select');
        $data['text_none'] = $this->language->get('text_none');
        $data['text_loading'] = $this->language->get('text_loading');

        // Custom Fields
        if (isset($this->request->get['address_id'])) {
            $address_id = $this->request->get['address_id'];
        } else {
            $address_id = '';
        }

        $this->load->model('account/address');

        $addresses = array();


        if (!empty($addresses['firstname'])) {
            $data['firstname'] = $addresses['firstname'];
        } elseif ($this->customer->getFirstName()) {
            $data['firstname'] = $this->customer->getFirstName();
        } else {
            $data['firstname'] = '';
        }

        if (!empty($addresses['lastname'])) {
            $data['lastname'] = $addresses['lastname'];
        } elseif ($this->customer->getLastName()) {
            $data['lastname'] = $this->customer->getLastName();
        } else {
            $data['lastname'] = '';
        }

        if (!empty($addresses['company'])) {
            $data['company'] = $addresses['company'];
        } else {
            $data['company'] = '';
        }

        if (!empty($addresses['address_1'])) {
            $data['address_1'] = $addresses['address_1'];
        } else {
            $data['address_1'] = '';
        }

        if (!empty($addresses['address_2'])) {
            $data['address_2'] = $addresses['address_2'];
        } else {
            $data['address_2'] = '';
        }

        if (!empty($addresses['postcode'])) {
            $data['postcode'] = $addresses['postcode'];
        } else {
            $data['postcode'] = '';
        }

        if (!empty($addresses['city'])) {
            $data['city'] = $addresses['city'];
        } else {
            $data['city'] = '';
        }

        if (!empty($addresses['zone_id'])) {
            $data['zone_id'] = $addresses['zone_id'];
        } elseif (isset($this->session->data['shipping_address']['zone_id'])) {
            $data['zone_id'] = $this->session->data['shipping_address']['zone_id'];
        } else {
            $data['zone_id'] = $this->config->get('config_zone_id');
        }

        if (!empty($addresses['country_id'])) {
            $data['country_id'] = $addresses['country_id'];
        } elseif (isset($this->session->data['shipping_address']['country_id'])) {
            $data['country_id'] = $this->session->data['shipping_address']['country_id'];
        } else {
            $data['country_id'] = $this->config->get('config_country_id');
        }

        if (!empty($addresses['custom_field'])) {
            $data['custom_field'] = $addresses['custom_field'];
        } else {
            $data['custom_field'] = array();
        }

        $this->load->model('account/custom_field');

        $data['custom_fields'] = $this->model_account_custom_field->getCustomFields($this->config->get('tmdqc_customer_group_id'));

        if (isset($this->session->data['shipping_address']['custom_field'])) {
            $data['shipping_address_custom_field'] = $this->session->data['shipping_address']['custom_field'];
        } else {
            $data['shipping_address_custom_field'] = array();
        }

        $this->load->model('localisation/country');

        $data['countries'] = $this->model_localisation_country->getCountries();


        $data['alldata'] = $data;


        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/tmdqc/shippingaddress_form')) {
            $this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/tmdqc/shippingaddress_form', $data));
        } else {
            $this->response->setOutput($this->load->view('tmdqc/shippingaddress_form', $data));
        }
    }

    public function save()
    {
        $this->load->language('tmdqc/tmdcheckout');

        $json = array();

        // Validate if customer is logged in.
        if (!$this->customer->isLogged()) {
            $json['redirect'] = $this->url->link('tmdqc/tmdcheckout', '', 'SSL');
        }

        // Validate if shipping is required. If not the customer should not have reached this page.
        if (!$this->cart->hasShipping()) {
            $json['redirect'] = $this->url->link('tmdqc/tmdcheckout', '', 'SSL');
        }

        // Validate cart has products and has stock.
        if ((!$this->cart->hasProducts() && empty($this->session->data['vouchers'])) || (!$this->cart->hasStock() && !$this->config->get('config_stock_checkout'))) {
            $json['redirect'] = $this->url->link('tmdqc/tmdcheckout');
        }

        // Validate minimum quantity requirements.
        $products = $this->cart->getProducts();

        foreach ($products as $product) {
            $product_total = 0;

            foreach ($products as $product_2) {
                if ($product_2['product_id'] == $product['product_id']) {
                    $product_total += $product_2['quantity'];
                }
            }

            if ($product['minimum'] > $product_total) {
                $json['redirect'] = $this->url->link('tmdqc/tmdcheckout');

                break;
            }
        }

        if (!$json) {
            if (empty($this->request->post) || !empty($this->request->post['shipping_address'])) {
                $this->session->data['shipping_address'] = $this->session->data['payment_address'];
            } else {
                if (isset($this->request->post['address_id']) && $this->request->post['address_id'] != 'new') {
                    $this->load->model('account/address');
                    $this->session->data['shipping_address'] = $this->model_account_address->getAddress($this->request->post['address_id']);

                } else {

                    $tmdqc_deliveryaddress_firstname = $this->config->get('tmdqc_deliveryaddress_firstname');
                    if (!empty($tmdqc_deliveryaddress_firstname['status']) && !empty($tmdqc_deliveryaddress_firstname['required'])) {
                        if ((utf8_strlen(trim($this->request->post['firstname'])) < 1) || (utf8_strlen(trim($this->request->post['firstname'])) > 32)) {
                            $json['error']['firstname'] = $this->language->get('error_firstname');
                        }
                    }

                    $tmdqc_deliveryaddress_lastname = $this->config->get('tmdqc_deliveryaddress_lastname');
                    if (!empty($tmdqc_deliveryaddress_lastname['status']) && !empty($tmdqc_deliveryaddress_lastname['required'])) {
                        if ((utf8_strlen(trim($this->request->post['lastname'])) < 1) || (utf8_strlen(trim($this->request->post['lastname'])) > 32)) {
                            $json['error']['lastname'] = $this->language->get('error_lastname');
                        }
                    }

                    /***** Changes Starts *****/
                    $tmdqc_deliveryaddress_company = $this->config->get('tmdqc_deliveryaddress_company');
                    if (!empty($tmdqc_deliveryaddress_company['status']) && !empty($tmdqc_deliveryaddress_company['required'])) {
                        if (utf8_strlen(trim($this->request->post['company'])) < 1) {
                            $json['error']['company'] = $this->language->get('error_company');
                        }
                    }

                    $tmdqc_deliveryaddress_address2 = $this->config->get('tmdqc_deliveryaddress_address2');
                    if (!empty($tmdqc_deliveryaddress_address2['status']) && !empty($tmdqc_deliveryaddress_address2['required'])) {
                        if ((utf8_strlen(trim($this->request->post['address_2'])) < 3) || (utf8_strlen(trim($this->request->post['address_2'])) > 128)) {
                            $json['error']['address_2'] = $this->language->get('error_address_2');
                        }
                    }
                    /***** Changes Ends *****/

                    $tmdqc_deliveryaddress_address1 = $this->config->get('tmdqc_deliveryaddress_address1');
                    if (!empty($tmdqc_deliveryaddress_address1['status']) && !empty($tmdqc_deliveryaddress_address1['required'])) {
                        if ((utf8_strlen(trim($this->request->post['address_1'])) < 3) || (utf8_strlen(trim($this->request->post['address_1'])) > 128)) {
                            $json['error']['address_1'] = $this->language->get('error_address_1');
                        }
                    }


                    $tmdqc_deliveryaddress_city = $this->config->get('tmdqc_deliveryaddress_city');
                    if (!empty($tmdqc_deliveryaddress_city['status']) && !empty($tmdqc_deliveryaddress_city['required'])) {
                        if ((utf8_strlen(trim($this->request->post['city'])) < 2) || (utf8_strlen(trim($this->request->post['city'])) > 128)) {
                            $json['error']['city'] = $this->language->get('error_city');
                        }
                    }

                    $this->load->model('localisation/country');

                    $country_info = $this->model_localisation_country->getCountry($this->request->post['country_id']);


                    $tmdqc_deliveryaddress_postal_code = $this->config->get('tmdqc_deliveryaddress_postal_code');
                    if (!empty($tmdqc_deliveryaddress_postal_code['status']) && !empty($tmdqc_deliveryaddress_postal_code['required'])) {
                        if ($country_info && $country_info['postcode_required'] && (utf8_strlen(trim($this->request->post['postcode'])) < 2 || utf8_strlen(trim($this->request->post['postcode'])) > 10)) {
                            $json['error']['postcode'] = $this->language->get('error_postcode');
                        }
                    }


                    $tmdqc_deliveryaddress_country = $this->config->get('tmdqc_deliveryaddress_country');
                    if (!empty($tmdqc_deliveryaddress_country['status']) && !empty($tmdqc_deliveryaddress_country['required'])) {
                        if ($this->request->post['country_id'] == '') {
                            $json['error']['country'] = $this->language->get('error_country');
                        }
                    }

                    $tmdqc_deliveryaddress_state = $this->config->get('tmdqc_deliveryaddress_state');
                    if (!empty($tmdqc_deliveryaddress_state['status']) && !empty($tmdqc_deliveryaddress_state['required'])) {
                        if (!isset($this->request->post['zone_id']) || $this->request->post['zone_id'] == '') {
                            $json['error']['zone'] = $this->language->get('error_zone');
                        }
                    }


                    // Custom field validation
                    $this->load->model('account/custom_field');

                    $custom_fields = $this->model_account_custom_field->getCustomFields($this->config->get('tmdqc_customer_group_id'));

                    foreach ($custom_fields as $custom_field) {
                        if (($custom_field['location'] == 'address') && $custom_field['required'] && empty($this->request->post['custom_field'][$custom_field['custom_field_id']])) {
                            $json['error']['custom_field' . $custom_field['custom_field_id']] = sprintf($this->language->get('error_custom_field'), $custom_field['name']);
                        }
                    }

                    if (!$json) {
                        // Default Shipping Address
                        $this->load->model('account/address');

                        $address_id = $this->model_account_address->addAddress($this->request->post);

                        $this->session->data['shipping_address'] = $this->model_account_address->getAddress($address_id);


                        $this->load->model('account/activity');

                        $activity_data = array(
                            'customer_id' => $this->customer->getId(),
                            'name' => $this->customer->getFirstName() . ' ' . $this->customer->getLastName()
                        );

                        $this->model_account_activity->addActivity('address_add', $activity_data);
                    }
                }
            }
        }

        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($json));
    }
}