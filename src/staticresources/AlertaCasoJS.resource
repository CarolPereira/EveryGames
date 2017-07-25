var app = angular.module("jogosApp");

app.controller('AlertasCasosCtrl', function($scope) {

	$scope.lstCasos = [];
	$scope.lstCasosOld;
	$scope.lstMotivos = [];
	$scope.qtdfiltro = {};
	$scope.lstFiltrada = [];

	// Intervalo em que se realiza a busca
	setInterval(function(){
		iniciar();
	}, 60000);

	// Função para abrir caso
	$scope.abrirCaso = function(casoId) {
		sforce.console.openPrimaryTab(null, '/' + casoId, true);
	}

	// Filtrar casos pelo motivo selecionado
	$scope.filtrar = function(motivo){
		$scope.lstFiltrada = [];
		for(var m=0; m< $scope.lstCasos.length; m++) {
			if($scope.lstCasos[m].Type == motivo || motivo == '') {
				$scope.lstFiltrada.push($scope.lstCasos[m]);
			}
		}
	}

	// Filtra quantidade de casos por motivo
	function filtrarLista(){
		for(var i=0; i < $scope.lstMotivos.length; i++) {
			var quantidade = 0;
			for(var x=0; x < $scope.lstCasos.length; x++) {
				if($scope.lstCasos[x].Type == $scope.lstMotivos[i]) {
					quantidade++;
				}
			}
			$scope.qtdfiltro[$scope.lstMotivos[i]] = quantidade;
		}		
	}

	// Função de inicio
	function iniciar() {
		$scope.lstCasosOld = $scope.lstCasos;
		AlertaCasoController.buscarCasosAbertos(function(result) {

			$scope.lstCasos = result;
			$scope.lstFiltrada = result;

			definirMotivos();
			filtrarLista();
			$scope.$apply();

			var igual;
			// a lista de casos tem o tamanho igual da anterior?
			if($scope.lstCasosOld.length == 0 && $scope.lstCasos.length != 0){
				igual = false;
			}else{
				// Os casos são os mesmos?
				// Obs.: vide funcionamento da função .every na base de conhecimento. Att. Carol
				igual = $scope.lstCasos.every( function(v,i) {
						v = false;
						for(x=0; x<$scope.lstCasosOld.length; x++){
							if($scope.lstCasos[i].Id == $scope.lstCasosOld[x].Id){
								v = true;
							}
						}
						return v;
				});
			}
			// Se não for igual, piscar o botão
			if(!igual){
				trocarCorBotao();
			}
		});
	}
	
	// Definir lista de motivos
	function definirMotivos() {
		$scope.lstMotivos =[];
		for(var i = 0; i < $scope.lstCasos.length; i++) {
			if(i==0){
				$scope.lstMotivos.push($scope.lstCasos[i].Type);
			}else{
				// Se não existe, adicionar na lista
				var adicionar = $scope.lstMotivos.every(function(v,x) {
						v = true;
						if($scope.lstMotivos[x] == $scope.lstCasos[i].Type) {
							v = false;
						}
						return v;
				});
				// É para adicionar?
				if(adicionar) {
					$scope.lstMotivos.push($scope.lstCasos[i].Type);
				}	
			}
		}
		$scope.lstMotivos.sort();
	}

	// Troca a cor do botão a cada segundo, para fazer piscar =)
	function trocarCorBotao() {
		console.log('Era para piscar !!!!!!!!!');
		window.setTimeout(
			function(){
				sforce.console.setCustomConsoleComponentButtonStyle('background: ' + '#eb676b' + ';');
				console.log('Era para piscar laranja!!!!!!!!!');
			},0);		
		window.setTimeout(
			function(){
				sforce.console.setCustomConsoleComponentButtonStyle('background: ' + 'transparent' + ';');
				console.log('Era para piscar preto!!!!!!!!!');
			}, 1000);
		window.setTimeout(
			function(){
				sforce.console.setCustomConsoleComponentButtonStyle('background: ' + '#eb676b' + ';');
				console.log('Era para piscar laranja!!!!!!!!!');
			}, 2000);
		window.setTimeout(
			function(){
				sforce.console.setCustomConsoleComponentButtonStyle('background: ' + 'transparent' + ';');
				console.log('Era para piscar preto!!!!!!!!!');
			}, 3000);
		window.setTimeout(
			function(){
				sforce.console.setCustomConsoleComponentButtonStyle('background: ' + '#eb676b' + ';');
				console.log('Era para piscar laranja!!!!!!!!!');
			}, 4000);
		window.setTimeout(
			function(){
				sforce.console.setCustomConsoleComponentButtonStyle('background: ' + 'transparent' + ';');
				console.log('Era para piscar preto!!!!!!!!!');
			}, 5000);
		window.setTimeout(
			function(){
				sforce.console.setCustomConsoleComponentButtonStyle('background: ' + '#eb676b' + ';');
				console.log('Era para piscar laranja!!!!!!!!!');
			}, 6000);
		window.setTimeout(
			function(){
				sforce.console.setCustomConsoleComponentButtonStyle('background: ' + 'transparent' + ';');
				console.log('Era para piscar preto!!!!!!!!!');
			},7000);
	}

	iniciar();

});