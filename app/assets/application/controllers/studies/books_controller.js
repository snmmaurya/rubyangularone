snmmaurya.controller("booksController", function($http, $scope, $location, $log, $rootScope){
	var baseUrl = "/api/v1/"+$location.path();
	$http.get(baseUrl, {format: 'json'}).then(function(response){
		$scope.response = response.data;
	});
});