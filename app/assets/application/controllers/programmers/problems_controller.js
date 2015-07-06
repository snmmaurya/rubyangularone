/*----------------------------------------------------------------------------------------
START Problem controller
-----------------------------------------------------------------------------------------*/
snmmaurya.controller("programmersSolutionsProblemsController", function(friendsFactory, $scope, $log, $http, $controller, $location, $rootScope){
  //$controller('solutionsProblemsPaginationController', {$scope: $scope});
  $scope.url = "/api/v1"+$location.path();
  $http.get($scope.url, {format: 'json'}).success( function(response) {
    $scope.paginationContents = response;
    snmmaurya.console($scope.problems);
  });
});
/*----------------------------------------------------------------------------------------
END Problem controller
-----------------------------------------------------------------------------------------*/