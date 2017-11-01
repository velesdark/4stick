<?php

class ControllerTmdqcRegister extends Controller
{
    public function index()
    {
        $this->load->language('tmdqc/tmdcheckout');


        $text_your_details = $this->language->get('text_your_details');
        if ($this->config->get('tmdqc_title')) {
            $tmdqc_title = $this->config->get('tmdqc_title');
            $text_your_details = (!empty($tmdqc_title['personal_detail_title'][$this->config->get('config_language_id')])) ? $tmdqc_title['personal_detail_title'][$this->config->get('config_language_id')] : $this->language->get('text_your_details');
        }

        /* TMD Quick Checkout Register Starts */

        $data['language_id'] = $this->config->get('config_language_id');

        $this->load->model('setting/setting');
        $results = $this->model_setting_setting->getSetting('tmdqc');

        $tmdqc_register = array();
        if (!empty($results['tmdqc_register_newsletter'])) {
            $tmdqc_register['tmdqc_register_newsletter'] = $results['tmdqc_register_newsletter'];
        }

        if (!empty($results['tmdqc_register_password'])) {
            $tmdqc_register['tmdqc_register_password'] = $results['tmdqc_register_password'];
        }

        if (!empty($results['tmdqc_register_cpassword'])) {
            $tmdqc_register['tmdqc_register_cpassword'] = $results['tmdqc_register_cpassword'];
        }

        if (!empty($results['tmdqc_register_address2'])) {
            $tmdqc_register['tmdqc_register_address2'] = $results['tmdqc_register_address2'];
        }
        if (!empty($results['tmdqc_register_state'])) {
            $tmdqc_register['tmdqc_register_state'] = $results['tmdqc_register_state'];
        }

        if (!empty($results['tmdqc_register_country'])) {
            $tmdqc_register['tmdqc_register_country'] = $results['tmdqc_register_country'];
        }

        if (!empty($results['tmdqc_register_postal_code'])) {
            $tmdqc_register['tmdqc_register_postal_code'] = $results['tmdqc_register_postal_code'];
        }
        if (!empty($results['tmdqc_register_city'])) {
            $tmdqc_register['tmdqc_register_city'] = $results['tmdqc_register_city'];
        }

        if (!empty($results['tmdqc_register_company'])) {
            $tmdqc_register['tmdqc_register_company'] = $results['tmdqc_register_company'];
        }

        if (!empty($results['tmdqc_register_address1'])) {
            $tmdqc_register['tmdqc_register_address1'] = $results['tmdqc_register_address1'];
        }
        if (!empty($results['tmdqc_register_fax'])) {
            $tmdqc_register['tmdqc_register_fax'] = $results['tmdqc_register_fax'];
        }
        if (!empty($results['tmdqc_register_telephone'])) {
            $tmdqc_register['tmdqc_register_telephone'] = $results['tmdqc_register_telephone'];
        }

        if (!empty($results['tmdqc_register_email'])) {
            $tmdqc_register['tmdqc_register_email'] = $results['tmdqc_register_email'];
        }
        if (!empty($results['tmdqc_register_lastname'])) {
            $tmdqc_register['tmdqc_register_lastname'] = $results['tmdqc_register_lastname'];
        }
        if (!empty($results['tmdqc_register_firstname'])) {
            $tmdqc_register['tmdqc_register_firstname'] = $results['tmdqc_register_firstname'];
        }


        $data['tmdqc_registers'] = array();
        foreach ($tmdqc_register as $key => $tmdqc_reg) {
            $tmdqc_reg['sort_order'] = (!empty($tmdqc_reg['sort_order'])) ? $tmdqc_reg['sort_order'] : 1;

            $data['tmdqc_registers'][] = array(
                'label' => (!empty($tmdqc_reg['label'])) ? $tmdqc_reg['label'] : '',
                'required' => (!empty($tmdqc_reg['required'])) ? $tmdqc_reg['required'] : 0,
                'status' => (!empty($tmdqc_reg['status'])) ? $tmdqc_reg['status'] : '',
                'sort_order' => $tmdqc_reg['sort_order'],
                'feild' => $key
            );
        }

        function sortByOrder($a, $b)
        {
            return $a['sort_order'] - $b['sort_order'];
        }

        usort($data['tmdqc_registers'], 'sortByOrder');

        /* TMD Quick Checkout Register Ends */


        $data['text_checkout_payment_address'] = $this->language->get('text_checkout_payment_address');
        $data['text_your_details'] = $text_your_details;
        $data['text_your_address'] = $this->language->get('text_your_address');
        $data['text_your_password'] = $this->language->get('text_your_password');
        $data['text_select'] = $this->language->get('text_select');
        $data['text_none'] = $this->language->get('text_none');
        $data['text_loading'] = $this->language->get('text_loading');

        $data['entry_customer_group'] = $this->language->get('entry_customer_group');
        $data['entry_firstname'] = $this->language->get('entry_firstname');
        $data['entry_lastname'] = $this->language->get('entry_lastname');
        $data['entry_email'] = $this->language->get('entry_email');
        $data['entry_telephone'] = $this->language->get('entry_telephone');
        $data['entry_fax'] = $this->language->get('entry_fax');
        $data['entry_company'] = $this->language->get('entry_company');
        $data['entry_address_1'] = $this->language->get('entry_address_1');
        $data['entry_address_2'] = $this->language->get('entry_address_2');
        $data['entry_postcode'] = $this->language->get('entry_postcode');
        $data['entry_city'] = $this->language->get('entry_city');
        $data['entry_country'] = $this->language->get('entry_country');
        $data['entry_zone'] = $this->language->get('entry_zone');
        $data['entry_newsletter'] = sprintf($this->language->get('entry_newsletter'), $this->config->get('config_name'));
        $data['entry_password'] = $this->language->get('entry_password');
        $data['entry_confirm'] = $this->language->get('entry_confirm');
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

        $data['customer_group_id'] = $this->config->get('tmdqc_customer_group_id');

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

        if ($this->config->get('tmdqc_account_id')) {
            $this->load->model('catalog/information');

            $information_info = $this->model_catalog_information->getInformation($this->config->get('tmdqc_account_id'));

            if ($information_info) {
                $data['text_agree'] = sprintf($this->language->get('text_agree'), $this->url->link('information/information/agree', 'information_id=' . $this->config->get('tmdqc_account_id'), 'SSL'), $information_info['title'], $information_info['title']);
            } else {
                $data['text_agree'] = '';
            }
        } else {
            $data['text_agree'] = '';
        }

        if ($this->config->get('tmdqc_account_default_checked')) {
            $data['tmdqc_account_default_checked'] = 'checked="checked"';
        } else {
            $data['tmdqc_account_default_checked'] = '';
        }

        $data['shipping_required'] = $this->cart->hasShipping();

        $data['alldata'] = $data;

        if ($this->config->get('tmdqc_deliveryaddress_status')) {
            $data['shipping_address_show'] = '';
        } else {
            $data['shipping_address_show'] = 'hide';
        }

        $this->response->setOutput($this->load->view('tmdqc/register', $data));
    }

    public function save()
    {

        $this->load->language('tmdqc/tmdcheckout');

        $json = array();

        // Validate if customer is already logged out.
        if ($this->customer->isLogged()) {
            $json['redirect'] = $this->url->link('tmdqc/tmdcheckout', '', 'SSL');
            $json['logged'] = true;
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
            $this->load->model('account/customer');


            $tmdqc_register_firstname = $this->config->get('tmdqc_register_firstname');
            if (!empty($tmdqc_register_firstname['status']) && !empty($tmdqc_register_firstname['required'])) {
                if ((utf8_strlen(trim($this->request->post['firstname'])) < 1) || (utf8_strlen(trim($this->request->post['firstname'])) > 32)) {
                    $json['error']['firstname'] = $this->language->get('error_firstname');
                }
            }

            $tmdqc_register_lastname = $this->config->get('tmdqc_register_lastname');
            if (!empty($tmdqc_register_lastname['status']) && !empty($tmdqc_register_lastname['required'])) {
                if ((utf8_strlen(trim($this->request->post['lastname'])) < 1) || (utf8_strlen(trim($this->request->post['lastname'])) > 32)) {
                    $json['error']['lastname'] = $this->language->get('error_lastname');
                }
            }

            $tmdqc_register_email = $this->config->get('tmdqc_register_email');
            if (!empty($tmdqc_register_email['status']) && !empty($tmdqc_register_email['required'])) {
                if ((utf8_strlen($this->request->post['email']) > 96) || !preg_match('/^[^\@]+@.*.[a-z]{2,15}$/i', $this->request->post['email'])) {
                    $json['error']['email'] = $this->language->get('error_email');
                }

                if ($this->model_account_customer->getTotalCustomersByEmail($this->request->post['email'])) {
                    $json['error']['warning'] = $this->language->get('error_exists');
                }
            }


            $tmdqc_register_telephone = $this->config->get('tmdqc_register_telephone');
            if (!empty($tmdqc_register_telephone['status']) && !empty($tmdqc_register_telephone['required'])) {
                if ((utf8_strlen($this->request->post['telephone']) < 3) || (utf8_strlen($this->request->post['telephone']) > 32)) {
                    $json['error']['telephone'] = $this->language->get('error_telephone');
                }
            }

            $tmdqc_register_address1 = $this->config->get('tmdqc_register_address1');
            if (!empty($tmdqc_register_address1['status']) && !empty($tmdqc_register_address1['required'])) {
                if ((utf8_strlen(trim($this->request->post['address_1'])) < 3) || (utf8_strlen(trim($this->request->post['address_1'])) > 128)) {
                    $json['error']['address_1'] = $this->language->get('error_address_1');
                }
            }

            $tmdqc_register_address2 = $this->config->get('tmdqc_register_address2');
            if (!empty($tmdqc_register_address2['status']) && !empty($tmdqc_register_address2['required'])) {
                if ((utf8_strlen(trim($this->request->post['address_2'])) < 3) || (utf8_strlen(trim($this->request->post['address_2'])) > 128)) {
                    $json['error']['address_2'] = $this->language->get('error_address_2');
                }
            }

            $tmdqc_register_fax = $this->config->get('tmdqc_register_fax');
            if (!empty($tmdqc_register_fax['status']) && !empty($tmdqc_register_fax['required'])) {
                if (empty($this->request->post['fax'])) {
                    $json['error']['fax'] = $this->language->get('error_fax');
                }
            }

            $tmdqc_register_company = $this->config->get('tmdqc_register_company');
            if (!empty($tmdqc_register_company['status']) && !empty($tmdqc_register_company['required'])) {
                if (empty($this->request->post['company'])) {
                    $json['error']['company'] = $this->language->get('error_company');
                }
            }

            $tmdqc_register_city = $this->config->get('tmdqc_register_city');
            if (!empty($tmdqc_register_city['status']) && !empty($tmdqc_register_city['required'])) {
                if ((utf8_strlen(trim($this->request->post['city'])) < 2) || (utf8_strlen(trim($this->request->post['city'])) > 128)) {
                    $json['error']['city'] = $this->language->get('error_city');
                }
            }

            $this->load->model('localisation/country');

            $country_info = $this->model_localisation_country->getCountry($this->request->post['country_id']);

            $tmdqc_register_postal_code = $this->config->get('tmdqc_register_postal_code');
            if (!empty($tmdqc_register_postal_code['status']) && !empty($tmdqc_register_postal_code['required'])) {
                if ($country_info && $country_info['postcode_required'] && (utf8_strlen(trim($this->request->post['postcode'])) < 2 || utf8_strlen(trim($this->request->post['postcode'])) > 10)) {
                    $json['error']['postcode'] = $this->language->get('error_postcode');
                }
            }

            $tmdqc_register_country = $this->config->get('tmdqc_register_country');
            if (!empty($tmdqc_register_country['status']) && !empty($tmdqc_register_country['required'])) {
                if ($this->request->post['country_id'] == '') {
                    $json['error']['country'] = $this->language->get('error_country');
                }
            }

            $tmdqc_register_state = $this->config->get('tmdqc_register_state');
            if (!empty($tmdqc_register_state['status']) && !empty($tmdqc_register_state['required'])) {
                if (!isset($this->request->post['zone_id']) || $this->request->post['zone_id'] == '') {
                    $json['error']['zone'] = $this->language->get('error_zone');
                }
            }

            $tmdqc_register_password = $this->config->get('tmdqc_register_password');
            if (!empty($tmdqc_register_password['status']) && !empty($tmdqc_register_password['required'])) {
                if ((utf8_strlen($this->request->post['password']) < 4) || (utf8_strlen($this->request->post['password']) > 20)) {
                    $json['error']['password'] = $this->language->get('error_password');
                }
            }

            $tmdqc_register_cpassword = $this->config->get('tmdqc_register_cpassword');
            if (!empty($tmdqc_register_cpassword['status']) && !empty($tmdqc_register_cpassword['required'])) {
                if ($this->request->post['confirm'] != $this->request->post['password']) {
                    $json['error']['confirm'] = $this->language->get('error_confirm');
                }
            }

            $tmdqc_register_newsletter = $this->config->get('tmdqc_register_newsletter');
            if (!empty($tmdqc_register_newsletter['status']) && !empty($tmdqc_register_newsletter['required'])) {
                if (empty($this->request->post['newsletter'])) {
                    $json['error']['warning'] = $this->language->get('error_newsletter');
                }
            }

            if ($this->config->get('tmdqc_account_id')) {
                $this->load->model('catalog/information');

                $information_info = $this->model_catalog_information->getInformation($this->config->get('tmdqc_account_id'));

                if ($information_info && !isset($this->request->post['agree'])) {
                    $json['error']['warning'] = sprintf($this->language->get('error_agree'), $information_info['title']);
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
            $customer_id = $this->model_account_customer->addCustomer($this->request->post);
            // Clear any previous login attempts for unregistered accounts.
            $this->model_account_customer->deleteLoginAttempts($this->request->post['email']);

            $this->session->data['account'] = 'register';

            $this->load->model('account/customer_group');

            $customer_group_info = $this->model_account_customer_group->getCustomerGroup($customer_group_id);

            if ($customer_group_info && !$customer_group_info['approval']) {
                $this->customer->login($this->request->post['email'], $this->request->post['password']);

                // Default Payment Address
                $this->load->model('account/address');

                $this->session->data['payment_address'] = $this->model_account_address->getAddress($this->customer->getAddressId());

                /* if (!empty($this->request->post['shipping_address'])) {
                    $this->session->data['shipping_address'] = $this->model_account_address->getAddress($this->customer->getAddressId());
                        $json['shipping_address_permission'] = true;
                }else{
                     $json['shipping_address_permission'] = false;
                } */
            } else {
                $json['redirect'] = $this->url->link('account/success');
            }

            unset($this->session->data['guest']);

            // Add to activity log
            $this->load->model('account/activity');

            $activity_data = array(
                'customer_id' => $customer_id,
                'name' => $this->request->post['firstname'] . ' ' . $this->request->post['lastname']
            );

            $this->model_account_activity->addActivity('register', $activity_data);
        }

        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($json));
    }
}