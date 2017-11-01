<?php

class ControllerDesignHyperPositions extends Controller
{

    private $_text_string = array(

        'hp_name_titles',
        'hp_name',
        'width_title',
        'text_pos_left_center',
        'text_pos_center',
        'text_pos_right_center',
        // TOP
        'text_pos_sliders',
        'text_top_pos',
        'text_content_pos',
        // FOOTER
        'text_footer_pos',
        'text_map_pos',
    );


    public function index()
    {

        $this->load->language('design/hyper_positions');

        foreach ($this->_text_string as $text) {
            $data[$text] = $this->language->get($text);
        }

        return $data;

    }

    public function validate($full_width = array())
    {

        $full_width['width'] = (int)$full_width['width'];

        return $full_width;
    }

}
