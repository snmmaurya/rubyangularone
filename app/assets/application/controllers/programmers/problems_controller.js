/*----------------------------------------------------------------------------------------
START Problem controller
-----------------------------------------------------------------------------------------*/
snmmaurya.controller("programmersSolutionsProblemsController", function($scope, $log, $http, $controller, $location, $rootScope){
  $controller('solutionsProblemsPaginationController', {$scope: $scope});

  $scope.initialize = function(data){
    $scope.url = "/api/v1"+$location.path();
    $http.get($scope.url, {format: 'json', params: {begins: data.begin, ends: data.end}}).success( function(response) {
      $scope.paginationContents = response;
      snmmaurya.console($scope.paginationContents);
    });
  };

  $scope.$watch('currentPage + numPerPage', function() {
    var begin = (($scope.currentPage - 1) * $scope.numPerPage)
    , end = begin + $scope.numPerPage;
    $http.get($scope.url, {format: 'json', params: {begins: begin, ends: end}}).success(function(response) {
      $scope.paginationContents = response;
    });
  });

  $scope.initialize(params={begin: $scope.currentPage, end: $scope.numPerPage});

});
/*----------------------------------------------------------------------------------------
END Problem controller
-----------------------------------------------------------------------------------------