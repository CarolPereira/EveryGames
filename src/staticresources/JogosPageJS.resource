var app = angular.module("jogosApp");

app.controller('JogosPageCtrl', function($scope) {
	
	$scope.jogo;
	$scope.lstVideos;
	$scope.lstTags;

	$scope.abrirLink = function(id) {
		console.log('O botão funciona : ' + id);
	}

	function inicio() {
		JogosPageController.buscarJogoPagina(function(result) {
			$scope.jogo = result[0];
			console.log('$scope.jogo :' +result[0]);
			$scope.$apply(); 
			console.log('$scope.jogo :' +$scope.jogo);
		});

		JogosPageController.buscarVideos( function(result) {
			$scope.lstVideos = result;
			$scope.$apply();
		});

		JogosPageController.buscarTAGs( function(result) {
			$scope.lstTags = result;
			$scope.$apply();
		});
	}

	inicio();
});

app.filter('trusted', ['$sce', function ($sce) {
	return function(url) {
	    return $sce.trustAsResourceUrl(url);
	};
}]);