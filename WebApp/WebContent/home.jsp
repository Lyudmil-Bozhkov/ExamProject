<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>Weather App</title>

    <meta name="apple-mobile-web-app-capable" content="yes">

    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">

    <link href="assets/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets/css/font-awesome.min.css" rel="stylesheet">
    <link href="assets/css/main.css" rel="stylesheet">   
	<script src="js/vendor/jquery/jquery-1.12.1.min.js"></script>
	 <script src="js/vendor/bootstrap/bootstrap.min.js"></script>
	<script src="js/main.js"></script>



</head>
<body onload="getCurrentTemp('Plovdiv')">

<div class="home-page">

        <header>
            <div class="container">
                <nav class="navbar navbar-default">

                        <!-- Brand and toggle get grouped for better mobile display -->
                        <div class="navbar-header">
                            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse" aria-expanded="false">
                                <span class="sr-only">Toggle navigation</span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </button>
                            <div class="current-weather">
                                <div class="img-container">
                                    <img src="assets/img/weather_icon.png" style="display:none;"/>
                                </div>
                                <div class="info">
                                    <div class="city">Пловдив</div>
                                    <div id="current-condition"></div>
                                    <div class="pull-right"><span id="current-temperature"></span> ℃</div>
                                </div>
                            </div>
                        </div>

                        <!-- Collect the nav links, forms, and other content for toggling -->
                        <div class="collapse navbar-collapse" id="navbar-collapse">
                            <ul class="nav navbar-nav navbar-right">
                                <li class="active">
                                    <a href="home.html">
                                        <span class="glyphicon glyphicon-home" aria-hidden="true"></span>
                                        <span class="nav-label">Начало</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="friends.html">
                                        <i class="fa fa-users" aria-hidden="true"></i>
                                        <span class="nav-label">Приятели</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="inbox.html">
                                        <span class="glyphicon glyphicon-envelope" aria-hidden="true"></span>
                                        <span class="nav-label">Известия</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="profile.html">
                                        <i class="fa fa-cogs" aria-hidden="true"></i>
                                        <span class="nav-label">Профил</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="index.html">
                                        <span class="glyphicon glyphicon-log-out" aria-hidden="true"></span>
                                        <span class="nav-label">Изход</span>
                                    </a>
                                </li>
                            </ul>
                        </div><!-- /.navbar-collapse -->
                </nav>
            </div>
        </header>


        <div class="container">


            <div class="row" style="margin-top:30px;">

                <div class="col-sm-4">

                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title">Отбележи място и напиши коментар</h3>
                        </div>
                        <div class="panel-body">
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-sm-4">
                                        <img class="thumbnail img-responsive" src="assets/img/icons/clear_sky.png">
                                    </div>
                                    <div class="col-sm-8">
                                        <div>
                                            <span class="label label-success"><span class="current-temp">27</span> ℃</span>
                                        </div>
                                        <label for="select-city">Избери град:</label>
                                        <select id="select-city" class="form-control">
                                            <option value="0" selected>Всички</option>
                                            <option>София</option>
                                            <option>Пловдив</option>
                                            <option>Варна</option>
                                            <option>Бургас</option>
                                            <option>Стара Загора</option>
                                            <option>Русе</option>
                                            <option>Плевен</option>
                                            <option>Добрич</option>
                                            <option>Сливен</option>
                                            <option>Шумен</option>
                                            <option>Перник</option>
                                            <option>Пазарджик</option>
                                            <option>Ямбол</option>
                                            <option>Хасково</option>
                                            <option>Благоевград</option>
                                            <option>Велико Търново</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="row">
                                   <div class="col-sm-12">
                                       <label for="comment">Коментар:</label>
                                       <textarea class="form-control" rows="3" id="comment"></textarea>
                                   </div>
                                </div>

                            </div>
                        </div>
                        <div class="panel-footer" style="height:55px;">
                            <button onclick="addComment()" type="button" class="btn btn-primary pull-right publish"><span class="glyphicon glyphicon-globe"></span> Публикувай</button>
                        </div>
                    </div>
                </div>
                <div class="col-sm-8">

                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title">Твоите отбелязвания</h3>
                        </div>

                        <ul id="statuses" class="list-group" style="min-height:241px;">

                            <li class="list-group-item">
                                <div class="row">
                                    <div class="col-sm-2 col-xs-3">
                                        <img src="assets/img/icons/clear_sky.png" class="thumbnail img-responsive">
                                    </div>
                                    <div class="col-sm-7 col-xs-6">
                                        <span class="label label-success"><span class="current-temp">27</span> ℃</span>
                                        <h4>Пловдив</h4>
                                        <p>Времето беше супер. Разхождах се по главната. Купих си сладолед и пих вода от чешмичката на джумаята. </p>
                                    </div>
                                    <div class="col-sm-3 col-xs-3">
                                        <button type="button" class="btn btn-danger pull-right remove-post"><span class="glyphicon glyphicon-remove"></span><span class="hidden-xs"> Изтрий</span></button>
                                    </div>
                                </div>
                            </li>

                            <li class="list-group-item">
                                <div class="row">
                                    <div class="col-sm-2 col-xs-3">
                                        <img src="assets/img/icons/rain.png" class="thumbnail img-responsive">
                                    </div>
                                    <div class="col-sm-7 col-xs-6">
                                        <span class="label label-success"><span class="current-temp">20</span> ℃</span>
                                        <h4>Пловдив</h4>
                                        <p>Времето беше супер. Разхождах се по главната. Купих си сладолед и пих вода от чешмичката на джумаята. </p>
                                    </div>
                                    <div class="col-sm-3 col-xs-3">
                                        <button type="button" class="btn btn-danger pull-right remove-post"><span class="glyphicon glyphicon-remove"></span><span class="hidden-xs"> Изтрий</span></button>
                                    </div>
                                </div>
                            </li>
                            <li class="list-group-item">
                                <div class="row">
                                    <div class="col-sm-2 col-xs-3">
                                        <img src="assets/img/icons/few_clouds.png" class="thumbnail img-responsive">
                                    </div>
                                    <div class="col-sm-7 col-xs-6">
                                        <span class="label label-success"><span class="current-temp">24</span> ℃</span>
                                        <h4>Пловдив</h4>
                                        <p>Времето беше супер. Разхождах се по главната. Купих си сладолед и пих вода от чешмичката на джумаята. </p>
                                    </div>
                                    <div class="col-sm-3 col-xs-3">
                                        <button type="button" class="btn btn-danger pull-right remove-post"><span class="glyphicon glyphicon-remove"></span><span class="hidden-xs"> Изтрий</span></button>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>

                </div>
            </div>


        </div>

</div>

							<li class="list-group-item" style="display:none" id="temp">
                                <div class="row">
                                    <div class="col-sm-2 col-xs-3">
                                        <img src="assets/img/icons/few_clouds.png" class="thumbnail img-responsive">
                                    </div>
                                    <div class="col-sm-7 col-xs-6">
                                        <span class="label label-success"><span class="current-temp" id="temp-temperature">24</span> ℃</span>
                                        <h4>Пловдив</h4>
                                        <p id="temp-comment">Времето беше супер. Разхождах се по главната. Купих си сладолед и пих вода от чешмичката на джумаята. </p>
                                    </div>
                                    <div class="col-sm-3 col-xs-3">
                                        <button type="button" class="btn btn-danger pull-right remove-post"><span class="glyphicon glyphicon-remove"></span><span class="hidden-xs"> Изтрий</span></button>
                                    </div>
                                </div>
                            </li>
</body>
</html>