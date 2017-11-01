<?php

class ControllerTmdqcTmdcart extends Controller
{

    public function index()
    {
        $this->load->language('tmdqc/tmdcart');

        $heading_title = $this->language->get('heading_title');
        if ($this->config->get('tmdqc_title')) {
            $tmdqc_title = $this->config->get('tmdqc_title');
            $heading_title = (!empty($tmdqc_title['cart_title'][$this->config->get('config_language_id')])) ? $tmdqc_title['cart_title'][$this->config->get('config_language_id')] : $this->language->get('heading_title');
        }

        if ($this->cart->hasProducts() || !empty($this->session->data['vouchers'])) {
            $data['heading_title'] = $heading_title;

            $data['text_recurring_item'] = $this->language->get('text_recurring_item');
            $data['text_next'] = $this->language->get('text_next');
            $data['text_next_choice'] = $this->language->get('text_next_choice');

            $data['column_image'] = $this->language->get('column_image');
            $data['column_name'] = $this->language->get('column_name');
            $data['column_model'] = $this->language->get('column_model');
            $data['column_quantity'] = $this->language->get('column_quantity');
            $data['column_price'] = $this->language->get('column_price');
            $data['column_total'] = $this->language->get('column_total');
            $data['column_upc'] = $this->language->get('column_upc');
            $data['column_ean'] = $this->language->get('column_ean');
            $data['column_isbn'] = $this->language->get('column_isbn');

            $data['button_update'] = $this->language->get('button_update');
            $data['button_remove'] = $this->language->get('button_remove');
            $data['button_shopping'] = $this->language->get('button_shopping');
            $data['button_checkout'] = $this->language->get('button_checkout');
            $data['button_coupon'] = $this->language->get('button_coupon');
            $data['button_voucher'] = $this->language->get('button_voucher');
            $data['button_reward'] = $this->language->get('button_reward');

            $data['text_loading'] = $this->language->get('text_loading');
            $data['text_vochersuccess'] = $this->language->get('text_vochersuccess');
            $data['text_rewardsuccess'] = $this->language->get('text_rewardsuccess');

            $data['entry_coupon'] = $this->language->get('entry_coupon');
            $data['entry_voucher'] = $this->language->get('entry_voucher');


            if (!$this->cart->hasStock() && (!$this->config->get('config_stock_checkout') || $this->config->get('config_stock_warning'))) {
                $data['error_warning'] = $this->language->get('error_stock');
            } elseif (isset($this->session->data['error'])) {
                $data['error_warning'] = $this->session->data['error'];
                unset($this->session->data['error']);
            } else {
                $data['error_warning'] = '';
            }

            if ($this->config->get('config_customer_price') && !$this->customer->isLogged()) {
                $data['attention'] = sprintf($this->language->get('text_login'), $this->url->link('account/login'), $this->url->link('account/register'));
            } else {
                $data['attention'] = '';
            }

            if (isset($this->session->data['success'])) {
                $data['success'] = $this->session->data['success'];
                unset($this->session->data['success']);
            } else {
                $data['success'] = '';
            }

            $data['action'] = $this->url->link('tmdqc/tmdcheckout/edit', '', true);

            if ($this->config->get('config_cart_weight')) {
                $data['weight'] = $this->weight->format($this->cart->getWeight(), $this->config->get('config_weight_class_id'), $this->language->get('decimal_point'), $this->language->get('thousand_point'));
            } else {
                $data['weight'] = '';
            }

            $this->load->model('tool/image');
            $this->load->model('tool/upload');
            $this->load->model('catalog/product');

            $data['products'] = array();

            $products = $this->cart->getProducts();

            foreach ($products as $product) {
                $product_info = $this->model_catalog_product->getProduct($product['product_id']);

                $product_total = 0;

                foreach ($products as $product_2) {
                    if ($product_2['product_id'] == $product['product_id']) {
                        $product_total += $product_2['quantity'];
                    }
                }

                if ($product['minimum'] > $product_total) {
                    $data['error_warning'] = sprintf($this->language->get('error_minimum'), $product['name'], $product['minimum']);
                }

                if ($product['image']) {
                    $image = $this->model_tool_image->resize($product['image'], $this->config->get($this->config->get('config_theme') . '_image_cart_width'), $this->config->get($this->config->get('config_theme') . '_image_cart_height'));
                } else {
                    $image = '';
                }

                $option_data = array();

                foreach ($product['option'] as $option) {
                    if ($option['type'] != 'file') {
                        $value = $option['value'];
                    } else {
                        $upload_info = $this->model_tool_upload->getUploadByCode($option['value']);

                        if ($upload_info) {
                            $value = $upload_info['name'];
                        } else {
                            $value = '';
                        }
                    }

                    $option_data[] = array(
                        'name' => $option['name'],
                        'value' => (utf8_strlen($value) > 20 ? utf8_substr($value, 0, 20) . '..' : $value)
                    );
                }

                // Display prices
                if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
                    $price = $this->currency->format($this->tax->calculate($product['price'], $product['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
                } else {
                    $price = false;
                }

                // Display prices
                if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
                    $total = $this->currency->format($this->tax->calculate($product['price'], $product['tax_class_id'], $this->config->get('config_tax')) * $product['quantity'], $this->session->data['currency']);
                } else {
                    $total = false;
                }

                $recurring = '';

                if ($product['recurring']) {
                    $frequencies = array(
                        'day' => $this->language->get('text_day'),
                        'week' => $this->language->get('text_week'),
                        'semi_month' => $this->language->get('text_semi_month'),
                        'month' => $this->language->get('text_month'),
                        'year' => $this->language->get('text_year'),
                    );

                    if ($product['recurring']['trial']) {
                        $recurring = sprintf($this->language->get('text_trial_description'), $this->currency->format($this->tax->calculate($product['recurring']['trial_price'] * $product['quantity'], $product['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']), $product['recurring']['trial_cycle'], $frequencies[$product['recurring']['trial_frequency']], $product['recurring']['trial_duration']) . ' ';
                    }

                    if ($product['recurring']['duration']) {
                        $recurring .= sprintf($this->language->get('text_payment_description'), $this->currency->format($this->tax->calculate($product['recurring']['price'] * $product['quantity'], $product['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']), $product['recurring']['cycle'], $frequencies[$product['recurring']['frequency']], $product['recurring']['duration']);
                    } else {
                        $recurring .= sprintf($this->language->get('text_payment_cancel'), $this->currency->format($this->tax->calculate($product['recurring']['price'] * $product['quantity'], $product['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']), $product['recurring']['cycle'], $frequencies[$product['recurring']['frequency']], $product['recurring']['duration']);
                    }
                }

                $data['products'][] = array(
                    'cart_id' => $product['cart_id'],
                    'thumb' => $image,
                    'name' => $product['name'],
                    'upc' => $product_info['upc'],
                    'ean' => $product_info['ean'],
                    'isbn' => $product_info['isbn'],
                    'model' => $product['model'],
                    'option' => $option_data,
                    'recurring' => $recurring,
                    'quantity' => $product['quantity'],
                    'stock' => $product['stock'] ? true : !(!$this->config->get('config_stock_checkout') || $this->config->get('config_stock_warning')),
                    'reward' => ($product['reward'] ? sprintf($this->language->get('text_points'), $product['reward']) : ''),
                    'price' => $price,
                    'total' => $total,
                    'href' => $this->url->link('product/product', 'product_id=' . $product['product_id'])
                );
            }

            // Gift Voucher
            $data['vouchers'] = array();

            if (!empty($this->session->data['vouchers'])) {
                foreach ($this->session->data['vouchers'] as $key => $voucher) {
                    $data['vouchers'][] = array(
                        'key' => $key,
                        'description' => $voucher['description'],
                        'amount' => $this->currency->format($voucher['amount'], $this->session->data['currency']),
                        'remove' => $this->url->link('tmdqc/tmdcheckout', 'remove=' . $key)
                    );
                }
            }

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
                        $this->load->model('extension/total/' . $result['code']);

                        // We have to put the totals in an array so that they pass by reference.
                        $this->{'model_extension_total_' . $result['code']}->getTotal($total_data);
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

            $data['continue'] = $this->url->link('common/home');

            $data['checkout'] = $this->url->link('checkout/checkout', '', 'SSL');

            $this->load->model('extension/extension');

            $data['checkout_buttons'] = array();

            //Coupan
            if (isset($this->session->data['coupon'])) {
                $data['coupon'] = $this->session->data['coupon'];
            } else {
                $data['coupon'] = '';
            }

            //vocher
            if (isset($this->session->data['voucher'])) {
                $data['voucher'] = $this->session->data['voucher'];
            } else {
                $data['voucher'] = '';
            }

            ///Reward
            $points = $this->customer->getRewardPoints();

            $points_total = 0;

            foreach ($this->cart->getProducts() as $product) {
                if ($product['points']) {
                    $points_total += $product['points'];
                }
            }

            $data['permission_reward'] = false;
            if ($points && $points_total && $this->config->get('tmdqc_cart_reward_status')) {
                $data['permission_reward'] = true;
            }

            if (isset($this->session->data['reward'])) {
                $data['reward'] = $this->session->data['reward'];
            } else {
                $data['reward'] = '';
            }


            ///Setting Cart
            $data['tmdqc_cart_isbn_status'] = $this->config->get('tmdqc_cart_isbn_status');
            $data['tmdqc_cart_upc_status'] = $this->config->get('tmdqc_cart_upc_status');
            $data['tmdqc_cart_qty_status'] = $this->config->get('tmdqc_cart_qty_status');
            $data['tmdqc_cart_name_status'] = $this->config->get('tmdqc_cart_name_status');
            $data['tmdqc_cart_model_status'] = $this->config->get('tmdqc_cart_model_status');
            $data['tmdqc_cart_ean_status'] = $this->config->get('tmdqc_cart_ean_status');
            $data['tmdqc_cart_image_status'] = $this->config->get('tmdqc_cart_image_status');
            $data['tmdqc_cart_unitprice_status'] = $this->config->get('tmdqc_cart_unitprice_status');
            $data['tmdqc_cart_total_status'] = $this->config->get('tmdqc_cart_total_status');
            $data['tmdqc_cart_coupan_status'] = $this->config->get('tmdqc_cart_coupan_status');
            $data['tmdqc_cart_gift_status'] = $this->config->get('tmdqc_cart_gift_status');
            $data['tmdqc_cart_reward_status'] = $this->config->get('tmdqc_cart_reward_status');


            $data['entry_reward'] = sprintf($this->language->get('entry_reward'), $points_total);
            $data['column_left'] = $this->load->controller('common/column_left');
            $data['column_right'] = $this->load->controller('common/column_right');
            $data['content_top'] = $this->load->controller('common/content_top');
            $data['content_bottom'] = $this->load->controller('common/content_bottom');
            $data['footer'] = $this->load->controller('common/footer');
            $data['header'] = $this->load->controller('common/header');

            $colspn = 1;
            if ($this->config->get('tmdqc_cart_image_status')) {
                $colspn += 1;
            }

            if ($this->config->get('tmdqc_cart_name_status')) {
                $colspn += 1;
            }
            if ($this->config->get('tmdqc_cart_model_status')) {
                $colspn += 1;
            }
            if ($this->config->get('tmdqc_cart_upc_status')) {
                $colspn += 1;
            }
            if ($this->config->get('tmdqc_cart_ean_status')) {
                $colspn += 1;
            }
            if ($this->config->get('tmdqc_cart_isbn_status')) {
                $colspn += 1;
            }
            if ($this->config->get('tmdqc_cart_qty_status')) {
                $colspn += 1;
            }
            if ($this->config->get('tmdqc_cart_unitprice_status')) {
                $colspn += 1;
            }
            $data['colspn'] = $colspn;

            $this->response->setOutput($this->load->view('tmdqc/tmdcart', $data));

        }
    }

    public function add()
    {
        $this->load->language('checkout/cart');

        $json = array();

        if (isset($this->request->post['product_id'])) {
            $product_id = (int)$this->request->post['product_id'];
        } else {
            $product_id = 0;
        }

        $this->load->model('catalog/product');

        $product_info = $this->model_catalog_product->getProduct($product_id);

        if ($product_info) {
            if (isset($this->request->post['quantity']) && ((int)$this->request->post['quantity'] >= $product_info['minimum'])) {
                $quantity = (int)$this->request->post['quantity'];
            } else {
                $quantity = $product_info['minimum'] ? $product_info['minimum'] : 1;
            }

            if (isset($this->request->post['option'])) {
                $option = array_filter($this->request->post['option']);
            } else {
                $option = array();
            }

            $product_options = $this->model_catalog_product->getProductOptions($this->request->post['product_id']);

            foreach ($product_options as $product_option) {
                if ($product_option['required'] && empty($option[$product_option['product_option_id']])) {
                    $json['error']['option'][$product_option['product_option_id']] = sprintf($this->language->get('error_required'), $product_option['name']);
                }
            }

            if (isset($this->request->post['recurring_id'])) {
                $recurring_id = $this->request->post['recurring_id'];
            } else {
                $recurring_id = 0;
            }

            $recurrings = $this->model_catalog_product->getProfiles($product_info['product_id']);

            if ($recurrings) {
                $recurring_ids = array();

                foreach ($recurrings as $recurring) {
                    $recurring_ids[] = $recurring['recurring_id'];
                }

                if (!in_array($recurring_id, $recurring_ids)) {
                    $json['error']['recurring'] = $this->language->get('error_recurring_required');
                }
            }

            if (!$json) {
                $this->cart->add($this->request->post['product_id'], $quantity, $option, $recurring_id);

                $json['success'] = sprintf($this->language->get('text_success'), $this->url->link('product/product', 'product_id=' . $this->request->post['product_id']), $product_info['name'], $this->url->link('checkout/cart'));

                unset($this->session->data['shipping_method']);
                unset($this->session->data['shipping_methods']);
                unset($this->session->data['payment_method']);
                unset($this->session->data['payment_methods']);

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
                            $this->load->model('extension/total/' . $result['code']);

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

                $json['total'] = sprintf($this->language->get('text_items'), $this->cart->countProducts() + (isset($this->session->data['vouchers']) ? count($this->session->data['vouchers']) : 0), $this->currency->format($total, $this->session->data['currency']));
            } else {
                $json['redirect'] = str_replace('&amp;', '&', $this->url->link('product/product', 'product_id=' . $this->request->post['product_id']));
            }
        }

        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($json));
    }


}
