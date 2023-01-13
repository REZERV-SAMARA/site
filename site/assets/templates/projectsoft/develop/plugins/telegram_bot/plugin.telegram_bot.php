<?php
if(!defined('MODX_BASE_PATH')) die('What are you doing? Get out of here!');

/**
 * 
{
  "chat_id": [
    {
      "label": "ID пользователя",
      "type": "text",
      "value": "83741005",
      "default": "83741005",
      "desc": "ID пользователя вы можете узнать у бота <a href='https://t.me/ShowJsonBot' target='_blank'>https://t.me/ShowJsonBot</a>"
    }
  ],
  "chanel_id": [
    {
      "label": "ID Канала",
      "type": "text",
      "value": "",
      "default": "",
      "desc": "ID канала узнать после создания канала приёма заявок. Напишите на канале сообщение и перешлите его <a href='https://t.me/ShowJsonBot' target='_blank'>@ShowJsonBot</a>"
    }
  ],
  "bot_token": [
    {
      "label": "Токен бота",
      "type": "text",
      "value": "5742061218:AAE6zhQrQwnIPFh4yZr2-ABwr586c_3WULY",
      "default": "5742061218:AAE6zhQrQwnIPFh4yZr2-ABwr586c_3WULY",
      "desc": "Токен созданного вами бота. Бот должен быть участником канала."
    }
  ]
}
*
**/

$e = &$modx->event;
$params = $e->params;


if(!function_exists('sendBotMessage')):
	function sendBotMessage($url){
		$ch = curl_init();
		$optArray = array(
				CURLOPT_URL => $url,
				CURLOPT_RETURNTRANSFER => true
		);
		curl_setopt_array($ch, $optArray);
		$result = curl_exec($ch);
		curl_close($ch);
	}
endif;

$bot_token = !empty($params['bot_token']) ? $params['bot_token'] : false;
$chat_id = !empty($params['chat_id']) ? $params['chat_id'] : false;
$chanel_id = !empty($params['chanel_id']) ? $params['chanel_id'] : false;
$site_url = $modx->config['site_url'];

switch($e->name){
	case "OnLogEvent":
		if($chat_id && $bot_token):
			// Отправляем разработчику ошибки;
			$url = "https://api.telegram.org/bot" . $bot_token . "/sendMessage?chat_id=" . $chat_id;
			$types = array(
				'Пользовательский',
				'Информация',
				'Предупреждение',
				'Ошибка'
			);
			$messagge = "
*site:*\t" . $site_url . "
*name:*\t" . $e->name . "
*eventid:*\t" . $params['eventid'] . "
*type:*\t" . $types[$params['type']] . "
*createdon:*\t" . $modx->toDateFormat($params['createdon']) . "
*source:*\t" . $params['source'] . "";
			$url .= "&text=" . urlencode($messagge) . "&parse_mode=Markdown&disable_web_page_preview=true";
			sendBotMessage($url);
		endif;
		break;
	case "OnSendFormSite":
		// Отправляем на канал заявки с форм
		if($chanel_id):
			$url = "https://api.telegram.org/bot" . $bot_token . "/sendMessage?chat_id=" . $chanel_id;
			$messagge =  $params['message'];
			$url .= "&text=" . urlencode($messagge) . "&parse_mode=Markdown&disable_web_page_preview=true";
			sendBotMessage($url);
		endif;
		break;
	case "OnManagerLogin":
		$pars = print_r($params, true);
		$url = "https://api.telegram.org/bot" . $bot_token . "/sendMessage?chat_id=" . $chat_id;
		$arr = array(
			"userid" => $params["userid"],
			"username" => $params["username"],
		);
		$messagge = $site_url . PHP_EOL . "*Вход пользователя:*" . PHP_EOL . "```" . print_r($arr, true) . PHP_EOL . "```";
		$url .= "&text=" . urlencode($messagge) . "&parse_mode=Markdown&disable_web_page_preview=true";
		sendBotMessage($url);
		break;
}
