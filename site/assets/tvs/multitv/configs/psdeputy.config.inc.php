<?php
$settings['display'] = 'vertical';
$settings['fields'] = array(
	'fio' => array(
		'caption' => 'Фамилия Имя Отчество',
		'type' => 'textarea'
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
	<div class="deputy">
		<div class="row">
			<div class="columns">
				[+wrapper+]
			</div>
		</div>
	</div>',

	'rowTpl' => '
		<article class="col-md-6">
			<div class="row">
				<div class="columns">
					<div class="deputy-image col-md-4">
						<p><img src="[[phpthumb? &input=`[+photo+]` &options=`w=370,h=493,zc=C` &noImage=`assets/templates/projectsoft/images/no_photo.png`]]" alt="[+fio+]"</p>
					</div>
					<div class="col-md-8 deputy-content">
						<header class="deputy-title">
							<h3>[+fio:nl2br+]</h3>
						</header>
						<div class="deputy-work">
							<p>[+work+]</p>
						</div>
					</div>
					<footer class="deputy-footer col-md-12">
						<hr class="structure-hr" style="height:1px;">
					</footer>
				</div>
			</div>
		</article>'
);
$settings['configuration'] = array(
	'enablePaste' => true,
	'enableClear' => true,
	'csvseparator' => ';'
);