CREATE TABLE IF NOT EXISTS `oc_easy_blog_article` (
			    `article_id` INT(11) NOT NULL AUTO_INCREMENT,
	            `sort_order` INT(11) NOT NULL DEFAULT '0',
	            `status` TINYINT(1) NOT NULL DEFAULT '0',
	            `date_modified` DATETIME NOT NULL,
              `viewed` INT(5) NOT NULL DEFAULT '0',
	        PRIMARY KEY (`article_id`)
	) DEFAULT COLLATE=utf8_general_ci;
CREATE TABLE IF NOT EXISTS `oc_easy_blog_article_description` (
			    `article_id` INT(11) NOT NULL,
                `language_id` INT(11) NOT NULL,
                `name` VARCHAR(255) NOT NULL,
                `description` TEXT NOT NULL,
                `intro_text` TEXT NOT NULL,
                `meta_title` VARCHAR(255) NOT NULL,
                `meta_description` VARCHAR(255) NOT NULL,
                `meta_keyword` VARCHAR(255) NOT NULL,
                `author` VARCHAR(255) NOT NULL,
                `tag` TEXT,
            PRIMARY KEY (`article_id`, `language_id`),
	        INDEX `name` (`name`)
	) DEFAULT COLLATE=utf8_general_ci;