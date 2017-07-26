var app = angular.module("jogosApp");

app.controller('JogoVideosCtrl', function($scope) {

	$scope.lstVideos;

	function iniciar() {
		JogoVideosController.buscarVideos( function(result) {
			$scope.lstVideos = result;
			$scope.$apply();
		});
	}
	
	iniciar();
});

app.filter('trusted', ['$sce', function ($sce) {
	return function(url) {
	    return $sce.trustAsResourceUrl(url);
	};
}]);

