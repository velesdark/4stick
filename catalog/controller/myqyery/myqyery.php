<?php

class ControllerMyqyeryMyqyery extends Controller
{
    public function updateSubtract()
    {
        $price = $_GET['price'];
        $w = $_GET['w'];
        $h = $_GET['h'];
        $id = $_GET['id'];
        $json = array();
        $json['price'] = $price;
        /*if (!$this->user->hasPermission('modify', 'catalog/product')) {
            $json['warning'] = $this->language->get('error_permission');
        }*/
        //$res=$this->db->query("SELECT * FROM " . DB_PREFIX . "`product`");
        /*$json['success'] = (int)$this->db->countAffected();
        $this->response->addHeader('Content-Type: application/json');*/
        //`nak_product_option_value` WHERE `product_id`=69 AND `option_id`=16 AND `option_value_id`=93
        //$json['res']=$this->db->query("SELECT * FROM `" . DB_PREFIX . "product`");
        $this->response->addHeader('Content-Type: application/json');
        $json['res'] = $this->db->query("UPDATE `" . DB_PREFIX . "product_option_value` SET `price`=" . round($price) . " WHERE `product_id`=" . $id . " AND `option_id`=16 AND `option_value_id`=93");
        $this->response->setOutput(json_encode($json));
    }
}