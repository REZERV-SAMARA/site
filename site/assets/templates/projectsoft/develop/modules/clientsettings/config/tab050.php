<?php

return [
	'caption' => 'ОБЩИЙ',
	'introtext' => 'Общие настройки',
	'settings' => [
		'company_name' => [
			'caption' => 'Название компании',
			'type'  => 'text',
			'note'  => 'Отображается в шапке, в футтере...',
			'default_text' => '',
		],
		'logotype' => [
			'caption' => 'Логотип компании',
			'type'  => 'image',
			'note'  => 'Лототип отображаемый в шапке и футере. Будет автоматически от масштабирован в размер <code>64 х 64</code> пикселя',
			'default_text' => 'assets/templates/projectsoft/images/samara.png'
		],
		'director' => [
			'caption' => 'Директор компании',
			'type'  => 'textarea',
			'note'  => 'Фамилия, Имя, Отчество. Поддерживается перенос строк при отображении.',
			'default_text' => '',
		],
		'director_photo' => [
			'caption' => 'Фотография директора',
			'type'  => 'image',
			'note'  => '',
			'default_text' => '',
		],
		'dop_styles' => [
			'caption' => 'Дополнительные стили',
			'type'  => 'textarea',
			'note'  => 'Стили, которые присылают для размещения. Например Банер с ГосУслуг...',
			'default_text' => '',
		],
		'dop_scripts' => [
			'caption' => 'Дополнительные скрипты',
			'type'  => 'textarea',
			'note'  => 'Скрипты, которые присылают для размещения. Например Банер с ГосУслуг...',
			'default_text' => '',
		],
	],
];
