<?php

return [
	'caption' => 'Yandex.Api',
	'introtext' => 'Настройки Yandex.Api',
	'settings' => [
		'yandex_verification' => [
			'caption' => 'Yandex Verification',
			'type'  => 'text',
			'note'  => 'Yandex Verification',
			'default_text' => '',
		],
		'map_apykey' => [
			'caption' => 'API key Yandex.MAP',
			'type'  => 'text',
			'note'  => 'API key Yandex.MAP',
			'default_text' => '',
		],
		'map_point' => [
			'caption' => 'Координаты Yandex.Map вашей компании',
			'type'  => 'text',
			'note'  => 'В формате [широта, долгота] latlong',
			'default_text' => '[55.87, 37.66]',
		],
		'map_zoom' => [
			'caption' => 'Zoom Карты',
			'type'  => 'number',
			'note'  => 'Зум карты при загрузке',
			'default_text' => '17',
		],
		'map_addres' => [
			'caption' => 'Адрес компании',
			'type'  => 'text',
			'note'  => 'Почтовый адрес компании',
			'default_text' => '[55.87, 37.66]',
		],
		'map_phones' => [
			'caption' => 'Телефоны компании',
			'type'  => 'textarea',
			'note'  => '',
			'default_text' => '',
		],
		'map_email' => [
			'caption' => 'Email компании',
			'type'  => 'text',
			'note'  => 'Электронная почта',
			'default_text' => '',
		],
	],
];
