var app = angular.module("jogosApp");

app.controller('JogoVideosCtrl', function($scope) {

	$scope.lstVideos;


	function iniciar() {
		
		var lstVideos = urls.split(";");
		$scope.$apply();
		
	}
	
	iniciar();
});

app.filter('trusted', ['$sce', function ($sce) {
	return function(url) {
	    return $sce.trustAsResourceUrl(url);
	};
}]);

