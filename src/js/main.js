!(function($){
	// Yandex.Maps
	const bvi = new isvek.Bvi({
		speech: false,
		panelFixed: false
	});
	console.log(bvi);
	window.mapInit = function() {
		const $map = $("#map");
		if($map.length) {
			const $div = $map.closest('div.main-map'),
				/**
				 * data.point
				 * data.addres
				 * data.phones
				 * data.email
				 * data.zoom
				 **/
				data = $map.data();
			if($div.length) {
				$div.addClass("embed-responsive embed-responsive-16by9");
				const yaMap = new ymaps.Map("map", {
						center: data.point,
						zoom: data.zoom,
						controls: ['typeSelector','zoomControl','fullscreenControl']
					},
					{
						yandexMapDisablePoiInteractivity: true
					}),
					yaPlacemark = new ymaps.Placemark(
						data.point,
						{
							balloonContent: `<div id="ballonPlacemark" class="ballon text-left">
												<div class="ballon__close">x</div>
												<p>` + data.addres + `</p>
												<p class="text-right map__phones">` + data.phones + `</p>
												<div class="text-center">
													<a href="mailto:` + data.email + `" >` + data.email + `</a>
												</div>
											</div>`
						},
						{
							iconLayout: 'default#image',
							iconImageHref: '/assets/templates/projectsoft/images/placeholder.png?_=v0.0',
							iconImageSize: [46, 65],
							iconImageOffset: [-18, -67],
							balloonLayout: "default#imageWithContent",
							balloonImageHref: '/assets/templates/projectsoft/images/placeholder.png?_=v0.0',
							balloonImageOffset: [-18, -67],
							balloonImageSize: [46, 65],
							balloonShadow: true,
							balloonAutoPan: true
		                }
					);
				yaMap.controls.remove('searchControl');
				yaMap.controls.remove('geolocationControl');
				yaMap.behaviors.disable('scrollZoom');
				yaMap.geoObjects.add(yaPlacemark);
				yaPlacemark.balloon.open();
				$(document).on('click', '.ballon__close', function(e){
					e.preventDefault();
					yaMap.balloon.close();
					return !1;
				});
			}
		}
	};
}(jQuery));

/**
 * Изменения сайта. Конфигурация Плагинов, Модулей, Сниппетов
 * Установлен мой плагин FileManager ^
 * Установлен Модуль ClientSettings. В параметрах указан свой path конфигурации ^
 * Установлен multiTv. Есть собственные конфигурационные файлы. ^
 * Установлен PegeBuilder. Есть собственные конфигурационные файлы. ^
 * 
**/