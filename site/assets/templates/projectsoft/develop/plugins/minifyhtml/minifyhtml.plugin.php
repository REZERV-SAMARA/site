<?php
if(!defined('MODX_BASE_PATH')) die('What are you doing? Get out of here!');

use ProjectSoft\Util;

$e =&$modx->event;

switch ($e->name) {
	case "OnWebPagePrerender":
	$minify = true;
		if (isset($_SERVER['HTTP_X_REQUESTED_WITH']) && !empty($_SERVER['HTTP_X_REQUESTED_WITH']) && strtolower($_SERVER['HTTP_X_REQUESTED_WITH']) == 'xmlhttprequest'):
			if(!empty($_POST["formid"])):
				$minify = false;
			endif;
		endif;
		if($modx->documentObject['minify'][1]==1 && $minify):
			$str = $modx->documentOutput;
			$str = preg_replace('/<\!--.*-->/Usi', '', $str);
			$re = '/((?:(?:content|title|alt)=))(?:"|\')(.*)?(?:"|\')/Usi';
			$use_hash = md5(Util::has());
			$str = preg_replace_callback($re, function ($matches) use ($use_hash) {
				$ureg = '/(\r?(?:\n))/Usi';
				$res = preg_replace($ureg, $use_hash, $matches[2]);
				return $matches[1].'"'.$res.'"';
			}, $str);
			$str = preg_replace("/(\s+)?\n(\s+)?/", '', $str);
			$str = preg_filter("/\s+/u", ' ', $str);
			$str = preg_replace("/(" . $use_hash . ")/", "\n", $str);
			$modx->documentOutput = $str;
		endif;
		break;
}
