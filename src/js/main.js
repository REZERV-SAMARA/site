!(function($){
	// Yandex.Maps
	const bvi = new isvek.Bvi({
		speech: false
	});
	//console.log(bvi);
	window.mapInit = function() {
		const $map = $("#map");
		if($map.length) {
			const $div = $map.closest('div.main-map'),
				data = $map.data();
			if($div.length) {
				$div.addClass("embed-responsive embed-responsive-16by9")
				var yaMap = new ymaps.Map("map", {
					center: data.point,
					zoom: 10,
					ontrols: ['typeSelector','zoomControl','fullscreenControl']
				});
				yaMap.behaviors.disable('scrollZoom');
			}
		}
	};
}(jQuery));

/**
 * 
 * data-point="[(map_point)]" data-addres="[(map_addres)]" data-phones="[(map_phones)]" data-email="[(map_email)]"
 * var orgAddress = $("#orgAddress").text(),
			orgPhones = $("#orgPhones").html(),
			orgEmail = $("#orgEmail").html(),
			mapPoint = $("#orgAddress").data('point').split(",").map(Number),
			$msosh = $('#map');
mapSosh = new ymaps.Map("map",
					{
						center: mapPoint,
						zoom: 17,
						controls: ['typeSelector','zoomControl','fullscreenControl']
					}
				);
				var soshPlacemark = new ymaps.Placemark(
					mapPoint,
					{
						balloonContent: `<div id="sosh_close" class="ballon text-left">
											<div class="ballon__close" onclick="mapSosh.balloon.close();">x</div>
											<p>` + orgAddress + `</p>
											<p class="text-right map__phones">` + orgPhones + `</p>
											<div class="text-center">
												<a href="mailto:` + orgEmail + `" >` + orgEmail + `</a>
											</div>
										</div>`
	            	},
					{
						iconLayout: 'default#image',
						iconImageHref: '/assets/templates/projectsoft/images/p__sosh.png?_=v0.0',
						iconImageSize: [46, 52],
						iconImageOffset: [-18, -50],
						balloonLayout: "default#imageWithContent",
						balloonImageHref: '/assets/templates/projectsoft/images/p__sosh.png?_=v0.0',
						balloonImageOffset: [-18, -50],
						balloonImageSize: [46, 52],
						balloonShadow: true,
						balloonAutoPan: true
	                }
				);
				mapSosh.behaviors.disable('scrollZoom');
				mapSosh.geoObjects.add(soshPlacemark);
				soshPlacemark.balloon.open();
			};
			**/