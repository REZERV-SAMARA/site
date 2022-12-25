<?php
if(!defined('MODX_BASE_PATH')) die('What are you doing? Get out of here!');

$e = &$modx->event;

switch($e->name){
	case 'OnManagerTopPrerender':
		$modx->config['global_tabs'] = 1;
		$out = '<script>modx.config.global_tabs = 1;</script>';
		$modx->event->output($out);
		break;
}