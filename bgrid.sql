
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `wp474`
--

-- --------------------------------------------------------

--
-- Table structure for table `[[dbprefix]]commentmeta`
--

CREATE TABLE `[[dbprefix]]commentmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE [[collate]] DEFAULT NULL,
  `meta_value` longtext COLLATE [[collate]],
  PRIMARY KEY (`meta_id`),
  KEY `comment_id` (`comment_id`),
  KEY `meta_key` (`meta_key`(191))
) DEFAULT CHARSET=[[utf8]] COLLATE=[[collate]] AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `[[dbprefix]]comments`
--

CREATE TABLE `[[dbprefix]]comments` (
  `comment_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_post_ID` bigint(20) unsigned NOT NULL DEFAULT '0',
  `comment_author` tinytext COLLATE [[collate]] NOT NULL,
  `comment_author_email` varchar(100) COLLATE [[collate]] NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) COLLATE [[collate]] NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) COLLATE [[collate]] NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text COLLATE [[collate]] NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) COLLATE [[collate]] NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) COLLATE [[collate]] NOT NULL DEFAULT '',
  `comment_type` varchar(20) COLLATE [[collate]] NOT NULL DEFAULT '',
  `comment_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_ID`),
  KEY `comment_post_ID` (`comment_post_ID`),
  KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  KEY `comment_date_gmt` (`comment_date_gmt`),
  KEY `comment_parent` (`comment_parent`),
  KEY `comment_author_email` (`comment_author_email`(10))
)  DEFAULT CHARSET=[[utf8]] COLLATE=[[collate]] AUTO_INCREMENT=2 ;

--
-- Dumping data for table `[[dbprefix]]comments`
--

INSERT INTO `[[dbprefix]]comments` VALUES
(1, 1, 'A WordPress Commenter', 'wapuu@wordpress.example', 'https://wordpress.org/', '', '[[date_gmt]]', '[[date_gmt]]', 'Hi, this is a comment.\nTo get started with moderating, editing, and deleting comments, please visit the Comments screen in the dashboard.\nCommenter avatars come from <a href="https://gravatar.com">Gravatar</a>.', 0, '1', '', '', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `[[dbprefix]]links`
--

CREATE TABLE `[[dbprefix]]links` (
  `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) COLLATE [[collate]] NOT NULL DEFAULT '',
  `link_name` varchar(255) COLLATE [[collate]] NOT NULL DEFAULT '',
  `link_image` varchar(255) COLLATE [[collate]] NOT NULL DEFAULT '',
  `link_target` varchar(25) COLLATE [[collate]] NOT NULL DEFAULT '',
  `link_description` varchar(255) COLLATE [[collate]] NOT NULL DEFAULT '',
  `link_visible` varchar(20) COLLATE [[collate]] NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) unsigned NOT NULL DEFAULT '1',
  `link_rating` int(11) NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) COLLATE [[collate]] NOT NULL DEFAULT '',
  `link_notes` mediumtext COLLATE [[collate]] NOT NULL,
  `link_rss` varchar(255) COLLATE [[collate]] NOT NULL DEFAULT '',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_visible`)
) DEFAULT CHARSET=[[utf8]] COLLATE=[[collate]] AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `[[dbprefix]]options`
--

CREATE TABLE `[[dbprefix]]options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(191) COLLATE [[collate]] NOT NULL DEFAULT '',
  `option_value` longtext COLLATE [[collate]] NOT NULL,
  `autoload` varchar(20) COLLATE [[collate]] NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`)
)  DEFAULT CHARSET=[[utf8]] COLLATE=[[collate]] AUTO_INCREMENT=105 ;

--
-- Dumping data for table `[[dbprefix]]options`
--

INSERT INTO `[[dbprefix]]options` VALUES
(1, 'siteurl', '[[softurl]]', 'yes'),
(2, 'home', '[[softurl]]', 'yes'),
(3, 'blogname', '[[site_name]]', 'yes'),
(4, 'blogdescription', '[[site_desc]]', 'yes'),
(5, 'users_can_register', '0', 'yes'),
(6, 'admin_email', '[[admin_email]]', 'yes'),
(7, 'start_of_week', '1', 'yes'),
(8, 'use_balanceTags', '0', 'yes'),
(9, 'use_smilies', '1', 'yes'),
(10, 'require_name_email', '1', 'yes'),
(11, 'comments_notify', '1', 'yes'),
(12, 'posts_per_rss', '10', 'yes'),
(13, 'rss_use_excerpt', '0', 'yes'),
(14, 'mailserver_url', 'mail.example.com', 'yes'),
(15, 'mailserver_login', 'login@example.com', 'yes'),
(16, 'mailserver_pass', 'password', 'yes'),
(17, 'mailserver_port', '110', 'yes'),
(18, 'default_category', '1', 'yes'),
(19, 'default_comment_status', 'open', 'yes'),
(20, 'default_ping_status', 'open', 'yes'),
(21, 'default_pingback_flag', '1', 'yes'),
(22, 'posts_per_page', '10', 'yes'),
(23, 'date_format', 'F j, Y', 'yes'),
(24, 'time_format', 'g:i a', 'yes'),
(25, 'links_updated_date_format', 'F j, Y g:i a', 'yes'),
(26, 'comment_moderation', '0', 'yes'),
(27, 'moderation_notify', '1', 'yes'),
(28, 'permalink_structure', '[[permalink_structure]]', 'yes'),
(29, 'rewrite_rules', '', 'yes'),
(30, 'hack_file', '0', 'yes'),
(31, 'blog_charset', 'UTF-8', 'yes'),
(32, 'moderation_keys', '', 'no'),
(33, 'active_plugins','a:2:{i:0;s:35:\"boldgrid-editor/boldgrid-editor.php\";i:1;s:47:\"boldgrid-inspirations/boldgrid-inspirations.php\";}','yes'),
(34, 'category_base', '', 'yes'),
(35, 'ping_sites', 'http://rpc.pingomatic.com/', 'yes'),
(36, 'comment_max_links', '2', 'yes'),
(37, 'gmt_offset', '0', 'yes'),
(38, 'default_email_category', '1', 'yes'),
(39, 'recently_edited', '', 'no'),
(40, 'template', 'boldgrid-gridone', 'yes'),
(41, 'stylesheet', 'boldgrid-gridone', 'yes'),
(42, 'comment_whitelist', '1', 'yes'),
(43, 'blacklist_keys', '', 'no'),
(44, 'comment_registration', '0', 'yes'),
(45, 'html_type', 'text/html', 'yes'),
(46, 'use_trackback', '0', 'yes'),
(47, 'default_role', 'subscriber', 'yes'),
(48, 'db_version', '38590', 'yes'),
(49, 'uploads_use_yearmonth_folders', '1', 'yes'),
(50, 'upload_path', '', 'yes'),
(51, 'blog_public', '1', 'yes'),
(52, 'default_link_category', '2', 'yes'),
(53, 'show_on_front', 'page', 'yes'),
(54, 'tag_base', '', 'yes'),
(55, 'show_avatars', '1', 'yes'),
(56, 'avatar_rating', 'G', 'yes'),
(57, 'upload_url_path', '', 'yes'),
(58, 'thumbnail_size_w', '150', 'yes'),
(59, 'thumbnail_size_h', '150', 'yes'),
(60, 'thumbnail_crop', '1', 'yes'),
(61, 'medium_size_w', '300', 'yes'),
(62, 'medium_size_h', '300', 'yes'),
(63, 'avatar_default', 'mystery', 'yes'),
(64, 'large_size_w', '1024', 'yes'),
(65, 'large_size_h', '1024', 'yes'),
(66, 'image_default_link_type', 'none', 'yes'),
(67, 'image_default_size', '', 'yes'),
(68, 'image_default_align', '', 'yes'),
(69, 'close_comments_for_old_posts', '0', 'yes'),
(70, 'close_comments_days_old', '14', 'yes'),
(71, 'thread_comments', '1', 'yes'),
(72, 'thread_comments_depth', '5', 'yes'),
(73, 'page_comments', '0', 'yes'),
(74, 'comments_per_page', '50', 'yes'),
(75, 'default_comments_page', 'newest', 'yes'),
(76, 'comment_order', 'asc', 'yes'),
(77, 'sticky_posts', 'a:0:{}', 'yes'),
(78, 'widget_categories', 'a:2:{i:2;a:4:{s:5:"title";s:0:"";s:5:"count";i:0;s:12:"hierarchical";i:0;s:8:"dropdown";i:0;}s:12:"_multiwidget";i:1;}', 'yes'),
(79, 'widget_text', 'a:0:{}', 'yes'),
(80, 'widget_rss', 'a:0:{}', 'yes'),
(81, 'uninstall_plugins', 'a:0:{}', 'no'),
(82, 'timezone_string', '', 'yes'),
(83, 'page_for_posts', '0', 'yes'),
(84, 'page_on_front', '5', 'yes'),
(85, 'default_post_format', '0', 'yes'),
(86, 'link_manager_enabled', '0', 'yes'),
(87, 'finished_splitting_shared_terms', '1', 'yes'),
(88, 'site_icon', '0', 'yes'),
(89, 'medium_large_size_w', '768', 'yes'),
(90, 'medium_large_size_h', '0', 'yes'),
(91, 'initial_db_version', '38590', 'yes'),
(92, '[[dbprefix]]user_roles', 'a:5:{s:13:"administrator";a:2:{s:4:"name";s:13:"Administrator";s:12:"capabilities";a:61:{s:13:"switch_themes";b:1;s:11:"edit_themes";b:1;s:16:"activate_plugins";b:1;s:12:"edit_plugins";b:1;s:10:"edit_users";b:1;s:10:"edit_files";b:1;s:14:"manage_options";b:1;s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:6:"import";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:8:"level_10";b:1;s:7:"level_9";b:1;s:7:"level_8";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;s:12:"delete_users";b:1;s:12:"create_users";b:1;s:17:"unfiltered_upload";b:1;s:14:"edit_dashboard";b:1;s:14:"update_plugins";b:1;s:14:"delete_plugins";b:1;s:15:"install_plugins";b:1;s:13:"update_themes";b:1;s:14:"install_themes";b:1;s:11:"update_core";b:1;s:10:"list_users";b:1;s:12:"remove_users";b:1;s:13:"promote_users";b:1;s:18:"edit_theme_options";b:1;s:13:"delete_themes";b:1;s:6:"export";b:1;}}s:6:"editor";a:2:{s:4:"name";s:6:"Editor";s:12:"capabilities";a:34:{s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;}}s:6:"author";a:2:{s:4:"name";s:6:"Author";s:12:"capabilities";a:10:{s:12:"upload_files";b:1;s:10:"edit_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:4:"read";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;s:22:"delete_published_posts";b:1;}}s:11:"contributor";a:2:{s:4:"name";s:11:"Contributor";s:12:"capabilities";a:5:{s:10:"edit_posts";b:1;s:4:"read";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;}}s:10:"subscriber";a:2:{s:4:"name";s:10:"Subscriber";s:12:"capabilities";a:2:{s:4:"read";b:1;s:7:"level_0";b:1;}}}', 'yes'),
(93, 'fresh_site', '1', 'yes'),
(94, 'widget_search', 'a:2:{i:2;a:1:{s:5:"title";s:0:"";}s:12:"_multiwidget";i:1;}', 'yes'),
(95, 'widget_recent-posts', 'a:2:{i:2;a:2:{s:5:"title";s:0:"";s:6:"number";i:5;}s:12:"_multiwidget";i:1;}', 'yes'),
(96, 'widget_recent-comments', 'a:2:{i:2;a:2:{s:5:"title";s:0:"";s:6:"number";i:5;}s:12:"_multiwidget";i:1;}', 'yes'),
(97, 'widget_archives', 'a:2:{i:2;a:3:{s:5:"title";s:0:"";s:5:"count";i:0;s:8:"dropdown";i:0;}s:12:"_multiwidget";i:1;}', 'yes'),
(98, 'widget_meta', 'a:2:{i:2;a:1:{s:5:"title";s:0:"";}s:12:"_multiwidget";i:1;}', 'yes'),
(99, 'sidebars_widgets', 'a:5:{s:19:"wp_inactive_widgets";a:0:{}s:9:"sidebar-1";a:6:{i:0;s:8:"search-2";i:1;s:14:"recent-posts-2";i:2;s:17:"recent-comments-2";i:3;s:10:"archives-2";i:4;s:12:"categories-2";i:5;s:6:"meta-2";}s:9:"sidebar-2";a:0:{}s:9:"sidebar-3";a:0:{}s:13:"array_version";i:3;}', 'yes'),
(100, 'widget_pages', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(101, 'widget_calendar', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(102, 'widget_tag_cloud', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(103, 'widget_nav_menu', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(104, 'cron', 'a:2:{i:[[timestamp]];a:3:{s:16:"wp_version_check";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}s:17:"wp_update_plugins";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}s:16:"wp_update_themes";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}}s:7:"version";i:2;}', 'yes');

-- --------------------------------------------------------

--
-- Table structure for table `[[dbprefix]]postmeta`
--

CREATE TABLE `[[dbprefix]]postmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE [[collate]] DEFAULT NULL,
  `meta_value` longtext COLLATE [[collate]],
  PRIMARY KEY (`meta_id`),
  KEY `post_id` (`post_id`),
  KEY `meta_key` (`meta_key`(191))
)  DEFAULT CHARSET=[[utf8]] COLLATE=[[collate]] AUTO_INCREMENT=2 ;

--
-- Dumping data for table `[[dbprefix]]postmeta`
--

INSERT INTO `[[dbprefix]]postmeta` VALUES
(1, 2, '_wp_page_template', 'default');

-- --------------------------------------------------------

--
-- Table structure for table `[[dbprefix]]posts`
--

CREATE TABLE `[[dbprefix]]posts` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) unsigned NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext COLLATE [[collate]] NOT NULL,
  `post_title` text COLLATE [[collate]] NOT NULL,
  `post_excerpt` text COLLATE [[collate]] NOT NULL,
  `post_status` varchar(20) COLLATE [[collate]] NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) COLLATE [[collate]] NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) COLLATE [[collate]] NOT NULL DEFAULT 'open',
  `post_password` varchar(255) COLLATE [[collate]] NOT NULL DEFAULT '',
  `post_name` varchar(200) COLLATE [[collate]] NOT NULL DEFAULT '',
  `to_ping` text COLLATE [[collate]] NOT NULL,
  `pinged` text COLLATE [[collate]] NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext COLLATE [[collate]] NOT NULL,
  `post_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `guid` varchar(255) COLLATE [[collate]] NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT '0',
  `post_type` varchar(20) COLLATE [[collate]] NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) COLLATE [[collate]] NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `post_name` (`post_name`(191)),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`)
)  DEFAULT CHARSET=[[utf8]] COLLATE=[[collate]] AUTO_INCREMENT=3 ;

--
-- Dumping data for table `[[dbprefix]]posts`
--

INSERT INTO `[[dbprefix]]posts` VALUES
(3, 0, '2017-06-06 16:46:36', '2017-06-06 16:46:36', '\n  <p>\n   This site has been created with the help of many different people and companies.\n  </p>\n\n  <p>\n   In particular, a special thanks goes to the following for content running on this site:\n </p>\n\n      <style>\n       .attributed{height:250px;overflow:hidden;}\n        .attributed img{max-height:180px;}\n      </style>\n      <div class=\"row\">\n   <div class=\"col-xs-12 col-sm-3 col-md-3 col-lg-3 attributed\"> <a href=\"http://unsplash.com/photos/gp8BLyaTaA0\" target=\"_blank\"><img src=\'[[softurl]]wp-content/uploads/2017/06/aHR0cHM6Ly9zb3VyY2UudW5zcGxhc2guY29tL2dwOEJMeWFUYUEwLzYwMHgzMDA_3D-imhwpb-3hx4cj8bmyayisq-150x150.jpg\' /></a><br /><strong>Author</strong>: <a href=\"http://unsplash.com/@imthebear\" target=\"_blank\">Thomas Lefebvre</a><br /><strong>License</strong>: <em>Unknown license</em> </div><div class=\"col-xs-12 col-sm-3 col-md-3 col-lg-3 attributed\"> <a href=\"http://unsplash.com/photos/WHWYBmtn3_0\" target=\"_blank\"><img src=\'[[softurl]]wp-content/uploads/2017/06/aHR0cHM6Ly9zb3VyY2UudW5zcGxhc2guY29tL1dIV1lCbXRuM18wLzYwMHg0NTA_3D-imhwpb-3jdbnyuh81bfd64-150x150.jpg\' /></a><br /><strong>Author</strong>: <a href=\"http://unsplash.com/@brookecagle\" target=\"_blank\">Brooke Cagle</a><br /><strong>License</strong>: <em>Unknown license</em> </div><div class=\"col-xs-12 col-sm-3 col-md-3 col-lg-3 attributed\"> <a href=\"http://unsplash.com/photos/IOzk8YKDhYg\" target=\"_blank\"><img src=\'[[softurl]]wp-content/uploads/2017/06/aHR0cHM6Ly9zb3VyY2UudW5zcGxhc2guY29tL0lPems4WUtEaFlnLzMwMHgzMDA_3D-imhwpb-ijgqofoxxyngmlu-150x150.jpg\' /></a><br /><strong>Author</strong>: <a href=\"http://unsplash.com/@hopehousepress\" target=\"_blank\">Hope House Press</a><br /><strong>License</strong>: <em>Unknown license</em> </div><div class=\"col-xs-12 col-sm-3 col-md-3 col-lg-3 attributed\"> <a href=\"http://unsplash.com/photos/BckPaTv1RZ8\" target=\"_blank\"><img src=\'[[softurl]]wp-content/uploads/2017/06/aHR0cHM6Ly9zb3VyY2UudW5zcGxhc2guY29tL0Jja1BhVHYxUlo4LzYwMHgzMDA_3D-imhwpb-8yn1htn2n7bbs9c-150x150.jpg\' /></a><br /><strong>Author</strong>: <a href=\"http://unsplash.com/@cdbattags\" target=\"_blank\">Christian Battaglia</a><br /><strong>License</strong>: <em>Unknown license</em> </div></div><hr />\n <p style=\"clear:both;\">\n   In addition, this  site was built on a powerful, Inspirations based web builder called <a href=\"http://www.boldgrid.com\">BoldGrid</a>. It is running on <a href=\"http://wordpress.org\">WordPress</a>, the most popular content management software online today.\n  </p>\n<div class=\"boldgrid-attribution\"><p>Additional functionality provided by:</p><ul><li><a href=\"http://ninjaforms.com\">Ninja Forms</a></li></ul></div>', 'Attribution', '', 'publish', 'closed', 'closed', '', 'attribution', '', '', '2017-06-06 16:47:38', '2017-06-06 16:47:38', '', 0, '[[softurl]]attribution/', 0, 'bg_attribution', '', 0),
(4, 1, '2017-06-06 16:46:51', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2017-06-06 16:46:51', '0000-00-00 00:00:00', '', 0, '[[softurl]]?p=4', 0, 'post', '', 0),
(5, 1, '2017-06-06 16:47:35', '2017-06-06 16:47:35', '\n<div class=\"boldgrid-section\"><div class=\"container\"><div class=\"row\">\n  <div class=\"col-md-5 col-xs-12 col-sm-12\">\n    <h2 class=\"title-main\">WEBSITE COMING SOON</h2>\n   <h2>JUST VISITING?</h2>\n   <p>If you are a looking for more information, please check back soon, our new site is on the way!</p>\n   <h2>IS THIS YOUR SITE?</h2>\n   <p>If you own this site, we have installed this \"Coming Soon\" page as a temporary placeholder. Go to your <strong><a href=\"wp-admin\">BoldGrid Login</a></strong> to choose your <strong>Inspiration</strong> to replace this placeholder.  Your username and password were provided in your Welcome Email.</p>\n  </div>\n  <div class=\"col-md-7 col-xs-12 col-sm-12\">\n    <p>\n     <img src=\"//www.boldgrid.com/assets/images/default-1.jpg\" alt=\"hikers in the mountains\" width=\"800\" height=\"904\" class=\"alignnone size-full\"></p>\n </div>\n</div></div></div>\n', '', '', 'publish', 'closed', 'closed', '', '', '', '', '2017-06-06 16:47:35', '2017-06-06 16:47:35', '', 0, '[[softurl]]/', 0, 'page', '', 0),
(6, 1, '2017-06-06 16:47:35', '2017-06-06 16:47:35', ' ', '', '', 'publish', 'closed', 'closed', '', '6', '', '', '2017-06-06 16:47:35', '2017-06-06 16:47:35', '', 0, '[[softurl]]6/', 0, 'nav_menu_item', '', 0),
(7, 1, '2017-06-06 16:47:35', '2017-06-06 16:47:35', '\n<div class=\"boldgrid-section\">\r\n<div class=\"container\">\r\n<div class=\"row gridblock\">\r\n<div class=\"col-md-6 col-xs-12 col-sm-12\">\r\n<h2 class=\"\">The Write Stuff</h2>\r\n<h4 class=\"\">A Better Copywriting Service</h4>\r\n<div class=\"row gridblock\">\r\n<div class=\"col-md-12 col-xs-12 col-sm-12\">\r\n\r\n<hr></div>\r\n</div>\r\n</div>\r\n<div class=\"col-md-6 col-sm-12 col-xs-12\">\r\n\r\n&nbsp;\r\n\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"boldgrid-section\">\r\n<div class=\"container\">\r\n<div class=\"row gridblock\">\r\n<div class=\"col-md-6 col-margin-bottom col-xs-12 col-sm-12\">\r\n\r\nThe concept for my company was a team effort. After chatting with local copywriters at a marketing expo, founder Janet Riley wanted to create a business where marketers and copywriters could work together to create a message that clients could genuinely get behind while driving sales for that client. Tired of the continuous process of finding clients, wooing them into hiring her for projects and then having to start over again once the project was complete, she dreamed of a better way.\r\n\r\nTeaming up with several copywriters in the area, she formed The Write Stuff, a copywriting service that paired copywriters with the companies that needed their unique offerings. Over the past decade, The Write Stuff covers social media and blog content, white papers, copywriting and so much more!\r\n<p class=\"p-button-primary\"><a class=\"button-primary\" href=\"#\">View Our Services</a> <a class=\"button-secondary\" href=\"#\">Visit Our Gallery</a></p>\r\n\r\n</div>\r\n<div class=\"col-md-6 col-margin-bottom text-center col-xs-12 col-sm-12\">\r\n<p class=\"mod-img\"><img class=\"wp-image-91 wp-image-14\" src=\"[[softurl]]wp-content/uploads/2017/06/aHR0cHM6Ly9zb3VyY2UudW5zcGxhc2guY29tL2dwOEJMeWFUYUEwLzYwMHgzMDA_3D-imhwpb-3hx4cj8bmyayisq.jpg\" alt=\"\" data-imhwpb-asset-id=\"780828\"></p>\r\n\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"boldgrid-section\">\r\n<div class=\"container\">\r\n<div class=\"row gridblock\">\r\n<div class=\"col-md-12 col-xs-12 col-sm-12\">\r\n<div class=\"mod-space\"></div>\r\n<div class=\"mod-space\"></div>\r\n<div class=\"mod-space\"></div>\r\n<div class=\"mod-space\"></div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"boldgrid-section\">\r\n<div class=\"container\">\r\n<div class=\"row gridblock\">\r\n<div class=\"col-md-3 col-sm-12 col-xs-12\">\r\n\r\n&nbsp;\r\n\r\n</div>\r\n<div class=\"col-md-9 col-xs-12 col-sm-12\">\r\n<h2 class=\"\">Janet Riley</h2>\r\n<h4 class=\"\">MBA</h4>\r\n<div class=\"row gridblock\">\r\n<div class=\"col-md-12 col-xs-12 col-sm-12\">\r\n\r\n<hr></div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"boldgrid-section\">\r\n<div class=\"container\">\r\n<div class=\"row gridblock\">\r\n<div class=\"col-md-3 col-margin-bottom text-center col-xs-12 col-sm-12\">\r\n<p class=\"mod-img\"><img class=\"alignnone size-full wp-image-15\" src=\"[[softurl]]wp-content/uploads/2017/06/aHR0cHM6Ly9zb3VyY2UudW5zcGxhc2guY29tL1dIV1lCbXRuM18wLzYwMHg0NTA_3D-imhwpb-3jdbnyuh81bfd64.jpg\" alt=\"\" data-imhwpb-asset-id=\"780829\" width=\"600\" height=\"450\"></p>\r\n\r\n</div>\r\n<div class=\"col-md-5 col-margin-bottom col-xs-12 col-sm-12\">\r\n\r\nWith a fabulous talent for writing seductive copy, a natural eye towards business matters and drive to succeed, founder Janet Riley had over 20 years\' in the copywriting business before forming The Write Stuff. She\'d discovered over the years that the never-ending process of \"find project\", \"finish project\", \"repeat\", was getting old. She wanted to focus on the writing end of her business, not spend all her time seeking clients.\r\n\r\nWith an MBA, serious copywriting chops and a fabulous sense of humor that comes across in her writing, Janet has undertaken copywriting for such corporate giants as Hewlett Packard, Barnes &amp; Noble, Macy\'s and numerous Fortune 500 companies.\r\n<p class=\"p-button-primary\"><a class=\"button-primary\" href=\"#\">See Janet\'s Resume</a></p>\r\n\r\n</div>\r\n<div class=\"col-md-4 col-sm-12 col-xs-12\">\r\n<p class=\"mod-img-circle\"><img class=\"alignnone size-full wp-image-16\" src=\"[[softurl]]wp-content/uploads/2017/06/aHR0cHM6Ly9zb3VyY2UudW5zcGxhc2guY29tL0lPems4WUtEaFlnLzMwMHgzMDA_3D-imhwpb-ijgqofoxxyngmlu.jpg\" alt=\"\" data-imhwpb-asset-id=\"780830\" width=\"300\" height=\"300\"></p>\r\n\r\n<div class=\"row gridblock\">\r\n<div class=\"col-md-6 col-xs-12 col-sm-12\">\r\n<div class=\"mod-space\"></div>\r\n</div>\r\n</div>\r\n<div class=\"mod-blockquote\">\r\n\r\n\"serious copywriting chops and a fabulous sense of humor\"\r\n\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"boldgrid-section\">\r\n<div class=\"container\">\r\n<div class=\"row gridblock\">\r\n<div class=\"col-md-12 col-xs-12 col-sm-12\">\r\n<div class=\"mod-space\"></div>\r\n<div class=\"mod-space\"></div>\r\n<div class=\"mod-space\"></div>\r\n<div class=\"mod-space\"></div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"boldgrid-section\">\r\n<div class=\"container\">\r\n<div class=\"row gridblock\">\r\n<div class=\"col-md-6 col-xs-12 col-sm-12\">\r\n<h2 class=\"\">The Crew</h2>\r\n<h4 class=\"\">A Team You Can Rely On</h4>\r\n<div class=\"row gridblock\">\r\n<div class=\"col-md-12 col-xs-12 col-sm-12\">\r\n\r\n<hr></div>\r\n</div>\r\n</div>\r\n<div class=\"col-md-6 col-sm-12 col-xs-12\">\r\n\r\n&nbsp;\r\n\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"boldgrid-section\">\r\n<div class=\"container\">\r\n<div class=\"row gridblock\">\r\n<div class=\"col-md-6 col-margin-bottom col-xs-12 col-sm-12\">\r\n\r\nJanet knows she wouldn\'t get a fraction of the things done she wants to if it wasn\'t for her awesome crew. Kara Margules heads up our sales department, helping us find new clients in need of copywriting services when she\'s not hitting the sales herself. Marie St. Clair keeps our copywriters working while developing awesome new craft designs. Jason Andrews leads our exceptional IT support team when he\'s not making a new batch of award-winning homebrewed ale.\r\n\r\nThe Write Stuff wouldn\'t be anywhere if it wasn\'t for our highly-skilled team of copywriters. Covering industries from accounting to zoo advertising, our amazing copywriters can cover any campaign for any business anywhere in the world.\r\n<div class=\"row gridblock\">\r\n<div class=\"col-md-4 col-xs-12 col-sm-12\">\r\n<p class=\"mod-img-circle\"><img src=\"[[softurl]]wp-content/uploads/2017/06/4-FotoliaComp_73135829_zhWfAoeB8Xi9Wu9pBp5dzkLPXjS33Wws-200x200.jpg\" alt=\"\" data-imhwpb-built-photo-search=\"155|square\" width=\"200\" class=\"wp-image-17\"></p>\r\n\r\n</div>\r\n<div class=\"col-md-4 col-sm-12 col-xs-12\">\r\n<p class=\"mod-img-circle\"><img src=\"[[softurl]]wp-content/uploads/2017/06/4-FotoliaComp_77677505_i1u4su8nSjM8Z1uXL6bNgZbgXAND7YGf-200x200.jpg\" alt=\"\" data-imhwpb-built-photo-search=\"152|square\" width=\"200\" class=\"wp-image-18\"></p>\r\n\r\n</div>\r\n<div class=\"col-md-4 col-sm-12 col-xs-12\">\r\n<p class=\"mod-img-circle\"><img src=\"[[softurl]]wp-content/uploads/2017/06/4-FotoliaComp_64690098_dY2erf2oxUBxmAXUcsGgAR3DWC2BvfoP-200x200.jpg\" alt=\"\" data-imhwpb-built-photo-search=\"152|square\" width=\"200\" class=\"wp-image-19\"></p>\r\n\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"col-md-6 col-margin-bottom text-center col-xs-12 col-sm-12\">\r\n<p class=\"mod-img\"><img class=\"wp-image-94 wp-image-20\" src=\"[[softurl]]wp-content/uploads/2017/06/aHR0cHM6Ly9zb3VyY2UudW5zcGxhc2guY29tL0Jja1BhVHYxUlo4LzYwMHgzMDA_3D-imhwpb-8yn1htn2n7bbs9c.jpg\" alt=\"\" data-imhwpb-asset-id=\"780831\"></p>\r\n\r\n</div>\r\n</div>\r\n</div>\r\n</div>\n', 'About Us', '', 'publish', 'closed', 'closed', '', 'about-us', '', '', '2017-06-06 16:47:38', '2017-06-06 16:47:38', '', 0, '[[softurl]]about-us/', 0, 'page', '', 0),
(8, 1, '2017-06-06 16:47:35', '2017-06-06 16:47:35', ' ', '', '', 'publish', 'closed', 'closed', '', '8', '', '', '2017-06-06 16:47:35', '2017-06-06 16:47:35', '', 0, '[[softurl]]8/', 2, 'nav_menu_item', '', 0),
(9, 1, '2017-06-06 16:47:35', '2017-06-06 16:47:35', '\n<div class=\"boldgrid-section\"><div class=\"container\"><div class=\"row\">\n<div class=\"col-md-8 col-sm-8 col-xs-12\">\n<p>Please use the contact form below, if you have any general questions or requests about our services.</p>\n<p>We will try our best to respond back to you within 24 hours.</p>\n\n[ninja_forms id=\"6\"]\n\n</div>\n<div class=\"col-md-4 col-sm-4 col-xs-12\">\n\n<h3><i class=\"fa fa-1x fa-envelope-o\"><!-- icon --></i> Email</h3>\n<p><a href=\"mailto:admin@yourdomain.com\">admin@dyourdomain.com</a></p>\n\n<h3><i class=\"fa fa-1x fa-phone\"><!-- icon --></i> Phone</h3>\n<p>777-765-4321</p>\n\n<h3><i class=\"fa fa-1x fa-map-marker\"><!-- icon --></i> Address</h3>\n<p>1234 Your St, City, STATE, 12345</p>\n<p class=\"boldgrid-google-maps\" style=\"width:100%;height:200px;\"><iframe style=\"width:100%;height:100%;\" src=\"https://maps.google.com/maps?q=1234+Your+St%2C+City%2C+STATE%2C+12345&amp;t=m&amp;z=16&amp;output=embed\" frameborder=\"0\"></iframe></p>\n\n<p class=\"mod-reset\"><img src=\"[[softurl]]wp-content/uploads/2017/06/4-FotoliaComp_67431242_5dNCwgR9gtnc3oV2IXhpMDqKwA1RwlZr-360x240.jpg\" alt=\"\" data-imhwpb-built-photo-search=\"54|portrait\" width=\"360\" class=\"wp-image-21\"></p>\n\n</div></div></div></div>\n', 'Contact Us', '', 'publish', 'closed', 'closed', '', 'contact-us', '', '', '2017-06-06 16:47:38', '2017-06-06 16:47:38', '', 0, '[[softurl]]contact-us/', 0, 'page', '', 0),
(10, 1, '2017-06-06 16:47:35', '2017-06-06 16:47:35', ' ', '', '', 'publish', 'closed', 'closed', '', '10', '', '', '2017-06-06 16:47:35', '2017-06-06 16:47:35', '', 0, '[[softurl]]10/', 3, 'nav_menu_item', '', 0),
(11, 1, '2017-06-06 16:47:36', '0000-00-00 00:00:00', 'This is a preview of how this form will appear on your website', 'ninja_forms_preview_page', '', 'draft', 'closed', 'closed', '', '', '', '', '2017-06-06 16:47:36', '0000-00-00 00:00:00', '', 0, '[[softurl]]?page_id=11', 0, 'page', '', 0),
(14, 1, '2017-06-06 16:47:38', '2017-06-06 16:47:38', '', '', '', 'inherit', 'open', 'closed', '', '14', '', '', '2017-06-06 16:47:38', '2017-06-06 16:47:38', '', 7, '[[softurl]]wp-content/uploads/2017/06/aHR0cHM6Ly9zb3VyY2UudW5zcGxhc2guY29tL2dwOEJMeWFUYUEwLzYwMHgzMDA_3D-imhwpb-3hx4cj8bmyayisq.jpg', 0, 'attachment', 'image/jpeg', 0),
(15, 1, '2017-06-06 16:47:38', '2017-06-06 16:47:38', '', '', '', 'inherit', 'open', 'closed', '', '15', '', '', '2017-06-06 16:47:38', '2017-06-06 16:47:38', '', 7, '[[softurl]]wp-content/uploads/2017/06/aHR0cHM6Ly9zb3VyY2UudW5zcGxhc2guY29tL1dIV1lCbXRuM18wLzYwMHg0NTA_3D-imhwpb-3jdbnyuh81bfd64.jpg', 0, 'attachment', 'image/jpeg', 0),
(16, 1, '2017-06-06 16:47:38', '2017-06-06 16:47:38', '', '', '', 'inherit', 'open', 'closed', '', '16', '', '', '2017-06-06 16:47:38', '2017-06-06 16:47:38', '', 7, '[[softurl]]wp-content/uploads/2017/06/aHR0cHM6Ly9zb3VyY2UudW5zcGxhc2guY29tL0lPems4WUtEaFlnLzMwMHgzMDA_3D-imhwpb-ijgqofoxxyngmlu.jpg', 0, 'attachment', 'image/jpeg', 0),
(17, 1, '2017-06-06 16:47:38', '2017-06-06 16:47:38', '', '', '', 'inherit', 'open', 'closed', '', '17', '', '', '2017-06-06 16:47:38', '2017-06-06 16:47:38', '', 7, '[[softurl]]wp-content/uploads/2017/06/4-FotoliaComp_73135829_zhWfAoeB8Xi9Wu9pBp5dzkLPXjS33Wws-200x200.jpg', 0, 'attachment', 'image/jpeg', 0),
(18, 1, '2017-06-06 16:47:38', '2017-06-06 16:47:38', '', '', '', 'inherit', 'open', 'closed', '', '18', '', '', '2017-06-06 16:47:38', '2017-06-06 16:47:38', '', 7, '[[softurl]]wp-content/uploads/2017/06/4-FotoliaComp_77677505_i1u4su8nSjM8Z1uXL6bNgZbgXAND7YGf-200x200.jpg', 0, 'attachment', 'image/jpeg', 0),
(19, 1, '2017-06-06 16:47:38', '2017-06-06 16:47:38', '', '', '', 'inherit', 'open', 'closed', '', '19', '', '', '2017-06-06 16:47:38', '2017-06-06 16:47:38', '', 7, '[[softurl]]wp-content/uploads/2017/06/4-FotoliaComp_64690098_dY2erf2oxUBxmAXUcsGgAR3DWC2BvfoP-200x200.jpg', 0, 'attachment', 'image/jpeg', 0),
(20, 1, '2017-06-06 16:47:38', '2017-06-06 16:47:38', '', '', '', 'inherit', 'open', 'closed', '', '20', '', '', '2017-06-06 16:47:38', '2017-06-06 16:47:38', '', 7, '[[softurl]]wp-content/uploads/2017/06/aHR0cHM6Ly9zb3VyY2UudW5zcGxhc2guY29tL0Jja1BhVHYxUlo4LzYwMHgzMDA_3D-imhwpb-8yn1htn2n7bbs9c.jpg', 0, 'attachment', 'image/jpeg', 0),
(21, 1, '2017-06-06 16:47:38', '2017-06-06 16:47:38', '', '', '', 'inherit', 'open', 'closed', '', '21', '', '', '2017-06-06 16:47:38', '2017-06-06 16:47:38', '', 9, '[[softurl]]wp-content/uploads/2017/06/4-FotoliaComp_67431242_5dNCwgR9gtnc3oV2IXhpMDqKwA1RwlZr-360x240.jpg', 0, 'attachment', 'image/jpeg', 0),
(22, 1, '2017-06-06 16:47:38', '2017-06-06 16:47:38', '\n<div class=\"boldgrid-section\">\r\n<div class=\"container\">\r\n<div class=\"row gridblock\">\r\n<div class=\"col-md-6 col-xs-12 col-sm-12\">\r\n<h2 class=\"\">The Write Stuff</h2>\r\n<h4 class=\"\">A Better Copywriting Service</h4>\r\n<div class=\"row gridblock\">\r\n<div class=\"col-md-12 col-xs-12 col-sm-12\">\r\n\r\n<hr></div>\r\n</div>\r\n</div>\r\n<div class=\"col-md-6 col-sm-12 col-xs-12\">\r\n\r\n&nbsp;\r\n\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"boldgrid-section\">\r\n<div class=\"container\">\r\n<div class=\"row gridblock\">\r\n<div class=\"col-md-6 col-margin-bottom col-xs-12 col-sm-12\">\r\n\r\nThe concept for my company was a team effort. After chatting with local copywriters at a marketing expo, founder Janet Riley wanted to create a business where marketers and copywriters could work together to create a message that clients could genuinely get behind while driving sales for that client. Tired of the continuous process of finding clients, wooing them into hiring her for projects and then having to start over again once the project was complete, she dreamed of a better way.\r\n\r\nTeaming up with several copywriters in the area, she formed The Write Stuff, a copywriting service that paired copywriters with the companies that needed their unique offerings. Over the past decade, The Write Stuff covers social media and blog content, white papers, copywriting and so much more!\r\n<p class=\"p-button-primary\"><a class=\"button-primary\" href=\"#\">View Our Services</a> <a class=\"button-secondary\" href=\"#\">Visit Our Gallery</a></p>\r\n\r\n</div>\r\n<div class=\"col-md-6 col-margin-bottom text-center col-xs-12 col-sm-12\">\r\n<p class=\"mod-img\"><img class=\"wp-image-91 wp-image-14\" src=\"[[softurl]]wp-content/uploads/2017/06/aHR0cHM6Ly9zb3VyY2UudW5zcGxhc2guY29tL2dwOEJMeWFUYUEwLzYwMHgzMDA_3D-imhwpb-3hx4cj8bmyayisq.jpg\" alt=\"\" data-imhwpb-asset-id=\"780828\"></p>\r\n\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"boldgrid-section\">\r\n<div class=\"container\">\r\n<div class=\"row gridblock\">\r\n<div class=\"col-md-12 col-xs-12 col-sm-12\">\r\n<div class=\"mod-space\"></div>\r\n<div class=\"mod-space\"></div>\r\n<div class=\"mod-space\"></div>\r\n<div class=\"mod-space\"></div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"boldgrid-section\">\r\n<div class=\"container\">\r\n<div class=\"row gridblock\">\r\n<div class=\"col-md-3 col-sm-12 col-xs-12\">\r\n\r\n&nbsp;\r\n\r\n</div>\r\n<div class=\"col-md-9 col-xs-12 col-sm-12\">\r\n<h2 class=\"\">Janet Riley</h2>\r\n<h4 class=\"\">MBA</h4>\r\n<div class=\"row gridblock\">\r\n<div class=\"col-md-12 col-xs-12 col-sm-12\">\r\n\r\n<hr></div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"boldgrid-section\">\r\n<div class=\"container\">\r\n<div class=\"row gridblock\">\r\n<div class=\"col-md-3 col-margin-bottom text-center col-xs-12 col-sm-12\">\r\n<p class=\"mod-img\"><img class=\"alignnone size-full wp-image-15\" src=\"[[softurl]]wp-content/uploads/2017/06/aHR0cHM6Ly9zb3VyY2UudW5zcGxhc2guY29tL1dIV1lCbXRuM18wLzYwMHg0NTA_3D-imhwpb-3jdbnyuh81bfd64.jpg\" alt=\"\" data-imhwpb-asset-id=\"780829\" width=\"600\" height=\"450\"></p>\r\n\r\n</div>\r\n<div class=\"col-md-5 col-margin-bottom col-xs-12 col-sm-12\">\r\n\r\nWith a fabulous talent for writing seductive copy, a natural eye towards business matters and drive to succeed, founder Janet Riley had over 20 years\' in the copywriting business before forming The Write Stuff. She\'d discovered over the years that the never-ending process of \"find project\", \"finish project\", \"repeat\", was getting old. She wanted to focus on the writing end of her business, not spend all her time seeking clients.\r\n\r\nWith an MBA, serious copywriting chops and a fabulous sense of humor that comes across in her writing, Janet has undertaken copywriting for such corporate giants as Hewlett Packard, Barnes &amp; Noble, Macy\'s and numerous Fortune 500 companies.\r\n<p class=\"p-button-primary\"><a class=\"button-primary\" href=\"#\">See Janet\'s Resume</a></p>\r\n\r\n</div>\r\n<div class=\"col-md-4 col-sm-12 col-xs-12\">\r\n<p class=\"mod-img-circle\"><img class=\"alignnone size-full wp-image-16\" src=\"[[softurl]]wp-content/uploads/2017/06/aHR0cHM6Ly9zb3VyY2UudW5zcGxhc2guY29tL0lPems4WUtEaFlnLzMwMHgzMDA_3D-imhwpb-ijgqofoxxyngmlu.jpg\" alt=\"\" data-imhwpb-asset-id=\"780830\" width=\"300\" height=\"300\"></p>\r\n\r\n<div class=\"row gridblock\">\r\n<div class=\"col-md-6 col-xs-12 col-sm-12\">\r\n<div class=\"mod-space\"></div>\r\n</div>\r\n</div>\r\n<div class=\"mod-blockquote\">\r\n\r\n\"serious copywriting chops and a fabulous sense of humor\"\r\n\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"boldgrid-section\">\r\n<div class=\"container\">\r\n<div class=\"row gridblock\">\r\n<div class=\"col-md-12 col-xs-12 col-sm-12\">\r\n<div class=\"mod-space\"></div>\r\n<div class=\"mod-space\"></div>\r\n<div class=\"mod-space\"></div>\r\n<div class=\"mod-space\"></div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"boldgrid-section\">\r\n<div class=\"container\">\r\n<div class=\"row gridblock\">\r\n<div class=\"col-md-6 col-xs-12 col-sm-12\">\r\n<h2 class=\"\">The Crew</h2>\r\n<h4 class=\"\">A Team You Can Rely On</h4>\r\n<div class=\"row gridblock\">\r\n<div class=\"col-md-12 col-xs-12 col-sm-12\">\r\n\r\n<hr></div>\r\n</div>\r\n</div>\r\n<div class=\"col-md-6 col-sm-12 col-xs-12\">\r\n\r\n&nbsp;\r\n\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"boldgrid-section\">\r\n<div class=\"container\">\r\n<div class=\"row gridblock\">\r\n<div class=\"col-md-6 col-margin-bottom col-xs-12 col-sm-12\">\r\n\r\nJanet knows she wouldn\'t get a fraction of the things done she wants to if it wasn\'t for her awesome crew. Kara Margules heads up our sales department, helping us find new clients in need of copywriting services when she\'s not hitting the sales herself. Marie St. Clair keeps our copywriters working while developing awesome new craft designs. Jason Andrews leads our exceptional IT support team when he\'s not making a new batch of award-winning homebrewed ale.\r\n\r\nThe Write Stuff wouldn\'t be anywhere if it wasn\'t for our highly-skilled team of copywriters. Covering industries from accounting to zoo advertising, our amazing copywriters can cover any campaign for any business anywhere in the world.\r\n<div class=\"row gridblock\">\r\n<div class=\"col-md-4 col-xs-12 col-sm-12\">\r\n<p class=\"mod-img-circle\"><img src=\"[[softurl]]wp-content/uploads/2017/06/4-FotoliaComp_73135829_zhWfAoeB8Xi9Wu9pBp5dzkLPXjS33Wws-200x200.jpg\" alt=\"\" data-imhwpb-built-photo-search=\"155|square\" width=\"200\" class=\"wp-image-17\"></p>\r\n\r\n</div>\r\n<div class=\"col-md-4 col-sm-12 col-xs-12\">\r\n<p class=\"mod-img-circle\"><img src=\"[[softurl]]wp-content/uploads/2017/06/4-FotoliaComp_77677505_i1u4su8nSjM8Z1uXL6bNgZbgXAND7YGf-200x200.jpg\" alt=\"\" data-imhwpb-built-photo-search=\"152|square\" width=\"200\" class=\"wp-image-18\"></p>\r\n\r\n</div>\r\n<div class=\"col-md-4 col-sm-12 col-xs-12\">\r\n<p class=\"mod-img-circle\"><img src=\"[[softurl]]wp-content/uploads/2017/06/4-FotoliaComp_64690098_dY2erf2oxUBxmAXUcsGgAR3DWC2BvfoP-200x200.jpg\" alt=\"\" data-imhwpb-built-photo-search=\"152|square\" width=\"200\" class=\"wp-image-19\"></p>\r\n\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"col-md-6 col-margin-bottom text-center col-xs-12 col-sm-12\">\r\n<p class=\"mod-img\"><img class=\"wp-image-94 wp-image-20\" src=\"[[softurl]]wp-content/uploads/2017/06/aHR0cHM6Ly9zb3VyY2UudW5zcGxhc2guY29tL0Jja1BhVHYxUlo4LzYwMHgzMDA_3D-imhwpb-8yn1htn2n7bbs9c.jpg\" alt=\"\" data-imhwpb-asset-id=\"780831\"></p>\r\n\r\n</div>\r\n</div>\r\n</div>\r\n</div>\n', 'About Us', '', 'inherit', 'closed', 'closed', '', '7-revision-v1', '', '', '2017-06-06 16:47:38', '2017-06-06 16:47:38', '', 7, '[[softurl]]7-revision-v1/', 0, 'revision', '', 0),
(23, 1, '2017-06-06 16:47:38', '2017-06-06 16:47:38', '\n<div class=\"boldgrid-section\"><div class=\"container\"><div class=\"row\">\n<div class=\"col-md-8 col-sm-8 col-xs-12\">\n<p>Please use the contact form below, if you have any general questions or requests about our services.</p>\n<p>We will try our best to respond back to you within 24 hours.</p>\n\n[ninja_forms id=\"6\"]\n\n</div>\n<div class=\"col-md-4 col-sm-4 col-xs-12\">\n\n<h3><i class=\"fa fa-1x fa-envelope-o\"><!-- icon --></i> Email</h3>\n<p><a href=\"mailto:admin@yourdomain.com\">admin@yourdomain.com</a></p>\n\n<h3><i class=\"fa fa-1x fa-phone\"><!-- icon --></i> Phone</h3>\n<p>777-765-4321</p>\n\n<h3><i class=\"fa fa-1x fa-map-marker\"><!-- icon --></i> Address</h3>\n<p>1234 Your St, City, STATE, 12345</p>\n<p class=\"boldgrid-google-maps\" style=\"width:100%;height:200px;\"><iframe style=\"width:100%;height:100%;\" src=\"https://maps.google.com/maps?q=1234+Your+St%2C+City%2C+STATE%2C+12345&amp;t=m&amp;z=16&amp;output=embed\" frameborder=\"0\"></iframe></p>\n\n<p class=\"mod-reset\"><img src=\"[[softurl]]wp-content/uploads/2017/06/4-FotoliaComp_67431242_5dNCwgR9gtnc3oV2IXhpMDqKwA1RwlZr-360x240.jpg\" alt=\"\" data-imhwpb-built-photo-search=\"54|portrait\" width=\"360\" class=\"wp-image-21\"></p>\n\n</div></div></div></div>\n', 'Contact Us', '', 'inherit', 'closed', 'closed', '', '9-revision-v1', '', '', '2017-06-06 16:47:38', '2017-06-06 16:47:38', '', 9, '[[softurl]]9-revision-v1/', 0, 'revision', '', 0),
(27, 1, '2017-06-06 16:47:39', '0000-00-00 00:00:00', '', 'BoldGrid - GridBlock Set - Preview Page', '', 'draft', 'closed', 'closed', '', 'boldgrid-gridblock-set-preview-page', '', '', '2017-06-06 16:47:39', '0000-00-00 00:00:00', '', 0, '[[softurl]]?page_id=27', 0, 'page', '', 0),
(28, 1, '2017-06-06 16:47:40', '2017-06-06 16:47:40', '', 'Facebook', 'Facebook', 'publish', 'closed', 'closed', '', 'facebook', '', '', '2017-06-06 16:47:40', '2017-06-06 16:47:40', '', 0, '[[softurl]]facebook/', 0, 'nav_menu_item', '', 0);
-- --------------------------------------------------------

--
-- Table structure for table `[[dbprefix]]termmeta`
--

CREATE TABLE `[[dbprefix]]termmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE [[collate]] DEFAULT NULL,
  `meta_value` longtext COLLATE [[collate]],
  PRIMARY KEY (`meta_id`),
  KEY `term_id` (`term_id`),
  KEY `meta_key` (`meta_key`(191))
) DEFAULT CHARSET=[[utf8]] COLLATE=[[collate]] AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `[[dbprefix]]terms`
--

CREATE TABLE `[[dbprefix]]terms` (
  `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE [[collate]] NOT NULL DEFAULT '',
  `slug` varchar(200) COLLATE [[collate]] NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_id`),
  KEY `slug` (`slug`(191)),
  KEY `name` (`name`(191))
)  DEFAULT CHARSET=[[utf8]] COLLATE=[[collate]] AUTO_INCREMENT=2 ;

--
-- Dumping data for table `[[dbprefix]]terms`
--

INSERT INTO `[[dbprefix]]terms` VALUES
(1, 'Uncategorized', 'uncategorized', 0);

-- --------------------------------------------------------

--
-- Table structure for table `[[dbprefix]]term_relationships`
--

CREATE TABLE `[[dbprefix]]term_relationships` (
  `object_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  KEY `term_taxonomy_id` (`term_taxonomy_id`)
) DEFAULT CHARSET=[[utf8]] COLLATE=[[collate]];

--
-- Dumping data for table `[[dbprefix]]term_relationships`
--

INSERT INTO `[[dbprefix]]term_relationships` VALUES
(1, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `[[dbprefix]]term_taxonomy`
--

CREATE TABLE `[[dbprefix]]term_taxonomy` (
  `term_taxonomy_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) COLLATE [[collate]] NOT NULL DEFAULT '',
  `description` longtext COLLATE [[collate]] NOT NULL,
  `parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_taxonomy_id`),
  UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  KEY `taxonomy` (`taxonomy`)
)  DEFAULT CHARSET=[[utf8]] COLLATE=[[collate]] AUTO_INCREMENT=2 ;

--
-- Dumping data for table `[[dbprefix]]term_taxonomy`
--

INSERT INTO `[[dbprefix]]term_taxonomy` VALUES
(1, 1, 'category', '', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `[[dbprefix]]usermeta`
--

CREATE TABLE `[[dbprefix]]usermeta` (
  `umeta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE [[collate]] DEFAULT NULL,
  `meta_value` longtext COLLATE [[collate]],
  PRIMARY KEY (`umeta_id`),
  KEY `user_id` (`user_id`),
  KEY `meta_key` (`meta_key`(191))
)  DEFAULT CHARSET=[[utf8]] COLLATE=[[collate]] AUTO_INCREMENT=15 ;

--
-- Dumping data for table `[[dbprefix]]usermeta`
--

INSERT INTO `[[dbprefix]]usermeta` VALUES
(1, 1, 'nickname', '[[admin_username]]'),
(2, 1, 'first_name', ''),
(3, 1, 'last_name', ''),
(4, 1, 'description', ''),
(5, 1, 'rich_editing', 'true'),
(6, 1, 'comment_shortcuts', 'false'),
(7, 1, 'admin_color', 'fresh'),
(8, 1, 'use_ssl', '0'),
(9, 1, 'show_admin_bar_front', 'true'),
(10, 1, 'locale', ''),
(11, 1, '[[dbprefix]]capabilities', 'a:1:{s:13:"administrator";b:1;}'),
(12, 1, '[[dbprefix]]user_level', '10'),
(13, 1, 'dismissed_wp_pointers', ''),
(14, 1, 'show_welcome_panel', '1');

-- --------------------------------------------------------

--
-- Table structure for table `[[dbprefix]]users`
--

CREATE TABLE `[[dbprefix]]users` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) COLLATE [[collate]] NOT NULL DEFAULT '',
  `user_pass` varchar(255) COLLATE [[collate]] NOT NULL DEFAULT '',
  `user_nicename` varchar(50) COLLATE [[collate]] NOT NULL DEFAULT '',
  `user_email` varchar(100) COLLATE [[collate]] NOT NULL DEFAULT '',
  `user_url` varchar(100) COLLATE [[collate]] NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(255) COLLATE [[collate]] NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT '0',
  `display_name` varchar(250) COLLATE [[collate]] NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`),
  KEY `user_email` (`user_email`)
)  DEFAULT CHARSET=[[utf8]] COLLATE=[[collate]] AUTO_INCREMENT=2 ;

--
-- Dumping data for table `[[dbprefix]]users`
--

INSERT INTO `[[dbprefix]]users` VALUES
(1, '[[admin_username]]', '[[admin_pass]]', '[[admin_username]]', '[[admin_email]]', '', '[[date_gmt]]', '', 0, '[[admin_username]]');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
