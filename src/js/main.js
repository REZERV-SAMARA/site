!(function($){
	Array.prototype.last = function() {
		return this[this.length - 1];
	};
	// Supported PDF
	const supportedPdf = function(){
		var is_pdf = false,
			plugins = Array.from(window.navigator.plugins || {}),
			map = plugins.map(function(a){
				var mp = Array.from(a);
				if (mp[0].suffixes=='pdf' && !is_pdf){
					is_pdf = true;
				}
				return mp;
			});
		return is_pdf;
	};
	const isPDF = supportedPdf();
	// Button Visually Impaired
	const bvi = new isvek.Bvi({
		speech: false,
		panelFixed: false
	});
	// Navigation button
	$(document).on('click', '.nav-btn', function(e){
		e.preventDefault();
		$(e.target).closest('.navbar-site').toggleClass('open');
		return !1;
	});
	// Fancybox
	$.fancybox.defaults.parentEl = ".fancybox__wrapper";
	$.fancybox.defaults.transitionEffect = "circular";
	$.fancybox.defaults.transitionDuration = 500;
	$.fancybox.defaults.lang = "ru";
	$.fancybox.defaults.i18n.ru = {
		CLOSE: "Закрыть",
		NEXT: "Следующий",
		PREV: "Предыдущий",
		ERROR: "Запрошенный контент не может быть загружен.<br/>Повторите попытку позже.",
		PLAY_START: "Начать слайдшоу",
		PLAY_STOP: "Остановить слайдшоу",
		FULL_SCREEN: "Полный экран",
		THUMBS: "Миниатюры",
		DOWNLOAD: "Скачать",
		SHARE: "Поделиться",
		ZOOM: "Увеличить"
	};
	$(window).on('resize scroll', function(e){
		setTimeout(function(){
			$('.fancybox-content').css({
				height: '100%'
			});
		}, 5);
		
	});
	$(document).on('click', ".main a", function(e){
		const base = window.location.origin,
			reg = new RegExp("^" + base, 'i'),
			regex = new RegExp('\.pdf$', 'i'),
			href = e.target.href;
		if(reg.test(href)) {
			try {
				const url = new URL(href),
					src = url.pathname,
					go = window.location.origin + '/viewer/web/?file=' + encodeURI(src);
				if(regex.test(src)){
					e.preventDefault();
					if(!$(this).data('google')){
						$(this).data('google', go);
					}
					$.fancybox.open({
						src: go
					});
					return !1;
				}
			} catch (error) {
				//error
			} 
		}
	});
	// Yandex.Maps
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
	supportedPdf();
}(jQuery));

/**
 * Изменения сайта. Конфигурация Плагинов, Модулей, Сниппетов
 * Установлен мой плагин FileManager ^
 * Установлен Модуль ClientSettings. В параметрах указан свой path конфигурации ^
 * Установлен multiTv. Есть собственные конфигурационные файлы. ^
 * Установлен PegeBuilder. Есть собственные конфигурационные файлы. ^
 * 
**/