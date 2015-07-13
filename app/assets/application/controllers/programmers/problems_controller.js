/*----------------------------------------------------------------------------------------
START Problem controller
-----------------------------------------------------------------------------------------*/
snmmaurya.controller("programmersSolutionsProblemsController", function($scope, $log, $http, $controller, $location, $rootScope, globalAccess){
  $controller('paginationController', {$scope: $scope});

  $scope.initialize = function(data){
    var url = "/api/v1"+$location.path();
    $http.get(url, {format: 'json', params: {begins: data.begin, ends: data.end}}).success( function(response) {
      $scope.paginationContents = response;
      snmmaurya.console($scope.paginationContents);
    });
  };

  $scope.$watch('currentPage + numPerPage', function() {
    var begin = (($scope.currentPage - 1) * $scope.numPerPage)
    , end = begin + $scope.numPerPage;
     $scope.initialize(params={begin: begin, end: end});
  });

  globalAccess.setGlobalAccess("totalItems", 100);
  globalAccess.setGlobalAccess("itemsPerPage", 10);
  globalAccess.setGlobalAccess("numPerPage", 10);
  $scope.initialize(params={begin: $scope.currentPage -1, end: $scope.numPerPage});
});
/*----------------------------------------------------------------------------------------
END Problem controller
-----------------------------------------------------------------------------------------