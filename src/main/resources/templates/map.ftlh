<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <style>

        body, html, #map {
            background-color: darkcyan;
            width: 100%;
            height: 80%;
            padding: 0;
            margin: 0;
            position: absolute;
        }
        .search{
            position:relative;
        }
        .search_result{
            background: #FFF;
            border: 1px #ccc solid;
            width: 100px;
            border-radius: 4px;
            max-height:100px;
            overflow-y:scroll;
            display:none;
        }
        .search_result li{
            list-style: none;
            padding: 5px 10px;
            margin: 0 0 0 -40px;
            color: #0896D3;
            border-bottom: 1px #ccc solid;
            cursor: pointer;
            transition:0.3s;
        }
        .search_result li:hover{
            background: #F9FF00;
        }
        .search{
            position:relative;
        }
        .search_result{
            background: #FFF;
            border: 1px #ccc solid;
            width: 100px;
            border-radius: 4px;
            max-height:100px;
            overflow-y:scroll;
            display:none;
        }
        .search_result li{
            list-style: none;
            padding: 5px 10px;
            margin: 0 0 0 -40px;
            color: #0896D3;
            border-bottom: 1px #ccc solid;
            cursor: pointer;
            transition:0.3s;
        }
        .search_result li:hover{
            background: #F9FF00;
        }
    </style>
    <script src="https://api-maps.yandex.ru/2.1/?apikey=cfc7b0b2-a407-468d-bfa3-4ccfe9aa0ab8&lang=ru_RU" type="text/javascript"></script>
    <link rel="stylesheet" href="https://cdn.shoelace.style/1.0.0-beta.25/shoelace.css">

</head>
<body>
<form action="/map" method="post">

    <input type="search" id="search" name="search" >
<button >Submit</button>

</form>
<div id="map">

</div>


    <script type="text/javascript">
        ymaps.ready(init);

        function init() {
            var myPlacemark,
                myMap = new ymaps.Map('map', {
                    center: [55.753994, 37.622093],
                    zoom: 9
                }, {
                    searchControlProvider: 'yandex#search'
                });

            // Слушаем клик на карте.
            myMap.events.add('click', function (e) {
                var coords = e.get('coords');

                // Если метка уже создана – просто передвигаем ее.
                if (myPlacemark) {
                    myPlacemark.geometry.setCoordinates(coords);
                }
                // Если нет – создаем.
                else {
                    myPlacemark = createPlacemark(coords);
                    myMap.geoObjects.add(myPlacemark);
                    // Слушаем событие окончания перетаскивания на метке.
                    myPlacemark.events.add('dragend', function () {
                        getAddress(myPlacemark.geometry.getCoordinates());
                    });
                }
               getAddress(coords);
            });

            // Создание метки.
            function createPlacemark(coords) {
                return new ymaps.Placemark(coords, {
                    iconCaption: 'поиск...'
                }, {
                    preset: 'islands#violetDotIconWithCaption',
                    draggable: true
                });
            }

            // Определяем адрес по координатам (обратное геокодирование).
            function getAddress(coords) {
                myPlacemark.properties.set('iconCaption', 'поиск...');
                ymaps.geocode(coords).then(function (res) {
                    var firstGeoObject = res.geoObjects.get(0);

                    myPlacemark.properties
                        .set({
                            // Формируем строку с данными об объекте.
                            iconCaption: [
                                // Название населенного пункта или вышестоящее административно-территориальное образование.
                                firstGeoObject.getLocalities().length ? firstGeoObject.getLocalities() : firstGeoObject.getAdministrativeAreas(),
                                // Получаем путь до топонима, если метод вернул null, запрашиваем наименование здания.
                                firstGeoObject.getThoroughfare() || firstGeoObject.getPremise()
                            ].filter(Boolean).join(', '),
                            // В качестве контента балуна задаем строку с адресом объекта.
                            balloonContent: firstGeoObject.getAddressLine()
                        });
                    var search = document.getElementById("search");
                    search.value=firstGeoObject.getLocalities();
                });}

        }



    </script>

</body>
</html>