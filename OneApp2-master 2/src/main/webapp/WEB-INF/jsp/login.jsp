<html>
<head>






</head>
<body ng-app="accesso" ng-controller="controller" align="center">
	<div id="login">

		<header>
			<h1>OnePunchApp</h1>
			<div>
				<a href="./">Home</a>
			</div>
		</header>
		<div class="wrapper">
			<div class="form-signin">
				<h2 class="form-signin-heading">Accedi</h2>
				<center>
					<form action="/login" method="POST" modelAttribute="res">
						<table>
							<tr>
								<td>Email:</td>
								<td><input type="path" ng-model="email" id="surname"
									class="form-control" placeholder="Email Address" required=""
									autofocus="" /></td>
							</tr>
							<tr>
								<td>Password:</td>
								<td><input type="path" ng-model="password" id="password"
									class="form-control" placeholder="Password" required="" /></td>
							</tr>
							<tr>
								<td></td>
								<!-- ng-click="login(username, password)" -->
								<td><input class="btn btn-primary btn-block" type="submit"
									value="Login"></input></td>
							</tr>
						</table>
					</form>

					<p class="create-account-callout mt-3">
						<a href="./formRegistrazione.jsp">nuovo utente</a>
						<ng-click="formRegistrazione()">
						</a>
					</p>
				</center>
			</div>
		</div>
	</div>
</body>
</html>
