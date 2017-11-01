<?php

class ControllerTmdqcGuestShipping extends Controller
{
    public function index()
    {
        $this->load->language('tmdqc/tmdcheckout');

        if (!empty($this->session->data['guest']['customer_group_id'])) {
            $this->session->data['guest']['customer_group_id'] = $this->session->data['guest']['customer_group_id'];
        } else {
            $this->session->data['guest']['customer_group_id'] = $this->config->get('tmdqc_customer_group_id');
        }

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

        if (!empty($results['tmdqc_deliveryaddress_postal_code'])) {
            $tmdqc_deliveryaddress['tmdqc_deliveryaddress_postal_code'] = $results['tmdqc_deliveryaddress_postal_code'];
        }

        if (!empty($results['tmdqc_deliveryaddress_company'])) {
            $tmdqc_deliveryaddress['tmdqc_deliveryaddress_company'] = $results['tmdqc_deliveryaddress_company'];
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

        $data['text_select'] = $this->language->get('text_select');
        $data['text_none'] = $this->language->get('text_none');
        $data['text_loading'] = $this->language->get('text_loading');

        $data['entry_firstname'] = $this->language->get('entry_firstname');
        $data['entry_lastname'] = $this->language->get('entry_lastname');
        $data['entry_company'] = $this->language->get('entry_company');
        $data['entry_address_1'] = $this->language->get('entry_address_1');
        $data['entry_address_2'] = $this->language->get('entry_address_2');
        $data['entry_postcode'] = $this->language->get('entry_postcode');
        $data['entry_city'] = $this->language->get('entry_city');
        $data['entry_country'] = $this->language->get('entry_country');
        $data['entry_zone'] = $this->language->get('entry_zone');
        $data['entry_shipping'] = $this->language->get('entry_shipping');

        $data['shipping_required'] = $this->cart->hasShipping();

        $data['button_continue'] = $this->language->get('button_continue');
        $data['button_upload'] = $this->language->get('button_upload');


        if (isset($this->session->data['shipping_address']['firstname'])) {
            $data['firstname'] = $this->session->data['shipping_address']['firstname'];
        } else {
            $data['firstname'] = '';
        }

        if (isset($this->session->data['shipping_address']['lastname'])) {
            $data['lastname'] = $this->session->data['shipping_address']['lastname'];
        } else {
            $data['lastname'] = '';
        }

        if (isset($this->session->data['shipping_address']['company'])) {
            $data['company'] = $this->session->data['shipping_address']['company'];
        } else {
            $data['company'] = '';
        }

        if (isset($this->session->data['shipping_address']['address_1'])) {
            $data['address_1'] = $this->session->data['shipping_address']['address_1'];
        } else {
            $data['address_1'] = '';
        }

        if (isset($this->session->data['shipping_address']['address_2'])) {
            $data['address_2'] = $this->session->data['shipping_address']['address_2'];
        } else {
            $data['address_2'] = '';
        }

        if (isset($this->session->data['shipping_address']['postcode'])) {
            $data['postcode'] = $this->session->data['shipping_address']['postcode'];
        } else {
            $data['postcode'] = '';
        }

        if (isset($this->session->data['shipping_address']['city'])) {
            $data['city'] = $this->session->data['shipping_address']['city'];
        } else {
            $data['city'] = '';
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

        if (isset($this->session->data['guest']['customer_group_id'])) {
            $data['custom_fields'] = $this->model_account_custom_field->getCustomFields($this->session->data['guest']['customer_group_id']);
        } else {
            $data['custom_fields'] = $this->model_account_custom_field->getCustomFields();
        }

        if (isset($this->session->data['shipping_address']['custom_field'])) {
            $data['address_custom_field'] = $this->session->data['shipping_address']['custom_field'];
        } else {
            $data['address_custom_field'] = array();
        }

        $data['alldata'] = $data;

        $this->response->setOutput($this->load->view('tmdqc/guest_shipping', $data));
    }


    public function save()
    {
        $this->load->language('tmdqc/tmdcheckout');

        $json = array();

        // Validate if customer is logged in.
        if ($this->customer->isLogged()) {
            $json['redirect'] = $this->url->link('tmdqc/tmdcheckout', '', 'SSL');

        }

        // Validate cart has products and has stock.
        if ((!$this->cart->hasProducts() && empty($this->session->data['vouchers'])) || (!$this->cart->hasStock() && !$this->config->get('config_stock_checkout'))) {
            $json['redirect'] = $this->url->link('tmdqc/tmdcheckout');

        }

        // Check if guest checkout is available.
        if (!$this->config->get('tmdqc_guest_status') || $this->config->get('config_customer_price') || $this->cart->hasDownload()) {
            $json['redirect'] = $this->url->link('tmdqc/tmdcheckout', '', 'SSL');

        }

        if (!$json) {

            if (!empty($this->request->post['shipping_address'])) {

                $this->session->data['shipping_address']['firstname'] = $this->session->data['payment_address']['firstname'];
                $this->session->data['shipping_address']['lastname'] = $this->session->data['payment_address']['lastname'];
                $this->session->data['shipping_address']['company'] = $this->session->data['payment_address']['company'];
                $this->session->data['shipping_address']['address_1'] = $this->session->data['payment_address']['address_1'];
                $this->session->data['shipping_address']['address_2'] = $this->session->data['payment_address']['address_2'];
                $this->session->data['shipping_address']['postcode'] = $this->session->data['payment_address']['postcode'];
                $this->session->data['shipping_address']['city'] = $this->session->data['payment_address']['city'];
                $this->session->data['shipping_address']['country_id'] = $this->session->data['payment_address']['country_id'];
                $this->session->data['shipping_address']['zone_id'] = $this->session->data['payment_address']['zone_id'];

                $this->session->data['shipping_address']['country'] = $this->session->data['payment_address']['country'];
                $this->session->data['shipping_address']['iso_code_2'] = $this->session->data['payment_address']['iso_code_2'];
                $this->session->data['shipping_address']['iso_code_3'] = $this->session->data['payment_address']['iso_code_3'];
                $this->session->data['shipping_address']['address_format'] = $this->session->data['payment_address']['address_format'];
                $this->session->data['shipping_address']['custom_field'] = $this->session->data['payment_address']['custom_field'];
                $this->session->data['shipping_address']['zone'] = $this->session->data['payment_address']['zone'];
                $this->session->data['shipping_address']['zone_code'] = $this->session->data['payment_address']['zone_code'];
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

                $custom_fields = $this->model_account_custom_field->getCustomFields($this->session->data['guest']['customer_group_id']);

                foreach ($custom_fields as $custom_field) {
                    if (($custom_field['location'] == 'address') && $custom_field['required'] && empty($this->request->post['custom_field'][$custom_field['custom_field_id']])) {
                        $json['error']['custom_field' . $custom_field['custom_field_id']] = sprintf($this->language->get('error_custom_field'), $custom_field['name']);
                    }
                }


                if (!$json) {
                    $this->session->data['shipping_address']['firstname'] = $this->request->post['firstname'];
                    $this->session->data['shipping_address']['lastname'] = $this->request->post['lastname'];
                    $this->session->data['shipping_address']['company'] = $this->request->post['company'];
                    $this->session->data['shipping_address']['address_1'] = $this->request->post['address_1'];
                    $this->session->data['shipping_address']['address_2'] = $this->request->post['address_2'];
                    $this->session->data['shipping_address']['postcode'] = $this->request->post['postcode'];
                    $this->session->data['shipping_address']['city'] = $this->request->post['city'];
                    $this->session->data['shipping_address']['country_id'] = $this->request->post['country_id'];
                    $this->session->data['shipping_address']['zone_id'] = $this->request->post['zone_id'];

                    $this->load->model('localisation/country');

                    $country_info = $this->model_localisation_country->getCountry($this->request->post['country_id']);

                    if ($country_info) {
                        $this->session->data['shipping_address']['country'] = $country_info['name'];
                        $this->session->data['shipping_address']['iso_code_2'] = $country_info['iso_code_2'];
                        $this->session->data['shipping_address']['iso_code_3'] = $country_info['iso_code_3'];
                        $this->session->data['shipping_address']['address_format'] = $country_info['address_format'];
                    } else {
                        $this->session->data['shipping_address']['country'] = '';
                        $this->session->data['shipping_address']['iso_code_2'] = '';
                        $this->session->data['shipping_address']['iso_code_3'] = '';
                        $this->session->data['shipping_address']['address_format'] = '';
                    }

                    $this->load->model('localisation/zone');

                    $zone_info = $this->model_localisation_zone->getZone($this->request->post['zone_id']);

                    if ($zone_info) {
                        $this->session->data['shipping_address']['zone'] = $zone_info['name'];
                        $this->session->data['shipping_address']['zone_code'] = $zone_info['code'];
                    } else {
                        $this->session->data['shipping_address']['zone'] = '';
                        $this->session->data['shipping_address']['zone_code'] = '';
                    }

                    if (isset($this->request->post['custom_field'])) {
                        $this->session->data['shipping_address']['custom_field'] = $this->request->post['custom_field'];
                    } else {
                        $this->session->data['shipping_address']['custom_field'] = array();
                    }
                }
            }
        }

        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($json));
    }
}