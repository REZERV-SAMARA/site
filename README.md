# Сайт ГКУЗ МЦ «Резерв» г. Самара

Государственное казенное учреждение здравоохранения «Самарский областной медицинский центр мобилизационных резервов «Резерв»

Запуск инициализации проекта:
```console
$ npm install && bower install
```
## `⚠️ Настройка сервера ⚠️`

Я разрабатываю на сервере OpenServer. В OpenServer на вкладке «Домены» нужно параметр «Управление доменами» выставить в значение «Ручное + Автопоиск» и указать папку домена, в моём случае, ```\rezerv.school\site```, где `site` является папкой сборки проекта. В эту же папку устанавливаем [Evolution CMS v1.4.x](https://github.com/evocms-community/evolution/tree/1.4.x).

Дальше настраиваем CMS согласно коду и желаниям. В папке `site\assets\templates\projectsoft\develop\` имеются все плагины, сниппеты, модули, которые вам нужно только подключить согласно коду в шаблонах проекта.