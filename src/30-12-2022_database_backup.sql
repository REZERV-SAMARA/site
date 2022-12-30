#
# ГКУЗ МЦ «Резерв» г. Самара Database Dump
# MODX Version:1.4.22
# 
# Host: 
# Generation Time: 30-12-2022 12:38:48
# Server version: 5.6.51
# PHP Version: 7.4.30
# Database: `REZERV`
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
# Table structure for table `evo_categories`
#

DROP TABLE IF EXISTS `evo_categories`;
CREATE TABLE `evo_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(45) NOT NULL DEFAULT '',
  `rank` int(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='Categories to be used snippets,tv,chunks, etc';



# --------------------------------------------------------

#
# Table structure for table `evo_document_groups`
#

DROP TABLE IF EXISTS `evo_document_groups`;
CREATE TABLE `evo_document_groups` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `document_group` int(10) NOT NULL DEFAULT '0',
  `document` int(10) NOT NULL DEFAULT '0',
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
  `private_memgroup` tinyint(4) DEFAULT '0' COMMENT 'determine whether the document group is private to manager users',
  `private_webgroup` tinyint(4) DEFAULT '0' COMMENT 'determines whether the document is private to web users',
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
  `eventid` int(11) DEFAULT '0',
  `createdon` int(11) NOT NULL DEFAULT '0',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1- information, 2 - warning, 3- error',
  `user` int(11) NOT NULL DEFAULT '0' COMMENT 'link to user table',
  `usertype` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0 - manager, 1 - web',
  `source` varchar(50) NOT NULL DEFAULT '',
  `description` text,
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
  `timestamp` int(20) NOT NULL DEFAULT '0',
  `internalKey` int(10) NOT NULL DEFAULT '0',
  `username` varchar(255) DEFAULT NULL,
  `action` int(10) NOT NULL DEFAULT '0',
  `itemid` varchar(10) DEFAULT '0',
  `itemname` varchar(255) DEFAULT NULL,
  `message` varchar(255) NOT NULL DEFAULT '',
  `ip` varchar(46) DEFAULT NULL,
  `useragent` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='Contains a record of user interaction.';



# --------------------------------------------------------

#
# Table structure for table `evo_member_groups`
#

DROP TABLE IF EXISTS `evo_member_groups`;
CREATE TABLE `evo_member_groups` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_group` int(10) NOT NULL DEFAULT '0',
  `member` int(10) NOT NULL DEFAULT '0',
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
  `membergroup` int(10) NOT NULL DEFAULT '0',
  `documentgroup` int(10) NOT NULL DEFAULT '0',
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
# Table structure for table `evo_pagebuilder`
#

DROP TABLE IF EXISTS `evo_pagebuilder`;
CREATE TABLE `evo_pagebuilder` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `document_id` int(10) unsigned NOT NULL,
  `container` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `config` varchar(255) NOT NULL,
  `values` mediumtext NOT NULL,
  `visible` tinyint(1) unsigned DEFAULT '1',
  `index` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `document_id` (`document_id`,`container`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;



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
  `published` int(1) NOT NULL DEFAULT '0',
  `pub_date` int(20) NOT NULL DEFAULT '0',
  `unpub_date` int(20) NOT NULL DEFAULT '0',
  `parent` int(10) NOT NULL DEFAULT '0',
  `isfolder` int(1) NOT NULL DEFAULT '0',
  `introtext` text COMMENT 'Used to provide quick summary of the document',
  `content` mediumtext,
  `richtext` tinyint(1) NOT NULL DEFAULT '1',
  `template` int(10) NOT NULL DEFAULT '0',
  `menuindex` int(10) NOT NULL DEFAULT '0',
  `searchable` int(1) NOT NULL DEFAULT '1',
  `cacheable` int(1) NOT NULL DEFAULT '1',
  `createdby` int(10) NOT NULL DEFAULT '0',
  `createdon` int(20) NOT NULL DEFAULT '0',
  `editedby` int(10) NOT NULL DEFAULT '0',
  `editedon` int(20) NOT NULL DEFAULT '0',
  `deleted` int(1) NOT NULL DEFAULT '0',
  `deletedon` int(20) NOT NULL DEFAULT '0',
  `deletedby` int(10) NOT NULL DEFAULT '0',
  `publishedon` int(20) NOT NULL DEFAULT '0' COMMENT 'Date the document was published',
  `publishedby` int(10) NOT NULL DEFAULT '0' COMMENT 'ID of user who published the document',
  `menutitle` varchar(255) NOT NULL DEFAULT '' COMMENT 'Menu title',
  `donthit` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Disable page hit count',
  `privateweb` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Private web document',
  `privatemgr` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Private manager document',
  `content_dispo` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0-inline, 1-attachment',
  `hidemenu` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Hide document from menu',
  `alias_visible` int(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `parent` (`parent`),
  KEY `aliasidx` (`alias`),
  KEY `typeidx` (`type`),
  FULLTEXT KEY `content_ft_idx` (`pagetitle`,`description`,`content`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='Contains the site document tree.';



# --------------------------------------------------------

#
# Table structure for table `evo_site_htmlsnippets`
#

DROP TABLE IF EXISTS `evo_site_htmlsnippets`;
CREATE TABLE `evo_site_htmlsnippets` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT 'Chunk',
  `editor_type` int(11) NOT NULL DEFAULT '0' COMMENT '0-plain text,1-rich text,2-code editor',
  `editor_name` varchar(50) NOT NULL DEFAULT 'none',
  `category` int(11) NOT NULL DEFAULT '0' COMMENT 'category id',
  `cache_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Cache option',
  `snippet` mediumtext,
  `locked` tinyint(4) NOT NULL DEFAULT '0',
  `createdon` int(11) NOT NULL DEFAULT '0',
  `editedon` int(11) NOT NULL DEFAULT '0',
  `disabled` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Disables the snippet',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Contains the site chunks.';



# --------------------------------------------------------

#
# Table structure for table `evo_site_module_access`
#

DROP TABLE IF EXISTS `evo_site_module_access`;
CREATE TABLE `evo_site_module_access` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `module` int(11) NOT NULL DEFAULT '0',
  `usergroup` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Module users group access permission';



# --------------------------------------------------------

#
# Table structure for table `evo_site_module_depobj`
#

DROP TABLE IF EXISTS `evo_site_module_depobj`;
CREATE TABLE `evo_site_module_depobj` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `module` int(11) NOT NULL DEFAULT '0',
  `resource` int(11) NOT NULL DEFAULT '0',
  `type` int(2) NOT NULL DEFAULT '0' COMMENT '10-chunks, 20-docs, 30-plugins, 40-snips, 50-tpls, 60-tvs',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Module Dependencies';



# --------------------------------------------------------

#
# Table structure for table `evo_site_modules`
#

DROP TABLE IF EXISTS `evo_site_modules`;
CREATE TABLE `evo_site_modules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '0',
  `editor_type` int(11) NOT NULL DEFAULT '0' COMMENT '0-plain text,1-rich text,2-code editor',
  `disabled` tinyint(4) NOT NULL DEFAULT '0',
  `category` int(11) NOT NULL DEFAULT '0' COMMENT 'category id',
  `wrap` tinyint(4) NOT NULL DEFAULT '0',
  `locked` tinyint(4) NOT NULL DEFAULT '0',
  `icon` varchar(255) NOT NULL DEFAULT '' COMMENT 'url to module icon',
  `enable_resource` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'enables the resource file feature',
  `resourcefile` varchar(255) NOT NULL DEFAULT '' COMMENT 'a physical link to a resource file',
  `createdon` int(11) NOT NULL DEFAULT '0',
  `editedon` int(11) NOT NULL DEFAULT '0',
  `guid` varchar(32) NOT NULL DEFAULT '' COMMENT 'globally unique identifier',
  `enable_sharedparams` tinyint(4) NOT NULL DEFAULT '0',
  `properties` text,
  `modulecode` mediumtext COMMENT 'module boot up code',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='Site Modules';



# --------------------------------------------------------

#
# Table structure for table `evo_site_plugin_events`
#

DROP TABLE IF EXISTS `evo_site_plugin_events`;
CREATE TABLE `evo_site_plugin_events` (
  `pluginid` int(10) NOT NULL,
  `evtid` int(10) NOT NULL DEFAULT '0',
  `priority` int(10) NOT NULL DEFAULT '0' COMMENT 'determines plugin run order',
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
  `editor_type` int(11) NOT NULL DEFAULT '0' COMMENT '0-plain text,1-rich text,2-code editor',
  `category` int(11) NOT NULL DEFAULT '0' COMMENT 'category id',
  `cache_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Cache option',
  `plugincode` mediumtext,
  `locked` tinyint(4) NOT NULL DEFAULT '0',
  `properties` text COMMENT 'Default Properties',
  `disabled` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Disables the plugin',
  `moduleguid` varchar(32) NOT NULL DEFAULT '' COMMENT 'GUID of module from which to import shared parameters',
  `createdon` int(11) NOT NULL DEFAULT '0',
  `editedon` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='Contains the site plugins.';



# --------------------------------------------------------

#
# Table structure for table `evo_site_snippets`
#

DROP TABLE IF EXISTS `evo_site_snippets`;
CREATE TABLE `evo_site_snippets` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT 'Snippet',
  `editor_type` int(11) NOT NULL DEFAULT '0' COMMENT '0-plain text,1-rich text,2-code editor',
  `category` int(11) NOT NULL DEFAULT '0' COMMENT 'category id',
  `cache_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Cache option',
  `snippet` mediumtext,
  `locked` tinyint(4) NOT NULL DEFAULT '0',
  `properties` text COMMENT 'Default Properties',
  `moduleguid` varchar(32) NOT NULL DEFAULT '' COMMENT 'GUID of module from which to import shared parameters',
  `createdon` int(11) NOT NULL DEFAULT '0',
  `editedon` int(11) NOT NULL DEFAULT '0',
  `disabled` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Disables the snippet',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='Contains the site snippets.';



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
  `editor_type` int(11) NOT NULL DEFAULT '0' COMMENT '0-plain text,1-rich text,2-code editor',
  `category` int(11) NOT NULL DEFAULT '0' COMMENT 'category id',
  `icon` varchar(255) NOT NULL DEFAULT '' COMMENT 'url to icon file',
  `template_type` int(11) NOT NULL DEFAULT '0' COMMENT '0-page,1-content',
  `content` mediumtext,
  `locked` tinyint(4) NOT NULL DEFAULT '0',
  `selectable` tinyint(4) NOT NULL DEFAULT '1',
  `createdon` int(11) NOT NULL DEFAULT '0',
  `editedon` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='Contains the site templates.';



# --------------------------------------------------------

#
# Table structure for table `evo_site_tmplvar_access`
#

DROP TABLE IF EXISTS `evo_site_tmplvar_access`;
CREATE TABLE `evo_site_tmplvar_access` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `tmplvarid` int(10) NOT NULL DEFAULT '0',
  `documentgroup` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains data used for template variable access permissions.';



# --------------------------------------------------------

#
# Table structure for table `evo_site_tmplvar_contentvalues`
#

DROP TABLE IF EXISTS `evo_site_tmplvar_contentvalues`;
CREATE TABLE `evo_site_tmplvar_contentvalues` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tmplvarid` int(10) NOT NULL DEFAULT '0' COMMENT 'Template Variable id',
  `contentid` int(10) NOT NULL DEFAULT '0' COMMENT 'Site Content Id',
  `value` mediumtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ix_tvid_contentid` (`tmplvarid`,`contentid`),
  KEY `idx_tmplvarid` (`tmplvarid`),
  KEY `idx_id` (`contentid`),
  FULLTEXT KEY `value_ft_idx` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='Site Template Variables Content Values Link Table';



# --------------------------------------------------------

#
# Table structure for table `evo_site_tmplvar_templates`
#

DROP TABLE IF EXISTS `evo_site_tmplvar_templates`;
CREATE TABLE `evo_site_tmplvar_templates` (
  `tmplvarid` int(10) NOT NULL DEFAULT '0' COMMENT 'Template Variable id',
  `templateid` int(11) NOT NULL DEFAULT '0',
  `rank` int(11) NOT NULL DEFAULT '0',
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
  `editor_type` int(11) NOT NULL DEFAULT '0' COMMENT '0-plain text,1-rich text,2-code editor',
  `category` int(11) NOT NULL DEFAULT '0' COMMENT 'category id',
  `locked` tinyint(4) NOT NULL DEFAULT '0',
  `elements` text,
  `rank` int(11) NOT NULL DEFAULT '0',
  `display` varchar(20) NOT NULL DEFAULT '' COMMENT 'Display Control',
  `display_params` text COMMENT 'Display Control Properties',
  `default_text` text,
  `createdon` int(11) NOT NULL DEFAULT '0',
  `editedon` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `indx_rank` (`rank`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='Site Template Variables';



# --------------------------------------------------------

#
# Table structure for table `evo_system_eventnames`
#

DROP TABLE IF EXISTS `evo_system_eventnames`;
CREATE TABLE `evo_system_eventnames` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `service` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'System Service number',
  `groupname` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=152 DEFAULT CHARSET=utf8 COMMENT='System Event Names.';



# --------------------------------------------------------

#
# Table structure for table `evo_system_settings`
#

DROP TABLE IF EXISTS `evo_system_settings`;
CREATE TABLE `evo_system_settings` (
  `setting_name` varchar(50) NOT NULL DEFAULT '',
  `setting_value` text,
  PRIMARY KEY (`setting_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains Content Manager settings.';



# --------------------------------------------------------

#
# Table structure for table `evo_user_messages`
#

DROP TABLE IF EXISTS `evo_user_messages`;
CREATE TABLE `evo_user_messages` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `type` varchar(15) NOT NULL DEFAULT '',
  `subject` varchar(60) NOT NULL DEFAULT '',
  `message` text,
  `sender` int(10) NOT NULL DEFAULT '0',
  `recipient` int(10) NOT NULL DEFAULT '0',
  `private` tinyint(4) NOT NULL DEFAULT '0',
  `postdate` int(20) NOT NULL DEFAULT '0',
  `messageread` tinyint(1) NOT NULL DEFAULT '0',
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
  `frames` int(1) NOT NULL DEFAULT '0',
  `home` int(1) NOT NULL DEFAULT '0',
  `view_document` int(1) NOT NULL DEFAULT '0',
  `new_document` int(1) NOT NULL DEFAULT '0',
  `save_document` int(1) NOT NULL DEFAULT '0',
  `publish_document` int(1) NOT NULL DEFAULT '0',
  `delete_document` int(1) NOT NULL DEFAULT '0',
  `empty_trash` int(1) NOT NULL DEFAULT '0',
  `action_ok` int(1) NOT NULL DEFAULT '0',
  `logout` int(1) NOT NULL DEFAULT '0',
  `help` int(1) NOT NULL DEFAULT '0',
  `messages` int(1) NOT NULL DEFAULT '0',
  `new_user` int(1) NOT NULL DEFAULT '0',
  `edit_user` int(1) NOT NULL DEFAULT '0',
  `logs` int(1) NOT NULL DEFAULT '0',
  `edit_parser` int(1) NOT NULL DEFAULT '0',
  `save_parser` int(1) NOT NULL DEFAULT '0',
  `edit_template` int(1) NOT NULL DEFAULT '0',
  `settings` int(1) NOT NULL DEFAULT '0',
  `credits` int(1) NOT NULL DEFAULT '0',
  `new_template` int(1) NOT NULL DEFAULT '0',
  `save_template` int(1) NOT NULL DEFAULT '0',
  `delete_template` int(1) NOT NULL DEFAULT '0',
  `edit_snippet` int(1) NOT NULL DEFAULT '0',
  `new_snippet` int(1) NOT NULL DEFAULT '0',
  `save_snippet` int(1) NOT NULL DEFAULT '0',
  `delete_snippet` int(1) NOT NULL DEFAULT '0',
  `edit_chunk` int(1) NOT NULL DEFAULT '0',
  `new_chunk` int(1) NOT NULL DEFAULT '0',
  `save_chunk` int(1) NOT NULL DEFAULT '0',
  `delete_chunk` int(1) NOT NULL DEFAULT '0',
  `empty_cache` int(1) NOT NULL DEFAULT '0',
  `edit_document` int(1) NOT NULL DEFAULT '0',
  `change_password` int(1) NOT NULL DEFAULT '0',
  `error_dialog` int(1) NOT NULL DEFAULT '0',
  `about` int(1) NOT NULL DEFAULT '0',
  `category_manager` int(1) NOT NULL DEFAULT '0',
  `file_manager` int(1) NOT NULL DEFAULT '0',
  `assets_files` int(1) NOT NULL DEFAULT '0',
  `assets_images` int(1) NOT NULL DEFAULT '0',
  `save_user` int(1) NOT NULL DEFAULT '0',
  `delete_user` int(1) NOT NULL DEFAULT '0',
  `save_password` int(11) NOT NULL DEFAULT '0',
  `edit_role` int(1) NOT NULL DEFAULT '0',
  `save_role` int(1) NOT NULL DEFAULT '0',
  `delete_role` int(1) NOT NULL DEFAULT '0',
  `new_role` int(1) NOT NULL DEFAULT '0',
  `access_permissions` int(1) NOT NULL DEFAULT '0',
  `bk_manager` int(1) NOT NULL DEFAULT '0',
  `new_plugin` int(1) NOT NULL DEFAULT '0',
  `edit_plugin` int(1) NOT NULL DEFAULT '0',
  `save_plugin` int(1) NOT NULL DEFAULT '0',
  `delete_plugin` int(1) NOT NULL DEFAULT '0',
  `new_module` int(1) NOT NULL DEFAULT '0',
  `edit_module` int(1) NOT NULL DEFAULT '0',
  `save_module` int(1) NOT NULL DEFAULT '0',
  `delete_module` int(1) NOT NULL DEFAULT '0',
  `exec_module` int(1) NOT NULL DEFAULT '0',
  `view_eventlog` int(1) NOT NULL DEFAULT '0',
  `delete_eventlog` int(1) NOT NULL DEFAULT '0',
  `new_web_user` int(1) NOT NULL DEFAULT '0',
  `edit_web_user` int(1) NOT NULL DEFAULT '0',
  `save_web_user` int(1) NOT NULL DEFAULT '0',
  `delete_web_user` int(1) NOT NULL DEFAULT '0',
  `web_access_permissions` int(1) NOT NULL DEFAULT '0',
  `view_unpublished` int(1) NOT NULL DEFAULT '0',
  `import_static` int(1) NOT NULL DEFAULT '0',
  `export_static` int(1) NOT NULL DEFAULT '0',
  `remove_locks` int(1) NOT NULL DEFAULT '0',
  `display_locks` int(1) NOT NULL DEFAULT '0',
  `change_resourcetype` int(1) NOT NULL DEFAULT '0',
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
  `setting_value` text,
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
  `webgroup` int(10) NOT NULL DEFAULT '0',
  `webuser` int(10) NOT NULL DEFAULT '0',
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
  `internalKey` int(10) NOT NULL DEFAULT '0',
  `fullname` varchar(100) NOT NULL DEFAULT '',
  `role` int(10) NOT NULL DEFAULT '0',
  `email` varchar(100) NOT NULL DEFAULT '',
  `phone` varchar(100) NOT NULL DEFAULT '',
  `mobilephone` varchar(100) NOT NULL DEFAULT '',
  `blocked` int(1) NOT NULL DEFAULT '0',
  `blockeduntil` int(11) NOT NULL DEFAULT '0',
  `blockedafter` int(11) NOT NULL DEFAULT '0',
  `logincount` int(11) NOT NULL DEFAULT '0',
  `lastlogin` int(11) NOT NULL DEFAULT '0',
  `thislogin` int(11) NOT NULL DEFAULT '0',
  `failedlogincount` int(10) NOT NULL DEFAULT '0',
  `sessionid` varchar(100) NOT NULL DEFAULT '',
  `dob` int(10) NOT NULL DEFAULT '0',
  `gender` int(1) NOT NULL DEFAULT '0' COMMENT '0 - unknown, 1 - Male 2 - female',
  `country` varchar(25) NOT NULL DEFAULT '',
  `street` varchar(255) NOT NULL DEFAULT '',
  `city` varchar(255) NOT NULL DEFAULT '',
  `state` varchar(25) NOT NULL DEFAULT '',
  `zip` varchar(25) NOT NULL DEFAULT '',
  `fax` varchar(100) NOT NULL DEFAULT '',
  `photo` varchar(255) NOT NULL DEFAULT '' COMMENT 'link to photo',
  `comment` text,
  `createdon` int(11) NOT NULL DEFAULT '0',
  `editedon` int(11) NOT NULL DEFAULT '0',
  `verified` int(1) NOT NULL DEFAULT '0',
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
  `setting_value` text,
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
  `webgroup` int(10) NOT NULL DEFAULT '0',
  `documentgroup` int(10) NOT NULL DEFAULT '0',
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
# Dumping data for table `evo_categories`
#

INSERT INTO `evo_categories` VALUES
  ('1','SEO','0'),
  ('2','Js','0'),
  ('3','Manager and Admin','0'),
  ('4','Content','0'),
  ('5','Navigation','0'),
  ('6','TEMPLATES','0'),
  ('7','FRONTEND','0'),
  ('8','Dashboard','0');

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
  ('1','1672389453','1','ProjectSoft','54','-','evo_manager_log','Optimizing a table','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 OPR/94.0.0.0'),
  ('2','1672389454','1','ProjectSoft','53','-','-','Viewing system info','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 OPR/94.0.0.0'),
  ('3','1672389465','1','ProjectSoft','26','-','-','Refreshing site','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 OPR/94.0.0.0'),
  ('4','1672389481','1','ProjectSoft','93','-','-','Backup Manager','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 OPR/94.0.0.0');

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
# Dumping data for table `evo_pagebuilder`
#

INSERT INTO `evo_pagebuilder` VALUES
  ('3','5','default','','documents','{\"text\":\"\",\"files\":[{\"text\":\"Меню питания\",\"file\":\"assets/files/26.12.2022.pdf\"},{\"text\":\"111\",\"file\":\"assets/files/compressed.tracemonkey-pldi-09.pdf\"},{\"text\":\"222\",\"file\":\"assets/files/compressed.tracemonkey-pldi-09.pdf\"},{\"text\":\"222???123\",\"file\":\"assets/files/compressed.tracemonkey-pldi-09.pdf?123=342342&asd=.pdf\"},{\"text\":\"222####123\",\"file\":\"assets/files/compressed.tracemonkey-pldi-09.pdf#123=342342&asd=.pdf\"},{\"text\":\"333\",\"file\":\"assets/files/index.html\"},{\"text\":\"https://projectsoft.ru/\",\"file\":\"https://projectsoft.ru/\"}]}','1','0');

#
# Dumping data for table `evo_site_content`
#

INSERT INTO `evo_site_content` VALUES
  ('1','document','text/html','Главная','О ведомстве','О ведомстве','index','','1','0','0','0','0','Государственное казенное учреждение здравоохранения Республиканский медицинский центр мобилизационных резервов «Резерв» Министерства здравоохранения Республики Татарстан является «Учреждением здравоохранения особого типа» с единой номенклатурой государственных и муниципальных учреждений здравоохранения.\nУчреждение создано в соответствии с приказом Министерства здравоохранения Республики Татарстан от 14 декабря 1996г. № 750 в порядке реорганизации ранее действовавшей Базы специального медицинского снабжения Министерства здравоохранения Республики Татарстан, и является преемником ее прав и обязанностей','<p class=\"text-justify\">b9Государственное казенное учреждение здравоохранения Республиканский медицинский центр мобилизационных резервов &laquo;Резерв&raquo; Министерства здравоохранения Республики Татарстан является <a href=\"[~4~]\">&laquo;Учреждением здравоохранения особого типа&raquo;</a> с единой номенклатурой государственных и муниципальных учреждений здравоохранения.</p>\n<p class=\"text-justify\">Учреждение создано в соответствии с приказом Министерства здравоохранения Республики Татарстан от 14 декабря 1996г. № 750 в порядке реорганизации ранее действовавшей Базы специального медицинского снабжения Министерства здравоохранения Республики Татарстан, и является преемником ее прав и обязанностей</p>\n<p class=\"text-justify\">Учреждение является некоммерческой организацией, финансируемой за счет средств бюджета, является юридическим лицом, имеет самостоятельный баланс, расчетный, валютный и иные счета в учреждениях банков.<br>Учредителем учреждения является Министерство здравоохранения Республики Татарстан в соответствии с распоряжением Министерства земельных и имущественных отношений Республики Татарстан от 27.02.2002г. № 128-р &laquo;О предоставлении полномочий Министерству здравоохранения Республики Татарстан&raquo;.</p>\n<p class=\"text-justify\">Деятельность ГКУЗ РМЦ МР &laquo;Резерв&raquo; МЗ РТ направлена на обеспечение качественной и количественной сохранности материальных ценностей мобилизационного резерва и постоянной готовности ее к выдаче для использования по предназначению. Запасы мобилизационного резерва, медицинского назначения, независимо от места их размещения являются федеральной собственностью.</p>\n<p class=\"text-justify\">Предпринимательскую деятельность Управление, ГКУЗ РМЦ МР &laquo;Резерв&raquo; МЗ РТ, не осуществляет.</p>\n<h2 class=\"text-justify\">Официальный сайт</h2>\n<p class=\"text-justify\"><a href=\"[(site_url)]\">[(site_url)]</a></p>','1','3','0','1','0','1','1130304721','1','1672344417','0','0','0','1130304721','1','Главная','0','0','0','0','0','1'),
  ('2','document','text/html','Руководитель','Понамарчук <br>Виталий  Владимирович','Понамарчук Виталий  Владимирович','leader','','1','0','0','0','0','Понамарчук Виталий  Владимирович','<p>Год рождения 5 августа 1972 года.</p>\n<p>Образование высшее. Окончил Казанский государственный медицинский университет, 1994г.<br>Московская государственная юридическая академия.<br>Специальность по образованию Врач по специальности &laquo;стоматология&raquo;, &laquo;Юриспруденция&raquo;<br>Ученая степень, звание Кандидат медицинских наук</p>\n<h3>Опыт работы</h3>\n<p>09.1994-08.1996 Клинический ординатор КГМУ<br>10.1996-09.1999 Аспирант КГМУ<br>10.1999-03.2000 Врач-стоматолог-ортопед санатория-профилактория Миннибаевского ГПЗ, г. Альметьевск<br>03.2000-04.2001 Врач-стоматолог-ортопед стоматологической поликлиники №1 г. Казань<br>04.2001-07.2005 Заместитель главного врача по организационно-методической работе Городской поликлиники №14<br>08.2005-12.2008 Заместитель главного врача по организационно-методической работе РКБ №3<br>12.2008-07.2012 Главный врач Высокогорской центральной районной больницы<br>С июля 2012 года директор ГУЗ РМЦ МР &laquo;Резерв&raquo; МЗ РТ<br>Женат, воспитывает дочь.</p>','1','5','1','1','0','1','1671480971','1','1672159455','0','0','0','1671480971','1','Руководитель','0','0','0','0','0','1'),
  ('3','document','text/html','Заместители','Заместители','Заместители','deputy','','1','0','0','0','0','Заместители','','1','6','2','1','0','1','1671481100','1','1672159571','0','0','0','1671481100','1','Заместители','0','0','0','0','0','1'),
  ('4','document','text/html','Структура ведомства','Структура ведомства','Структура ведомства','department-structure','','1','0','0','0','0','Структура ведомства','','1','7','3','1','0','1','1671481122','1','1672153269','0','0','0','1671481122','1','Структура ведомства','0','0','0','0','0','1'),
  ('5','document','text/html','Документы','Документы','Документы','documents','','1','0','0','0','0','Документы','','1','8','4','1','0','1','1671481137','1','1672153402','0','0','0','1671481137','1','Документы','0','0','0','0','0','1'),
  ('6','document','text/html','assets','','','assets','','0','0','0','0','1','','','0','0','6','0','0','1','1671481182','1','1671991306','0','0','0','0','0','','1','0','0','0','1','0'),
  ('7','document','text/html','404 Not Found','404 Not Found','404 Not Found','404','','1','0','0','6','0','404 Not Found','','0','9','0','0','0','1','1671481246','1','1671991265','0','0','0','1671481246','1','404 Not Found','0','0','0','0','1','0'),
  ('9','document','text/html','Сайт в разработке','Сайт в разработке','Сайт в разработке','develop','','1','0','0','6','0','Сайт в разработке','','0','3','2','0','0','1','1671481439','1','1671991273','0','0','0','1671481439','1','Сайт в разработке','0','0','0','0','1','0'),
  ('8','document','text/html','401 Unauthorized','401 Unauthorized','401 Unauthorized','401','','1','0','0','6','0','401 Unauthorized','','0','10','1','0','0','1','1671481342','1','1671991269','0','0','0','1671481342','1','401 Unauthorized','0','0','0','0','1','0'),
  ('10','document','text/html','Дефолт','Дефолт','Дефолт','defolt','','0','0','0','6','0','Дефолт','','1','6','5','0','0','1','1671630389','1','1671991276','0','0','0','1671481100','1','Дефолт','0','0','0','0','0','0');

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

INSERT INTO `evo_site_module_depobj` VALUES
  ('1','3','11','30');

#
# Dumping data for table `evo_site_modules`
#

INSERT INTO `evo_site_modules` VALUES
  ('1','Doc Manager','<strong>1.1.1</strong> Quickly perform bulk updates to the Documents in your site including templates, publishing details, and permissions','0','0','3','0','0','','0','','0','0','docman435243542tf542t5t','1','[]',' \n/**\n * Doc Manager\n * \n * Quickly perform bulk updates to the Documents in your site including templates, publishing details, and permissions\n * \n * @category	module\n * @version 	1.1.1\n * @license 	http://www.gnu.org/copyleft/gpl.html GNU Public License (GPL)\n * @internal	@properties\n * @internal	@guid docman435243542tf542t5t	\n * @internal	@shareparams 1\n * @internal	@dependencies requires files located at /assets/modules/docmanager/\n * @internal	@modx_category Manager and Admin\n * @internal    @installset base, sample\n * @lastupdate  09/04/2016\n */\n\ninclude_once(MODX_BASE_PATH.\'assets/modules/docmanager/classes/docmanager.class.php\');\ninclude_once(MODX_BASE_PATH.\'assets/modules/docmanager/classes/dm_frontend.class.php\');\ninclude_once(MODX_BASE_PATH.\'assets/modules/docmanager/classes/dm_backend.class.php\');\n\n$dm = new DocManager($modx);\n$dmf = new DocManagerFrontend($dm, $modx);\n$dmb = new DocManagerBackend($dm, $modx);\n\n$dm->ph = $dm->getLang();\n$dm->ph[\'theme\'] = $dm->getTheme();\n$dm->ph[\'ajax.endpoint\'] = MODX_SITE_URL.\'assets/modules/docmanager/tv.ajax.php\';\n$dm->ph[\'datepicker.offset\'] = $modx->config[\'datepicker_offset\'];\n$dm->ph[\'datetime.format\'] = $modx->config[\'datetime_format\'];\n\nif (isset($_POST[\'tabAction\'])) {\n    $dmb->handlePostback();\n} else {\n    $dmf->getViews();\n    echo $dm->parseTemplate(\'main.tpl\', $dm->ph);\n}'),
  ('2','Extras','<strong>0.1.4</strong> first repository for Evolution CMS','0','0','3','0','0','','0','','0','0','store435243542tf542t5t','1','[]',' \n/**\n * Extras\n * \n * first repository for Evolution CMS\n * \n * @category	module\n * @version 	0.1.4\n * @internal	@properties\n * @internal	@guid store435243542tf542t5t	\n * @internal	@shareparams 1\n * @internal	@dependencies requires files located at /assets/modules/store/\n * @internal	@modx_category Manager and Admin\n * @internal    @installset base, sample\n * @lastupdate  25/11/2016\n */\n\n//AUTHORS: Bumkaka & Dmi3yy \ninclude_once(\'../assets/modules/store/core.php\');'),
  ('3','ClientSettings','<strong>2.1.1</strong> Customizable set of fields for user settings','0','0','3','0','0','','0','','0','1671566611','clsee234523g354f542t5t','1','{\n  \"prefix\": [\n    {\n      \"label\": \"Prefix for settings\",\n      \"type\": \"text\",\n      \"value\": \"\",\n      \"default\": \"\",\n      \"desc\": \"\"\n    }\n  ],\n  \"config_path\": [\n    {\n      \"label\": \"Path to configuration files\",\n      \"type\": \"text\",\n      \"value\": \"assets/templates/projectsoft/develop/modules/clientsettings/config/\",\n      \"default\": \"\",\n      \"desc\": \"\"\n    }\n  ]\n}','require_once MODX_BASE_PATH . \'assets/modules/clientsettings/core/src/ClientSettings.php\';\n\nif (!$modx->hasPermission(\'exec_module\')) {\n    $modx->sendRedirect(\'index.php?a=106\');\n}\n\nif (!is_array($modx->event->params)) {\n    $modx->event->params = [];\n}\n\nif (!function_exists(\'renderFormElement\')) {\n    include_once MODX_MANAGER_PATH . \'includes/tmplvars.commands.inc.php\';\n    include_once MODX_MANAGER_PATH . \'includes/tmplvars.inc.php\';\n}\n\nif (isset($_REQUEST[\'stay\'])) {\n    $_SESSION[\'stay\'] = $_REQUEST[\'stay\'];\n} else if (isset($_SESSION[\'stay\'])) {\n    $_REQUEST[\'stay\'] = $_SESSION[\'stay\'];\n}\n\n(new ClientSettings($params))->processRequest();\n'),
  ('4','EvoPack','Пакет для формирования установочных пакетов на основе текущего сайта','0','0','3','0','0','','0','','0','0','evocheck92485832rt3','1','','include_once(MODX_BASE_PATH.\'assets/modules/evopack/evopack.module.php\');\n');

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
  ('11','129','0'),
  ('13','32','1'),
  ('13','30','3'),
  ('13','109','0'),
  ('13','120','1'),
  ('14','3','0'),
  ('15','130','0'),
  ('16','120','0'),
  ('16','32','0'),
  ('17','117','2'),
  ('17','118','0'),
  ('18','146','0'),
  ('18','151','0');

INSERT INTO `evo_site_plugin_events` VALUES
  ('19','121','0');

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
  ('11','ClientSettings','<strong>2.1.1</strong> Creates menu item for user module ClientSettings','0','3','0','\n\nif ($modx->event->name == \'OnManagerMenuPrerender\') {\n    require_once MODX_BASE_PATH . \'assets/modules/clientsettings/core/src/ClientSettings.php\';\n\n    $cs   = new ClientSettings($params);\n    $mid  = $cs->getModuleId();\n    $lang = $cs->loadLang();\n    $tabs = $cs->loadStructure();\n\n    if (!empty($tabs)) {\n        $menuparams = [\'client_settings\', \'main\', \'<i class=\"fa fa-cog\"></i>\' . $lang[\'cs.module_title\'], \'index.php?a=112&id=\' . $mid . \'&type=default\', $lang[\'cs.module_title\'], \'\', \'\', \'main\', 0, 100, \'\'];\n\n        if (count($tabs) > 1) {\n            $menuparams[3] = \'javscript:;\';\n            $menuparams[5] = \'return false;\';\n            $sort = 0;\n\n            $params[\'menu\'][\'client_settings_main\'] = [\'client_settings_main\', \'client_settings\', \'<i class=\"fa fa-cog\"></i>\' . $lang[\'cs.module_title\'], \'index.php?a=112&id=\' . $mid . \'&type=default\', $lang[\'cs.module_title\'], \'\', \'\', \'main\', 0, $sort, \'\'];\n\n            foreach ($tabs as $alias => $item) {\n                if ($alias != \'default\') {\n                    $params[\'menu\'][\'client_settings_\' . $alias] = [\'client_settings_\' . $alias, \'client_settings\', \'<i class=\"fa \' . (isset($item[\'menu\'][\'icon\']) ? $item[\'menu\'][\'icon\'] : \'fa-cog\') . \'\"></i>\' . $item[\'menu\'][\'caption\'], \'index.php?a=112&id=\' . $mid . \'&type=\' . $alias, $item[\'menu\'][\'caption\'], \'\', \'\', \'main\', 0, $sort += 10, \'\'];\n                }\n            }\n        }\n\n        $params[\'menu\'][\'client_settings\'] = $menuparams;\n        $modx->event->output(serialize($params[\'menu\']));\n    }\n\n    return;\n}\n\n','0','','0','clsee234523g354f542t5t','0','0'),
  ('13','PageBuilder','<strong>1.3.16</strong> Creates form for manage content sections','0','3','0','include_once MODX_BASE_PATH . \'assets/plugins/pagebuilder/pagebuilder.php\';\n\n$e = &$modx->event;\n\nswitch ($e->name) {\n    case \'OnWebPageInit\':\n    case \'OnManagerPageInit\': {\n        $modx->db->query(\"DELETE FROM \" . $modx->getFullTableName(\'site_plugin_events\') . \"\n            WHERE pluginid IN (\n               SELECT id\n               FROM \" . $modx->getFullTableName(\'site_plugins\') . \"\n               WHERE name = \'\" . $e->activePlugin . \"\'\n               AND disabled = 0\n            )\n            AND evtid IN (\n               SELECT id\n               FROM \" . $modx->getFullTableName(\'system_eventnames\') . \"\n               WHERE name IN (\'OnWebPageInit\', \'OnManagerPageInit\')\n            )\");\n\n        $modx->clearCache(\'full\');\n\n        (new PageBuilder($modx))->install();\n\n        return;\n    }\n\n    case \'OnDocFormRender\': {\n        $e->output((new PageBuilder($modx))->renderForm());\n        return;\n    }\n\n    case \'OnDocFormSave\': {\n        (new PageBuilder($modx))->save();\n        return;\n    }\n\n    case \'OnBeforeEmptyTrash\': {\n        (new PageBuilder($modx))->delete();\n        return;\n    }\n\n    case \'OnDocDuplicate\': {\n        (new PageBuilder($modx))->duplicate();\n        return;\n    }\n}\n\n\n','0','{\"tabName\":[{\"label\":\"Tab name\",\"type\":\"text\",\"value\":\"Page Builder\",\"default\":\"Page Builder\",\"desc\":\"\"}],\"addType\":[{\"label\":\"Add type\",\"type\":\"menu\",\"value\":\"dropdown\",\"options\":\"dropdown,icons,images\",\"default\":\"dropdown\",\"desc\":\"\"}],\"placement\":[{\"label\":\"Placement\",\"type\":\"menu\",\"value\":\"tab\",\"options\":\"content,tab\",\"default\":\"tab\",\"desc\":\"\"}],\"order\":[{\"label\":\"Default container ordering\",\"type\":\"text\",\"value\":\"0\",\"default\":\"0\",\"desc\":\"\"}]}','0','','0','0'),
  ('14','minifyHtml','<strong>1.0.1</strong> Минимизация  HTML кода','0','7','0','/**\n * minifyHtml\n *\n * Минимизация  HTML кода\n *\n * @category    plugin\n * @version     1.0.1\n * @internal    @events OnWebPagePrerender\n * @internal    @modx_category FRONTEND\n * @internal    @properties \n * @internal    @disabled 0\n * @internal    @installset base\n * @author      ProjectSoft https://github.com/ProjectSoft-STUDIONIONS\n * \n */\n\nrequire MODX_BASE_PATH.\'assets/templates/projectsoft/develop/plugins/minifyhtml/minifyhtml.plugin.php\';','0','','0',' ','1671907159','1672214542'),
  ('15','TabEnebled','Табы Для всех пользователей','0','3','0','require MODX_BASE_PATH.\'assets/templates/projectsoft/develop/plugins/tabenabled/plugin.tabenabled.php\';','0','','0',' ','1671989213','1671989630'),
  ('16','CreateDocFolder','','0','3','0','require MODX_BASE_PATH.\'assets/templates/projectsoft/develop/plugins/createdocfolder/plugin.createdocfolder.php\';','0','{\n  \"pad\": [\n    {\n      \"label\": \"Количество нулей слева\",\n      \"type\": \"int\",\n      \"value\": \"4\",\n      \"default\": \"4\",\n      \"desc\": \"\"\n    }\n  ]\n}','0',' ','1671989960','1671991059'),
  ('17','WidgetManager','<strong>v 1.2</strong> Evolution Dashboard Widget Manager','0','8','0','// get manager role\n$role = $_SESSION[\'mgrRole\'];\n// get language\nglobal $_lang;\n$e = &$modx->Event;\nswitch($e->name){\ncase \'OnManagerWelcomeHome\':\n// get manager role\n$role = $_SESSION[\'mgrRole\']; 		\n//welcome\n$welcome_showhide = isset($welcome_showhide) ? $welcome_showhide: \'hide\';\nif(($role!=1) AND ($welcome_showhide == \'AdminOnly\') OR ($welcome_showhide == \'hide\'))  {\n$widgets[\'welcome\'][\'hide\']=\'1\';\n}\n//onlineinfo\nif(($role!=1) AND ($onlineinfo_showhide == \'AdminOnly\') OR ($onlineinfo_showhide == \'hide\'))  {\n$widgets[\'onlineinfo\'][\'hide\']=\'1\';\n}\n//recentinfo\nif(($role!=1) AND ($recentinfo_showhide == \'AdminOnly\') OR ($recentinfo_showhide == \'hide\'))  {\n$widgets[\'recentinfo\'][\'hide\']=\'1\';\n}\n//news\nif(($role!=1) AND ($news_showhide == \'AdminOnly\') OR ($news_showhide == \'hide\'))  {\n$widgets[\'news\'][\'hide\']=\'1\';\n}\n//security\nif(($role!=1) AND ($security_showhide == \'AdminOnly\') OR ($security_showhide == \'hide\'))  {\n$widgets[\'security\'][\'hide\']=\'1\';\n}\n//cols\n$widgets[\'welcome\'][\'cols\']=\'col-sm-\'.$welcome_sizex.\'\'; \n$widgets[\'onlineinfo\'][\'cols\']=\'col-sm-\'.$onlineinfo_sizex.\'\'; \n$widgets[\'recentinfo\'][\'cols\']=\'col-sm-\'.$recentinfo_sizex.\'\'; \n$widgets[\'news\'][\'cols\']=\'col-sm-\'.$news_sizex.\'\'; \n$widgets[\'security\'][\'cols\']=\'col-sm-\'.$security_sizex.\'\'; \n//menuindex\n$widgets[\'welcome\'][\'menuindex\']=$welcome_menuindex; \n$widgets[\'onlineinfo\'][\'menuindex\']=$onlineinfo_menuindex; \n$widgets[\'recentinfo\'][\'menuindex\']=$recentinfo_menuindex; \n$widgets[\'news\'][\'menuindex\']=$news_menuindex; \n$widgets[\'security\'][\'menuindex\']=$security_menuindex; \n$e->output(serialize($widgets));\nbreak;\ncase \'OnManagerWelcomeRender\':\n// get plugin id\n$result = $modx->db->select(\'id\', $this->getFullTableName(\"site_plugins\"), \"name=\'{$modx->event->activePlugin}\' AND disabled=0\");\n$pluginid = $modx->db->getValue($result);\nif($modx->hasPermission(\'edit_plugin\')) {\n$button_pl_config = \'\n<!--div class=\"container-fluid\">\n    <p class=\"text-muted pull-right\">\n    <a class=\"btn btn-sm btn-secondary\" data-toggle=\"tooltip\" href=\"javascript:;\" title=\"\' . $_lang[\"settings_config\"] . \'\" class=\"text-muted pull-right\" onclick=\"parent.modx.popup({url:\\\'\'. MODX_MANAGER_URL.\'?a=102&id=\'.$pluginid.\'&tab=1\\\',title1:\\\'\' . $_lang[\"settings_config\"] . \'\\\',icon:\\\'fa-cog\\\',iframe:\\\'iframe\\\',selector2:\\\'#tabConfig\\\',position:\\\'center center\\\',width:\\\'80%\\\',height:\\\'80%\\\',hide:0,hover:0,overlay:1,overlayclose:1})\" ><i class=\"fa fa-cog\"></i> \' . $_lang[\"settings_config\"] . \'</a> \n    </p>\n  </div>\n</div-->\n\';\n}\n$e->output($button_pl_config);\nbreak;\n}\n','0','{\n  \"welcome_showhide\": [\n    {\n      \"label\": \"Show Welcome Widget:\",\n      \"type\": \"menu\",\n      \"value\": \"show\",\n      \"options\": \"show,hide,AdminOnly\",\n      \"default\": \"show\",\n      \"desc\": \"\"\n    }\n  ],\n  \"welcome_sizex\": [\n    {\n      \"label\": \"Welcome width:\",\n      \"type\": \"list\",\n      \"value\": \"12\",\n      \"options\": \"12,6,4,3\",\n      \"default\": \"6\",\n      \"desc\": \"\"\n    }\n  ],\n  \"welcome_menuindex\": [\n    {\n      \"label\": \"Welcome sort order:\",\n      \"type\": \"text\",\n      \"value\": \"1\",\n      \"default\": \"1\",\n      \"desc\": \"\"\n    }\n  ],\n  \"onlineinfo_showhide\": [\n    {\n      \"label\": \"Show Online Info widget:\",\n      \"type\": \"menu\",\n      \"value\": \"hide\",\n      \"options\": \"show,hide,AdminOnly\",\n      \"default\": \"show\",\n      \"desc\": \"\"\n    }\n  ],\n  \"onlineinfo_sizex\": [\n    {\n      \"label\": \"Online Info width:\",\n      \"type\": \"list\",\n      \"value\": \"6\",\n      \"options\": \"12,6,4,3\",\n      \"default\": \"6\",\n      \"desc\": \"\"\n    }\n  ],\n  \"onlineinfo_menuindex\": [\n    {\n      \"label\": \"Online Info sort order:\",\n      \"type\": \"text\",\n      \"value\": \"2\",\n      \"default\": \"2\",\n      \"desc\": \"\"\n    }\n  ],\n  \"recentinfo_showhide\": [\n    {\n      \"label\": \"Show Recent resource Widget:\",\n      \"type\": \"menu\",\n      \"value\": \"hide\",\n      \"options\": \"show,hide,AdminOnly\",\n      \"default\": \"show\",\n      \"desc\": \"\"\n    }\n  ],\n  \"recentinfo_sizex\": [\n    {\n      \"label\": \"Recent resource width:\",\n      \"type\": \"list\",\n      \"value\": \"12\",\n      \"options\": \"12,6,4,3\",\n      \"default\": \"12\",\n      \"desc\": \"\"\n    }\n  ],\n  \"recentinfo_menuindex\": [\n    {\n      \"label\": \"Recent resource sort order:\",\n      \"type\": \"text\",\n      \"value\": \"3\",\n      \"default\": \"3\",\n      \"desc\": \"\"\n    }\n  ],\n  \"news_showhide\": [\n    {\n      \"label\": \"Show News Widget:\",\n      \"type\": \"menu\",\n      \"value\": \"hide\",\n      \"options\": \"show,hide,AdminOnly\",\n      \"default\": \"show\",\n      \"desc\": \"\"\n    }\n  ],\n  \"news_sizex\": [\n    {\n      \"label\": \"News width:\",\n      \"type\": \"list\",\n      \"value\": \"6\",\n      \"options\": \"12,6,4,3\",\n      \"default\": \"6\",\n      \"desc\": \"\"\n    }\n  ],\n  \"news_menuindex\": [\n    {\n      \"label\": \"News sort order:\",\n      \"type\": \"text\",\n      \"value\": \"4\",\n      \"default\": \"4\",\n      \"desc\": \"\"\n    }\n  ],\n  \"security_showhide\": [\n    {\n      \"label\": \"Show SecurityNews Widget:\",\n      \"type\": \"menu\",\n      \"value\": \"hide\",\n      \"options\": \"show,hide,AdminOnly\",\n      \"default\": \"show\",\n      \"desc\": \"\"\n    }\n  ],\n  \"security_sizex\": [\n    {\n      \"label\": \"SecurityNews width:\",\n      \"type\": \"list\",\n      \"value\": \"6\",\n      \"options\": \"12,6,4,3\",\n      \"default\": \"6\",\n      \"desc\": \"\"\n    }\n  ],\n  \"security_menuindex\": [\n    {\n      \"label\": \"SecurityNews order:\",\n      \"type\": \"text\",\n      \"value\": \"5\",\n      \"default\": \"5\",\n      \"desc\": \"\"\n    }\n  ]\n}','0',' ','0','1671992311'),
  ('18','TelegramBot','TelegramBot','0','3','0','/**\n * TelegramBot\n *\n * TelegramBot\n *\n * @category    plugin\n * @internal    @events OnLogEvent,OnSendBot\n * @internal    @modx_category \n * @internal    @properties &chat_id=ID пользователя;text;83741005;ID пользователя вы можете узнать у бота <a href=\'https://t.me/ShowJsonBot\' target=\'_blank\'>https://t.me/ShowJsonBot</a> &chanel_id=ID Канала;text;;ID канала узнать после создания канала приёма заявок. Напишите на канале сообщение и перешлите его <a href=\'https://t.me/ShowJsonBot\' target=\'_blank\'>@ShowJsonBot</a> &bot_token=Токен бота;text;5742061218:AAE6zhQrQwnIPFh4yZr2-ABwr586c_3WULY;Токен созданного вами бота. Бот должен быть участником канала.\n * @internal    @disabled 0\n * @internal    @installset base\n */\nrequire MODX_BASE_PATH.\"assets/templates/projectsoft/develop/plugins/telegram_bot/plugin.telegram_bot.php\";','0','{\n  \"chat_id\": [\n    {\n      \"label\": \"ID пользователя\",\n      \"type\": \"text\",\n      \"value\": \"83741005\",\n      \"default\": \"ID пользователя вы можете узнать у бота <a href\",\n      \"desc\": \"\"\n    }\n  ],\n  \"chanel_id\": [\n    {\n      \"label\": \"ID Канала\",\n      \"type\": \"text\",\n      \"value\": \"\",\n      \"default\": \"ID канала узнать после создания канала приёма заявок. Напишите на канале сообщение и перешлите его <a href\",\n      \"desc\": \"\"\n    }\n  ],\n  \"bot_token\": [\n    {\n      \"label\": \"Токен бота\",\n      \"type\": \"text\",\n      \"value\": \"5742061218:AAE6zhQrQwnIPFh4yZr2-ABwr586c_3WULY\",\n      \"default\": \"Токен созданного вами бота. Бот должен быть участником канала.\",\n      \"desc\": \"\"\n    }\n  ]\n}','0',' ','1671995324','1672228226'),
  ('19','EvoFileManagerDialog','<strong>1.2.4</strong> Открыте файлменеджера в окне редактирования документа, а не в новом окне браузера.','0','3','0','require MODX_BASE_PATH.\'assets/plugins/filemanageropen/plugin.filemanageropen.php\';\n','0','{\"show_buttons\":[{\"label\":\"Показать кнопки файлменеджера в ресурсе\",\"type\":\"list\",\"value\":\"1\",\"options\":\"0,1\",\"default\":\"1\",\"desc\":\"\"}],\"show_alert_copy\":[{\"label\":\"Показать сообщение о копировании пути в FileManager\",\"type\":\"list\",\"value\":\"0\",\"options\":\"0,1\",\"default\":\"0\",\"desc\":\"\"}]}','0',' ','0','1672344414');

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
  ('8','phpthumb','<strong>1.4.2</strong> PHPThumb creates thumbnails and altered images on the fly and caches them','0','4','0','\nreturn require MODX_BASE_PATH.\'assets/snippets/phpthumb/snippet.phpthumb.php\';','0','{\n  \"noImage\": [\n    {\n      \"label\": \"noImage\",\n      \"type\": \"text\",\n      \"value\": \"assets/templates/projectsoft/images/imgsoc.png\",\n      \"default\": \"assets/templates/projectsoft/images/imgsoc.png\",\n      \"desc\": \"Подставляемое изображение если запрашиваемое не существует\"\n    }\n  ]\n}',' ','0','1672215219','0'),
  ('9','summary','<strong>2.0.2</strong> Truncates the string to the specified length','0','4','0','return require MODX_BASE_PATH.\'assets/snippets/summary/snippet.summary.php\';','0','[]','','0','0','0'),
  ('10','multiTV','<strong>2.0.16</strong> Custom Template Variabe containing a sortable multi item list or a datatable','0','4','0','return require MODX_BASE_PATH . \'assets/tvs/multitv/multitv.snippet.php\';\n','0','','','0','0','0'),
  ('11','PageBuilder','<strong>1.3.16</strong> output content sections for current page','0','4','0','include_once MODX_BASE_PATH . \'assets/plugins/pagebuilder/pagebuilder.php\';\nreturn (new PageBuilder($modx))->render($params);\n\n','0','','','0','0','0'),
  ('12','ogImage','Генератор Open Graph Image','0','4','0','\nreturn require MODX_BASE_PATH . \"assets/templates/projectsoft/develop/snippets/ogimage/snippet.ogimage.php\";','0','{\n  \"og\": [\n    {\n      \"label\": \"Вывести Open Graph Image\",\n      \"type\": \"list\",\n      \"value\": \"1\",\n      \"options\": \"0,1\",\n      \"default\": \"1\",\n      \"desc\": \"\"\n    }\n  ],\n  \"twitter\": [\n    {\n      \"label\": \"Вывести Twitter Image\",\n      \"type\": \"list\",\n      \"value\": \"0\",\n      \"options\": \"0,1\",\n      \"default\": \"1\",\n      \"desc\": \"\"\n    }\n  ]\n}',' ','1672153699','1672159500','0');

#
# Dumping data for table `evo_site_templates`
#

INSERT INTO `evo_site_templates` VALUES
  ('3','Шаблон «Главная страница»',NULL,'','0','6','','0','{{@FILE assets/templates/projectsoft/html/index.html}}','0','1','0','1671630541'),
  ('4','Шаблон «Дефолтный»',NULL,'','0','6','','0','{{@FILE assets/templates/projectsoft/html/default.html}}','0','1','1671556916','1671630548'),
  ('5','Шаблон «Руководитель»',NULL,'','0','6','','0','{{@FILE assets/templates/projectsoft/html/leader.html}}','0','0','1671628325','1671809804'),
  ('6','Шаблон «Заместители»',NULL,'','0','6','','0','{{@FILE assets/templates/projectsoft/html/deputy.html}}','0','0','0','1671648730'),
  ('7','Шаблон «Структура ведомства»',NULL,'','0','6','','0','{{@FILE assets/templates/projectsoft/html/structure.html}}','0','0','0','1671635509'),
  ('8','Шаблон «Документы»',NULL,'','0','6','','0','{{@FILE assets/templates/projectsoft/html/documents.html}}','0','0','0','1671685106'),
  ('9','Шаблон «404 Not Found»',NULL,'','0','6','','0','{{@FILE assets/templates/projectsoft/html/notfound.html}}','0','0','0','1671630535'),
  ('10','Шаблон «401 Unauthorized»',NULL,'','0','6','','0','{{@FILE assets/templates/projectsoft/html/unauthorized.html}}','0','0','0','1671630528');

#
# Dumping data for table `evo_site_tmplvar_access`
#

#
# Dumping data for table `evo_site_tmplvar_contentvalues`
#

INSERT INTO `evo_site_tmplvar_contentvalues` VALUES
  ('1','4','1','[(site_name)]'),
  ('2','5','4','{\"fieldValue\":[{\"department\":\"Бухгалтерия\",\"fio\":\"Фамилия Имя Отчество\",\"work\":\"Главный бухгалтер\",\"phone\":\"+7 (846) 333-68-86\",\"email\":\"06029@mail.miac.samregion.ru\",\"photo\":\"assets/images/evo-logo.png\",\"thumb\":\"\"},{\"department\":\"Планово-экономический отдел\",\"fio\":\"Фамилия Имя Отчество\",\"work\":\"Начальник планово-экономического отдела\",\"phone\":\"+7 (846) 333-68-86\",\"email\":\"06029@mail.miac.samregion.ru\",\"photo\":\"assets/images/evo-logo.png\",\"thumb\":\"\"},{\"department\":\"Отдел кадров\",\"fio\":\"Фамилия Имя Отчество\",\"work\":\"Начальник отдела кадров\",\"phone\":\"+7 (846) 333-68-86\",\"email\":\"06029@mail.miac.samregion.ru\",\"photo\":\"assets/images/evo-logo.png\",\"thumb\":\"\"},{\"department\":\"Отдел материальных ценностей мобилизационного резерва\",\"fio\":\"Фамилия Имя Отчество\",\"work\":\"Начальник отдела материальных ценностей мобилизационного резерва\",\"phone\":\"+7 (846) 333-68-86\",\"email\":\"06029@mail.miac.samregion.ru\",\"photo\":\"assets/images/evo-logo.png\",\"thumb\":\"\"}],\"fieldSettings\":{\"autoincrement\":1}}'),
  ('3','6','3','{\"fieldValue\":[{\"fio\":\"Фамилия\\nИмя Отчество\",\"work\":\"Заместитель директора по общим вопросам\",\"phone\":\"+7 (999) 999-99-99\",\"email\":\"mail@exemple.com\",\"photo\":\"\",\"thumb\":\"\"},{\"fio\":\"Фамилия\\nИмя Отчество\",\"work\":\"Заместитель директора по мобилизационной работе\",\"phone\":\"+7 (999) 999-99-99\",\"email\":\"mail@exemple.com\",\"photo\":\"\",\"thumb\":\"\"}],\"fieldSettings\":{\"autoincrement\":1}}'),
  ('5','2','1','[*longtitle*]'),
  ('6','6','10','[]'),
  ('9','8','2','assets/images/0002/0000.jpg');

#
# Dumping data for table `evo_site_tmplvar_templates`
#

INSERT INTO `evo_site_tmplvar_templates` VALUES
  ('1','3','2'),
  ('2','3','3'),
  ('4','3','1'),
  ('3','3','5'),
  ('1','4','2'),
  ('2','4','3'),
  ('4','4','1'),
  ('3','4','5'),
  ('1','5','2'),
  ('2','5','3'),
  ('4','5','1'),
  ('3','5','5'),
  ('1','6','2'),
  ('2','6','3'),
  ('4','6','1'),
  ('3','6','5'),
  ('1','7','2'),
  ('2','7','3'),
  ('4','7','1'),
  ('3','7','5'),
  ('1','8','2'),
  ('2','8','3'),
  ('4','8','1'),
  ('3','8','5'),
  ('1','9','2'),
  ('2','9','3'),
  ('4','9','1'),
  ('3','9','5'),
  ('1','10','2'),
  ('2','10','3'),
  ('4','10','1');

INSERT INTO `evo_site_tmplvar_templates` VALUES
  ('3','10','5'),
  ('5','7','6'),
  ('6','6','6'),
  ('7','10','4'),
  ('7','9','4'),
  ('7','3','4'),
  ('7','4','4'),
  ('7','8','4'),
  ('7','6','4'),
  ('7','5','4'),
  ('7','7','4'),
  ('8','10','0'),
  ('8','9','0'),
  ('8','3','0'),
  ('8','4','0'),
  ('8','8','0'),
  ('8','6','0'),
  ('8','5','0'),
  ('8','7','0');

#
# Dumping data for table `evo_site_tmplvars`
#

INSERT INTO `evo_site_tmplvars` VALUES
  ('1','textarea','desc','Meta description','Meta description','0','1','0','','0','','','[*introtext*]','0','0'),
  ('2','text','keyw','Meta keywords','Meta keywords','0','1','0','','0','','','[*pagetitle*]','0','0'),
  ('3','checkbox','noIndex','No index page','Meta robots','0','1','0','Нет==<meta name=\"robots\" content=\"noindex, nofollow\">','0','','','','0','0'),
  ('4','text','titl','Meta title','Meta title','0','1','0','','0','','','[*pagetitle*] | [(site_name)]','0','1671557867'),
  ('5','custom_tv:multitv','psstructure','Структура ведомства','','0','6','0','','0','','','','1671633902','1671647651'),
  ('6','custom_tv:multitv','psdeputy','Заместители','','0','6','0','','0','','','','1671647606','1671647623'),
  ('7','checkbox','minify','Минификация HTML кода','','0','1','0','Нет==0','0','','','1','1671907356','1671907356'),
  ('8','image','imgSoc','Open Graph Image','','0','1','0','','0','','','assets/templates/projectsoft/images/imgsoc.png','1672153093','1672153093');

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
  ('146','OnLogEvent','1',''),
  ('147','OnBeforeClientSettingsSave','6','ClientSettings'),
  ('148','OnClientSettingsSave','6','ClientSettings'),
  ('149','OnPBContainerRender','6','PageBuilder'),
  ('150','OnPBFieldRender','6','PageBuilder'),
  ('151','OnSendBot','6','Bot Telegram');

#
# Dumping data for table `evo_system_settings`
#

INSERT INTO `evo_system_settings` VALUES
  ('settings_version','1.4.22'),
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
  ('editor_css_path','assets/templates/projectsoft/css/content.min.css'),
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
  ('login_logo','aassets/templates/projectsoft/images/login-logo.png'),
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
  ('tinymce4_theme','rezerv'),
  ('tinymce4_skin','lightgray'),
  ('tinymce4_skintheme','modern'),
  ('tinymce4_template_docs',''),
  ('tinymce4_template_chunks',''),
  ('tinymce4_entermode','p'),
  ('tinymce4_element_format','html'),
  ('tinymce4_schema','html5'),
  ('tinymce4_custom_plugins','advlist autolink lists link image charmap print preview hr anchor pagebreak searchreplace wordcount visualblocks visualchars code fullscreen spellchecker insertdatetime media nonbreaking save table contextmenu directionality emoticons template paste textcolor codesample colorpicker textpattern imagetools paste modxlink youtube'),
  ('tinymce4_custom_buttons1','undo redo | cut copy paste | searchreplace | bold italic underline strikethrough | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent blockquote | styleselect'),
  ('tinymce4_custom_buttons2','link unlink anchor image media codesample table | hr removeformat | subscript superscript charmap | nonbreaking | visualchars visualblocks print preview fullscreen code formatselect');

INSERT INTO `evo_system_settings` VALUES
  ('tinymce4_custom_buttons3',''),
  ('tinymce4_custom_buttons4',''),
  ('tinymce4_blockFormats','Параграф=p;Заголовок 2=h2;Заголовок 3=h3;Заголовок 4=h4;Заголовок 5=h5;Заголовок 6=h6'),
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
  ('filemanager_path','C:/OSPanel/domains/rezerv.school/site/'),
  ('upload_files','bmp,ico,gif,jpeg,jpg,png,psd,tif,tiff,fla,flv,swf,aac,au,avi,css,cache,doc,docx,gz,gzip,htaccess,htm,html,js,mp3,mp4,mpeg,mpg,ods,odp,odt,pdf,ppt,pptx,rar,tar,tgz,txt,wav,wmv,xls,xlsx,xml,z,zip,JPG,JPEG,PNG,GIF,svg,tpl'),
  ('upload_images','bmp,ico,gif,jpeg,jpg,png,psd,tif,tiff,svg'),
  ('upload_media','au,avi,mp3,mp4,mpeg,mpg,wav,wmv'),
  ('upload_flash','fla,flv,swf'),
  ('new_file_permissions','0644'),
  ('new_folder_permissions','0755'),
  ('which_browser','mcpuk'),
  ('rb_webuser','0'),
  ('rb_base_dir','C:/OSPanel/domains/rezerv.school/site/assets/'),
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
  ('thumbsDir','thumbs'),
  ('jpegQuality','90'),
  ('denyZipDownload','0'),
  ('denyExtensionRename','0'),
  ('showHiddenFiles','0'),
  ('lang_code','ru'),
  ('sys_files_checksum','a:4:{s:47:\"C:/OSPanel/domains/rezerv.school/site/index.php\";s:32:\"62aec542f3fd84f47f91d2248fa59153\";s:47:\"C:/OSPanel/domains/rezerv.school/site/.htaccess\";s:32:\"298f866b733fb7af8e2cef433d6af994\";s:55:\"C:/OSPanel/domains/rezerv.school/site/manager/index.php\";s:32:\"bb667738d2d80c29198903030ec6e657\";s:69:\"C:/OSPanel/domains/rezerv.school/site/manager/includes/config.inc.php\";s:32:\"23f1047f4181682138aaab5f352ae572\";}'),
  ('map_apykey','8e879461-d958-48ec-92ce-0f3930887231'),
  ('map_point','[53.185922, 50.100809]'),
  ('map_addres','443020, Самарская область, город Самара, Самарская ул., д.63'),
  ('map_zoom','17'),
  ('map_phones','+7 (846) 333-68-86'),
  ('map_email','06029@mail.miac.samregion.ru'),
  ('director','Понамарчук Виталий \nВладимирович'),
  ('director_photo','assets/templates/projectsoft/images/i.jpg'),
  ('company_name','ГКУЗ Самарский областной медицинский центр мобилизационных резервов «РЕЗЕРВ» Министерства здравоохранения Самарской области'),
  ('logotype','assets/templates/projectsoft/images/samara.png'),
  ('dop_styles','#js-show-iframe-wrapper{position:relative;display:flex;align-items:center;justify-content:center;width:100%;min-width:293px;max-width:100%;background:linear-gradient(138.4deg,#38bafe 26.49%,#2d73bc 79.45%);color:#fff;cursor:pointer}#js-show-iframe-wrapper .pos-banner-fluid *{box-sizing:border-box}#js-show-iframe-wrapper .pos-banner-fluid .pos-banner-btn_2{display:block;width:240px;min-height:56px;font-size:18px;line-height:24px;cursor:pointer;background:#0d4cd3;color:#fff;border:none;border-radius:8px;outline:0}#js-show-iframe-wrapper .pos-banner-fluid .pos-banner-btn_2:hover{background:#1d5deb}#js-show-iframe-wrapper .pos-banner-fluid .pos-banner-btn_2:focus{background:#2a63ad}#js-show-iframe-wrapper .pos-banner-fluid .pos-banner-btn_2:active{background:#2a63ad}@-webkit-keyframes fadeInFromNone{0%{display:none;opacity:0}1%{display:block;opacity:0}100%{display:block;opacity:1}}@keyframes fadeInFromNone{0%{display:none;opacity:0}1%{display:block;opacity:0}100%{display:block;opacity:1}}@font-face{font-family:LatoWebLight;src:url(https://pos.gosuslugi.ru/bin/fonts/Lato/fonts/Lato-Light.woff2) format(\"woff2\"),url(https://pos.gosuslugi.ru/bin/fonts/Lato/fonts/Lato-Light.woff) format(\"woff\"),url(https://pos.gosuslugi.ru/bin/fonts/Lato/fonts/Lato-Light.ttf) format(\"truetype\");font-style:normal;font-weight:400}@font-face{font-family:LatoWeb;src:url(https://pos.gosuslugi.ru/bin/fonts/Lato/fonts/Lato-Regular.woff2) format(\"woff2\"),url(https://pos.gosuslugi.ru/bin/fonts/Lato/fonts/Lato-Regular.woff) format(\"woff\"),url(https://pos.gosuslugi.ru/bin/fonts/Lato/fonts/Lato-Regular.ttf) format(\"truetype\");font-style:normal;font-weight:400}@font-face{font-family:LatoWebBold;src:url(https://pos.gosuslugi.ru/bin/fonts/Lato/fonts/Lato-Bold.woff2) format(\"woff2\"),url(https://pos.gosuslugi.ru/bin/fonts/Lato/fonts/Lato-Bold.woff) format(\"woff\"),url(https://pos.gosuslugi.ru/bin/fonts/Lato/fonts/Lato-Bold.ttf) format(\"truetype\");font-style:normal;font-weight:400}@font-face{font-family:RobotoWebLight;src:url(https://pos.gosuslugi.ru/bin/fonts/Roboto/Roboto-Light.woff2) format(\"woff2\"),url(https://pos.gosuslugi.ru/bin/fonts/Roboto/Roboto-Light.woff) format(\"woff\"),url(https://pos.gosuslugi.ru/bin/fonts/Roboto/Roboto-Light.ttf) format(\"truetype\");font-style:normal;font-weight:400}@font-face{font-family:RobotoWebRegular;src:url(https://pos.gosuslugi.ru/bin/fonts/Roboto/Roboto-Regular.woff2) format(\"woff2\"),url(https://pos.gosuslugi.ru/bin/fonts/Roboto/Roboto-Regular.woff) format(\"woff\"),url(https://pos.gosuslugi.ru/bin/fonts/Roboto/Roboto-Regular.ttf) format(\"truetype\");font-style:normal;font-weight:400}@font-face{font-family:RobotoWebBold;src:url(https://pos.gosuslugi.ru/bin/fonts/Roboto/Roboto-Bold.woff2) format(\"woff2\"),url(https://pos.gosuslugi.ru/bin/fonts/Roboto/Roboto-Bold.woff) format(\"woff\"),url(https://pos.gosuslugi.ru/bin/fonts/Roboto/Roboto-Bold.ttf) format(\"truetype\");font-style:normal;font-weight:400}@font-face{font-family:ScadaWebRegular;src:url(https://pos.gosuslugi.ru/bin/fonts/Scada/Scada-Regular.woff2) format(\"woff2\"),url(https://pos.gosuslugi.ru/bin/fonts/Scada/Scada-Regular.woff) format(\"woff\"),url(https://pos.gosuslugi.ru/bin/fonts/Scada/Scada-Regular.ttf) format(\"truetype\");font-style:normal;font-weight:400}@font-face{font-family:ScadaWebBold;src:url(https://pos.gosuslugi.ru/bin/fonts/Scada/Scada-Bold.woff2) format(\"woff2\"),url(https://pos.gosuslugi.ru/bin/fonts/Scada/Scada-Bold.woff) format(\"woff\"),url(https://pos.gosuslugi.ru/bin/fonts/Scada/Scada-Bold.ttf) format(\"truetype\");font-style:normal;font-weight:400}@font-face{font-family:Geometria;src:url(https://pos.gosuslugi.ru/bin/fonts/Geometria/Geometria.eot);src:url(https://pos.gosuslugi.ru/bin/fonts/Geometria/Geometria.eot?#iefix) format(\"embedded-opentype\"),url(https://pos.gosuslugi.ru/bin/fonts/Geometria/Geometria.woff) format(\"woff\"),url(https://pos.gosuslugi.ru/bin/fonts/Geometria/Geometria.ttf) format(\"truetype\");font-weight:400;font-style:normal}@font-face{font-family:Geometria-ExtraBold;src:url(https://pos.gosuslugi.ru/bin/fonts/Geometria/Geometria-ExtraBold.eot);src:url(https://pos.gosuslugi.ru/bin/fonts/Geometria/Geometria-ExtraBold.eot?#iefix) format(\"embedded-opentype\"),url(https://pos.gosuslugi.ru/bin/fonts/Geometria/Geometria-ExtraBold.woff) format(\"woff\"),url(https://pos.gosuslugi.ru/bin/fonts/Geometria/Geometria-ExtraBold.ttf) format(\"truetype\");font-weight:800;font-style:normal}#js-show-iframe-wrapper{background:var(--pos-banner-fluid-12__background)}#js-show-iframe-wrapper .pos-banner-fluid .pos-banner-btn_2{width:100%;min-height:52px;background:#fff;color:#0b1f33;font-size:16px;font-family:LatoWeb,sans-serif;font-weight:400;padding:0;line-height:1.2}#js-show-iframe-wrapper .pos-banner-fluid .pos-banner-btn_2:active,#js-show-iframe-wrapper .pos-banner-fluid .pos-banner-btn_2:focus,#js-show-iframe-wrapper .pos-banner-fluid .pos-banner-btn_2:hover{background:#e4ecfd}#js-show-iframe-wrapper .bf-12{position:relative;display:grid;grid-template-columns:var(--pos-banner-fluid-12__grid-template-columns);grid-template-rows:var(--pos-banner-fluid-12__grid-template-rows);width:100%;max-width:var(--pos-banner-fluid-12__max-width);box-sizing:border-box;grid-auto-flow:row dense}#js-show-iframe-wrapper .bf-12__decor{background:var(--pos-banner-fluid-12__bg-url) var(--pos-banner-fluid-12__bg-url-position) no-repeat;background-size:var(--pos-banner-fluid-12__bg-size);background-color:#f8efec;position:relative}#js-show-iframe-wrapper .bf-12__content{display:flex;flex-direction:column;padding:var(--pos-banner-fluid-12__content-padding);grid-row:var(--pos-banner-fluid-12__content-grid-row);justify-content:center}#js-show-iframe-wrapper .bf-12__text{margin:var(--pos-banner-fluid-12__text-margin);font-size:var(--pos-banner-fluid-12__text-font-size);line-height:1.2;font-family:LatoWeb,sans-serif;font-weight:700;color:#0b1f33}#js-show-iframe-wrapper .bf-12__bottom-wrap{display:flex;flex-direction:row;align-items:center}#js-show-iframe-wrapper .bf-12__logo-wrap{position:absolute;top:var(--pos-banner-fluid-12__logo-wrap-top);right:var(--pos-banner-fluid-12__logo-wrap-right)}#js-show-iframe-wrapper .bf-12__logo{width:var(--pos-banner-fluid-12__logo-width);margin-left:1px}#js-show-iframe-wrapper .bf-12__slogan{font-family:LatoWeb,sans-serif;font-weight:700;font-size:var(--pos-banner-fluid-12__slogan-font-size);line-height:1.2;color:#005ca9}#js-show-iframe-wrapper .bf-12__btn-wrap{width:100%;max-width:var(--pos-banner-fluid-12__button-wrap-max-width)}'),
  ('dop_scripts','<script src=\"https://pos.gosuslugi.ru/bin/script.min.js\"></script>\n\n<script type=\"text/javascript\">(function(){\"use strict\";function ownKeys(e,t){var n=Object.keys(e);if(Object.getOwnPropertySymbols){var r=Object.getOwnPropertySymbols(e);if(t)r=r.filter(function(t){return Object.getOwnPropertyDescriptor(e,t).enumerable});n.push.apply(n,r)}return n}function _objectSpread(e){for(var t=1;t<arguments.length;t++){var n=null!=arguments[t]?arguments[t]:{};if(t%2)ownKeys(Object(n),true).forEach(function(t){_defineProperty(e,t,n[t])});else if(Object.getOwnPropertyDescriptors)Object.defineProperties(e,Object.getOwnPropertyDescriptors(n));else ownKeys(Object(n)).forEach(function(t){Object.defineProperty(e,t,Object.getOwnPropertyDescriptor(n,t))})}return e}function _defineProperty(e,t,n){if(t in e)Object.defineProperty(e,t,{value:n,enumerable:true,configurable:true,writable:true});else e[t]=n;return e}var POS_PREFIX_12=\"--pos-banner-fluid-12__\",posOptionsInitialBanner12={background:\"#50b3ff\",\"grid-template-columns\":\"100%\",\"grid-template-rows\":\"188px auto\",\"max-width\":\"100%\",\"text-font-size\":\"24px\",\"text-margin\":\"0 0 24px 0\",\"button-wrap-max-width\":\"100%\",\"bg-url\":\"url(\'https://pos.gosuslugi.ru/bin/banner-fluid/6/banner-fluid-bg-6.svg\')\",\"bg-url-position\":\"center bottom\",\"bg-size\":\"contain\",\"content-padding\":\"24px\",\"content-grid-row\":\"0\",\"logo-width\":\"65px\",\"logo-wrap-top\":\"16px\",\"logo-wrap-right\":\"13px\",\"slogan-font-size\":\"12px\"},setStyles=function(e,t){var n=arguments.length>2&&void 0!==arguments[2]?arguments[2]:POS_PREFIX_12;Object.keys(e).forEach(function(r){t.style.setProperty(n+r,e[r])})},removeStyles=function(e,t){var n=arguments.length>2&&void 0!==arguments[2]?arguments[2]:POS_PREFIX_12;Object.keys(e).forEach(function(e){t.style.removeProperty(n+e)})};function changePosBannerOnResize(){var e=document.documentElement,t=_objectSpread({},posOptionsInitialBanner12),n=document.getElementById(\"js-show-iframe-wrapper\"),r=n?n.offsetWidth:document.body.offsetWidth;if(r>340)t[\"grid-template-rows\"]=\"236px auto\",t[\"bg-url\"]=\"url(\'https://pos.gosuslugi.ru/bin/banner-fluid/6/banner-fluid-bg-6-2.svg\')\",t[\"button-wrap-max-width\"]=\"209px\",t[\"content-padding\"]=\"24px 32px\",t[\"text-margin\"]=\"0 0 24px 0\";if(r>350)t[\"bg-url-position\"]=\"center bottom calc(100% - 40px)\";if(r>415)t[\"bg-url-position\"]=\"center bottom\";if(r>568)t[\"grid-template-columns\"]=\"1fr 292px\",t[\"grid-template-rows\"]=\"100%\",t[\"content-grid-row\"]=\"1\",t[\"content-padding\"]=\"32px 24px 24px\",t[\"bg-url\"]=\"url(\'https://pos.gosuslugi.ru/bin/banner-fluid/6/banner-fluid-bg-6.svg\')\";if(r>783)t[\"grid-template-columns\"]=\"1fr 400px\",t[\"text-font-size\"]=\"32px\",t[\"content-padding\"]=\"32px 24px\",t[\"bg-url\"]=\"url(\'https://pos.gosuslugi.ru/bin/banner-fluid/6/banner-fluid-bg-6-2.svg\')\",t[\"bg-url-position\"]=\"center bottom calc(100% - 25px)\";if(r>820)t[\"grid-template-columns\"]=\"1fr 420px\",t[\"bg-url-position\"]=\"center bottom\";if(r>1098)t[\"bg-url\"]=\"url(\'https://pos.gosuslugi.ru/bin/banner-fluid/6/banner-fluid-bg-6-3.svg\')\",t[\"grid-template-columns\"]=\"1fr 557px\",t[\"text-font-size\"]=\"36px\",t[\"content-padding\"]=\"32px 32px 32px 50px\",t[\"logo-width\"]=\"78px\",t[\"logo-wrap-top\"]=\"20px\",t[\"logo-wrap-right\"]=\"17px\",t[\"slogan-font-size\"]=\"15px\";if(r>1422)t[\"max-width\"]=\"1422px\",t[\"grid-template-columns\"]=\"1fr 720px\",t[\"content-padding\"]=\"32px 48px 32px 160px\",t.background=\"linear-gradient(90deg, #50b3ff 50%, #f8efec 50%)\";setStyles(t,e)}changePosBannerOnResize(),window.addEventListener(\"resize\",changePosBannerOnResize),window.onunload=function(){var e=document.documentElement,t=_objectSpread({},posOptionsInitialBanner12);window.removeEventListener(\"resize\",changePosBannerOnResize),removeStyles(t,e)};})();</script>\n\n<script type=\"text/javascript\">Widget(\"https://pos.gosuslugi.ru/form\", 333863)</script>'),
  ('yandex_verification','');

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

