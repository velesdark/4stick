<?php

class ControllerTmdqcPaymentMethod extends Controller
{
    public function index()
    {
        $this->load->language('tmdqc/tmdcheckout');


        $text_payment_method_title = $this->language->get('text_payment_method_title');
        if ($this->config->get('tmdqc_title')) {
            $tmdqc_title = $this->config->get('tmdqc_title');
            $text_payment_method_title = (!empty($tmdqc_title['payment_method_title'][$this->config->get('config_language_id')])) ? $tmdqc_title['payment_method_title'][$this->config->get('config_language_id')] : $this->language->get('text_payment_method_title');
        }

        $data['text_payment_method_title'] = $text_payment_method_title;

        if (isset($this->session->data['payment_address'])) {
            // Totals
            $totals = array();
            $taxes = $this->cart->getTaxes();
            $total = 0;

            // Because __call can not keep var references so we put them into an array.
            $total_data = array(
                'totals' => &$totals,
                'taxes' => &$taxes,
                'total' => &$total
            );

            $this->load->model('extension/extension');

            $sort_order = array();

            $results = $this->model_extension_extension->getExtensions('total');

            foreach ($results as $key => $value) {
                $sort_order[$key] = $this->config->get($value['code'] . '_sort_order');
            }

            array_multisort($sort_order, SORT_ASC, $results);

            foreach ($results as $result) {
                if ($this->config->get($result['code'] . '_status')) {
                    $this->load->model('extension/total/' . $result['code']);

                    // We have to put the totals in an array so that they pass by reference.
                    $this->{'model_extension_total_' . $result['code']}->getTotal($total_data);
                }
            }

            // Payment Methods
            $method_data = array();

            $this->load->model('extension/extension');

            $this->load->model('tool/image');

            $results = $this->model_extension_extension->getExtensions('payment');

            $recurring = $this->cart->hasRecurringProducts();

            foreach ($results as $result) {
                if ($this->config->get($result['code'] . '_status')) {
                    $paymentsetting = $this->config->get('tmdqc_' . $result['code']);

                    if (!empty($paymentsetting[$this->config->get('config_language_id')]['image'])) {
                        $image = $this->model_tool_image->resize($paymentsetting[$this->config->get('config_language_id')]['image'], 50, 50);
                    } else {
                        $image = '';
                    }


                    $this->load->model('extension/payment/' . $result['code']);

                    $method = $this->{'model_extension_payment_' . $result['code']}->getMethod($this->session->data['payment_address'], $total);


                    if ($method) {
                        if (!empty($paymentsetting[$this->config->get('config_language_id')]['label'])) {
                            $title = $paymentsetting[$this->config->get('config_language_id')]['label'];
                        } else {
                            $title = $method['title'];
                        }
                        if ($recurring) {
                            if (method_exists($this->{'model_extension_payment_' . $result['code']}, 'recurringPayments') && $this->{'model_extension_payment_' . $result['code']}->recurringPayments()) {
                                $method = array(
                                    'code' => $method['code'],
                                    'title' => $title,
                                    'terms' => $method['terms'],
                                    'sort_order' => $method['sort_order'],
                                    'image' => $image,
                                );
                                $method_data[$result['code']] = $method;
                            }
                        } else {
                            $method = array(
                                'code' => $method['code'],
                                'title' => $title,
                                'terms' => (isset($method['terms']) ? $method['terms'] : ''),
                                'sort_order' => $method['sort_order'],
                                'image' => $image,
                            );
                            $method_data[$result['code']] = $method;
                        }
                    }
                }
            }

            $sort_order = array();

            foreach ($method_data as $key => $value) {
                $sort_order[$key] = $value['sort_order'];
            }

            array_multisort($sort_order, SORT_ASC, $method_data);

            $this->session->data['payment_methods'] = $method_data;

        }

        $data['text_payment_method'] = $this->language->get('text_payment_method');
        $data['text_comments'] = $this->language->get('text_comments');
        $data['text_loading'] = $this->language->get('text_loading');

        $data['button_continue'] = $this->language->get('button_continue');

        if (empty($this->session->data['payment_methods'])) {
            $data['error_warning'] = sprintf($this->language->get('error_no_payment'), $this->url->link('information/contact'));
        } else {
            $data['error_warning'] = '';
        }

        if (isset($this->session->data['payment_methods'])) {
            $data['payment_methods'] = $this->session->data['payment_methods'];
        } else {
            $data['payment_methods'] = array();
        }

        if (isset($this->session->data['payment_method']['code'])) {
            $data['code'] = $this->session->data['payment_method']['code'];
        } else {
            $data['code'] = '';
        }

        if (isset($this->session->data['comment'])) {
            $data['comment'] = $this->session->data['comment'];
        } else {
            $data['comment'] = '';
        }

        $data['scripts'] = $this->document->getScripts();

        if ($this->config->get('tmdqc_checkout_id')) {
            $this->load->model('catalog/information');

            $information_info = $this->model_catalog_information->getInformation($this->config->get('tmdqc_checkout_id'));

            if ($information_info) {
                $data['text_agree'] = sprintf($this->language->get('text_agree'), $this->url->link('information/information/agree', 'information_id=' . $this->config->get('tmdqc_checkout_id'), 'SSL'), $information_info['title'], $information_info['title']);
            } else {
                $data['text_agree'] = '';
            }
        } else {
            $data['text_agree'] = '';
        }

        if (isset($this->session->data['agree'])) {
            $data['agree'] = $this->session->data['agree'];
        } elseif ($this->config->get('tmdqc_checkout_default_checked')) {
            $data['agree'] = $this->config->get('tmdqc_checkout_default_checked');
        } else {
            $data['agree'] = '';
        }


        if ($this->config->get('tmdqc_payment_comment')) {
            $data['tmdqc_payment_comment'] = '';
        } else {
            $data['tmdqc_payment_comment'] = 'hide';
        }


        if ($this->config->get('tmdqc_payment_label')) {
            $data['tmdqc_payment_label'] = true;
        } else {
            $data['tmdqc_payment_label'] = false;
        }

        $this->response->setOutput($this->load->view('tmdqc/payment_method', $data));
    }

    public function save()
    {
        $this->load->language('tmdqc/tmdcheckout');

        $json = array();

        // Validate if payment address has been set.
        if (!isset($this->session->data['payment_address'])) {
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

        if (!isset($this->request->post['payment_method'])) {
            $json['error']['warning'] = $this->language->get('error_payment');
        } elseif (!isset($this->session->data['payment_methods'][$this->request->post['payment_method']])) {
            $json['error']['warning'] = $this->language->get('error_payment');
        }

        if ($this->config->get('tmdqc_checkout_id')) {
            $this->load->model('catalog/information');

            $information_info = $this->model_catalog_information->getInformation($this->config->get('tmdqc_checkout_id'));

            if ($information_info && !isset($this->request->post['agree'])) {
                $json['error']['warning'] = sprintf($this->language->get('error_agree'), $information_info['title']);
            }
        }

        if (!$json) {
            $this->session->data['payment_method'] = $this->session->data['payment_methods'][$this->request->post['payment_method']];

            $this->session->data['comment'] = strip_tags($this->request->post['comment']);

            if (isset($this->session->data['order_id'])) {
                $json['order_id'] = $this->session->data['order_id'];
            } else {
                $json['order_id'] = false;
            }
        }

        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($json));
    }
}
