<html>

<head>
  <link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">


<title>REGISTRATI</title>

        
</head>
<body >
<div id="registrazione">
	<h2>Registrati a OneAPP</h2>
	<center>
		<a href="./">HOME</a>
	</center>
	<form name="form" method="POST" action="/registrami" ng-submit="vm.register()" role="form">
		<div class="form-group"
			ng-class="{ 'has-error': form.email.$dirty && form.email.$error.required }">
			<label for="email">Email</label> <input type="text"
				style="width: 20%" name="email" id="email" 
				ng-model="vm.user.email" required />

		</div>
		<div class="form-group"
			ng-class="{ 'has-error': form.nickname.$dirty && form.nickname.$error.required }">
			<label for="nickname">Nickname</label> <input type="text"
				style="width: 20%" name="nickname" id="Text1" 
				ng-model="vm.user.nickname" required />

		</div>
		<div class="form-group"
			ng-class="{ 'has-error': form.password.$dirty && form.password.$error.required }">
			<label for="password">Password</label> <input type="text"
				style="width: 20%" name="password" id="password"
				ng-model="vm.user.password" required />

		</div>
		<div class="form-group"
			ng-class="{ 'has-error': form.nome.$dirty && form.nome.$error.required }">
			<label for="nome">Nome</label> <input type="nome" style="width: 20%"
				name="nome" id="nome"  ng-model="vm.user.nome"
				required />

		</div>
		<div class="form-group"
			ng-class="{ 'has-error': form.cognome.$dirty && form.cognome.$error.required }">
			<label for="cognome">Cognome</label> <input type="cognome"
				style="width: 20%" name="cognome" id="cognome" 
				ng-model="vm.user.cognome" required />

		</div>
		<div class="form-group"
			ng-class="{ 'has-error': form.eta.$dirty && form.eta.$error.required }">
			<label for="eta">eta</label> <input type="eta" style="width: 20%"
				name="eta" id="eta"  ng-model="vm.user.eta"
				required />

		</div>
		<div class="form-group"
			ng-class="{ 'has-error': form.sesso.$dirty && form.sesso.$error.required }">
			<label for="sesso">Sesso</label> <input type="sesso"
				style="width: 20%" name="sesso" id="sesso" 
				ng-model="vm.user.sesso" required />

		</div>
		<div class="form-actions">
			<button type="submit" value ="/registrami" ng-disabled="form.$invalid || vm.dataLoading"
				class="btn btn-primary">Registrati!</button>
			<a href="#!/login" class="btn btn-link">Annulla</a>
		</div>
	</form>
</div>
	

</body>
</html>