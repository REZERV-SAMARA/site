module.exports = function(grunt){
	require('load-grunt-tasks')(grunt);
	require('time-grunt')(grunt);
	const NpmImportPlugin = require("less-plugin-npm-import"),
		uniqid = function() {
			var timestamp = new Date().getTime().toString();
			return timestamp;
		};
	grunt.initConfig({
		globalConfig: {},
		pkg: grunt.file.readJSON('package.json'),
		clean: {
			options: {
				force: true
			},
			default: {
				src: [
					'site/assets/templates/projectsoft/*',
					'site/manifest.webmanifest',
					'site/*.ico',
					'site/*.png'
				]
			},
			favicons: {
				src: [
					'site/manifest.webmanifest',
					'site/*.ico',
					'site/*.png'
				]
			},
			fonts: {
				src: [
					'site/assets/templates/projectsoft/fonts/*'
				]
			},
			css: {
				src: [
					'site/assets/templates/projectsoft/css/*'
				]
			},
			js: {
				src: [
					'site/assets/templates/projectsoft/js/*'
				]
			},
			html: {
				src: [
					'site/assets/templates/projectsoft/html/*'
				]
			},
			images: {
				src: [
					'site/assets/templates/projectsoft/images/*'
				]
			},
		},
		favicons: {
			options: {
				regular: true,
				trueColor: true,
				sharp: 0,
				precomposed: true,
				timestamp: true,
				/* Apple */
				apple: true,
				appleTouchBackgroundColor: 'none',
				appleTouchPadding: 10,
				/* Windows */
				windowsTile: true,
				tileBlackWhite: false,
				tileColor: "auto",
				/* Coast */
				coast: true,
				/* FireFox */
				firefox: true,
				firefoxRound: true,
				firefoxManifest: 'site/manifest.webmanifest',
				HTMLPrefix: '[(site_url)]',
				/* HTML */
				truncateHTML: false,
				html: 'src/pug/inc/favicon.pug'
			},
			default: {
				src: 'src/favicon/favicon.png',
				dest: 'site'
			}
		},
		webfont: {
			default: {
				src: 'src/glyph/*.svg',
				dest: 'site/assets/templates/projectsoft/fonts/',
				options: {
					engine: 'node',
					hashes: true,
					relativeFontPath: '/assets/templates/projectsoft/fonts/',
					destLess: 'src/less/fonts',
					font: 'glyph',
					types: 'ttf,woff2,woff,eot',
					fontFamilyName: 'Gluph',
					fontHeight: 1000,
					stylesheets: ['less'],
					syntax: 'bootstrap',
					//execMaxBuffer: 1024 * 200,
					htmlDemo: false,
					version: '1.0.0',
					normalize: true,
					startCodepoint: 0xF101,
					iconsStyles: false,
					autoHint: false,
					templateOptions: {
						baseClass: '',
						classPrefix: 'glyph-'
					},
					embed: false,
					template: 'src/font.template'
				}
			},
		},
		ttf2woff2: {
		    default: {
				src: ["src/fonts/*.ttf"],
				dest: "site/assets/templates/projectsoft/fonts/"
			},
		},
		ttf2woff: {
			default: {
				src: ['src/fonts/*.ttf'],
				dest: 'site/assets/templates/projectsoft/fonts/'
			}
		},
		ttf2eot: {
			default: {
				src: 'src/fonts/*.ttf',
				dest: 'site/assets/templates/projectsoft/fonts/'
			}
		},
		concat: {
			options: {
				separator: "\n",
			},
			appjs: {
				src: [
					'bower_components/jquery/dist/jquery.js',
					"bower_components/fancybox/src/js/core.js",
					"bower_components/fancybox/src/js/media.js",
					"bower_components/fancybox/src/js/guestures.js",
					"bower_components/fancybox/src/js/slideshow.js",
					"bower_components/fancybox/src/js/fullscreen.js",
					"bower_components/fancybox/src/js/thumbs.js",
					"bower_components/fancybox/src/js/hash.js",
					"bower_components/fancybox/src/js/wheel.js",
					/*'bower_components/slick-carousel/slick/slick.js',
					'bower_components/js-cookie/src/js.cookie.js',
					'bower_components/jquery.cookie/jquery.cookie.js'*/
				],
				dest: 'test/js/appjs.js'
			},
			main: {
				src: [
					//'src/js/bvi.js',
					'src/js/main.js'
				],
				dest: 'test/js/main.js'
			}
		},
		uglify: {
			options: {
				sourceMap: false,
				compress: {
					drop_console: false
	  			}
			},
			default: {
				files: [
					{
						expand: true,
						flatten : true,
						src: [
							'test/js/appjs.js',
							'test/js/main.js'
						],
						dest: 'site/assets/templates/projectsoft/js',
						filter: 'isFile',
						rename: function (dst, src) {
							return dst + '/' + src.replace('.js', '.min.js');
						}
					}
				]
			}
		},
		imagemin: {
			options: {
				optimizationLevel: 3,
				svgoPlugins: [
					{
						removeViewBox: false
					}
				]
			},
			default: {
				files: [
					{
						expand: true,
						cwd: 'src/images', 
						src: ['**/*.{png,jpg,jpeg}'],
						dest: 'test/images/',
					},
					{
						expand: true,
						flatten : true,
						src: [
							'src/images/*.{gif,svg}'
						],
						dest: 'site/assets/templates/projectsoft/images/',
						filter: 'isFile'
					}
				]
			}
		},
		tinyimg: {
			default: {
				files: [
					{
						expand: true,
						cwd: 'test/images', 
						src: ['**/*.{png,jpg,jpeg}'],
						dest: 'site/assets/templates/projectsoft/images/'
					}
				]
			}
		},
		less: {
			default: {
				options : {
					compress: false,
					ieCompat: false,
					plugins: [
						new NpmImportPlugin({prefix: '~'})
					],
					modifyVars: {
						'hashes': '\'' + uniqid() + '\'',
						'fontpath': '/assets/templates/projectsoft/fonts',
						'imgpath': '/assets/templates/projectsoft/images'
					}
				},
				files : {
					'test/css/main.css' : [
						'src/less/main.less'
					]
				}
			}
		},
		autoprefixer:{
			options: {
				browsers: [
					"last 4 version"
				],
				cascade: true
			},
			default: {
				files: {
					'test/css/prefix.main.css' : [
						'test/css/main.css'
					]
				}
			}
		},
		group_css_media_queries: {
			group: {
				files: {
					'test/css/media/main.css': ['test/css/prefix.main.css']
				}
			}
		},
		replace: {
			default: {
				options: {
					patterns: [
						{
							match: /\/\*.+?\*\//gs,
							replacement: ''
						},
						{
							match: /\r?\n\s+\r?\n/g,
							replacement: '\n'
						}
					]
				},
				files: [
					{
						expand: true,
						flatten : true,
						src: [
							'test/css/media/main.css'
						],
						dest: 'test/css/replace/',
						filter: 'isFile'
					},
					{
						expand: true,
						flatten : true,
						src: [
							'test/css/media/main.css'
						],
						dest: 'site/assets/templates/projectsoft/css/',
						filter: 'isFile'
					}
				]
			},
		},
		cssmin: {
			options: {
				mergeIntoShorthands: false,
				roundingPrecision: -1
			},
			default: {
				files: {
					'site/assets/templates/projectsoft/css/main.min.css' : ['test/css/replace/main.css']
				}
			}
		},
		pug: {
			default: {
				options: {
					doctype: 'html',
					client: false,
					pretty: '\t',
					separator: '\n',
					//pretty: '',
					//separator: '',
					data: function(dest, src) {
						return {
							"base": "[(site_url)]",
							"tem_path" : "/assets/templates/projectsoft",
							"img_path" : "assets/templates/projectsoft/images/",
							"site_name": "[(site_name)]",
							"hash": uniqid(),
						}
					}
				},
				files: [
					{
						expand: true,
						cwd: __dirname + '/src/pug/',
						src: [ '*.pug' ],
						dest: 'site/assets/templates/projectsoft/html/',
						ext: '.html'
					},
					{
						expand: true,
						cwd:  __dirname + '/src/pug/tpl/',
						src: ['*.pug'],
						dest: __dirname + '/site/assets/templates/projectsoft/html/tpl/',
						ext: '.html'
					}
				]
			}
		},
	});
	grunt.registerTask('default', [
		'clean:default',
		'favicons',
		'webfont',
		'ttf2woff2',
		'ttf2woff',
		'ttf2eot',
		'imagemin',
		'tinyimg',
		'concat',
		'uglify',
		'less',
		'autoprefixer',
		'group_css_media_queries',
		'replace',
		'cssmin',
		'pug'
	]);
}