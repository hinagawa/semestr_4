<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <link rel="stylesheet" href="https://cdn.shoelace.style/1.0.0-beta.25/shoelace.css">
    <style>
        html{
            background-color: dodgerblue;
        }
    </style>
</head>
<body>
<table class="table-bordered">
    <tr>
        <th>Откуда</th>
        <th>Куда</th>
        <th>Транспорт</th>
        <th>Дата</th>
        <th>Время в пути</th>
    </tr>
    <#list maps as map>
        <tr>
            <td>${map.fromcountry}</td>
            <td>${map.tocountry}</td>
            <td>${map.transport}</td>
            <td>${map.time}</td>
            <td>${map.duration}</td>
        </tr>
    </#list>


</table>


</body>
</html>
