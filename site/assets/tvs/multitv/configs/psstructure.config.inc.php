<?php
$settings['display'] = 'vertical';
$settings['fields'] = array(
	'department' => array(
		'caption' => 'Отдел',
		'type' => 'text'
	),
	'fio' => array(
		'caption' => 'Фамилия Имя Отчество',
		'type' => 'text'
	),
	'work' => array(
		'caption' => 'Должность',
		'type' => 'text'
	),
	'phone' => array(
		'caption' => 'Телефон',
		'type' => 'text'
	),
	'email' => array(
		'caption' => 'Email',
		'type' => 'text'
	),
	'photo' => array(
		'caption' => 'Фото',
		'type' => 'image'
	),
	'thumb' => array(
		'caption' => 'Thumbnail',
		'type' => 'thumb',
		'thumbof' => 'photo'
	),
);
$settings['templates'] = array(
	'outerTpl' => '
	<div class="structure">
		<div class="row">
			[+wrapper+]
		</div>
	</div>',

	'rowTpl' => '
		<article class="columns">
			<header class="col-md-12">
				<h3 class="structure-title">[+department+]</h3>
			</header>
			<div class="col-md-6">
				<p class="structure-fio"><strong>[+fio+] </strong><br><span>[+work+]</span></p>
			</div>
			<div class="col-md-3">
				<p class="structure-phone"><span>Телефон </span><br><span>[+phone+]</span></p>
			</div>
			<div class="col-md-3">
				<p class="structure-email"><span>Email </span><br><span><a class="structure-email-link" href="mailto:[+email+]" target="_blank">[+email+]</a></span></p>
			</div>
			<footer class="structure-footer col-md-12">
				<hr class="structure-hr" style="height:1px;">
			</footer>
		</article>'
);
$settings['configuration'] = array(
	'enablePaste' => true,
	'enableClear' => true,
	'csvseparator' => ','
);