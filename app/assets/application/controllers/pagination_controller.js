/*----------------------------------------------------------------------------------------
Start Pagination controller
-----------------------------------------------------------------------------------------*/
snmmaurya.controller('paginationController', function ($scope, $log, $http, $controller) {
  $scope.totalItems = 64;
  $scope.currentPage = 1;
  $scope.maxSize = 5;
  $scope.bigTotalItems = 175;
  $scope.bigCurrentPage = 1;
  $scope.perPage = 10;

   $scope.setPage = function (pageNo) {
    $scope.currentPage = pageNo;
  };

  $scope.pageChanged = function() {
    $log.log('Page changed to: ' + $scope.currentPage);
  };

  // $scope.$watch('currentPage + perPage', function() {
  //   var begin = (($scope.currentPage - 1) * $scope.perPage)
  //   , end = begin + $scope.perPage;
  //   snmmaurya.console("Getting solution's problems");
  //   $http.get($scope.url, {format: 'json'}).success( function(response) {
  //   $scope.paginationContents = response; //$scope.todos.slice(begin, end);;
  //   });
  //   snmmaurya.console("End");
  // });
});
/*----------------------------------------------------------------------------------------
End Pagination controller
-----------------------------------------------------------------------------------------*/


// snmmaurya.controller('paginationController', function ($scope, $log, $http, $controller) {
//   // $controller('programmersSolutionsProblemsController', {$scope: $scope});

//   // $scope.paginationContents = Array.new(5);
//   $scope.totalItems = 64;
//   $scope.currentPage = 1;
//   $scope.setPage = function (pageNo) {
//     $scope.currentPage = pageNo;
//   };

//   $scope.pageChanged = function() {
//     $log.log('Page changed to: ' + $scope.currentPage);
//   };

//   $scope.maxSize = 5;
//   $scope.bigTotalItems = 175;
//   $scope.bigCurrentPage = 1;
//   $scope.numPerPage = 10;


//     $scope.$watch('currentPage + numPerPage', function() {
//     var begin = (($scope.currentPage - 1) * $scope.numPerPage)
//     , end = begin + $scope.numPerPage;
//     snmmaurya.console("Getting solutions");
//     $http.get($scope.url, {format: 'json'}).success( function(response) {
//     $scope.paginationContents = response;
//     });
//     snmmaurya.console("End"+$scope.url);
// });

// });



//Site pagination part
snmmaurya.controller("XpaginationController", function($scope){
   $scope.filteredTodos = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]
  ,$scope.currentPage = 1
  ,$scope.numPerPage = 2
  ,$scope.maxSize = 5;
  
  $scope.makeTodos = function() {
    $scope.todos = [];
    for (i=1;i<=1000;i++) {
      $scope.todos.push({ text:'todo '+i, done:false});
    }
  };
  $scope.makeTodos(); 
  
  $scope.$watch('currentPage + numPerPage', function() {
    var begin = (($scope.currentPage - 1) * $scope.numPerPage)
    , end = begin + $scope.numPerPage;
    
    $scope.filteredTodos = $scope.todos.slice(begin, end);
});
});






//Custom methods
