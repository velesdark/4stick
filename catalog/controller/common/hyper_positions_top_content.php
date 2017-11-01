<?php

class ControllerCommonHyperPositionsTopContent extends Controller
{

    public function index()
    {
        $this->load->model('design/layout');

        if (isset($this->request->get['route'])) {
            $route = (string)$this->request->get['route'];
        } else {
            $route = 'common/home';
        }

        $layout_id = 0;

        if ($route == 'product/category' && isset($this->request->get['path'])) {
            $this->load->model('catalog/category');

            $path = explode('_', (string)$this->request->get['path']);

            $layout_id = $this->model_catalog_category->getCategoryLayoutId(end($path));
        }

        if ($route == 'product/product' && isset($this->request->get['product_id'])) {
            $this->load->model('catalog/product');

            $layout_id = $this->model_catalog_product->getProductLayoutId($this->request->get['product_id']);
        }

        if ($route == 'information/information' && isset($this->request->get['information_id'])) {
            $this->load->model('catalog/information');

            $layout_id = $this->model_catalog_information->getInformationLayoutId($this->request->get['information_id']);
        }

        if (!$layout_id) {
            $layout_id = $this->model_design_layout->getLayout($route);
        }

        if (!$layout_id) {
            $layout_id = $this->config->get('config_layout_id');
        }


        $this->load->model('extension/module');

        for ($i = 5; $i < 6; $i++) {

            $data['modules' . $i] = array();

            $modules = array();

            switch ($i) {
                case 5:// SLIDER - 1 blocks
                    $modules = $this->model_design_layout->getLayoutModules($layout_id, 'pos_sliders');
                    break;
            }

            foreach ($modules as $module) {
                $part = explode('.', $module['code']);

                if (isset($part[0]) && $this->config->get($part[0] . '_status')) {
                    $module_data = $this->load->controller('extension/module/' . $part[0]);

                    if ($module_data) {
                        $data['modules' . $i][] = $module_data;
                    }
                }

                if (isset($part[1])) {
                    $setting_info = $this->model_extension_module->getModule($part[1]);

                    if ($setting_info && $setting_info['status']) {
                        $output = $this->load->controller('extension/module/' . $part[0], $setting_info);

                        if ($output) {
                            $data['modules' . $i][] = $output;
                        }
                    }
                }
            }
        }

        return $this->load->view('common/hyper_positions_top_content', $data);
    }
}

