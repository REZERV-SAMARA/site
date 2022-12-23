<?php
// Документы
return [
	'title' => 'Документы',
	'show_in_templates' => [ 8 ],
	'templates' => [
		'owner' => '<div class="main-files">
				<@IF:[+text:isnot("")+]><h2>[+text+]</h2><@ENDIF>
				<ul class="documents-files">[+files+]</ul>
			</div>
		',
		'files' => '<li><a href="[+file+]" target="_blank">[+text+]</a></li>',
	],
	'fields' => [
		'text' => [
			'caption' => 'Название блока с файлами<br>Если нет - оставьте пустым',
			'type' => 'text'
		],
		'files' => [
			'caption' => 'Файлы 2',
			'type'    => 'group',
			'fields'  => [
				'text' => [
					'caption' => 'Отображаемое название файла',
					'type'    => 'text',
				],
				'file' => [
					'caption' => 'Файл',
					'type'    => 'file',
				],
			],
		],
	],
];
