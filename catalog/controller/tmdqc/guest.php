<?php

class ControllerTmdqcGuest extends Controller
{
    public function index()
    {
        /* TMD Quick Checkout Guest Starts */

        $data['language_id'] = $this->config->get('config_language_id');

        $this->load->model('setting/setting');
        $results = $this->model_setting_setting->getSetting('tmdqc');

        $tmdqc_guest = array();

        if (!empty($results['tmdqc_guest_state'])) {
            $tmdqc_guest['tmdqc_guest_state'] = $results['tmdqc_guest_state'];
        }
        if (!empty($results['tmdqc_guest_country'])) {
            $tmdqc_guest['tmdqc_guest_country'] = $results['tmdqc_guest_country'];
        }
        if (!empty($results['tmdqc_guest_postal_code'])) {
            $tmdqc_guest['tmdqc_guest_postal_code'] = $results['tmdqc_guest_postal_code'];
        }
        if (!empty($results['tmdqc_guest_city'])) {
            $tmdqc_guest['tmdqc_guest_city'] = $results['tmdqc_guest_city'];
        }
        if (!empty($results['tmdqc_guest_address2'])) {
            $tmdqc_guest['tmdqc_guest_address2'] = $results['tmdqc_guest_address2'];
        }
        if (!empty($results['tmdqc_guest_fax'])) {
            $tmdqc_guest['tmdqc_guest_fax'] = $results['tmdqc_guest_fax'];
        }
        if (!empty($results['tmdqc_guest_company'])) {
            $tmdqc_guest['tmdqc_guest_company'] = $results['tmdqc_guest_company'];
        }
        if (!empty($results['tmdqc_guest_address1'])) {
            $tmdqc_guest['tmdqc_guest_address1'] = $results['tmdqc_guest_address1'];
        }
        if (!empty($results['tmdqc_guest_firstname'])) {
            $tmdqc_guest['tmdqc_guest_firstname'] = $results['tmdqc_guest_firstname'];
        }
        if (!empty($results['tmdqc_guest_lastname'])) {
            $tmdqc_guest['tmdqc_guest_lastname'] = $results['tmdqc_guest_lastname'];
        }
        if (!empty($results['tmdqc_guest_email'])) {
            $tmdqc_guest['tmdqc_guest_email'] = $results['tmdqc_guest_email'];
        }
        if (!empty($results['tmdqc_guest_telephone'])) {
            $tmdqc_guest['tmdqc_guest_telephone'] = $results['tmdqc_guest_telephone'];
        }

        $data['tmdqc_guests'] = array();
        foreach ($tmdqc_guest as $key => $tmdqc_g) {
            $tmdqc_g['sort_order'] = (!empty($tmdqc_g['sort_order'])) ? $tmdqc_g['sort_order'] : 1;

            $data['tmdqc_guests'][] = array(
                'label' => (!empty($tmdqc_g['label'])) ? $tmdqc_g['label'] : '',
                'required' => (!empty($tmdqc_g['required'])) ? $tmdqc_g['required'] : 0,
                'status' => (!empty($tmdqc_g['status'])) ? $tmdqc_g['status'] : '',
                'sort_order' => $tmdqc_g['sort_order'],
                'feild' => $key
            );
        }

        function sortByOrder($a, $b)
        {
            return $a['sort_order'] - $b['sort_order'];
        }

        usort($data['tmdqc_guests'], 'sortByOrder');
        /* TMD Quick Checkout Guest Ends */


        $this->load->language('tmdqc/tmdcheckout');
        $data['text_select'] = $this->language->get('text_select');
        $data['text_none'] = $this->language->get('text_none');
        $data['text_your_details'] = $this->language->get('text_your_details');
        $data['text_your_account'] = $this->language->get('text_your_account');
        $data['text_your_address'] = $this->language->get('text_your_address');
        $data['text_loading'] = $this->language->get('text_loading');

        $data['entry_firstname'] = $this->language->get('entry_firstname');
        $data['entry_lastname'] = $this->language->get('entry_lastname');
        $data['entry_email'] = $this->language->get('entry_email');
        $data['entry_telephone'] = $this->language->get('entry_telephone');
        $data['entry_fax'] = $this->language->get('entry_fax');
        $data['entry_company'] = $this->language->get('entry_company');
        $data['entry_customer_group'] = $this->language->get('entry_customer_group');
        $data['entry_address_1'] = $this->language->get('entry_address_1');
        $data['entry_address_2'] = $this->language->get('entry_address_2');
        $data['entry_postcode'] = $this->language->get('entry_postcode');
        $data['entry_city'] = $this->language->get('entry_city');
        $data['entry_country'] = $this->language->get('entry_country');
        $data['entry_zone'] = $this->language->get('entry_zone');
        $data['entry_shipping'] = $this->language->get('entry_shipping');

        $data['button_continue'] = $this->language->get('button_continue');
        $data['button_upload'] = $this->language->get('button_upload');

        $data['customer_groups'] = array();

        if (is_array($this->config->get('config_customer_group_display'))) {
            $this->load->model('account/customer_group');

            $customer_groups = $this->model_account_customer_group->getCustomerGroups();

            foreach ($customer_groups as $customer_group) {
                if (in_array($customer_group['customer_group_id'], $this->config->get('config_customer_group_display'))) {
                    $data['customer_groups'][] = $customer_group;
                }
            }
        }

        if (isset($this->session->data['guest']['customer_group_id'])) {
            $data['customer_group_id'] = $this->session->data['guest']['customer_group_id'];
        } else {
            $data['customer_group_id'] = $this->config->get('tmdqc_customer_group_id');
        }

        if (isset($this->session->data['guest']['firstname'])) {
            $data['firstname'] = $this->session->data['guest']['firstname'];
        } else {
            $data['firstname'] = '';
        }

        if (isset($this->session->data['guest']['lastname'])) {
            $data['lastname'] = $this->session->data['guest']['lastname'];
        } else {
            $data['lastname'] = '';
        }

        if (isset($this->session->data['guest']['email'])) {
            $data['email'] = $this->session->data['guest']['email'];
        } else {
            $data['email'] = '';
        }

        if (isset($this->session->data['guest']['telephone'])) {
            $data['telephone'] = $this->session->data['guest']['telephone'];
        } else {
            $data['telephone'] = '';
        }

        if (isset($this->session->data['guest']['fax'])) {
            $data['fax'] = $this->session->data['guest']['fax'];
        } else {
            $data['fax'] = '';
        }

        if (isset($this->session->data['payment_address']['company'])) {
            $data['company'] = $this->session->data['payment_address']['company'];
        } else {
            $data['company'] = '';
        }

        if (isset($this->session->data['payment_address']['address_1'])) {
            $data['address_1'] = $this->session->data['payment_address']['address_1'];
        } else {
            $data['address_1'] = '';
        }

        if (isset($this->session->data['payment_address']['address_2'])) {
            $data['address_2'] = $this->session->data['payment_address']['address_2'];
        } else {
            $data['address_2'] = '';
        }

        if (isset($this->session->data['payment_address']['postcode'])) {
            $data['postcode'] = $this->session->data['payment_address']['postcode'];
        } elseif (isset($this->session->data['shipping_address']['postcode'])) {
            $data['postcode'] = $this->session->data['shipping_address']['postcode'];
        } else {
            $data['postcode'] = '';
        }

        if (isset($this->session->data['payment_address']['city'])) {
            $data['city'] = $this->session->data['payment_address']['city'];
        } else {
            $data['city'] = '';
        }

        if (isset($this->session->data['payment_address']['country_id'])) {
            $data['country_id'] = $this->session->data['payment_address']['country_id'];
        } elseif (isset($this->session->data['shipping_address']['country_id'])) {
            $data['country_id'] = $this->session->data['shipping_address']['country_id'];
        } else {
            $data['country_id'] = $this->config->get('config_country_id');
        }

        if (isset($this->session->data['payment_address']['zone_id'])) {
            $data['zone_id'] = $this->session->data['payment_address']['zone_id'];
        } elseif (isset($this->session->data['shipping_address']['zone_id'])) {
            $data['zone_id'] = $this->session->data['shipping_address']['zone_id'];
        } else {
            $data['zone_id'] = '';
        }

        $this->load->model('localisation/country');

        $data['countries'] = $this->model_localisation_country->getCountries();

        // Custom Fields
        $this->load->model('account/custom_field');
        $data['custom_field'] = $this->model_account_custom_field->getCustomFields();
        $data['custom_fields'] = array();
        foreach ($data['custom_field'] as $custom_field) {
            $tmdqc_custom_sort_oder = $this->config->get('tmdqc_custom_sort_oder');
            if (!empty($tmdqc_custom_sort_oder)) {
                $sort_order = $tmdqc_custom_sort_oder[$custom_field['custom_field_id']];
            } else {
                $sort_order = $custom_field['sort_order'];
            }

            $data['custom_fields'][] = array(
                'custom_field_id' => $custom_field['custom_field_id'],
                'custom_field_value' => $custom_field['custom_field_value'],
                'name' => $custom_field['name'],
                'type' => $custom_field['type'],
                'value' => $custom_field['value'],
                'location' => $custom_field['location'],
                'required' => empty($custom_field['required']) || $custom_field['required'] == 0 ? false : true,
                'sort_order' => $sort_order
            );
        }


        if (isset($this->session->data['guest']['custom_field'])) {
            if (isset($this->session->data['guest']['custom_field'])) {
                $guest_custom_field = $this->session->data['guest']['custom_field'];
            } else {
                $guest_custom_field = array();
            }

            if (isset($this->session->data['payment_address']['custom_field'])) {
                $address_custom_field = $this->session->data['payment_address']['custom_field'];
            } else {
                $address_custom_field = array();
            }

            $data['guest_custom_field'] = $guest_custom_field + $address_custom_field;
        } else {
            $data['guest_custom_field'] = array();
        }

        $data['shipping_required'] = $this->cart->hasShipping();

        if (isset($this->session->data['guest']['shipping_address'])) {
            $data['shipping_address'] = $this->session->data['guest']['shipping_address'];
        } else {
            $data['shipping_address'] = true;
        }

        $data['alldata'] = $data;

        $this->response->setOutput($this->load->view('tmdqc/guest', $data));
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

            $tmdqc_guest_firstname = $this->config->get('tmdqc_guest_firstname');
            if (!empty($tmdqc_guest_firstname['status']) && !empty($tmdqc_guest_firstname['required'])) {
                if ((utf8_strlen(trim($this->request->post['firstname'])) < 1) || (utf8_strlen(trim($this->request->post['firstname'])) > 32)) {
                    $json['error']['firstname'] = $this->language->get('error_firstname');
                }
            }

            $tmdqc_guest_lastname = $this->config->get('tmdqc_guest_lastname');
            if (!empty($tmdqc_guest_lastname['status']) && !empty($tmdqc_guest_lastname['required'])) {
                if ((utf8_strlen(trim($this->request->post['lastname'])) < 1) || (utf8_strlen(trim($this->request->post['lastname'])) > 32)) {
                    $json['error']['lastname'] = $this->language->get('error_lastname');
                }
            }

            $tmdqc_guest_email = $this->config->get('tmdqc_guest_email');
            if (!empty($tmdqc_guest_email['status']) && !empty($tmdqc_guest_email['required'])) {
                if ((utf8_strlen($this->request->post['email']) > 96) || !preg_match('/^[^\@]+@.*.[a-z]{2,15}$/i', $this->request->post['email'])) {
                    $json['error']['email'] = $this->language->get('error_email');
                }
            }

            $tmdqc_guest_telephone = $this->config->get('tmdqc_guest_telephone');
            if (!empty($tmdqc_guest_telephone['status']) && !empty($tmdqc_guest_telephone['required'])) {
                if ((utf8_strlen($this->request->post['telephone']) < 3) || (utf8_strlen($this->request->post['telephone']) > 32)) {
                    $json['error']['telephone'] = $this->language->get('error_telephone');
                }
            }

            $tmdqc_guest_address1 = $this->config->get('tmdqc_guest_address1');
            if (!empty($tmdqc_guest_address1['status']) && !empty($tmdqc_guest_address1['required'])) {
                if ((utf8_strlen(trim($this->request->post['address_1'])) < 3) || (utf8_strlen(trim($this->request->post['address_1'])) > 128)) {
                    $json['error']['address_1'] = $this->language->get('error_address_1');
                }
            }

            $tmdqc_guest_address2 = $this->config->get('tmdqc_guest_address2');
            if (!empty($tmdqc_guest_address2['status']) && !empty($tmdqc_guest_address2['required'])) {
                if ((utf8_strlen(trim($this->request->post['address_2'])) < 3) || (utf8_strlen(trim($this->request->post['address_2'])) > 128)) {
                    $json['error']['address_2'] = $this->language->get('error_address_2');
                }
            }


            $tmdqc_guest_fax = $this->config->get('tmdqc_guest_fax');
            if (!empty($tmdqc_guest_fax['status']) && !empty($tmdqc_guest_fax['required'])) {
                if (empty($this->request->post['fax'])) {
                    $json['error']['fax'] = $this->language->get('error_fax');
                }
            }

            $tmdqc_guest_company = $this->config->get('tmdqc_guest_company');
            if (!empty($tmdqc_guest_company['status']) && !empty($tmdqc_guest_company['required'])) {
                if (empty($this->request->post['company'])) {
                    $json['error']['company'] = $this->language->get('error_company');
                }
            }


            $tmdqc_guest_city = $this->config->get('tmdqc_guest_city');
            if (!empty($tmdqc_guest_city['status']) && !empty($tmdqc_guest_city['required'])) {
                if ((utf8_strlen(trim($this->request->post['city'])) < 2) || (utf8_strlen(trim($this->request->post['city'])) > 128)) {
                    $json['error']['city'] = $this->language->get('error_city');
                }
            }

            $this->load->model('localisation/country');

            $country_info = $this->model_localisation_country->getCountry($this->request->post['country_id']);

            $tmdqc_guest_postal_code = $this->config->get('tmdqc_guest_postal_code');

            if (!empty($tmdqc_guest_postal_code['status']) && !empty($tmdqc_guest_postal_code['required'])) {
                if ($country_info && $country_info['postcode_required'] && (utf8_strlen(trim($this->request->post['postcode'])) < 2 || utf8_strlen(trim($this->request->post['postcode'])) > 10)) {
                    $json['error']['postcode'] = $this->language->get('error_postcode');
                }
            }

            $tmdqc_guest_country = $this->config->get('tmdqc_guest_country');
            if (!empty($tmdqc_guest_country['status']) && !empty($tmdqc_guest_country['required'])) {
                if ($this->request->post['country_id'] == '') {
                    $json['error']['country'] = $this->language->get('error_country');
                }
            }

            $tmdqc_guest_state = $this->config->get('tmdqc_guest_state');
            if (!empty($tmdqc_guest_state['status']) && !empty($tmdqc_guest_state['required'])) {
                if (!isset($this->request->post['zone_id']) || $this->request->post['zone_id'] == '') {
                    $json['error']['zone'] = $this->language->get('error_zone');
                }
            }

            // Customer Group
            if (isset($this->request->post['customer_group_id']) && is_array($this->config->get('config_customer_group_display')) && in_array($this->request->post['customer_group_id'], $this->config->get('config_customer_group_display'))) {
                $customer_group_id = $this->request->post['customer_group_id'];
            } else {
                $customer_group_id = $this->config->get('tmdqc_customer_group_id');
            }

            // Custom field validation
            $this->load->model('account/custom_field');

            $custom_fields = $this->model_account_custom_field->getCustomFields($customer_group_id);

            foreach ($custom_fields as $custom_field) {
                if ($custom_field['required'] && empty($this->request->post['custom_field'][$custom_field['location']][$custom_field['custom_field_id']])) {
                    $json['error']['custom_field' . $custom_field['custom_field_id']] = sprintf($this->language->get('error_custom_field'), $custom_field['name']);
                }
            }
        }

        if (!$json) {
            $this->session->data['account'] = 'guest';

            $this->session->data['guest']['customer_group_id'] = $customer_group_id;
            $this->session->data['guest']['firstname'] = $this->request->post['firstname'];
            $this->session->data['guest']['lastname'] = $this->request->post['lastname'];
            $this->session->data['guest']['email'] = $this->request->post['email'];
            $this->session->data['guest']['telephone'] = $this->request->post['telephone'];
            $this->session->data['guest']['fax'] = $this->request->post['fax'];

            if (isset($this->request->post['custom_field']['account'])) {
                $this->session->data['guest']['custom_field'] = $this->request->post['custom_field']['account'];
            } else {
                $this->session->data['guest']['custom_field'] = array();
            }

            $this->session->data['payment_address']['firstname'] = $this->request->post['firstname'];
            $this->session->data['payment_address']['lastname'] = $this->request->post['lastname'];
            $this->session->data['payment_address']['company'] = $this->request->post['company'];
            $this->session->data['payment_address']['address_1'] = $this->request->post['address_1'];
            $this->session->data['payment_address']['address_2'] = $this->request->post['address_2'];
            $this->session->data['payment_address']['postcode'] = $this->request->post['postcode'];
            $this->session->data['payment_address']['city'] = $this->request->post['city'];
            $this->session->data['payment_address']['country_id'] = $this->request->post['country_id'];
            $this->session->data['payment_address']['zone_id'] = $this->request->post['zone_id'];

            $this->load->model('localisation/country');

            $country_info = $this->model_localisation_country->getCountry($this->request->post['country_id']);

            if ($country_info) {
                $this->session->data['payment_address']['country'] = $country_info['name'];
                $this->session->data['payment_address']['iso_code_2'] = $country_info['iso_code_2'];
                $this->session->data['payment_address']['iso_code_3'] = $country_info['iso_code_3'];
                $this->session->data['payment_address']['address_format'] = $country_info['address_format'];
            } else {
                $this->session->data['payment_address']['country'] = '';
                $this->session->data['payment_address']['iso_code_2'] = '';
                $this->session->data['payment_address']['iso_code_3'] = '';
                $this->session->data['payment_address']['address_format'] = '';
            }

            if (isset($this->request->post['custom_field']['address'])) {
                $this->session->data['payment_address']['custom_field'] = $this->request->post['custom_field']['address'];
            } else {
                $this->session->data['payment_address']['custom_field'] = array();
            }

            $this->load->model('localisation/zone');

            $zone_info = $this->model_localisation_zone->getZone($this->request->post['zone_id']);

            if ($zone_info) {
                $this->session->data['payment_address']['zone'] = $zone_info['name'];
                $this->session->data['payment_address']['zone_code'] = $zone_info['code'];
            } else {
                $this->session->data['payment_address']['zone'] = '';
                $this->session->data['payment_address']['zone_code'] = '';
            }


            $this->session->data['guest']['shipping_address'] = false;

            // Default Payment Address
            if ($this->session->data['guest']['shipping_address']) {
                $this->session->data['shipping_address']['firstname'] = $this->request->post['firstname'];
                $this->session->data['shipping_address']['lastname'] = $this->request->post['lastname'];
                $this->session->data['shipping_address']['company'] = $this->request->post['company'];
                $this->session->data['shipping_address']['address_1'] = $this->request->post['address_1'];
                $this->session->data['shipping_address']['address_2'] = $this->request->post['address_2'];
                $this->session->data['shipping_address']['postcode'] = $this->request->post['postcode'];
                $this->session->data['shipping_address']['city'] = $this->request->post['city'];
                $this->session->data['shipping_address']['country_id'] = $this->request->post['country_id'];
                $this->session->data['shipping_address']['zone_id'] = $this->request->post['zone_id'];

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

                if ($zone_info) {
                    $this->session->data['shipping_address']['zone'] = $zone_info['name'];
                    $this->session->data['shipping_address']['zone_code'] = $zone_info['code'];
                } else {
                    $this->session->data['shipping_address']['zone'] = '';
                    $this->session->data['shipping_address']['zone_code'] = '';
                }

                if (isset($this->request->post['custom_field']['address'])) {
                    $this->session->data['shipping_address']['custom_field'] = $this->request->post['custom_field']['address'];
                } else {
                    $this->session->data['shipping_address']['custom_field'] = array();
                }
            }

        }


        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($json));
    }
}