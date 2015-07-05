/*----------------------------------------------------------------------------------------
Start Pagination controller
-----------------------------------------------------------------------------------------*/
snmmaurya.controller('solutionsProblemsPaginationController', function ($scope, $log, $http, $controller, $location, $rootScope) {
  //$controller('programmersSolutionsProblemsController', {$scope: $scope});

  $scope.totalItems = 64;
  $scope.currentPage = 1;  
  $scope.setPage = function (pageNo) {
    $scope.currentPage = pageNo;
  };

  $scope.pageChanged = function() {
    $log.log('Page changed to: ' + $scope.currentPage);
    $rootScope.paginationContents = {};
  };

  $scope.maxSize = 5;
  $scope.bigTotalItems = 175;
  $scope.bigCurrentPage = 1;
  $scope.numPerPage = 2;
  $scope.url = "/api/v1"+$location.path();

  $scope.$watch('currentPage + numPerPage', function() {
    var begin = (($scope.currentPage - 1) * $scope.numPerPage)
    , end = begin + $scope.numPerPage;
    snmmaurya.console("Getting solutions");
    $http.get($scope.url, {format: 'json', params: {begins: begin, ends: end}}).success(function(response) {
      console.log("++++++++++++++++++++++ "+response );
    });
  });

});