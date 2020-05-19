<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <style>
        body, html{height:100%; width: 100%; font-family: "Yandex Sans Text", sans-serif;}

        body{
            background-color: darkcyan;

            background-size: cover;
        }

        @font-face {
            font-family: 'Yandex Sans Text';
            src: url('../static/fonts/YandexSansText-Regular.eot');
            src: local('Yandex Sans Text Regular'), local('YandexSansText-Regular'),
            url('../static/fonts/YandexSansText-Regular.eot?#iefix') format('embedded-opentype'),
            url('../static/fonts/YandexSansText-Regular.woff2') format('woff2'),
            url('../static/fonts/YandexSansText-Regular.woff') format('woff'),
            url('../static/fonts/YandexSansText-Regular.ttf') format('truetype');
            font-weight: normal;
            font-style: normal;
        }

        @font-face {
            font-family: 'Yandex Sans Display Bold';
            src: url('../static/fonts/YandexSansDisplay-Bold.eot');
            src: local('Yandex Sans Display Bold'), local('YandexSansDisplay-Bold'),
            url('../static/fonts/YandexSansDisplay-Bold.eot?#iefix') format('embedded-opentype'),
            url('../static/fonts/YandexSansDisplay-Bold.woff2') format('woff2'),
            url('../static/fonts/YandexSansDisplay-Bold.woff') format('woff'),
            url('../static/fonts/YandexSansDisplay-Bold.ttf') format('truetype');
            font-weight: bold;
            font-style: normal;
        }
        .mainPlace{
            height: 100%;
            width: 100%;
            display: flex;
            align-items: center;
            justify-content: center;
            background-size: cover;
        }

        .group{
            position:relative;
            margin-bottom:50px;
        }

        .loginPlace{
            position: relative;

            height: 800px;
            width: 360px;
            background-color: #ffffff;
            border-radius: 4px;
            box-shadow: 0 20px 40px 0 rgba(0,0,0,.5);
        }

        .loginTag{
            height: 118px;
        }

        .loginInputs{

        }

        .loginDivPlace{
            height: 100%;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .loginSpan{
            font-family: "Yandex Sans Display Bold", sans-serif;
            font-size: 30pt;
            color: #333333;
            cursor: default;
        }

        input{
            font-size:18px;
            padding:10px 10px 10px 5px;
            display:block;
            width:300px;
            border:none;
            border-bottom:1px solid #757575;
        }

        input:focus{
            outline:none;
            border-bottom-color: #5264AE;
        }

        label 				 {
            color:#999;
            font-size:18px;
            font-weight:normal;
            position:absolute;
            pointer-events:none;
            left:5px;
            top:10px;
            transition:0.4s ease all;
        }

        input:focus ~ label, input:valid ~ label{
            top:-20px;
            font-size:14px;
            color: #25aae1;
        }


        .group{
            width: 300px;
            margin-left: 30px;
        }

        .loginButtonDiv{
            margin-left:160px;
            margin-top: 80px;
        }

        .loginButton{
            background-image: linear-gradient(to right, #25aae1, #40e495, #30dd8a, #2bb673);
            background-size: 250% 100%;
            text-transform: uppercase;
            color: #ffffff;
            width: 190px;
            height: 40px;
            border-radius: 25px;
            border: none;
            cursor: pointer;
            transition: background-position .4s ease-in-out;
        }

        .loginButton:hover{
            outline: none;
            background-position: 100% 0;
            transition: all .4s ease-in-out;
        }








    </style>
</head>
<body>
<div class="mainPlace">
    <div class="loginPlace">
        <div class="loginTag">
            <div class="loginDivPlace">
                <span class="loginSpan">Добавить маршрут</span>
            </div>
        </div>
        <div class="loginInputs">
            <form action="/adminRoutes" method="post">
                <div class="group">
                    <input type="text" id="from_country" name="fromcountry">
                    <span class="bar"></span>
                    <label id="loginLabel">Откуда</label>
                </div>
                <div class="group">
                    <input type="text"  id="to_country" name="tocountry">
                    <span class="bar"></span>
                    <label id="loginLabel">Куда</label>
                </div>
                <div class="group">
                    <input type="text" id="time" name="time">
                    <span class="bar"></span>
                    <label id="passwordLabel">Дата yy.mm.dd hh:mm</label>
                </div>
                <div class="group">
                    <select id="transport" name="transport">
                        <option>Самолет</option>
                        <option>Поезд</option>
                        <option>Автобус</option>
                    </select>
                        <span class="bar"></span>
                        <label>Транспорт</label>

                </div>
                <div class="group">
                    <input type="text" id="duration" name="duration">
                    <span class="bar"></span>
                    <label>Время в пути</label>

                </div>
                <div class="loginButtonDiv">
                    <button class="loginButton" id="button"  type="submit">Отправить</button>
                </div>
            </form>


        </div>
    </div>
</div>

</body>
</html>
