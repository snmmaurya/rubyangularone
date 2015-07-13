snmmaurya.controller("lessionsController", function($http, $scope, $location, $log, $rootScope){
	var baseUrl = "/api/v1/"+$location.path();
	$http.get(baseUrl, {format: 'json'}).then(function(response){
		$scope.book = response.data.book;
		$scope.lessions = response.data.lessions;
		$scope.lession = response.data.lession;
	});
});