<?php

class ModelBlogBlog extends Model
{

    public function getBlog($blog_id)
    {
        $query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "blog i LEFT JOIN " . DB_PREFIX . "blog_description id ON (i.blog_id = id.blog_id) LEFT JOIN " . DB_PREFIX . "blog_to_store i2s ON (i.blog_id = i2s.blog_id) WHERE i.blog_id = '" . (int)$blog_id . "' AND id.language_id = '" . (int)$this->config->get('config_language_id') . "' AND i2s.store_id = '" . (int)$this->config->get('config_store_id') . "' AND i.status = '1'");

        return $query->row;
    }

    public function getBlogs($data, $start = 0, $limit = 30)
    {
        $sql = "SELECT * FROM " . DB_PREFIX . "blog i LEFT JOIN " . DB_PREFIX . "blog_description id ON (i.blog_id = id.blog_id) LEFT JOIN " . DB_PREFIX . "blog_to_store i2s ON (i.blog_id = i2s.blog_id) WHERE id.language_id = '" . (int)$this->config->get('config_language_id') . "' AND i2s.store_id = '" . (int)$this->config->get('config_store_id') . "' AND i.status = '1' AND i.sort_order <> '-1'";

        if (!empty($data['filter_tag'])) {
            $parts = explode(",", $data['filter_tag']);

            if (count($parts) > 1) {
                $tags = array();

                foreach ($parts as $part) {
                    $tags[] = 'id.tags LIKE "%' . $this->db->escape($part) . '%"';

                }

                $sql .= ' AND  ' . implode(" OR ", $tags) . ' ';

            } else {
                $sql .= ' AND id.tags LIKE "%' . $this->db->escape($data['filter_tag']) . '%"';
            }
        }

        $sql .= " ORDER BY i.sort_order, i.blog_id DESC LIMIT " . (int)$start . "," . (int)$limit;

        $query = $this->db->query($sql);

        return $query->rows;
    }

    public function getTotalBlogs($data)
    {
        $sql = "SELECT COUNT(*) AS total FROM " . DB_PREFIX . "blog i LEFT JOIN " . DB_PREFIX . "blog_description id ON (i.blog_id = id.blog_id) LEFT JOIN " . DB_PREFIX . "blog_to_store i2s ON (i.blog_id = i2s.blog_id) WHERE id.language_id = '" . (int)$this->config->get('config_language_id') . "' AND i2s.store_id = '" . (int)$this->config->get('config_store_id') . "' AND i.status = '1' AND i.sort_order <> '-1'";

        if (!empty($data['filter_tag'])) {
            $parts = explode(",", $data['filter_tag']);

            if (count($parts) > 1) {
                $tags = array();

                foreach ($parts as $part) {
                    $tags[] = 'id.tags LIKE "%' . $this->db->escape($part) . '%"';

                }

                $sql .= ' AND  ' . implode(" OR ", $tags) . ' ';

            } else {
                $sql .= ' AND id.tags LIKE "%' . $this->db->escape($data['filter_tag']) . '%"';
            }
        }

        $query = $this->db->query($sql);

        return $query->row['total'];
    }

    public function getLatestBlogs($data = array())
    {
        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "blog_to_category j, " . DB_PREFIX . "blog i LEFT JOIN " . DB_PREFIX . "blog_description id ON (i.blog_id = id.blog_id) LEFT JOIN " . DB_PREFIX . "blog_to_store i2s ON (i.blog_id = i2s.blog_id) WHERE id.language_id = '" . (int)$this->config->get('config_language_id') . "' AND i2s.store_id = '" . (int)$this->config->get('config_store_id') . "' AND i.status = '1' AND i.sort_order <> '-1' AND j.blog_category_id=" . $data['cat_id'] . " AND i.blog_id=j.blog_id ORDER BY i.sort_order, i.blog_id DESC LIMIT " . (int)$data['start'] . "," . (int)$data['limit'] . "");
        return $query->rows;
    }

    public function getBlogCat($id)
    {
        $query = $this->db->query("SELECT i.blog_category_id FROM " . DB_PREFIX . "blog_to_category i WHERE i.blog_id=" . $id);

        return $query->row['blog_category_id'];
    }

    public function getBlogsByBlogCategoryId($blog_category_id, $start = 0, $limit = 40)
    {
        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "blog n LEFT JOIN " . DB_PREFIX . "blog_description nd ON (n.blog_id = nd.blog_id) LEFT JOIN " . DB_PREFIX . "blog_to_store n2s ON (n.blog_id = n2s.blog_id) LEFT JOIN " . DB_PREFIX . "blog_to_category n2c ON (n.blog_id = n2c.blog_id) WHERE nd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND n2s.store_id = '" . (int)$this->config->get('config_store_id') . "' AND n2c.blog_category_id = '" . (int)$blog_category_id . "' AND n.status = '1' AND n.sort_order <> '-1' ORDER BY n.sort_order, n.blog_id DESC LIMIT " . (int)$start . "," . (int)$limit);

        return $query->rows;
    }

    public function getTotalBlogsByBlogCategoryId($blog_category_id = 0)
    {
        $query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "blog WHERE status = '1'");
        $query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "blog_to_category n2c LEFT JOIN " . DB_PREFIX . "blog n ON (n2c.blog_id = n.blog_id) LEFT JOIN " . DB_PREFIX . "blog_to_store n2s ON (n.blog_id = n2s.blog_id) WHERE n.status = '1' AND n2s.store_id = '" . (int)$this->config->get('config_store_id') . "' AND n2c.blog_category_id = '" . (int)$blog_category_id . "'");

        return $query->row['total'];
    }

    public function getTotalBlogsPerCategory($data = array())
    {
        $sql = "SELECT COUNT(*) AS total FROM " . DB_PREFIX . "blog n LEFT JOIN " . DB_PREFIX . "blog_to_store n2s ON (n.blog_id = n2s.blog_id) WHERE n.status = '1' AND n2s.store_id = '" . (int)$this->config->get('config_store_id') . "'";

        if (isset($data['filter_blog_category_id']) && $data['filter_blog_category_id']) {
            if (isset($data['filter_sub_blog_category']) && $data['filter_sub_blog_category']) {
                $implode_data = array();

                $this->load->model('blog/blog_category');

                $blog_categories = $this->model_blog_blog_category->getBlogCategoriesByParentId($data['filter_blog_category_id']);

                foreach ($blog_categories as $blog_category_id) {
                    $implode_data[] = "n2c.blog_category_id = '" . (int)$blog_category_id . "'";
                }

                $sql .= " AND n.blog_id IN (SELECT n2c.blog_id FROM " . DB_PREFIX . "blog_to_category n2c WHERE " . implode(' OR ', $implode_data) . ")";
            } else {
                $sql .= " AND n.blog_id IN (SELECT n2c.blog_id FROM " . DB_PREFIX . "blog_to_category n2c WHERE n2c.blog_category_id = '" . (int)$data['filter_blog_category_id'] . "')";
            }
        }

        $query = $this->db->query($sql);

        return $query->row['total'];
    }

    public function updateBlogReadCounter($blog_id, $new_read_counter_value)
    {
        $this->db->query("UPDATE " . DB_PREFIX . "blog SET count_read = '" . (int)$new_read_counter_value . "' WHERE blog_id = '" . (int)$blog_id . "'");
    }

    public function getRelatedBlog($blog_id)
    {
        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "blog n LEFT JOIN " . DB_PREFIX . "blog_description nd ON (n.blog_id = nd.blog_id) LEFT JOIN " . DB_PREFIX . "blog_to_store n2s ON (n.blog_id = n2s.blog_id) LEFT JOIN " . DB_PREFIX . "blog_related nr ON (n.blog_id = nr.child_blog_id) WHERE nd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND n2s.store_id = '" . (int)$this->config->get('config_store_id') . "' AND n.status = '1' AND n.sort_order <> '-1' AND nr.parent_blog_id = '" . (int)$blog_id . "' ORDER BY n.sort_order, n.blog_id DESC");
        return $query->rows;
    }

    public function getProductRelated($blog_id)
    {
        $this->load->model('catalog/product');

        $product_data = array();

        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "blog_related_products pr LEFT JOIN " . DB_PREFIX . "product p ON (pr.related_id = p.product_id) LEFT JOIN " . DB_PREFIX . "product_to_store p2s ON (p.product_id = p2s.product_id) WHERE pr.blog_id = '" . (int)$blog_id . "' AND p.status = '1' AND p.date_available <= NOW() AND p2s.store_id = '" . (int)$this->config->get('config_store_id') . "'");

        foreach ($query->rows as $result) {
            $product_data[$result['related_id']] = $this->model_catalog_product->getProduct($result['related_id']);
        }
        return $product_data;
    }


    public function addComment($blog_id, $data)
    {

        if ($this->config->get('blogsetting_comment_approve')) {
            $comment_status = '0';
        } else {
            $comment_status = '1';
        }

        $this->event->trigger('pre.comment.add', $data);

        $this->db->query("INSERT INTO " . DB_PREFIX . "blog_comment SET 
		name = '" . $this->db->escape($data['name']) . "', 
		email = '" . $this->db->escape($data['email']) . "', 
		blog_id = '" . (int)$blog_id . "', 
		comment = '" . $this->db->escape($data['comment']) . "', 
		status = '" . $comment_status . "',
		date_added = NOW()");

        $blog_comment_id = $this->db->getLastId();

        //$this->event->trigger('post.comment.add', $blog_comment_id);
    }


    public function getCommentsByBlogId($blog_id, $start = 0, $limit = 40)
    {
        $query = $this->db->query("SELECT nc.name, nc.email, nc.comment, nc.date_added FROM " . DB_PREFIX . "blog_comment nc LEFT JOIN " . DB_PREFIX . "blog n ON (nc.blog_id = n.blog_id) LEFT JOIN " . DB_PREFIX . "blog_description nd ON (n.blog_id = nd.blog_id) WHERE n.blog_id = '" . (int)$blog_id . "' AND n.status = '1' AND nc.status = '1' AND nd.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY nc.date_added DESC LIMIT " . (int)$start . "," . (int)$limit);

        return $query->rows;
    }

    public function getTotalCommentsByBlogId($blog_id)
    {
        $query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "blog_comment nc LEFT JOIN " . DB_PREFIX . "blog n ON (nc.blog_id = n.blog_id) LEFT JOIN " . DB_PREFIX . "blog_description nd ON (n.blog_id = nd.blog_id) WHERE n.blog_id = '" . (int)$blog_id . "' AND n.status = '1' AND nc.status = '1' AND nd.language_id = '" . (int)$this->config->get('config_language_id') . "'");

        return $query->row['total'];
    }


    public function getBlogLayoutId($blog_id)
    {
        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "blog_to_layout WHERE blog_id = '" . (int)$blog_id . "' AND store_id = '" . (int)$this->config->get('config_store_id') . "'");

        if ($query->num_rows) {
            return $query->row['layout_id'];
        } else {
            return 0;
        }
    }


}