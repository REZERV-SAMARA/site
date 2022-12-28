<?php
// Open Graph image
if(!isset($params)):
	$params = [];
endif;

$params['og'] = isset($og) ? intval($og) : 0;
$params['twitter'] = isset($twitter) ? intval($twitter) : 0;

function ogImage(\DocumentParser $modx, $params)
{
	$object = $modx->documentObject;
	$ID = $object['id'];
	$img = $object['imgSoc'][1];
	$out = "";
	if(is_file(MODX_BASE_PATH . $img)):
		$site_url = $modx->getConfig('site_url');
		$og_1 = $modx->runSnippet('phpthumb', array(
			'input'		=> $img,
			'options'	=> 'w=537,h=240,f=jpg,zc=T,sx=2'
		));
		$og_2 = $modx->runSnippet('phpthumb', array(
			'input'		=> $img,
			'options'	=> 'w=400,h=400,f=jpg,zc=T,sx=2'
		));
		$out .= '<meta itemprop="image" content="' . $site_url . $og_1 . '" />';
		if($params['og']==1):
			$out .= '<meta property="og:image" content="' . $site_url . $og_2 . '" />';
			$out .= '<meta property="og:image:width" content="400" />';
			$out .= '<meta property="og:image:height" content="400" />';
			$out .= '<meta property="og:image:type" content="image/jpeg" />';
			$out .= '<meta property="og:image" content="' . $site_url . $og_1 . '" />';
			$out .= '<meta property="og:image:width" content="537" />';
			$out .= '<meta property="og:image:height" content="240" />';
			$out .= '<meta property="og:image:type" content="image/jpeg" />';
		endif;
		if($params['twitter']==1):
			$out .= '<meta property="twitter:image0" content="' . $site_url . $img . '" />';
			$out .= '<meta property="twitter:image1" content="' . $site_url . $og_2 . '" />';
			$out .= '<meta property="twitter:image2" content="' . $site_url . $og_1 . '" />';
		endif;
	endif;
	return $out;
}

return ogImage($modx, $params);