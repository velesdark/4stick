<?php

class ControllertmdqcLogin extends Controller
{
    public function index()
    {
        $this->load->language('tmdqc/tmdcheckout');

        $text_log_in = $this->language->get('text_log_in');
        $button_login = $this->language->get('button_login');
        if ($this->config->get('tmdqc_title')) {
            $tmdqc_title = $this->config->get('tmdqc_title');
            $text_log_in = (!empty($tmdqc_title['login_title'][$this->config->get('config_language_id')])) ? $tmdqc_title['login_title'][$this->config->get('config_language_id')] : $this->language->get('text_log_in');

            $button_login = (!empty($tmdqc_title['login_button_title'][$this->config->get('config_language_id')])) ? $tmdqc_title['login_button_title'][$this->config->get('config_language_id')] : $this->language->get('button_login');
        }

        $data['text_log_in'] = $text_log_in;
        $data['text_checkout_account'] = $this->language->get('text_checkout_account');
        $data['text_checkout_payment_address'] = $this->language->get('text_checkout_payment_address');
        $data['text_new_customer'] = $this->language->get('text_new_customer');
        $data['text_returning_customer'] = $this->language->get('text_returning_customer');
        $data['text_checkout'] = $this->language->get('text_checkout');
        $data['text_register'] = $this->language->get('text_register');
        $data['text_guest'] = $this->language->get('text_guest');
        $data['text_i_am_returning_customer'] = $this->language->get('text_i_am_returning_customer');
        $data['text_register_account'] = $this->language->get('text_register_account');
        $data['text_forgotten'] = $this->language->get('text_forgotten');
        $data['text_loading'] = $this->language->get('text_loading');

        $data['entry_email'] = $this->language->get('entry_email');
        $data['entry_password'] = $this->language->get('entry_password');

        $data['button_continue'] = $this->language->get('button_continue');
        $data['button_login'] = $button_login;

        $data['checkout_guest'] = ($this->config->get('config_checkout_guest') && !$this->config->get('config_customer_price') && !$this->cart->hasDownload());

        if (isset($this->session->data['account'])) {
            $data['account'] = $this->session->data['account'];
        } else {
            $data['account'] = 'register';
        }

        $data['forgotten'] = $this->url->link('account/forgotten', '', 'SSL');

        if (isset($this->request->get['guest'])) {
            $data['permision'] = false;
        } else {
            $data['permision'] = true;
        }

        $this->response->setOutput($this->load->view('tmdqc/login', $data));
    }

    public function save()
    {
        $this->load->language('tmdqc/tmdcheckout');

        $json = array();

        if ($this->customer->isLogged()) {
            $json['redirect'] = $this->url->link('tmdqc/tmdcheckout', '', 'SSL');
        }

        if ((!$this->cart->hasProducts() && empty($this->session->data['vouchers'])) || (!$this->cart->hasStock() && !$this->config->get('config_stock_checkout'))) {
            $json['redirect'] = $this->url->link('tmdqc/tmdcheckout');
        }

        if (!$json) {
            $this->load->model('account/customer');

            // Check how many login attempts have been made.
            $login_info = $this->model_account_customer->getLoginAttempts($this->request->post['email']);

            if ($login_info && ($login_info['total'] >= $this->config->get('config_login_attempts')) && strtotime('-1 hour') < strtotime($login_info['date_modified'])) {
                $json['error']['warning'] = $this->language->get('error_attempts');
            }

            // Check if customer has been approved.
            $customer_info = $this->model_account_customer->getCustomerByEmail($this->request->post['email']);

            if ($customer_info && !$customer_info['approved']) {
                $json['error']['warning'] = $this->language->get('error_approved');
            }

            if (!isset($json['error'])) {
                if (!$this->customer->login($this->request->post['email'], $this->request->post['password'])) {
                    $json['error']['warning'] = $this->language->get('error_login');

                    $this->model_account_customer->addLoginAttempt($this->request->post['email']);
                } else {
                    $this->model_account_customer->deleteLoginAttempts($this->request->post['email']);
                }
            }
        }

        if (!$json) {
            unset($this->session->data['guest']);

            $this->load->model('account/address');

            if ($this->config->get('config_tax_customer') == 'payment') {
                $this->session->data['payment_address'] = $this->model_account_address->getAddress($this->customer->getAddressId());
            }

            if ($this->config->get('config_tax_customer') == 'shipping') {
                $this->session->data['shipping_address'] = $this->model_account_address->getAddress($this->customer->getAddressId());
            }

            $json['redirect'] = $this->url->link('tmdqc/tmdcheckout', '', 'SSL');

            // Add to activity log
            $this->load->model('account/activity');

            $activity_data = array(
                'customer_id' => $this->customer->getId(),
                'name' => $this->customer->getFirstName() . ' ' . $this->customer->getLastName()
            );

            $this->model_account_activity->addActivity('login', $activity_data);
        }

        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($json));
    }
}
