<?php
if(!defined('MODX_BASE_PATH')) die('What are you doing? Get out of here!');

$e = &$modx->event;

switch($e->name){
	case 'OnManagerTopPrerender':
		$modx->config['global_tabs'] = 1;
		$out = '<script>modx.config.global_tabs = 1;</script>';
        $out .= '<style>
    @media (min-width: 1200px) {
        #mainMenu #nav #site::before {
            background: url("/assets/templates/projectsoft/images/logo-navbar-white.png") 0 50% no-repeat;
            background-size: 9rem;
        }
    }
</style>';
		$modx->event->output($out);
		break;
}
