var app = angular.module("jogosApp");

app.controller('JogosPageCtrl', function($scope) {
	
	$scope.jogo;

	function inicio() {
		JogosPageController.buscarJogoPagina(function(result) {
			$scope.jogo = result[0];
			console.log('$scope.jogo :' +result[0]);
			$scope.$apply(); 
			console.log('$scope.jogo :' +$scope.jogo);
		});
	}

	inicio();
});