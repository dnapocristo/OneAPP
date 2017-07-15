<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<style>
#home {
	background-image:
		url("https://www.otakutees.com/wp-content/uploads/2017/03/0025_oppai_detail.jpg");
	background-repeat: no-repeat;
	background-size: 100% auto;
	position: fixed;
	height: 100%;
    width: 100%;
	background-position: 0px -350px;
	color: black;
}

#listaEroi
{
	background-image: url("http://www.anime-evo.net/wp-content/uploads/2015/12/One-Punch-Man-10-24.jpg");
	background-repeat: no-repeat;
	background-size:cover;
	position: fixed;
	height: 100%;
    width: 100%;
	background-positon:0 px - 350px;
	color : black;
			   
}

#listaMostri
{
			    background-image: url("http://img02.deviantart.net/ce9e/i/2015/315/7/d/we_are_the_monsters_underneath_your_bed_by_arrancarfighter-d9ge6uz.png");
			    background-repeat: no-repeat;
			    background-size:cover;
			    background-positon:0 px - 350px;
			    color : black;
			    position: fixed;
				height: 100%;
   				width: 100%;
			   
}

#registrazione
{
	position: fixed;
	height: 100%;
    width: 100%;
	background-color: orange;
}



#login {
	position: fixed;
	height: 100%;
	width: 100%;
	background: red;
}

.wrapper {
	margin-top: 80px;
	margin-bottom: 40px;
}

.form-signin {
	max-width: 380px;
	padding: 15px 35px 40px;
	margin: 0 auto;
	background-color: #fff;
	border: 1px solid rgba(0, 0, 0, 0.1);
	border-radius: 12px;
}

.form-control {
	position: relative;
	top: 10px;
	font-size: 16px;
	height: auto;
	padding: 10px;
}

#username {
	margin-bottom: 10px;
}

#password {
	margin-bottom: 20px;
	top: 15px;
}

h1 {
	color: white;
	font-family: Impact, Haettenschweiler, "Franklin Gothic Bold", Charcoal,
		"Helvetica Inserat", "Bitstream Vera Sans Bold", "Arial Black",
		"sans serif";
}

h2 {
	color: white;
}

h3 {
	color: white;
	font-family: Impact, Haettenschweiler, "Franklin Gothic Bold", Charcoal,
		"Helvetica Inserat", "Bitstream Vera Sans Bold", "Arial Black",
		"sans serif";
}

span {
	color: white;
}

table {
	color: orange;
	text-align: center;
}

.btn {
	background: #3498db;
	background-image: -webkit-linear-gradient(top, #3498db, #2980b9);
	background-image: -moz-linear-gradient(top, #3498db, #2980b9);
	background-image: -ms-linear-gradient(top, #3498db, #2980b9);
	background-image: -o-linear-gradient(top, #3498db, #2980b9);
	background-image: linear-gradient(to bottom, #3498db, #2980b9);
	-webkit-border-radius: 28;
	-moz-border-radius: 28;
	border-radius: 28px;
	font-family: Impact, Haettenschweiler, "Franklin Gothic Bold", Charcoal,
		"Helvetica Inserat", "Bitstream Vera Sans Bold", "Arial Black",
		"sans serif";
	color: #ffffff;
	font-size: 20px;
	padding: 10px 20px 10px 20px;
	text-decoration: none;
}

.btn:hover {
	background: #3cb0fd;
	background-image: -webkit-linear-gradient(top, #3cb0fd, #3498db);
	background-image: -moz-linear-gradient(top, #3cb0fd, #3498db);
	background-image: -ms-linear-gradient(top, #3cb0fd, #3498db);
	background-image: -o-linear-gradient(top, #3cb0fd, #3498db);
	background-image: linear-gradient(to bottom, #3cb0fd, #3498db);
	text-decoration: none;
}

.eroi {
	font-size: 20px;
	font-family: Impact, Charcoal, sans-serif;
}

.form-group {
	color: black;
}
</style>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>
<script>
	var app = angular.module('OneApp', []);
	app.controller('homeController', function($scope, $http) {

		$scope.listaEroi = function()
        {
            $scope.mostra = 'eroi';
            $http.post("/listaEroi").then(function(response){
                $scope.eroi = response.data;
                console.log($scope.eroi);
        	});
        }
		
		$scope.caricaEroe = function(id){
			$scope.mostra = "dettaglioEroe";
			console.log("Sono nel metodo caricaProgetto, id: " + id);
				
			$http.post("/listaEroi/"+id).then(function(response){
				$scope.eroe = response.data;
				console.log($scope.eroe);
			});
			
		}
    	
    	$scope.listaMostri = function()
        {
            $scope.mostra = 'mostri';
            $http.get("/listaMostri").then(function(response){
                $scope.mostro = response.data;
                console.log($scope.mostro);
        	});
        }
    	
    	
    	
    	
    	$scope.formRegistrazione = function()
        {
            $scope.mostra = 'formRegistrazione';
            $http.get("/formRegistrazione").then(function(response){
            	console.log("sono nel form registrazione");
        	});
        }
    	
   
   	$scope.log = function()
    {
        $scope.mostra = 'login';
        $http.get("/login").then(function(response){
        	console.log("sono in login");
    	});
        
    }
   	$scope.login = function(email, password){
		console.log("Email: " + email + ", password: " + password);
		$http.post("/login/"+email+"/"+password).then(function(response){
			$scope.login = response.data;
			console.log($scope.login);

			if($scope.login >= 0 && $scope.login < 3)
				alert("si");
			else
				alert("no");
		});
	}
   	
   	
   	
   	
   	
	});
</script>
</head>
<body ng-app="OneApp" ng-controller="homeController"
	ng-init="mostra = 'home'">
<div id="home">


	<div ng-show="mostra == 'home'">
		<h1>
			<center>
				<div>Benvenuto su OnePunchAPP!</div>
			</center>
		</h1>

		<center>
			<div>
				<section>
					
    				<a class = "btn" ng-click="listaEroi();" ><btn>Lista Eroi</btn></a>
                    <a class = "btn" ng-click="listaMostri();" ><btn>Lista Mostri</btn></a>
    				 
					<a class="btn" ng-click="log();"><btn>Login</btn></a> 
					<a class="btn" ng-click="formRegistrazione();"><btn>Registrati</btn></a>
				</section>
			</div>
		</center>

		</div>

	

	<div ng-show="mostra=='formRegistrazione'">
			<jsp:include page="formRegistrazione.jsp"></jsp:include>
	</div>
		
	<div ng-show="mostra == 'eroi'">
		<jsp:include page="listaEroi.jsp"></jsp:include>
	</div>
	
	<div ng-show =" mostra == 'mostri'">
		<jsp:include page="listaMostri.jsp"></jsp:include>
	</div>
	
	<div ng-show="mostra == 'login'">
		<jsp:include page="login.jsp"></jsp:include>
			
	</div>
</div>

</body>
</html>