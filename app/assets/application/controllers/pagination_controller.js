/*----------------------------------------------------------------------------------------
Start Pagination controller
-----------------------------------------------------------------------------------------*/
snmmaurya.controller('paginationController', function ($scope, $log, $http, $controller, $location, $rootScope, globalAccess) {
  var keys = globalAccess.globalAccess();
  $scope.totalItems = keys.totalItems;
  $scope.currentPage = 1;
  $scope.itemsPerPage = keys.itemsPerPage;
  $scope.numPerPage = keys.numPerPage;
  $scope.setPage = function (pageNo) {
    $scope.currentPage = pageNo;
  };
  $scope.pageChanged = function() {
    $log.log('Page changed to: ' + $scope.currentPage);
  };
});