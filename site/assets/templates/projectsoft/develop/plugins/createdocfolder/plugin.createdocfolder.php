<?php
if(!defined('MODX_BASE_PATH')) die('What are you doing? Get out of here!');

/**
 * 
 * OnDocFormSave
 * OnDocDuplicate
{
  "pad": [
    {
      "label": "Количество нулей слева",
      "type": "int",
      "value": "4",
      "default": "4",
      "desc": ""
    }
  ]
}
*
**/

if (!function_exists('createDocFolders')):

	function createDocFolders(\DocumentParser $modx, $params)
	{
		if(!is_array($params)):
			$params = array();
		endif;
		
		$parent = 0;

		$params["pad"] = isset($params["pad"]) ? intval($params["pad"]) : 4;
		if($params["pad"]< 1):
			$params["pad"] = 4;
		endif;
		$permsFolder = octdec($modx->config['new_folder_permissions']);
		$assetsPath = $modx->config['rb_base_dir'];

		$id = (isset($params['new_id'])) ? intval($params['new_id']) : intval($params["id"]);
		
		if(!$id):
			return;
		endif;
		
		$lists = array(str_pad($id, $params["pad"], "0", STR_PAD_LEFT));
		getParentCreateDocFolders($modx, $id, $lists, $params);
		
		$dir = implode('/', array_reverse($lists));
		
		if(!is_dir($assetsPath."images/".$dir)):
			@mkdir($assetsPath."images/".$dir, $permsFolder, true);
		endif;
		if(!is_dir($assetsPath."files/".$dir)):
			@mkdir($assetsPath."files/".$dir, $permsFolder, true);
		endif;
	}
endif;

if (!function_exists('getParentCreateDocFolders')):
	function getParentCreateDocFolders(\DocumentParser $modx, $id, &$lists, $params)
	{
		$table_content = $modx->getFullTableName('site_content');
		$parent = $modx->db->getValue($modx->db->select('parent', $table_content, "id='{$id}'"));
		if($parent):
			$lists[] = str_pad($parent, $params["pad"], "0", STR_PAD_LEFT);
			getParentCreateDocFolders($modx, $parent, $lists, $params);
		endif;
	}
endif;

$e =& $modx->event;
$params = $e->params;

switch ($e->name) {
	case "OnDocFormSave":
	case "OnDocDuplicate":
		// Create folders
		createDocFolders($modx, $params);
		break;
}