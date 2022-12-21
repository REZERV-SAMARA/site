#
# ГКУЗ МЦ «Резерв» г. Самара Database Dump
# MODX Version:1.4.21
# 
# Host: 
# Generation Time: 20-12-2022 03:24:10
# Server version: 5.5.5-10.3.22-MariaDB
# PHP Version: 7.4.5
# Database: `EvoRezerv`
# Description: 
#

# --------------------------------------------------------

SET @old_sql_mode := @@sql_mode;
SET @new_sql_mode := @old_sql_mode;
SET @new_sql_mode := TRIM(BOTH ',' FROM REPLACE(CONCAT(',',@new_sql_mode,','),',NO_ZERO_DATE,'  ,','));
SET @new_sql_mode := TRIM(BOTH ',' FROM REPLACE(CONCAT(',',@new_sql_mode,','),',NO_ZERO_IN_DATE,',','));
SET @@sql_mode := @new_sql_mode ;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;


# --------------------------------------------------------



# --------------------------------------------------------

#
# Table structure for table `evo_active_user_locks`
#

DROP TABLE IF EXISTS `evo_active_user_locks`;
CREATE TABLE `evo_active_user_locks` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `sid` varchar(32) NOT NULL DEFAULT '',
  `internalKey` int(9) NOT NULL DEFAULT 0,
  `elementType` int(1) NOT NULL DEFAULT 0,
  `elementId` int(10) NOT NULL DEFAULT 0,
  `lasthit` int(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ix_element_id` (`elementType`,`elementId`,`sid`)
) ENGINE=MyISAM AUTO_INCREMENT=71 DEFAULT CHARSET=utf8 COMMENT='Contains data about locked elements.';



# --------------------------------------------------------

#
# Table structure for table `evo_active_user_sessions`
#

DROP TABLE IF EXISTS `evo_active_user_sessions`;
CREATE TABLE `evo_active_user_sessions` (
  `sid` varchar(32) NOT NULL DEFAULT '',
  `internalKey` int(9) NOT NULL DEFAULT 0,
  `lasthit` int(20) NOT NULL DEFAULT 0,
  `ip` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`sid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains data about valid user sessions.';



# --------------------------------------------------------

#
# Table structure for table `evo_active_users`
#

DROP TABLE IF EXISTS `evo_active_users`;
CREATE TABLE `evo_active_users` (
  `sid` varchar(32) NOT NULL DEFAULT '',
  `internalKey` int(9) NOT NULL DEFAULT 0,
  `username` varchar(50) NOT NULL DEFAULT '',
  `lasthit` int(20) NOT NULL DEFAULT 0,
  `action` varchar(10) NOT NULL DEFAULT '',
  `id` int(10) DEFAULT NULL,
  PRIMARY KEY (`sid`,`username`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains data about last user action.';



# --------------------------------------------------------

#
# Table structure for table `evo_categories`
#

DROP TABLE IF EXISTS `evo_categories`;
CREATE TABLE `evo_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(45) NOT NULL DEFAULT '',
  `rank` int(5) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='Categories to be used snippets,tv,chunks, etc';



# --------------------------------------------------------

#
# Table structure for table `evo_document_groups`
#

DROP TABLE IF EXISTS `evo_document_groups`;
CREATE TABLE `evo_document_groups` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `document_group` int(10) NOT NULL DEFAULT 0,
  `document` int(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ix_dg_id` (`document_group`,`document`),
  KEY `document` (`document`),
  KEY `document_group` (`document_group`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains data used for access permissions.';



# --------------------------------------------------------

#
# Table structure for table `evo_documentgroup_names`
#

DROP TABLE IF EXISTS `evo_documentgroup_names`;
CREATE TABLE `evo_documentgroup_names` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(245) NOT NULL DEFAULT '',
  `private_memgroup` tinyint(4) DEFAULT 0 COMMENT 'determine whether the document group is private to manager users',
  `private_webgroup` tinyint(4) DEFAULT 0 COMMENT 'determines whether the document is private to web users',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains data used for access permissions.';



# --------------------------------------------------------

#
# Table structure for table `evo_event_log`
#

DROP TABLE IF EXISTS `evo_event_log`;
CREATE TABLE `evo_event_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `eventid` int(11) DEFAULT 0,
  `createdon` int(11) NOT NULL DEFAULT 0,
  `type` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1- information, 2 - warning, 3- error',
  `user` int(11) NOT NULL DEFAULT 0 COMMENT 'link to user table',
  `usertype` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0 - manager, 1 - web',
  `source` varchar(50) NOT NULL DEFAULT '',
  `description` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user` (`user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores event and error logs';



# --------------------------------------------------------

#
# Table structure for table `evo_manager_log`
#

DROP TABLE IF EXISTS `evo_manager_log`;
CREATE TABLE `evo_manager_log` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `timestamp` int(20) NOT NULL DEFAULT 0,
  `internalKey` int(10) NOT NULL DEFAULT 0,
  `username` varchar(255) DEFAULT NULL,
  `action` int(10) NOT NULL DEFAULT 0,
  `itemid` varchar(10) DEFAULT '0',
  `itemname` varchar(255) DEFAULT NULL,
  `message` varchar(255) NOT NULL DEFAULT '',
  `ip` varchar(46) DEFAULT NULL,
  `useragent` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Contains a record of user interaction.';



# --------------------------------------------------------

#
# Table structure for table `evo_manager_users`
#

DROP TABLE IF EXISTS `evo_manager_users`;
CREATE TABLE `evo_manager_users` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL DEFAULT '',
  `password` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Contains login information for backend users.';



# --------------------------------------------------------

#
# Table structure for table `evo_member_groups`
#

DROP TABLE IF EXISTS `evo_member_groups`;
CREATE TABLE `evo_member_groups` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_group` int(10) NOT NULL DEFAULT 0,
  `member` int(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ix_group_member` (`user_group`,`member`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains data used for access permissions.';



# --------------------------------------------------------

#
# Table structure for table `evo_membergroup_access`
#

DROP TABLE IF EXISTS `evo_membergroup_access`;
CREATE TABLE `evo_membergroup_access` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `membergroup` int(10) NOT NULL DEFAULT 0,
  `documentgroup` int(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains data used for access permissions.';



# --------------------------------------------------------

#
# Table structure for table `evo_membergroup_names`
#

DROP TABLE IF EXISTS `evo_membergroup_names`;
CREATE TABLE `evo_membergroup_names` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(245) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains data used for access permissions.';



# --------------------------------------------------------

#
# Table structure for table `evo_site_content`
#

DROP TABLE IF EXISTS `evo_site_content`;
CREATE TABLE `evo_site_content` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `type` varchar(20) NOT NULL DEFAULT 'document',
  `contentType` varchar(50) NOT NULL DEFAULT 'text/html',
  `pagetitle` varchar(255) NOT NULL DEFAULT '',
  `longtitle` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(245) DEFAULT '',
  `link_attributes` varchar(255) NOT NULL DEFAULT '' COMMENT 'Link attriubtes',
  `published` int(1) NOT NULL DEFAULT 0,
  `pub_date` int(20) NOT NULL DEFAULT 0,
  `unpub_date` int(20) NOT NULL DEFAULT 0,
  `parent` int(10) NOT NULL DEFAULT 0,
  `isfolder` int(1) NOT NULL DEFAULT 0,
  `introtext` text DEFAULT NULL COMMENT 'Used to provide quick summary of the document',
  `content` mediumtext DEFAULT NULL,
  `richtext` tinyint(1) NOT NULL DEFAULT 1,
  `template` int(10) NOT NULL DEFAULT 0,
  `menuindex` int(10) NOT NULL DEFAULT 0,
  `searchable` int(1) NOT NULL DEFAULT 1,
  `cacheable` int(1) NOT NULL DEFAULT 1,
  `createdby` int(10) NOT NULL DEFAULT 0,
  `createdon` int(20) NOT NULL DEFAULT 0,
  `editedby` int(10) NOT NULL DEFAULT 0,
  `editedon` int(20) NOT NULL DEFAULT 0,
  `deleted` int(1) NOT NULL DEFAULT 0,
  `deletedon` int(20) NOT NULL DEFAULT 0,
  `deletedby` int(10) NOT NULL DEFAULT 0,
  `publishedon` int(20) NOT NULL DEFAULT 0 COMMENT 'Date the document was published',
  `publishedby` int(10) NOT NULL DEFAULT 0 COMMENT 'ID of user who published the document',
  `menutitle` varchar(255) NOT NULL DEFAULT '' COMMENT 'Menu title',
  `donthit` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Disable page hit count',
  `privateweb` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Private web document',
  `privatemgr` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Private manager document',
  `content_dispo` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0-inline, 1-attachment',
  `hidemenu` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Hide document from menu',
  `alias_visible` int(2) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `parent` (`parent`),
  KEY `aliasidx` (`alias`),
  KEY `typeidx` (`type`),
  FULLTEXT KEY `content_ft_idx` (`pagetitle`,`description`,`content`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='Contains the site document tree.';



# --------------------------------------------------------

#
# Table structure for table `evo_site_htmlsnippets`
#

DROP TABLE IF EXISTS `evo_site_htmlsnippets`;
CREATE TABLE `evo_site_htmlsnippets` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT 'Chunk',
  `editor_type` int(11) NOT NULL DEFAULT 0 COMMENT '0-plain text,1-rich text,2-code editor',
  `editor_name` varchar(50) NOT NULL DEFAULT 'none',
  `category` int(11) NOT NULL DEFAULT 0 COMMENT 'category id',
  `cache_type` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Cache option',
  `snippet` mediumtext DEFAULT NULL,
  `locked` tinyint(4) NOT NULL DEFAULT 0,
  `createdon` int(11) NOT NULL DEFAULT 0,
  `editedon` int(11) NOT NULL DEFAULT 0,
  `disabled` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'Disables the snippet',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Contains the site chunks.';



# --------------------------------------------------------

#
# Table structure for table `evo_site_module_access`
#

DROP TABLE IF EXISTS `evo_site_module_access`;
CREATE TABLE `evo_site_module_access` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `module` int(11) NOT NULL DEFAULT 0,
  `usergroup` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Module users group access permission';



# --------------------------------------------------------

#
# Table structure for table `evo_site_module_depobj`
#

DROP TABLE IF EXISTS `evo_site_module_depobj`;
CREATE TABLE `evo_site_module_depobj` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `module` int(11) NOT NULL DEFAULT 0,
  `resource` int(11) NOT NULL DEFAULT 0,
  `type` int(2) NOT NULL DEFAULT 0 COMMENT '10-chunks, 20-docs, 30-plugins, 40-snips, 50-tpls, 60-tvs',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Module Dependencies';



# --------------------------------------------------------

#
# Table structure for table `evo_site_modules`
#

DROP TABLE IF EXISTS `evo_site_modules`;
CREATE TABLE `evo_site_modules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '0',
  `editor_type` int(11) NOT NULL DEFAULT 0 COMMENT '0-plain text,1-rich text,2-code editor',
  `disabled` tinyint(4) NOT NULL DEFAULT 0,
  `category` int(11) NOT NULL DEFAULT 0 COMMENT 'category id',
  `wrap` tinyint(4) NOT NULL DEFAULT 0,
  `locked` tinyint(4) NOT NULL DEFAULT 0,
  `icon` varchar(255) NOT NULL DEFAULT '' COMMENT 'url to module icon',
  `enable_resource` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'enables the resource file feature',
  `resourcefile` varchar(255) NOT NULL DEFAULT '' COMMENT 'a physical link to a resource file',
  `createdon` int(11) NOT NULL DEFAULT 0,
  `editedon` int(11) NOT NULL DEFAULT 0,
  `guid` varchar(32) NOT NULL DEFAULT '' COMMENT 'globally unique identifier',
  `enable_sharedparams` tinyint(4) NOT NULL DEFAULT 0,
  `properties` text DEFAULT NULL,
  `modulecode` mediumtext DEFAULT NULL COMMENT 'module boot up code',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Site Modules';



# --------------------------------------------------------

#
# Table structure for table `evo_site_plugin_events`
#

DROP TABLE IF EXISTS `evo_site_plugin_events`;
CREATE TABLE `evo_site_plugin_events` (
  `pluginid` int(10) NOT NULL,
  `evtid` int(10) NOT NULL DEFAULT 0,
  `priority` int(10) NOT NULL DEFAULT 0 COMMENT 'determines plugin run order',
  PRIMARY KEY (`pluginid`,`evtid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Links to system events';



# --------------------------------------------------------

#
# Table structure for table `evo_site_plugins`
#

DROP TABLE IF EXISTS `evo_site_plugins`;
CREATE TABLE `evo_site_plugins` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT 'Plugin',
  `editor_type` int(11) NOT NULL DEFAULT 0 COMMENT '0-plain text,1-rich text,2-code editor',
  `category` int(11) NOT NULL DEFAULT 0 COMMENT 'category id',
  `cache_type` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Cache option',
  `plugincode` mediumtext DEFAULT NULL,
  `locked` tinyint(4) NOT NULL DEFAULT 0,
  `properties` text DEFAULT NULL COMMENT 'Default Properties',
  `disabled` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'Disables the plugin',
  `moduleguid` varchar(32) NOT NULL DEFAULT '' COMMENT 'GUID of module from which to import shared parameters',
  `createdon` int(11) NOT NULL DEFAULT 0,
  `editedon` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='Contains the site plugins.';



# --------------------------------------------------------

#
# Table structure for table `evo_site_snippets`
#

DROP TABLE IF EXISTS `evo_site_snippets`;
CREATE TABLE `evo_site_snippets` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT 'Snippet',
  `editor_type` int(11) NOT NULL DEFAULT 0 COMMENT '0-plain text,1-rich text,2-code editor',
  `category` int(11) NOT NULL DEFAULT 0 COMMENT 'category id',
  `cache_type` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Cache option',
  `snippet` mediumtext DEFAULT NULL,
  `locked` tinyint(4) NOT NULL DEFAULT 0,
  `properties` text DEFAULT NULL COMMENT 'Default Properties',
  `moduleguid` varchar(32) NOT NULL DEFAULT '' COMMENT 'GUID of module from which to import shared parameters',
  `createdon` int(11) NOT NULL DEFAULT 0,
  `editedon` int(11) NOT NULL DEFAULT 0,
  `disabled` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'Disables the snippet',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='Contains the site snippets.';



# --------------------------------------------------------

#
# Table structure for table `evo_site_templates`
#

DROP TABLE IF EXISTS `evo_site_templates`;
CREATE TABLE `evo_site_templates` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `templatename` varchar(100) NOT NULL DEFAULT '',
  `templatealias` varchar(255) DEFAULT NULL,
  `description` varchar(255) NOT NULL DEFAULT 'Template',
  `editor_type` int(11) NOT NULL DEFAULT 0 COMMENT '0-plain text,1-rich text,2-code editor',
  `category` int(11) NOT NULL DEFAULT 0 COMMENT 'category id',
  `icon` varchar(255) NOT NULL DEFAULT '' COMMENT 'url to icon file',
  `template_type` int(11) NOT NULL DEFAULT 0 COMMENT '0-page,1-content',
  `content` mediumtext DEFAULT NULL,
  `locked` tinyint(4) NOT NULL DEFAULT 0,
  `selectable` tinyint(4) NOT NULL DEFAULT 1,
  `createdon` int(11) NOT NULL DEFAULT 0,
  `editedon` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Contains the site templates.';



# --------------------------------------------------------

#
# Table structure for table `evo_site_tmplvar_access`
#

DROP TABLE IF EXISTS `evo_site_tmplvar_access`;
CREATE TABLE `evo_site_tmplvar_access` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `tmplvarid` int(10) NOT NULL DEFAULT 0,
  `documentgroup` int(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains data used for template variable access permissions.';



# --------------------------------------------------------

#
# Table structure for table `evo_site_tmplvar_contentvalues`
#

DROP TABLE IF EXISTS `evo_site_tmplvar_contentvalues`;
CREATE TABLE `evo_site_tmplvar_contentvalues` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tmplvarid` int(10) NOT NULL DEFAULT 0 COMMENT 'Template Variable id',
  `contentid` int(10) NOT NULL DEFAULT 0 COMMENT 'Site Content Id',
  `value` mediumtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ix_tvid_contentid` (`tmplvarid`,`contentid`),
  KEY `idx_tmplvarid` (`tmplvarid`),
  KEY `idx_id` (`contentid`),
  FULLTEXT KEY `value_ft_idx` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Site Template Variables Content Values Link Table';



# --------------------------------------------------------

#
# Table structure for table `evo_site_tmplvar_templates`
#

DROP TABLE IF EXISTS `evo_site_tmplvar_templates`;
CREATE TABLE `evo_site_tmplvar_templates` (
  `tmplvarid` int(10) NOT NULL DEFAULT 0 COMMENT 'Template Variable id',
  `templateid` int(11) NOT NULL DEFAULT 0,
  `rank` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`tmplvarid`,`templateid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Site Template Variables Templates Link Table';



# --------------------------------------------------------

#
# Table structure for table `evo_site_tmplvars`
#

DROP TABLE IF EXISTS `evo_site_tmplvars`;
CREATE TABLE `evo_site_tmplvars` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(50) NOT NULL DEFAULT '',
  `name` varchar(50) NOT NULL DEFAULT '',
  `caption` varchar(80) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `editor_type` int(11) NOT NULL DEFAULT 0 COMMENT '0-plain text,1-rich text,2-code editor',
  `category` int(11) NOT NULL DEFAULT 0 COMMENT 'category id',
  `locked` tinyint(4) NOT NULL DEFAULT 0,
  `elements` text DEFAULT NULL,
  `rank` int(11) NOT NULL DEFAULT 0,
  `display` varchar(20) NOT NULL DEFAULT '' COMMENT 'Display Control',
  `display_params` text DEFAULT NULL COMMENT 'Display Control Properties',
  `default_text` text DEFAULT NULL,
  `createdon` int(11) NOT NULL DEFAULT 0,
  `editedon` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `indx_rank` (`rank`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='Site Template Variables';



# --------------------------------------------------------

#
# Table structure for table `evo_system_eventnames`
#

DROP TABLE IF EXISTS `evo_system_eventnames`;
CREATE TABLE `evo_system_eventnames` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `service` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'System Service number',
  `groupname` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=147 DEFAULT CHARSET=utf8 COMMENT='System Event Names.';



# --------------------------------------------------------

#
# Table structure for table `evo_system_settings`
#

DROP TABLE IF EXISTS `evo_system_settings`;
CREATE TABLE `evo_system_settings` (
  `setting_name` varchar(50) NOT NULL DEFAULT '',
  `setting_value` text DEFAULT NULL,
  PRIMARY KEY (`setting_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains Content Manager settings.';



# --------------------------------------------------------

#
# Table structure for table `evo_user_attributes`
#

DROP TABLE IF EXISTS `evo_user_attributes`;
CREATE TABLE `evo_user_attributes` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `internalKey` int(10) NOT NULL DEFAULT 0,
  `fullname` varchar(100) NOT NULL DEFAULT '',
  `role` int(10) NOT NULL DEFAULT 0,
  `email` varchar(100) NOT NULL DEFAULT '',
  `phone` varchar(100) NOT NULL DEFAULT '',
  `mobilephone` varchar(100) NOT NULL DEFAULT '',
  `blocked` int(1) NOT NULL DEFAULT 0,
  `blockeduntil` int(11) NOT NULL DEFAULT 0,
  `blockedafter` int(11) NOT NULL DEFAULT 0,
  `logincount` int(11) NOT NULL DEFAULT 0,
  `lastlogin` int(11) NOT NULL DEFAULT 0,
  `thislogin` int(11) NOT NULL DEFAULT 0,
  `failedlogincount` int(10) NOT NULL DEFAULT 0,
  `sessionid` varchar(100) NOT NULL DEFAULT '',
  `dob` int(10) NOT NULL DEFAULT 0,
  `gender` int(1) NOT NULL DEFAULT 0 COMMENT '0 - unknown, 1 - Male 2 - female',
  `country` varchar(5) NOT NULL DEFAULT '',
  `street` varchar(255) NOT NULL DEFAULT '',
  `city` varchar(255) NOT NULL DEFAULT '',
  `state` varchar(25) NOT NULL DEFAULT '',
  `zip` varchar(25) NOT NULL DEFAULT '',
  `fax` varchar(100) NOT NULL DEFAULT '',
  `photo` varchar(255) NOT NULL DEFAULT '' COMMENT 'link to photo',
  `comment` text DEFAULT NULL,
  `createdon` int(11) NOT NULL DEFAULT 0,
  `editedon` int(11) NOT NULL DEFAULT 0,
  `verified` int(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `userid` (`internalKey`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Contains information about the backend users.';



# --------------------------------------------------------

#
# Table structure for table `evo_user_messages`
#

DROP TABLE IF EXISTS `evo_user_messages`;
CREATE TABLE `evo_user_messages` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `type` varchar(15) NOT NULL DEFAULT '',
  `subject` varchar(60) NOT NULL DEFAULT '',
  `message` text DEFAULT NULL,
  `sender` int(10) NOT NULL DEFAULT 0,
  `recipient` int(10) NOT NULL DEFAULT 0,
  `private` tinyint(4) NOT NULL DEFAULT 0,
  `postdate` int(20) NOT NULL DEFAULT 0,
  `messageread` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains messages for the Content Manager messaging system.';



# --------------------------------------------------------

#
# Table structure for table `evo_user_roles`
#

DROP TABLE IF EXISTS `evo_user_roles`;
CREATE TABLE `evo_user_roles` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `frames` int(1) NOT NULL DEFAULT 0,
  `home` int(1) NOT NULL DEFAULT 0,
  `view_document` int(1) NOT NULL DEFAULT 0,
  `new_document` int(1) NOT NULL DEFAULT 0,
  `save_document` int(1) NOT NULL DEFAULT 0,
  `publish_document` int(1) NOT NULL DEFAULT 0,
  `delete_document` int(1) NOT NULL DEFAULT 0,
  `empty_trash` int(1) NOT NULL DEFAULT 0,
  `action_ok` int(1) NOT NULL DEFAULT 0,
  `logout` int(1) NOT NULL DEFAULT 0,
  `help` int(1) NOT NULL DEFAULT 0,
  `messages` int(1) NOT NULL DEFAULT 0,
  `new_user` int(1) NOT NULL DEFAULT 0,
  `edit_user` int(1) NOT NULL DEFAULT 0,
  `logs` int(1) NOT NULL DEFAULT 0,
  `edit_parser` int(1) NOT NULL DEFAULT 0,
  `save_parser` int(1) NOT NULL DEFAULT 0,
  `edit_template` int(1) NOT NULL DEFAULT 0,
  `settings` int(1) NOT NULL DEFAULT 0,
  `credits` int(1) NOT NULL DEFAULT 0,
  `new_template` int(1) NOT NULL DEFAULT 0,
  `save_template` int(1) NOT NULL DEFAULT 0,
  `delete_template` int(1) NOT NULL DEFAULT 0,
  `edit_snippet` int(1) NOT NULL DEFAULT 0,
  `new_snippet` int(1) NOT NULL DEFAULT 0,
  `save_snippet` int(1) NOT NULL DEFAULT 0,
  `delete_snippet` int(1) NOT NULL DEFAULT 0,
  `edit_chunk` int(1) NOT NULL DEFAULT 0,
  `new_chunk` int(1) NOT NULL DEFAULT 0,
  `save_chunk` int(1) NOT NULL DEFAULT 0,
  `delete_chunk` int(1) NOT NULL DEFAULT 0,
  `empty_cache` int(1) NOT NULL DEFAULT 0,
  `edit_document` int(1) NOT NULL DEFAULT 0,
  `change_password` int(1) NOT NULL DEFAULT 0,
  `error_dialog` int(1) NOT NULL DEFAULT 0,
  `about` int(1) NOT NULL DEFAULT 0,
  `category_manager` int(1) NOT NULL DEFAULT 0,
  `file_manager` int(1) NOT NULL DEFAULT 0,
  `assets_files` int(1) NOT NULL DEFAULT 0,
  `assets_images` int(1) NOT NULL DEFAULT 0,
  `save_user` int(1) NOT NULL DEFAULT 0,
  `delete_user` int(1) NOT NULL DEFAULT 0,
  `save_password` int(11) NOT NULL DEFAULT 0,
  `edit_role` int(1) NOT NULL DEFAULT 0,
  `save_role` int(1) NOT NULL DEFAULT 0,
  `delete_role` int(1) NOT NULL DEFAULT 0,
  `new_role` int(1) NOT NULL DEFAULT 0,
  `access_permissions` int(1) NOT NULL DEFAULT 0,
  `bk_manager` int(1) NOT NULL DEFAULT 0,
  `new_plugin` int(1) NOT NULL DEFAULT 0,
  `edit_plugin` int(1) NOT NULL DEFAULT 0,
  `save_plugin` int(1) NOT NULL DEFAULT 0,
  `delete_plugin` int(1) NOT NULL DEFAULT 0,
  `new_module` int(1) NOT NULL DEFAULT 0,
  `edit_module` int(1) NOT NULL DEFAULT 0,
  `save_module` int(1) NOT NULL DEFAULT 0,
  `delete_module` int(1) NOT NULL DEFAULT 0,
  `exec_module` int(1) NOT NULL DEFAULT 0,
  `view_eventlog` int(1) NOT NULL DEFAULT 0,
  `delete_eventlog` int(1) NOT NULL DEFAULT 0,
  `new_web_user` int(1) NOT NULL DEFAULT 0,
  `edit_web_user` int(1) NOT NULL DEFAULT 0,
  `save_web_user` int(1) NOT NULL DEFAULT 0,
  `delete_web_user` int(1) NOT NULL DEFAULT 0,
  `web_access_permissions` int(1) NOT NULL DEFAULT 0,
  `view_unpublished` int(1) NOT NULL DEFAULT 0,
  `import_static` int(1) NOT NULL DEFAULT 0,
  `export_static` int(1) NOT NULL DEFAULT 0,
  `remove_locks` int(1) NOT NULL DEFAULT 0,
  `display_locks` int(1) NOT NULL DEFAULT 0,
  `change_resourcetype` int(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Contains information describing the user roles.';



# --------------------------------------------------------

#
# Table structure for table `evo_user_settings`
#

DROP TABLE IF EXISTS `evo_user_settings`;
CREATE TABLE `evo_user_settings` (
  `user` int(11) NOT NULL,
  `setting_name` varchar(50) NOT NULL DEFAULT '',
  `setting_value` text DEFAULT NULL,
  PRIMARY KEY (`user`,`setting_name`),
  KEY `setting_name` (`setting_name`),
  KEY `user` (`user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains backend user settings.';



# --------------------------------------------------------

#
# Table structure for table `evo_web_groups`
#

DROP TABLE IF EXISTS `evo_web_groups`;
CREATE TABLE `evo_web_groups` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `webgroup` int(10) NOT NULL DEFAULT 0,
  `webuser` int(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ix_group_user` (`webgroup`,`webuser`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains data used for web access permissions.';



# --------------------------------------------------------

#
# Table structure for table `evo_web_user_attributes`
#

DROP TABLE IF EXISTS `evo_web_user_attributes`;
CREATE TABLE `evo_web_user_attributes` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `internalKey` int(10) NOT NULL DEFAULT 0,
  `fullname` varchar(100) NOT NULL DEFAULT '',
  `role` int(10) NOT NULL DEFAULT 0,
  `email` varchar(100) NOT NULL DEFAULT '',
  `phone` varchar(100) NOT NULL DEFAULT '',
  `mobilephone` varchar(100) NOT NULL DEFAULT '',
  `blocked` int(1) NOT NULL DEFAULT 0,
  `blockeduntil` int(11) NOT NULL DEFAULT 0,
  `blockedafter` int(11) NOT NULL DEFAULT 0,
  `logincount` int(11) NOT NULL DEFAULT 0,
  `lastlogin` int(11) NOT NULL DEFAULT 0,
  `thislogin` int(11) NOT NULL DEFAULT 0,
  `failedlogincount` int(10) NOT NULL DEFAULT 0,
  `sessionid` varchar(100) NOT NULL DEFAULT '',
  `dob` int(10) NOT NULL DEFAULT 0,
  `gender` int(1) NOT NULL DEFAULT 0 COMMENT '0 - unknown, 1 - Male 2 - female',
  `country` varchar(25) NOT NULL DEFAULT '',
  `street` varchar(255) NOT NULL DEFAULT '',
  `city` varchar(255) NOT NULL DEFAULT '',
  `state` varchar(25) NOT NULL DEFAULT '',
  `zip` varchar(25) NOT NULL DEFAULT '',
  `fax` varchar(100) NOT NULL DEFAULT '',
  `photo` varchar(255) NOT NULL DEFAULT '' COMMENT 'link to photo',
  `comment` text DEFAULT NULL,
  `createdon` int(11) NOT NULL DEFAULT 0,
  `editedon` int(11) NOT NULL DEFAULT 0,
  `verified` int(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `userid` (`internalKey`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains information for web users.';



# --------------------------------------------------------

#
# Table structure for table `evo_web_user_settings`
#

DROP TABLE IF EXISTS `evo_web_user_settings`;
CREATE TABLE `evo_web_user_settings` (
  `webuser` int(11) NOT NULL,
  `setting_name` varchar(50) NOT NULL DEFAULT '',
  `setting_value` text DEFAULT NULL,
  PRIMARY KEY (`webuser`,`setting_name`),
  KEY `setting_name` (`setting_name`),
  KEY `webuserid` (`webuser`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains web user settings.';



# --------------------------------------------------------

#
# Table structure for table `evo_web_users`
#

DROP TABLE IF EXISTS `evo_web_users`;
CREATE TABLE `evo_web_users` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL DEFAULT '',
  `password` varchar(100) NOT NULL DEFAULT '',
  `cachepwd` varchar(100) NOT NULL DEFAULT '' COMMENT 'Store new unconfirmed password',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# --------------------------------------------------------

#
# Table structure for table `evo_webgroup_access`
#

DROP TABLE IF EXISTS `evo_webgroup_access`;
CREATE TABLE `evo_webgroup_access` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `webgroup` int(10) NOT NULL DEFAULT 0,
  `documentgroup` int(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains data used for web access permissions.';



# --------------------------------------------------------

#
# Table structure for table `evo_webgroup_names`
#

DROP TABLE IF EXISTS `evo_webgroup_names`;
CREATE TABLE `evo_webgroup_names` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(245) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains data used for web access permissions.';


#
# Dumping data for table `evo_active_user_locks`
#

#
# Dumping data for table `evo_active_user_sessions`
#

INSERT INTO `evo_active_user_sessions` VALUES
  ('nneathg0km11elihcossll0hra5f6o7b','1','1671495850','127.0.0.1');

#
# Dumping data for table `evo_active_users`
#

INSERT INTO `evo_active_users` VALUES
  ('sda65b9ukmlied89p15pnsal1bdndh8r','1','ProjectSoft','1671458257','93',NULL),
  ('nneathg0km11elihcossll0hra5f6o7b','1','ProjectSoft','1671495850','93',NULL);

#
# Dumping data for table `evo_categories`
#

INSERT INTO `evo_categories` VALUES
  ('1','SEO','0'),
  ('2','Js','0'),
  ('3','Manager and Admin','0'),
  ('4','Content','0'),
  ('5','Navigation','0'),
  ('6','TEMPLATES','0');

#
# Dumping data for table `evo_document_groups`
#

#
# Dumping data for table `evo_documentgroup_names`
#

#
# Dumping data for table `evo_event_log`
#

#
# Dumping data for table `evo_manager_log`
#

INSERT INTO `evo_manager_log` VALUES
  ('1','1671495842','1','ProjectSoft','54','-','evo_manager_log','Optimizing a table','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.5112.102 Safari/537.36 OPR/90.0.4480.84'),
  ('2','1671495842','1','ProjectSoft','93','-','-','Backup Manager','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.5112.102 Safari/537.36 OPR/90.0.4480.84');

#
# Dumping data for table `evo_manager_users`
#

INSERT INTO `evo_manager_users` VALUES
  ('1','ProjectSoft','$P$Bns/67yyGYQQSRsX5nLCCD0f1iy5ch.');

#
# Dumping data for table `evo_member_groups`
#

#
# Dumping data for table `evo_membergroup_access`
#

#
# Dumping data for table `evo_membergroup_names`
#

#
# Dumping data for table `evo_site_content`
#

INSERT INTO `evo_site_content` VALUES
  ('1','document','text/html','Главная','О ведомстве','Главная','index','','1','0','0','0','0','Главная','<p>Государственное казенное учреждение здравоохранения Республиканский медицинский центр мобилизационных резервов &laquo;Резерв&raquo; Министерства здравоохранения Республики Татарстан является &laquo;Учреждением здравоохранения особого типа&raquo; с единой номенклатурой государственных и муниципальных учреждений здравоохранения.</p>\n<p>Учреждение создано в соответствии с приказом Министерства здравоохранения Республики Татарстан от 14 декабря 1996г. № 750 в порядке реорганизации ранее действовавшей Базы специального медицинского снабжения Министерства здравоохранения Республики Татарстан, и является преемником ее прав и обязанностей</p>\n<p>Учреждение является некоммерческой организацией, финансируемой за счет средств бюджета, является юридическим лицом, имеет самостоятельный баланс, расчетный, валютный и иные счета в учреждениях банков.<br />Учредителем учреждения является Министерство здравоохранения Республики Татарстан в соответствии с распоряжением Министерства земельных и имущественных отношений Республики Татарстан от 27.02.2002г. № 128-р &laquo;О предоставлении полномочий Министерству здравоохранения Республики Татарстан&raquo;.</p>\n<p>Деятельность ГКУЗ РМЦ МР &laquo;Резерв&raquo; МЗ РТ направлена на обеспечение качественной и количественной сохранности материальных ценностей мобилизационного резерва и постоянной готовности ее к выдаче для использования по предназначению. Запасы мобилизационного резерва, медицинского назначения, независимо от места их размещения являются федеральной собственностью.</p>\n<p>Предпринимательскую деятельность Управление, ГКУЗ РМЦ МР &laquo;Резерв&raquo; МЗ РТ, не осуществляет.</p>','1','3','0','1','0','1','1130304721','1','1671494445','0','0','0','1130304721','1','Главная','0','0','0','0','0','1'),
  ('2','document','text/html','Руководитель','Руководитель','Руководитель','rukovoditel','','1','0','0','0','0','Руководитель','','1','3','1','1','0','1','1671480971','1','1671489186','0','0','0','1671480971','1','Руководитель','0','0','0','0','0','1'),
  ('3','document','text/html','Заместители','Заместители','Заместители','zamestiteli','','1','0','0','0','0','Заместители','','1','3','2','1','0','1','1671481100','1','1671489190','0','0','0','1671481100','1','Заместители','0','0','0','0','0','1'),
  ('4','document','text/html','Структура ведомства','Структура ведомства','Структура ведомства','struktura-vedomstva','','1','0','0','0','0','Структура ведомства','','1','3','3','1','1','1','1671481122','1','1671489232','0','0','0','1671481122','1','Структура ведомства','0','0','0','0','0','1'),
  ('5','document','text/html','Документы','Документы','Документы','dokumenty','','1','0','0','0','0','Документы','','1','3','4','1','0','1','1671481137','1','1671489198','0','0','0','1671481137','1','Документы','0','0','0','0','0','1'),
  ('6','document','text/html','assets','','','assets','','0','0','0','0','1','','','0','0','5','0','0','1','1671481182','1','1671481502','0','0','0','0','0','','1','0','0','0','0','0'),
  ('7','document','text/html','404 Not Found','404 Not Found','404 Not Found','404','','1','0','0','6','0','404 Not Found','','0','3','0','0','0','1','1671481246','1','1671481391','0','0','0','1671481246','1','404 Not Found','0','0','0','0','1','0'),
  ('9','document','text/html','Сайт в разработке','Сайт в разработке','Сайт в разработке','develop','','1','0','0','6','0','Сайт в разработке','','0','3','2','0','0','1','1671481439','1','1671481445','0','0','0','1671481439','1','Сайт в разработке','0','0','0','0','1','0'),
  ('8','document','text/html','401 Unauthorized','401 Unauthorized','401 Unauthorized','401','','1','0','0','6','0','401 Unauthorized','','0','3','1','0','0','1','1671481342','1','1671481364','0','0','0','1671481342','1','401 Unauthorized','0','0','0','0','1','0');

#
# Dumping data for table `evo_site_htmlsnippets`
#

INSERT INTO `evo_site_htmlsnippets` VALUES
  ('1','mm_rules','Default ManagerManager rules.','2','none','2','0','// more example rules are in assets/plugins/managermanager/example_mm_rules.inc.php\n// example of how PHP is allowed - check that a TV named documentTags exists before creating rule\n\nif ($modx->db->getValue($modx->db->select(\'count(id)\', $modx->getFullTableName(\'site_tmplvars\'), \"name=\'documentTags\'\"))) {\n	mm_widget_tags(\'documentTags\', \' \'); // Give blog tag editing capabilities to the \'documentTags (3)\' TV\n}\nmm_widget_showimagetvs(); // Always give a preview of Image TVs\n\n// mm_createTab(\'SEO\', \'seo\', \'\', \'\', \'\', \'\');\n// mm_moveFieldsToTab(\'titl,keyw,desc,seoOverride,noIndex,sitemap_changefreq,sitemap_priority,sitemap_exclude\', \'seo\', \'\', \'\');\nmm_widget_tags(\'keyw\',\',\'); // Give blog tag editing capabilities to the \'documentTags (3)\' TV\n\n\n//mm_createTab(\'Images\', \'photos\', \'\', \'\', \'\', \'850\');\n//mm_moveFieldsToTab(\'images,photos\', \'photos\', \'\', \'\');\n\n//mm_hideFields(\'longtitle,description,link_attributes,menutitle,content\', \'\', \'6,7\');\n\n//mm_hideTemplates(\'0,5,8,9,11,12\', \'2,3\');\n\n//mm_hideTabs(\'settings, access\', \'2\');\n','0','0','1671454851','0');

#
# Dumping data for table `evo_site_module_access`
#

#
# Dumping data for table `evo_site_module_depobj`
#

#
# Dumping data for table `evo_site_modules`
#

INSERT INTO `evo_site_modules` VALUES
  ('1','Doc Manager','<strong>1.1.1</strong> Quickly perform bulk updates to the Documents in your site including templates, publishing details, and permissions','0','0','3','0','0','','0','','0','0','docman435243542tf542t5t','1','[]',' \n/**\n * Doc Manager\n * \n * Quickly perform bulk updates to the Documents in your site including templates, publishing details, and permissions\n * \n * @category	module\n * @version 	1.1.1\n * @license 	http://www.gnu.org/copyleft/gpl.html GNU Public License (GPL)\n * @internal	@properties\n * @internal	@guid docman435243542tf542t5t	\n * @internal	@shareparams 1\n * @internal	@dependencies requires files located at /assets/modules/docmanager/\n * @internal	@modx_category Manager and Admin\n * @internal    @installset base, sample\n * @lastupdate  09/04/2016\n */\n\ninclude_once(MODX_BASE_PATH.\'assets/modules/docmanager/classes/docmanager.class.php\');\ninclude_once(MODX_BASE_PATH.\'assets/modules/docmanager/classes/dm_frontend.class.php\');\ninclude_once(MODX_BASE_PATH.\'assets/modules/docmanager/classes/dm_backend.class.php\');\n\n$dm = new DocManager($modx);\n$dmf = new DocManagerFrontend($dm, $modx);\n$dmb = new DocManagerBackend($dm, $modx);\n\n$dm->ph = $dm->getLang();\n$dm->ph[\'theme\'] = $dm->getTheme();\n$dm->ph[\'ajax.endpoint\'] = MODX_SITE_URL.\'assets/modules/docmanager/tv.ajax.php\';\n$dm->ph[\'datepicker.offset\'] = $modx->config[\'datepicker_offset\'];\n$dm->ph[\'datetime.format\'] = $modx->config[\'datetime_format\'];\n\nif (isset($_POST[\'tabAction\'])) {\n    $dmb->handlePostback();\n} else {\n    $dmf->getViews();\n    echo $dm->parseTemplate(\'main.tpl\', $dm->ph);\n}'),
  ('2','Extras','<strong>0.1.4</strong> first repository for Evolution CMS','0','0','3','0','0','','0','','0','0','store435243542tf542t5t','1','[]',' \n/**\n * Extras\n * \n * first repository for Evolution CMS\n * \n * @category	module\n * @version 	0.1.4\n * @internal	@properties\n * @internal	@guid store435243542tf542t5t	\n * @internal	@shareparams 1\n * @internal	@dependencies requires files located at /assets/modules/store/\n * @internal	@modx_category Manager and Admin\n * @internal    @installset base, sample\n * @lastupdate  25/11/2016\n */\n\n//AUTHORS: Bumkaka & Dmi3yy \ninclude_once(\'../assets/modules/store/core.php\');');

#
# Dumping data for table `evo_site_plugin_events`
#

INSERT INTO `evo_site_plugin_events` VALUES
  ('1','24','0'),
  ('1','30','0'),
  ('1','39','0'),
  ('1','45','0'),
  ('1','51','0'),
  ('1','77','0'),
  ('1','95','0'),
  ('2','26','0'),
  ('2','28','0'),
  ('2','41','0'),
  ('2','43','0'),
  ('2','47','0'),
  ('2','49','0'),
  ('2','53','0'),
  ('2','55','0'),
  ('2','59','0'),
  ('2','61','0'),
  ('2','79','0'),
  ('2','81','0'),
  ('2','121','0'),
  ('2','125','0'),
  ('2','126','0'),
  ('3','84','0'),
  ('3','85','0'),
  ('3','105','0'),
  ('4','29','0'),
  ('4','30','1'),
  ('4','31','0'),
  ('4','32','0'),
  ('4','39','1'),
  ('4','57','0');

INSERT INTO `evo_site_plugin_events` VALUES
  ('4','120','0'),
  ('5','117','0'),
  ('6','3','0'),
  ('6','21','0'),
  ('6','90','0'),
  ('6','94','0'),
  ('6','95','1'),
  ('6','101','0'),
  ('6','102','0'),
  ('7','112','0'),
  ('8','74','0'),
  ('8','117','1'),
  ('8','134','0'),
  ('9','4','0'),
  ('9','7','0'),
  ('9','83','0'),
  ('9','97','0'),
  ('9','134','1'),
  ('10','24','1'),
  ('10','30','2'),
  ('10','39','2'),
  ('10','45','1'),
  ('10','51','1'),
  ('10','63','0'),
  ('10','69','0');

#
# Dumping data for table `evo_site_plugins`
#

INSERT INTO `evo_site_plugins` VALUES
  ('1','CodeMirror','<strong>1.5.1</strong> JavaScript library that can be used to create a relatively pleasant editor interface based on CodeMirror 5.33 (released on 21-12-2017)','0','3','0','\n/**\n * CodeMirror\n *\n * JavaScript library that can be used to create a relatively pleasant editor interface based on CodeMirror 5.33 (released on 21-12-2017)\n *\n * @category    plugin\n * @version     1.5.1\n * @license     http://www.gnu.org/copyleft/gpl.html GNU Public License (GPL)\n * @package     evo\n * @internal    @events OnDocFormRender,OnChunkFormRender,OnModFormRender,OnPluginFormRender,OnSnipFormRender,OnTempFormRender,OnRichTextEditorInit\n * @internal    @modx_category Manager and Admin\n * @internal    @properties &theme=Theme;list;default,ambiance,blackboard,cobalt,eclipse,elegant,erlang-dark,lesser-dark,midnight,monokai,neat,night,one-dark,rubyblue,solarized,twilight,vibrant-ink,xq-dark,xq-light;default &darktheme=Dark Theme;list;default,ambiance,blackboard,cobalt,eclipse,elegant,erlang-dark,lesser-dark,midnight,monokai,neat,night,one-dark,rubyblue,solarized,twilight,vibrant-ink,xq-dark,xq-light;one-dark &fontSize=Font-size;list;10,11,12,13,14,15,16,17,18;14 &lineHeight=Line-height;list;1,1.1,1.2,1.3,1.4,1.5;1.3 &indentUnit=Indent unit;int;4 &tabSize=The width of a tab character;int;4 &lineWrapping=lineWrapping;list;true,false;true &matchBrackets=matchBrackets;list;true,false;true &activeLine=activeLine;list;true,false;false &emmet=emmet;list;true,false;true &search=search;list;true,false;false &indentWithTabs=indentWithTabs;list;true,false;true &undoDepth=undoDepth;int;200 &historyEventDelay=historyEventDelay;int;1250\n * @internal    @installset base\n * @reportissues https://github.com/evolution-cms/evolution/issues/\n * @documentation Official docs https://codemirror.net/doc/manual.html\n * @author      hansek from http://www.modxcms.cz\n * @author      update Mihanik71\n * @author      update Deesen\n * @author      update 64j\n * @lastupdate  08-01-2018\n */\n\n$_CM_BASE = \'assets/plugins/codemirror/\';\n\n$_CM_URL = $modx->config[\'site_url\'] . $_CM_BASE;\n\nrequire(MODX_BASE_PATH. $_CM_BASE .\'codemirror.plugin.php\');','0','{\"theme\":[{\"label\":\"Theme\",\"type\":\"list\",\"value\":\"default\",\"options\":\"default,ambiance,blackboard,cobalt,eclipse,elegant,erlang-dark,lesser-dark,midnight,monokai,neat,night,one-dark,rubyblue,solarized,twilight,vibrant-ink,xq-dark,xq-light\",\"default\":\"default\",\"desc\":\"\"}],\"darktheme\":[{\"label\":\"Dark Theme\",\"type\":\"list\",\"value\":\"one-dark\",\"options\":\"default,ambiance,blackboard,cobalt,eclipse,elegant,erlang-dark,lesser-dark,midnight,monokai,neat,night,one-dark,rubyblue,solarized,twilight,vibrant-ink,xq-dark,xq-light\",\"default\":\"one-dark\",\"desc\":\"\"}],\"fontSize\":[{\"label\":\"Font-size\",\"type\":\"list\",\"value\":\"14\",\"options\":\"10,11,12,13,14,15,16,17,18\",\"default\":\"14\",\"desc\":\"\"}],\"lineHeight\":[{\"label\":\"Line-height\",\"type\":\"list\",\"value\":\"1.3\",\"options\":\"1,1.1,1.2,1.3,1.4,1.5\",\"default\":\"1.3\",\"desc\":\"\"}],\"indentUnit\":[{\"label\":\"Indent unit\",\"type\":\"int\",\"value\":\"4\",\"default\":\"4\",\"desc\":\"\"}],\"tabSize\":[{\"label\":\"The width of a tab character\",\"type\":\"int\",\"value\":\"4\",\"default\":\"4\",\"desc\":\"\"}],\"lineWrapping\":[{\"label\":\"lineWrapping\",\"type\":\"list\",\"value\":\"true\",\"options\":\"true,false\",\"default\":\"true\",\"desc\":\"\"}],\"matchBrackets\":[{\"label\":\"matchBrackets\",\"type\":\"list\",\"value\":\"true\",\"options\":\"true,false\",\"default\":\"true\",\"desc\":\"\"}],\"activeLine\":[{\"label\":\"activeLine\",\"type\":\"list\",\"value\":\"false\",\"options\":\"true,false\",\"default\":\"false\",\"desc\":\"\"}],\"emmet\":[{\"label\":\"emmet\",\"type\":\"list\",\"value\":\"true\",\"options\":\"true,false\",\"default\":\"true\",\"desc\":\"\"}],\"search\":[{\"label\":\"search\",\"type\":\"list\",\"value\":\"false\",\"options\":\"true,false\",\"default\":\"false\",\"desc\":\"\"}],\"indentWithTabs\":[{\"label\":\"indentWithTabs\",\"type\":\"list\",\"value\":\"true\",\"options\":\"true,false\",\"default\":\"true\",\"desc\":\"\"}],\"undoDepth\":[{\"label\":\"undoDepth\",\"type\":\"int\",\"value\":\"200\",\"default\":\"200\",\"desc\":\"\"}],\"historyEventDelay\":[{\"label\":\"historyEventDelay\",\"type\":\"int\",\"value\":\"1250\",\"default\":\"1250\",\"desc\":\"\"}]}','0','','0','0'),
  ('2','ElementsInTree','<strong>1.5.11</strong> Get access to all Elements and Modules inside Manager sidebar','0','3','0','require MODX_BASE_PATH.\'assets/plugins/elementsintree/plugin.elementsintree.php\';\n','0','{\n  \"adminRoleOnly\": [\n    {\n      \"label\": \"Administrators only\",\n      \"type\": \"list\",\n      \"value\": \"yes\",\n      \"options\": \"yes,no\",\n      \"default\": \"yes\",\n      \"desc\": \"\"\n    }\n  ],\n  \"treeButtonsInTab\": [\n    {\n      \"label\": \"Tree buttons in tab\",\n      \"type\": \"list\",\n      \"value\": \"yes\",\n      \"options\": \"yes,no\",\n      \"default\": \"yes\",\n      \"desc\": \"\"\n    }\n  ]\n}','0',' ','0','1671454625'),
  ('3','Forgot Manager Login','<strong>1.1.7</strong> Resets your manager login when you forget your password via email confirmation','0','3','0','require MODX_BASE_PATH.\'assets/plugins/forgotmanagerlogin/plugin.forgotmanagerlogin.php\';','0','[]','0','','0','0'),
  ('4','ManagerManager','<strong>0.6.4</strong> Customize the EVO Manager to offer bespoke admin functions for end users or manipulate the display of document fields in the manager.','0','3','0','\n/**\n * ManagerManager\n *\n * Customize the EVO Manager to offer bespoke admin functions for end users or manipulate the display of document fields in the manager.\n *\n * @category plugin\n * @version 0.6.4\n * @license http://creativecommons.org/licenses/GPL/2.0/ GNU Public License (GPL v2)\n * @internal @properties &remove_deprecated_tv_types_pref=Remove deprecated TV types;list;yes,no;yes &config_chunk=Configuration Chunk;text;mm_rules\n * @internal @events OnDocFormRender,OnDocFormPrerender,OnBeforeDocFormSave,OnDocFormSave,OnDocDuplicate,OnPluginFormRender,OnTVFormRender\n * @internal @modx_category Manager and Admin\n * @internal @installset base\n * @internal @legacy_names Image TV Preview, Show Image TVs\n * @reportissues https://github.com/DivanDesign/MODXEvo.plugin.ManagerManager/\n * @documentation README [+site_url+]assets/plugins/managermanager/readme.html\n * @documentation Official docs http://code.divandesign.biz/modx/managermanager\n * @link        Latest version http://code.divandesign.biz/modx/managermanager\n * @link        Additional tools http://code.divandesign.biz/modx\n * @link        Full changelog http://code.divandesign.biz/modx/managermanager/changelog\n * @author      Inspired by: HideEditor plugin by Timon Reinhard and Gildas; HideManagerFields by Brett @ The Man Can!\n * @author      DivanDesign studio http://www.DivanDesign.biz\n * @author      Nick Crossland http://www.rckt.co.uk\n * @author      Many others\n * @lastupdate  22/01/2018\n */\n\n// Run the main code\ninclude($modx->config[\'base_path\'].\'assets/plugins/managermanager/mm.inc.php\');\n','0','{\"remove_deprecated_tv_types_pref\":[{\"label\":\"Remove deprecated TV types\",\"type\":\"list\",\"value\":\"yes\",\"options\":\"yes,no\",\"default\":\"yes\",\"desc\":\"\"}],\"config_chunk\":[{\"label\":\"Configuration Chunk\",\"type\":\"text\",\"value\":\"mm_rules\",\"default\":\"mm_rules\",\"desc\":\"\"}]}','0','','0','0'),
  ('5','OutdatedExtrasCheck','<strong>1.4.7</strong> Check for Outdated critical extras not compatible with EVO 1.4.6','0','3','0','/**\n * OutdatedExtrasCheck\n *\n * Check for Outdated critical extras not compatible with EVO 1.4.6\n *\n * @category	plugin\n * @version     1.4.7\n * @license 	http://www.gnu.org/copyleft/gpl.html GNU Public License (GPL)\n * @package     evo\n * @author      Author: Nicola Lambathakis\n * @internal    @events OnManagerWelcomeHome\n * @internal    @properties &wdgVisibility=Show widget for:;menu;All,AdminOnly,AdminExcluded,ThisRoleOnly,ThisUserOnly;AdminOnly &ThisRole=Run only for this role:;string;;;(role id) &ThisUser=Run only for this user:;string;;;(username)\n * @internal    @modx_category Manager and Admin\n * @internal    @installset base\n * @internal    @disabled 0\n */\n\nrequire MODX_BASE_PATH . \'assets/plugins/extrascheck/OutdatedExtrasCheck.plugin.php\';\n','0','{\"wdgVisibility\":[{\"label\":\"Show widget for:\",\"type\":\"menu\",\"value\":\"AdminOnly\",\"options\":\"All,AdminOnly,AdminExcluded,ThisRoleOnly,ThisUserOnly\",\"default\":\"AdminOnly\",\"desc\":\"\"}],\"ThisRole\":[{\"label\":\"Run only for this role:\",\"type\":\"string\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}],\"ThisUser\":[{\"label\":\"Run only for this user:\",\"type\":\"string\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}]}','0','','0','0'),
  ('6','TinyMCE4','<strong>4.9.12</strong> Javascript rich text editor','0','3','0','\n/**\n * TinyMCE4\n *\n * Javascript rich text editor\n *\n * @category    plugin\n * @version     4.9.12\n * @license     http://www.gnu.org/copyleft/gpl.html GNU Public License (GPL)\n * @internal    @properties &styleFormats=Custom Style Formats <b>RAW</b><br/><br/><ul><li>leave empty to use below block/inline formats</li><li>allows simple-format: <i>Title,cssClass|Title2,cssClass2</i></li><li>Also accepts full JSON-config as per TinyMCE4 docs / configure / content-formating / style_formats</li></ul>;textarea; &styleFormats_inline=Custom Style Formats <b>INLINE</b><br/><br/><ul><li>will wrap selected text with span-tag + css-class</li><li>simple-format only</li></ul>;textarea;InlineTitle,cssClass1|InlineTitle2,cssClass2 &styleFormats_block=Custom Style Formats <b>BLOCK</b><br/><br/><ul><li>will add css-class to selected block-element</li><li>simple-format only</li></ul>;textarea;BlockTitle,cssClass3|BlockTitle2,cssClass4 &customParams=Custom Parameters<br/><b>(Be careful or leave empty!)</b>;textarea; &entityEncoding=Entity Encoding;list;named,numeric,raw;named &entities=Entities;text; &pathOptions=Path Options;list;Site config,Absolute path,Root relative,URL,No convert;Site config &resizing=Advanced Resizing;list;true,false;false &disabledButtons=Disabled Buttons;text; &webTheme=Web Theme;test;webuser &webPlugins=Web Plugins;text; &webButtons1=Web Buttons 1;text;bold italic underline strikethrough removeformat alignleft aligncenter alignright &webButtons2=Web Buttons 2;text;link unlink image undo redo &webButtons3=Web Buttons 3;text; &webButtons4=Web Buttons 4;text; &webAlign=Web Toolbar Alignment;list;ltr,rtl;ltr &width=Width;text;100% &height=Height;text;400px &introtextRte=<b>Introtext RTE</b><br/>add richtext-features to \"introtext\";list;enabled,disabled;disabled &inlineMode=<b>Inline-Mode</b>;list;enabled,disabled;disabled &inlineTheme=<b>Inline-Mode</b><br/>Theme;text;inline &browser_spellcheck=<b>Browser Spellcheck</b><br/>At least one dictionary must be installed inside your browser;list;enabled,disabled;disabled &paste_as_text=<b>Force Paste as Text</b>;list;enabled,disabled;disabled\n * @internal    @events OnLoadWebDocument,OnParseDocument,OnWebPagePrerender,OnLoadWebPageCache,OnRichTextEditorRegister,OnRichTextEditorInit,OnInterfaceSettingsRender\n * @internal    @modx_category Manager and Admin\n * @internal    @legacy_names TinyMCE Rich Text Editor\n * @internal    @installset base\n * @logo        /assets/plugins/tinymce4/tinymce/logo.png\n * @reportissues https://github.com/extras-evolution/tinymce4-for-modx-evo\n * @documentation Plugin docs https://github.com/extras-evolution/tinymce4-for-modx-evo\n * @documentation Official TinyMCE4-docs https://www.tinymce.com/docs/\n * @author      Deesen\n * @lastupdate  2018-01-17\n */\nif (!defined(\'MODX_BASE_PATH\')) { die(\'What are you doing? Get out of here!\'); }\n\nrequire(MODX_BASE_PATH.\"assets/plugins/tinymce4/plugin.tinymce.inc.php\");\n','0','{\"styleFormats\":[{\"label\":\"Custom Style Formats <b>RAW<\\/b><br\\/><br\\/><ul><li>leave empty to use below block\\/inline formats<\\/li><li>allows simple-format: <i>Title,cssClass|Title2,cssClass2<\\/i><\\/li><li>Also accepts full JSON-config as per TinyMCE4 docs \\/ configure \\/ content-formating \\/ style_formats<\\/li><\\/ul>\",\"type\":\"textarea\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}],\"styleFormats_inline\":[{\"label\":\"Custom Style Formats <b>INLINE<\\/b><br\\/><br\\/><ul><li>will wrap selected text with span-tag + css-class<\\/li><li>simple-format only<\\/li><\\/ul>\",\"type\":\"textarea\",\"value\":\"InlineTitle,cssClass1|InlineTitle2,cssClass2\",\"default\":\"InlineTitle,cssClass1|InlineTitle2,cssClass2\",\"desc\":\"\"}],\"styleFormats_block\":[{\"label\":\"Custom Style Formats <b>BLOCK<\\/b><br\\/><br\\/><ul><li>will add css-class to selected block-element<\\/li><li>simple-format only<\\/li><\\/ul>\",\"type\":\"textarea\",\"value\":\"BlockTitle,cssClass3|BlockTitle2,cssClass4\",\"default\":\"BlockTitle,cssClass3|BlockTitle2,cssClass4\",\"desc\":\"\"}],\"customParams\":[{\"label\":\"Custom Parameters<br\\/><b>(Be careful or leave empty!)<\\/b>\",\"type\":\"textarea\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}],\"entityEncoding\":[{\"label\":\"Entity Encoding\",\"type\":\"list\",\"value\":\"named\",\"options\":\"named,numeric,raw\",\"default\":\"named\",\"desc\":\"\"}],\"entities\":[{\"label\":\"Entities\",\"type\":\"text\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}],\"pathOptions\":[{\"label\":\"Path Options\",\"type\":\"list\",\"value\":\"Site config\",\"options\":\"Site config,Absolute path,Root relative,URL,No convert\",\"default\":\"Site config\",\"desc\":\"\"}],\"resizing\":[{\"label\":\"Advanced Resizing\",\"type\":\"list\",\"value\":\"false\",\"options\":\"true,false\",\"default\":\"false\",\"desc\":\"\"}],\"disabledButtons\":[{\"label\":\"Disabled Buttons\",\"type\":\"text\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}],\"webTheme\":[{\"label\":\"Web Theme\",\"type\":\"test\",\"value\":\"webuser\",\"default\":\"webuser\",\"desc\":\"\"}],\"webPlugins\":[{\"label\":\"Web Plugins\",\"type\":\"text\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}],\"webButtons1\":[{\"label\":\"Web Buttons 1\",\"type\":\"text\",\"value\":\"bold italic underline strikethrough removeformat alignleft aligncenter alignright\",\"default\":\"bold italic underline strikethrough removeformat alignleft aligncenter alignright\",\"desc\":\"\"}],\"webButtons2\":[{\"label\":\"Web Buttons 2\",\"type\":\"text\",\"value\":\"link unlink image undo redo\",\"default\":\"link unlink image undo redo\",\"desc\":\"\"}],\"webButtons3\":[{\"label\":\"Web Buttons 3\",\"type\":\"text\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}],\"webButtons4\":[{\"label\":\"Web Buttons 4\",\"type\":\"text\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}],\"webAlign\":[{\"label\":\"Web Toolbar Alignment\",\"type\":\"list\",\"value\":\"ltr\",\"options\":\"ltr,rtl\",\"default\":\"ltr\",\"desc\":\"\"}],\"width\":[{\"label\":\"Width\",\"type\":\"text\",\"value\":\"100%\",\"default\":\"100%\",\"desc\":\"\"}],\"height\":[{\"label\":\"Height\",\"type\":\"text\",\"value\":\"400px\",\"default\":\"400px\",\"desc\":\"\"}],\"introtextRte\":[{\"label\":\"<b>Introtext RTE<\\/b><br\\/>add richtext-features to \\\"introtext\\\"\",\"type\":\"list\",\"value\":\"disabled\",\"options\":\"enabled,disabled\",\"default\":\"disabled\",\"desc\":\"\"}],\"inlineMode\":[{\"label\":\"<b>Inline-Mode<\\/b>\",\"type\":\"list\",\"value\":\"disabled\",\"options\":\"enabled,disabled\",\"default\":\"disabled\",\"desc\":\"\"}],\"inlineTheme\":[{\"label\":\"<b>Inline-Mode<\\/b><br\\/>Theme\",\"type\":\"text\",\"value\":\"inline\",\"default\":\"inline\",\"desc\":\"\"}],\"browser_spellcheck\":[{\"label\":\"<b>Browser Spellcheck<\\/b><br\\/>At least one dictionary must be installed inside your browser\",\"type\":\"list\",\"value\":\"disabled\",\"options\":\"enabled,disabled\",\"default\":\"disabled\",\"desc\":\"\"}],\"paste_as_text\":[{\"label\":\"<b>Force Paste as Text<\\/b>\",\"type\":\"list\",\"value\":\"disabled\",\"options\":\"enabled,disabled\",\"default\":\"disabled\",\"desc\":\"\"}]}','0','','0','0'),
  ('7','TransAlias','<strong>1.0.4</strong> Human readible URL translation supporting multiple languages and overrides','0','3','0','require MODX_BASE_PATH.\'assets/plugins/transalias/plugin.transalias.php\';','0','{\"table_name\":[{\"label\":\"Trans table\",\"type\":\"list\",\"value\":\"russian\",\"options\":\"common,russian,dutch,german,czech,utf8,utf8lowercase\",\"default\":\"russian\",\"desc\":\"\"}],\"char_restrict\":[{\"label\":\"Restrict alias to\",\"type\":\"list\",\"value\":\"lowercase alphanumeric\",\"options\":\"lowercase alphanumeric,alphanumeric,legal characters\",\"default\":\"lowercase alphanumeric\",\"desc\":\"\"}],\"remove_periods\":[{\"label\":\"Remove Periods\",\"type\":\"list\",\"value\":\"No\",\"options\":\"Yes,No\",\"default\":\"No\",\"desc\":\"\"}],\"word_separator\":[{\"label\":\"Word Separator\",\"type\":\"list\",\"value\":\"dash\",\"options\":\"dash,underscore,none\",\"default\":\"dash\",\"desc\":\"\"}],\"override_tv\":[{\"label\":\"Override TV name\",\"type\":\"string\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}]}','0','','0','0'),
  ('8','Updater','<strong>0.8.7</strong> show message about outdated CMS version','0','3','0','require MODX_BASE_PATH.\'assets/plugins/updater/plugin.updater.php\';','0','{\"version\":[{\"label\":\"Version:\",\"type\":\"text\",\"value\":\"evocms-community\\/evolution\",\"default\":\"evocms-community\\/evolution\",\"desc\":\"\"}],\"wdgVisibility\":[{\"label\":\"Show widget for:\",\"type\":\"menu\",\"value\":\"All\",\"options\":\"All,AdminOnly,AdminExcluded,ThisRoleOnly,ThisUserOnly\",\"default\":\"All\",\"desc\":\"\"}],\"ThisRole\":[{\"label\":\"Show only to this role id:\",\"type\":\"string\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}],\"ThisUser\":[{\"label\":\"Show only to this username:\",\"type\":\"string\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}],\"showButton\":[{\"label\":\"Show Update Button:\",\"type\":\"menu\",\"value\":\"AdminOnly\",\"options\":\"show,hide,AdminOnly\",\"default\":\"AdminOnly\",\"desc\":\"\"}],\"type\":[{\"label\":\"Type:\",\"type\":\"menu\",\"value\":\"tags\",\"options\":\"tags,releases,commits\",\"default\":\"tags\",\"desc\":\"\"}],\"branch\":[{\"label\":\"Commit branch:\",\"type\":\"text\",\"value\":\"1.4.x\",\"default\":\"1.4.x\",\"desc\":\"\"}],\"commitCount\":[{\"label\":\"Commits count\",\"type\":\"text\",\"value\":\"20\",\"default\":\"20\",\"desc\":\"\"}],\"stableOnly\":[{\"label\":\"Offer upgrade to stable version only:\",\"type\":\"list\",\"value\":\"true\",\"options\":\"true,false\",\"default\":\"true\",\"desc\":\"\"}]}','0','','0','0'),
  ('9','userHelper','<strong>1.19.4</strong> addition to FormLister','0','4','0','/**\n * userHelper\n * \n * addition to FormLister\n * \n * @category    plugin\n * @version     1.19.4\n * @internal    @properties &model=Model;text;\\\\modUsers &logoutKey=Request key;text;logout &cookieName=Cookie Name;text;WebLoginPE &cookieLifetime=Cookie Lifetime, seconds;text;157680000 &maxFails=Max failed logins;text;3 &blockTime=Block for, seconds;text;3600 &trackWebUserActivity=Track web user activity;list;No,Yes;No\n * @internal    @events OnWebAuthentication,OnWebPageInit,OnPageNotFound,OnWebLogin,OnWebSaveUser\n * @internal    @modx_category Content\n * @internal    @disabled 1\n**/\n\nrequire MODX_BASE_PATH.\'assets/snippets/FormLister/plugin.userHelper.php\';\n','0','{\n  \"model\": [\n    {\n      \"label\": \"Model\",\n      \"type\": \"text\",\n      \"value\": \"\\\\\\\\modUsers\",\n      \"default\": \"\\\\\\\\modUsers\",\n      \"desc\": \"\"\n    }\n  ],\n  \"logoutKey\": [\n    {\n      \"label\": \"Request key\",\n      \"type\": \"text\",\n      \"value\": \"logout\",\n      \"default\": \"logout\",\n      \"desc\": \"\"\n    }\n  ],\n  \"cookieName\": [\n    {\n      \"label\": \"Cookie Name\",\n      \"type\": \"text\",\n      \"value\": \"WebLoginPE\",\n      \"default\": \"WebLoginPE\",\n      \"desc\": \"\"\n    }\n  ],\n  \"cookieLifetime\": [\n    {\n      \"label\": \"Cookie Lifetime, seconds\",\n      \"type\": \"text\",\n      \"value\": \"157680000\",\n      \"default\": \"157680000\",\n      \"desc\": \"\"\n    }\n  ],\n  \"maxFails\": [\n    {\n      \"label\": \"Max failed logins\",\n      \"type\": \"text\",\n      \"value\": \"3\",\n      \"default\": \"3\",\n      \"desc\": \"\"\n    }\n  ],\n  \"blockTime\": [\n    {\n      \"label\": \"Block for, seconds\",\n      \"type\": \"text\",\n      \"value\": \"3600\",\n      \"default\": \"3600\",\n      \"desc\": \"\"\n    }\n  ],\n  \"trackWebUserActivity\": [\n    {\n      \"label\": \"Track web user activity\",\n      \"type\": \"list\",\n      \"value\": \"No\",\n      \"options\": \"No,Yes\",\n      \"default\": \"No\",\n      \"desc\": \"\"\n    }\n  ]\n}','0',' ','0','1671454616'),
  ('10','EvoFileManagerDialog','<strong>1.2.3</strong> Открыте файлменеджера в окне редактирования документа, а не в новом окне браузера.','0','3','0','require MODX_BASE_PATH.\'assets/plugins/filemanageropen/plugin.filemanageropen.php\';\n','0','{\"show_buttons\":[{\"label\":\"Показать кнопки файлменеджера в ресурсе\",\"type\":\"list\",\"value\":\"1\",\"options\":\"0,1\",\"default\":\"1\",\"desc\":\"\"}],\"show_alert_copy\":[{\"label\":\"Показать сообщение о копировании пути в FileManager\",\"type\":\"list\",\"value\":\"0\",\"options\":\"0,1\",\"default\":\"0\",\"desc\":\"\"}]}','0','','0','0');

#
# Dumping data for table `evo_site_snippets`
#

INSERT INTO `evo_site_snippets` VALUES
  ('1','DLCrumbs','<strong>1.2</strong> DLCrumbs','0','5','0','return require MODX_BASE_PATH.\'assets/snippets/DocLister/snippet.DLCrumbs.php\';\n','0','[]','','0','0','0'),
  ('2','DLMenu','<strong>1.4.0</strong> Snippet to build menu with DocLister','0','5','0','return require MODX_BASE_PATH.\'assets/snippets/DocLister/snippet.DLMenu.php\';\n','0','[]','','0','0','0'),
  ('3','DLSitemap','<strong>1.0.2</strong> Snippet to build XML sitemap','0','4','0','return require MODX_BASE_PATH.\'assets/snippets/DocLister/snippet.DLSitemap.php\';\n','0','[]','','0','0','0'),
  ('4','DocInfo','<strong>0.4.1</strong> Take any field from any document (fewer requests than GetField)','0','4','0','return require MODX_BASE_PATH.\'assets/snippets/docinfo/snippet.docinfo.php\';\n','0','[]','','0','0','0'),
  ('5','DocLister','<strong>2.7.3</strong> Snippet to display the information of the tables by the description rules. The main goal - replacing Ditto and CatalogView','0','4','0','return require MODX_BASE_PATH.\'assets/snippets/DocLister/snippet.DocLister.php\';\n','0','[]','','0','0','0'),
  ('6','FormLister','<strong>1.19.4</strong> Form processor','0','4','0','return require MODX_BASE_PATH.\'assets/snippets/FormLister/snippet.FormLister.php\';\n','0','[]','','0','0','0'),
  ('7','if','<strong>1.3.1</strong> A simple conditional snippet. Allows for eq/neq/lt/gt/etc logic within templates, resources, chunks, etc.','0','5','0','return require MODX_BASE_PATH.\'assets/snippets/if/snippet.if.php\';','0','[]','','0','0','0'),
  ('8','phpthumb','<strong>1.4.2</strong> PHPThumb creates thumbnails and altered images on the fly and caches them','0','4','0','return require MODX_BASE_PATH.\'assets/snippets/phpthumb/snippet.phpthumb.php\';\n','0','[]','','0','0','0'),
  ('9','summary','<strong>2.0.2</strong> Truncates the string to the specified length','0','4','0','return require MODX_BASE_PATH.\'assets/snippets/summary/snippet.summary.php\';','0','[]','','0','0','0');

#
# Dumping data for table `evo_site_templates`
#

INSERT INTO `evo_site_templates` VALUES
  ('3','Шаблон «Главная страница»',NULL,'','0','6','','0','{{@FILE assets/templates/projectsoft/html/index.html}}','0','1','0','1671454820');

#
# Dumping data for table `evo_site_tmplvar_access`
#

#
# Dumping data for table `evo_site_tmplvar_contentvalues`
#

#
# Dumping data for table `evo_site_tmplvar_templates`
#

INSERT INTO `evo_site_tmplvar_templates` VALUES
  ('1','3','1'),
  ('2','3','2'),
  ('4','3','3'),
  ('3','3','4');

#
# Dumping data for table `evo_site_tmplvars`
#

INSERT INTO `evo_site_tmplvars` VALUES
  ('1','textarea','desc','Meta description','Meta description','0','1','0','','0','','','[*introtext*]','0','0'),
  ('2','text','keyw','Meta keywords','Meta keywords','0','1','0','','0','','','[*pagetitle*]','0','0'),
  ('3','checkbox','noIndex','No index page','Meta robots','0','1','0','Нет==<meta name=\"robots\" content=\"noindex, nofollow\">','0','','','','0','0'),
  ('4','text','titl','Meta title','Meta title','0','1','0','','0','','','[*pagetitle*] - [(site_name)]','0','0');

#
# Dumping data for table `evo_system_eventnames`
#

INSERT INTO `evo_system_eventnames` VALUES
  ('1','OnDocPublished','5',''),
  ('2','OnDocUnPublished','5',''),
  ('3','OnWebPagePrerender','5',''),
  ('4','OnWebLogin','3',''),
  ('5','OnBeforeWebLogout','3',''),
  ('6','OnWebLogout','3',''),
  ('7','OnWebSaveUser','3',''),
  ('8','OnWebDeleteUser','3',''),
  ('9','OnWebChangePassword','3',''),
  ('10','OnWebCreateGroup','3',''),
  ('11','OnManagerLogin','2',''),
  ('12','OnBeforeManagerLogout','2',''),
  ('13','OnManagerLogout','2',''),
  ('14','OnManagerSaveUser','2',''),
  ('15','OnManagerDeleteUser','2',''),
  ('16','OnManagerChangePassword','2',''),
  ('17','OnManagerCreateGroup','2',''),
  ('18','OnBeforeCacheUpdate','4',''),
  ('19','OnCacheUpdate','4',''),
  ('20','OnMakePageCacheKey','4',''),
  ('21','OnLoadWebPageCache','4',''),
  ('22','OnBeforeSaveWebPageCache','4',''),
  ('23','OnChunkFormPrerender','1','Chunks'),
  ('24','OnChunkFormRender','1','Chunks'),
  ('25','OnBeforeChunkFormSave','1','Chunks'),
  ('26','OnChunkFormSave','1','Chunks'),
  ('27','OnBeforeChunkFormDelete','1','Chunks'),
  ('28','OnChunkFormDelete','1','Chunks'),
  ('29','OnDocFormPrerender','1','Documents'),
  ('30','OnDocFormRender','1','Documents'),
  ('31','OnBeforeDocFormSave','1','Documents');

INSERT INTO `evo_system_eventnames` VALUES
  ('32','OnDocFormSave','1','Documents'),
  ('33','OnBeforeDocFormDelete','1','Documents'),
  ('34','OnDocFormDelete','1','Documents'),
  ('35','OnDocFormUnDelete','1','Documents'),
  ('36','onBeforeMoveDocument','1','Documents'),
  ('37','onAfterMoveDocument','1','Documents'),
  ('38','OnPluginFormPrerender','1','Plugins'),
  ('39','OnPluginFormRender','1','Plugins'),
  ('40','OnBeforePluginFormSave','1','Plugins'),
  ('41','OnPluginFormSave','1','Plugins'),
  ('42','OnBeforePluginFormDelete','1','Plugins'),
  ('43','OnPluginFormDelete','1','Plugins'),
  ('44','OnSnipFormPrerender','1','Snippets'),
  ('45','OnSnipFormRender','1','Snippets'),
  ('46','OnBeforeSnipFormSave','1','Snippets'),
  ('47','OnSnipFormSave','1','Snippets'),
  ('48','OnBeforeSnipFormDelete','1','Snippets'),
  ('49','OnSnipFormDelete','1','Snippets'),
  ('50','OnTempFormPrerender','1','Templates'),
  ('51','OnTempFormRender','1','Templates'),
  ('52','OnBeforeTempFormSave','1','Templates'),
  ('53','OnTempFormSave','1','Templates'),
  ('54','OnBeforeTempFormDelete','1','Templates'),
  ('55','OnTempFormDelete','1','Templates'),
  ('56','OnTVFormPrerender','1','Template Variables'),
  ('57','OnTVFormRender','1','Template Variables'),
  ('58','OnBeforeTVFormSave','1','Template Variables'),
  ('59','OnTVFormSave','1','Template Variables'),
  ('60','OnBeforeTVFormDelete','1','Template Variables'),
  ('61','OnTVFormDelete','1','Template Variables'),
  ('62','OnUserFormPrerender','1','Users');

INSERT INTO `evo_system_eventnames` VALUES
  ('63','OnUserFormRender','1','Users'),
  ('64','OnBeforeUserFormSave','1','Users'),
  ('65','OnUserFormSave','1','Users'),
  ('66','OnBeforeUserFormDelete','1','Users'),
  ('67','OnUserFormDelete','1','Users'),
  ('68','OnWUsrFormPrerender','1','Web Users'),
  ('69','OnWUsrFormRender','1','Web Users'),
  ('70','OnBeforeWUsrFormSave','1','Web Users'),
  ('71','OnWUsrFormSave','1','Web Users'),
  ('72','OnBeforeWUsrFormDelete','1','Web Users'),
  ('73','OnWUsrFormDelete','1','Web Users'),
  ('74','OnSiteRefresh','1',''),
  ('75','OnFileManagerUpload','1',''),
  ('76','OnModFormPrerender','1','Modules'),
  ('77','OnModFormRender','1','Modules'),
  ('78','OnBeforeModFormDelete','1','Modules'),
  ('79','OnModFormDelete','1','Modules'),
  ('80','OnBeforeModFormSave','1','Modules'),
  ('81','OnModFormSave','1','Modules'),
  ('82','OnBeforeWebLogin','3',''),
  ('83','OnWebAuthentication','3',''),
  ('84','OnBeforeManagerLogin','2',''),
  ('85','OnManagerAuthentication','2',''),
  ('86','OnLoadSettings','1','System Settings'),
  ('87','OnSiteSettingsRender','1','System Settings'),
  ('88','OnFriendlyURLSettingsRender','1','System Settings'),
  ('89','OnUserSettingsRender','1','System Settings'),
  ('90','OnInterfaceSettingsRender','1','System Settings'),
  ('91','OnSecuritySettingsRender','1','System Settings'),
  ('92','OnFileManagerSettingsRender','1','System Settings'),
  ('93','OnMiscSettingsRender','1','System Settings');

INSERT INTO `evo_system_eventnames` VALUES
  ('94','OnRichTextEditorRegister','1','RichText Editor'),
  ('95','OnRichTextEditorInit','1','RichText Editor'),
  ('96','OnManagerPageInit','2',''),
  ('97','OnWebPageInit','5',''),
  ('98','OnLoadDocumentObject','5',''),
  ('99','OnBeforeLoadDocumentObject','5',''),
  ('100','OnAfterLoadDocumentObject','5',''),
  ('101','OnLoadWebDocument','5',''),
  ('102','OnParseDocument','5',''),
  ('103','OnParseProperties','5',''),
  ('104','OnBeforeParseParams','5',''),
  ('105','OnManagerLoginFormRender','2',''),
  ('106','OnWebPageComplete','5',''),
  ('107','OnLogPageHit','5',''),
  ('108','OnBeforeManagerPageInit','2',''),
  ('109','OnBeforeEmptyTrash','1','Documents'),
  ('110','OnEmptyTrash','1','Documents'),
  ('111','OnManagerLoginFormPrerender','2',''),
  ('112','OnStripAlias','1','Documents'),
  ('113','OnMakeDocUrl','5',''),
  ('114','OnBeforeLoadExtension','5',''),
  ('115','OnCreateDocGroup','1','Documents'),
  ('116','OnManagerWelcomePrerender','2',''),
  ('117','OnManagerWelcomeHome','2',''),
  ('118','OnManagerWelcomeRender','2',''),
  ('119','OnBeforeDocDuplicate','1','Documents'),
  ('120','OnDocDuplicate','1','Documents'),
  ('121','OnManagerMainFrameHeaderHTMLBlock','2',''),
  ('122','OnManagerPreFrameLoader','2',''),
  ('123','OnManagerFrameLoader','2',''),
  ('124','OnManagerTreeInit','2','');

INSERT INTO `evo_system_eventnames` VALUES
  ('125','OnManagerTreePrerender','2',''),
  ('126','OnManagerTreeRender','2',''),
  ('127','OnManagerNodePrerender','2',''),
  ('128','OnManagerNodeRender','2',''),
  ('129','OnManagerMenuPrerender','2',''),
  ('130','OnManagerTopPrerender','2',''),
  ('131','OnDocFormTemplateRender','1','Documents'),
  ('132','OnBeforeMinifyCss','1',''),
  ('133','OnPageUnauthorized','1',''),
  ('134','OnPageNotFound','1',''),
  ('135','OnFileBrowserUpload','1','File Browser Events'),
  ('136','OnBeforeFileBrowserUpload','1','File Browser Events'),
  ('137','OnFileBrowserDelete','1','File Browser Events'),
  ('138','OnBeforeFileBrowserDelete','1','File Browser Events'),
  ('139','OnFileBrowserInit','1','File Browser Events'),
  ('140','OnFileBrowserMove','1','File Browser Events'),
  ('141','OnBeforeFileBrowserMove','1','File Browser Events'),
  ('142','OnFileBrowserCopy','1','File Browser Events'),
  ('143','OnBeforeFileBrowserCopy','1','File Browser Events'),
  ('144','OnBeforeFileBrowserRename','1','File Browser Events'),
  ('145','OnFileBrowserRename','1','File Browser Events'),
  ('146','OnLogEvent','1','');

#
# Dumping data for table `evo_system_settings`
#

INSERT INTO `evo_system_settings` VALUES
  ('settings_version','1.4.21'),
  ('manager_theme','default'),
  ('server_offset_time','0'),
  ('manager_language','russian-UTF8'),
  ('modx_charset','UTF-8'),
  ('site_name','ГКУЗ МЦ «Резерв» г. Самара'),
  ('site_start','1'),
  ('error_page','7'),
  ('unauthorized_page','8'),
  ('site_status','1'),
  ('auto_template_logic','sibling'),
  ('default_template','3'),
  ('old_template','3'),
  ('publish_default','1'),
  ('friendly_urls','1'),
  ('friendly_alias_urls','1'),
  ('use_alias_path','1'),
  ('cache_type','2'),
  ('failed_login_attempts','3'),
  ('blocked_minutes','60'),
  ('use_captcha','0'),
  ('emailsender','projectsoft2009@yandex.ru'),
  ('use_editor','1'),
  ('use_browser','1'),
  ('fe_editor_lang','russian-UTF8'),
  ('fck_editor_toolbar','standard'),
  ('fck_editor_autolang','0'),
  ('editor_css_path',''),
  ('editor_css_selectors',''),
  ('upload_maxsize','10485760'),
  ('manager_layout','4');

INSERT INTO `evo_system_settings` VALUES
  ('auto_menuindex','1'),
  ('session.cookie.lifetime','604800'),
  ('mail_check_timeperiod','600'),
  ('manager_direction','ltr'),
  ('xhtml_urls','0'),
  ('automatic_alias','1'),
  ('datetime_format','dd-mm-YYYY'),
  ('warning_visibility','0'),
  ('remember_last_tab','1'),
  ('enable_bindings','1'),
  ('seostrict','1'),
  ('number_of_results','30'),
  ('theme_refresher',''),
  ('show_picker','0'),
  ('show_newresource_btn','0'),
  ('show_fullscreen_btn','0'),
  ('email_sender_method','1'),
  ('site_id','63a05e6d3e091'),
  ('a','30'),
  ('site_unavailable_page','9'),
  ('reload_site_unavailable',''),
  ('site_unavailable_message','В настоящее время сайт недоступен.'),
  ('siteunavailable_message_default','russian-UTF8'),
  ('chunk_processor',''),
  ('enable_at_syntax','1'),
  ('enable_filter','1'),
  ('cache_default','1'),
  ('search_default','1'),
  ('custom_contenttype','application/rss+xml,application/pdf,application/vnd.ms-word,application/vnd.ms-excel,text/html,text/css,text/xml,text/javascript,text/plain,application/json'),
  ('docid_incrmnt_method','0'),
  ('enable_cache','1');

INSERT INTO `evo_system_settings` VALUES
  ('disable_chunk_cache','0'),
  ('disable_snippet_cache','0'),
  ('disable_plugins_cache','0'),
  ('minifyphp_incache','0'),
  ('server_protocol','http'),
  ('rss_url_news','https://github.com/evocms-community/evolution/releases.atom'),
  ('track_visitors','0'),
  ('friendly_url_prefix',''),
  ('friendly_url_suffix','/'),
  ('make_folders','1'),
  ('full_aliaslisting','0'),
  ('aliaslistingfolder','0'),
  ('allow_duplicate_alias','0'),
  ('use_udperms','1'),
  ('udperms_allowroot','0'),
  ('email_method','mail'),
  ('smtp_auth','0'),
  ('smtp_secure','none'),
  ('smtp_host','smtp.example.com'),
  ('smtp_port','25'),
  ('smtp_username','you@example.com'),
  ('reload_emailsubject',''),
  ('emailsubject','Данные для авторизации'),
  ('emailsubject_default','Данные для авторизации'),
  ('reload_signupemail_message',''),
  ('signupemail_message','Здравствуйте, [+uid+]!\n\nВаши данные для авторизации в системе управления сайтом [+sname+]:\n\nИмя пользователя: [+uid+]\nПароль: [+pwd+]\n\nПосле успешной авторизации в системе управления сайтом ([+surl+]), вы сможете изменить свой пароль.\n\nС уважением, Администрация'),
  ('system_email_signup_default','Здравствуйте, [+uid+]!\n\nВаши данные для авторизации в системе управления сайтом [+sname+]:\n\nИмя пользователя: [+uid+]\nПароль: [+pwd+]\n\nПосле успешной авторизации в системе управления сайтом ([+surl+]), вы сможете изменить свой пароль.\n\nС уважением, Администрация'),
  ('reload_websignupemail_message',''),
  ('websignupemail_message','Здравствуйте, [+uid+]!\n\nВаши данные для авторизации на [+sname+]:\n\nИмя пользователя: [+uid+]\nПароль: [+pwd+]\n\nПосле успешной авторизации на [+sname+] ([+surl+]), вы сможете изменить свой пароль.\n\nС уважением, Администрация'),
  ('system_email_websignup_default','Здравствуйте, [+uid+]!\n\nВаши данные для авторизации на [+sname+]:\n\nИмя пользователя: [+uid+]\nПароль: [+pwd+]\n\nПосле успешной авторизации на [+sname+] ([+surl+]), вы сможете изменить свой пароль.\n\nС уважением, Администрация'),
  ('reload_system_email_webreminder_message','');

INSERT INTO `evo_system_settings` VALUES
  ('webpwdreminder_message','Здравствуйте, [+uid+]!\n\nЧтобы активировать ваш новый пароль, перейдите по следующей ссылке:\n\n[+surl+]\n\nПозже вы сможете использовать следующий пароль для авторизации: [+pwd+]\n\nЕсли это письмо пришло к вам по ошибке, пожалуйста, проигнорируйте его.\n\nС уважением, Администрация'),
  ('system_email_webreminder_default','Здравствуйте, [+uid+]!\n\nЧтобы активировать ваш новый пароль, перейдите по следующей ссылке:\n\n[+surl+]\n\nПозже вы сможете использовать следующий пароль для авторизации: [+pwd+]\n\nЕсли это письмо пришло к вам по ошибке, пожалуйста, проигнорируйте его.\n\nС уважением, Администрация'),
  ('allow_multiple_emails','0'),
  ('manager_theme_mode','2'),
  ('login_logo',''),
  ('login_bg',''),
  ('login_form_position','center'),
  ('login_form_style','dark'),
  ('manager_menu_position','top'),
  ('tree_page_click','27'),
  ('use_breadcrumbs','0'),
  ('global_tabs','1'),
  ('group_tvs','5'),
  ('resource_tree_node_name','pagetitle'),
  ('session_timeout','15'),
  ('tree_show_protected','0'),
  ('datepicker_offset','-10'),
  ('number_of_logs','100'),
  ('number_of_messages','40'),
  ('which_editor','TinyMCE4'),
  ('tinymce4_theme','advanced'),
  ('tinymce4_skin','lightgray'),
  ('tinymce4_skintheme','inlite'),
  ('tinymce4_template_docs',''),
  ('tinymce4_template_chunks',''),
  ('tinymce4_entermode','p'),
  ('tinymce4_element_format','xhtml'),
  ('tinymce4_schema','html5'),
  ('tinymce4_custom_plugins','advlist autolink lists link image charmap print preview hr anchor pagebreak searchreplace wordcount visualblocks visualchars code fullscreen spellchecker insertdatetime media nonbreaking save table contextmenu directionality emoticons template paste textcolor codesample colorpicker textpattern imagetools paste modxlink youtube'),
  ('tinymce4_custom_buttons1','undo redo | cut copy paste | searchreplace | bold italic underline strikethrough | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent blockquote | styleselect'),
  ('tinymce4_custom_buttons2','link unlink anchor image media codesample table | hr removeformat | subscript superscript charmap | nonbreaking | visualchars visualblocks print preview fullscreen code formatselect');

INSERT INTO `evo_system_settings` VALUES
  ('tinymce4_custom_buttons3',''),
  ('tinymce4_custom_buttons4',''),
  ('tinymce4_blockFormats','Paragraph=p;Header 1=h1;Header 2=h2;Header 3=h3'),
  ('allow_eval','with_scan'),
  ('safe_functions_at_eval','time,date,strtotime'),
  ('check_files_onlogin','index.php\n.htaccess\nmanager/index.php\nmanager/includes/config.inc.php'),
  ('validate_referer','1'),
  ('rss_url_security','https://github.com/extras-evolution/security-fix/releases.atom'),
  ('error_reporting','1'),
  ('send_errormail','0'),
  ('pwd_hash_algo','UNCRYPT'),
  ('reload_captcha_words',''),
  ('captcha_words','EVO,Access,Better,BitCode,Chunk,Cache,Desc,Design,Excell,Enjoy,URLs,TechView,Gerald,Griff,Humphrey,Holiday,Intel,Integration,Joystick,Join(),Oscope,Genetic,Light,Likeness,Marit,Maaike,Niche,Netherlands,Ordinance,Oscillo,Parser,Phusion,Query,Question,Regalia,Righteous,Snippet,Sentinel,Template,Thespian,Unity,Enterprise,Verily,Tattoo,Veri,Website,WideWeb,Yap,Yellow,Zebra,Zygote'),
  ('captcha_words_default','EVO,Access,Better,BitCode,Chunk,Cache,Desc,Design,Excell,Enjoy,URLs,TechView,Gerald,Griff,Humphrey,Holiday,Intel,Integration,Joystick,Join(),Oscope,Genetic,Light,Likeness,Marit,Maaike,Niche,Netherlands,Ordinance,Oscillo,Parser,Phusion,Query,Question,Regalia,Righteous,Snippet,Sentinel,Template,Thespian,Unity,Enterprise,Verily,Tattoo,Veri,Website,WideWeb,Yap,Yellow,Zebra,Zygote'),
  ('filemanager_path','C:/OpenServer/domains/rezerv.school/site/'),
  ('upload_files','bmp,ico,gif,jpeg,jpg,png,psd,tif,tiff,fla,flv,swf,aac,au,avi,css,cache,doc,docx,gz,gzip,htaccess,htm,html,js,mp3,mp4,mpeg,mpg,ods,odp,odt,pdf,ppt,pptx,rar,tar,tgz,txt,wav,wmv,xls,xlsx,xml,z,zip,JPG,JPEG,PNG,GIF,svg,tpl'),
  ('upload_images','bmp,ico,gif,jpeg,jpg,png,psd,tif,tiff,svg'),
  ('upload_media','au,avi,mp3,mp4,mpeg,mpg,wav,wmv'),
  ('upload_flash','fla,flv,swf'),
  ('new_file_permissions','0644'),
  ('new_folder_permissions','0755'),
  ('which_browser','mcpuk'),
  ('rb_webuser','0'),
  ('rb_base_dir','C:/OpenServer/domains/rezerv.school/site/assets/'),
  ('rb_base_url','assets/'),
  ('clean_uploaded_filename','1'),
  ('strip_image_paths','1'),
  ('maxImageWidth','2600'),
  ('maxImageHeight','2200'),
  ('clientResize','0'),
  ('noThumbnailsRecreation','0');

INSERT INTO `evo_system_settings` VALUES
  ('thumbWidth','150'),
  ('thumbHeight','150'),
  ('thumbsDir','.thumbs'),
  ('jpegQuality','90'),
  ('denyZipDownload','0'),
  ('denyExtensionRename','0'),
  ('showHiddenFiles','0'),
  ('lang_code','ru'),
  ('sys_files_checksum','a:4:{s:50:\"C:/OpenServer/domains/rezerv.school/site/index.php\";s:32:\"62aec542f3fd84f47f91d2248fa59153\";s:50:\"C:/OpenServer/domains/rezerv.school/site/.htaccess\";s:32:\"b12739e14a9d18d7090427db01bd4021\";s:58:\"C:/OpenServer/domains/rezerv.school/site/manager/index.php\";s:32:\"bb667738d2d80c29198903030ec6e657\";s:72:\"C:/OpenServer/domains/rezerv.school/site/manager/includes/config.inc.php\";s:32:\"f483d2bb3b57ceb40657710465bf1a5b\";}');

#
# Dumping data for table `evo_user_attributes`
#

INSERT INTO `evo_user_attributes` VALUES
  ('1','1','Admin','1','projectsoft2009@yandex.ru','','','0','0','0','1','0','1671454332','0','sda65b9ukmlied89p15pnsal1bdndh8r','0','0','','','','','','','','','0','0','1');

#
# Dumping data for table `evo_user_messages`
#

#
# Dumping data for table `evo_user_roles`
#

INSERT INTO `evo_user_roles` VALUES
  ('2','Editor','Limited to managing content','1','1','1','1','1','1','1','0','1','1','1','0','0','0','0','0','0','0','0','1','0','0','0','0','0','0','0','1','0','1','0','1','1','1','1','1','0','1','1','1','0','0','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','1','0','0','0','0','0','0','0','1','0','0','1','1','1'),
  ('3','Publisher','Editor with expanded permissions including manage users, update Elements and site settings','1','1','1','1','1','1','1','1','1','1','1','0','1','1','1','0','0','1','1','1','1','1','1','0','0','0','0','1','1','1','1','1','1','1','1','1','0','1','1','1','1','1','1','0','0','0','0','0','1','0','0','0','0','0','0','0','0','1','0','0','1','1','1','1','0','1','0','0','1','1','1'),
  ('1','Administrator','Site administrators have full access to all functions','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1');

#
# Dumping data for table `evo_user_settings`
#

#
# Dumping data for table `evo_web_groups`
#

#
# Dumping data for table `evo_web_user_attributes`
#

#
# Dumping data for table `evo_web_user_settings`
#

#
# Dumping data for table `evo_web_users`
#

#
# Dumping data for table `evo_webgroup_access`
#

#
# Dumping data for table `evo_webgroup_names`
#


# --------------------------------------------------------

SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;

SET @@sql_mode := @old_sql_mode ;


# --------------------------------------------------------
