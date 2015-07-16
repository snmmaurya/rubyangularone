/*----------------------------------------------------------------------------------------
START Problem controller
-----------------------------------------------------------------------------------------*/
snmmaurya.controller("programmersSolutionsProblemsController", function($scope, $log, $http, $controller, $location, $rootScope, globalAccess, problemFactory){
  $controller('paginationController', {$scope: $scope});

  $scope.initialize = function(data){
    var url = "/api/v1"+$location.path();
    $http.get(url, {format: 'json', params: {begins: data.begin, ends: data.end}}).success( function(response) {
      $scope.paginationContents = response.problems;
      globalAccess.setGlobalAccess("totalItems", response.total_problems);      
      var keys = globalAccess.globalAccess();
      $scope.totalItems = keys.totalItems;
    });
    $scope.problem = {htmlContent: "Write you problem here!"};
  };

  $scope.$watch('currentPage + numPerPage', function() {
    var begin = (($scope.currentPage - 1) * $scope.numPerPage)
    , end = begin + $scope.numPerPage;
     $scope.initialize(params={begin: begin, end: end});
  });


  $scope.createProblem = function(){
    problemFactory.create({problem: {problem: $scope.problem.htmlContent}}).then(function(response){
      if(response.data.status == "OK")
      {
        $scope.initialize(params={begin: $scope.currentPage -1, end: $scope.numPerPage});
      }  
    });
  };

  $scope.getProblems = function(){
    problemFactory.problems().then(function(response){
      $scope.problems = response.data;
      deviseService.currentUser().then(function(response){
        $scope.currentUser = response;
      });
    });
  };

  $scope.getProblem = function(){
    problemFactory.problem().then(function(response){
      $scope.problem = response.data;      
    });
  };

  $scope.updateProblem = function (problem) {
    problemFactory.update(problem).then(function(response){
      if(response.data.status == "OK")
      {
        $scope.initialize(params={begin: $scope.currentPage -1, end: $scope.numPerPage});
      }
    });
  };

  $scope.initialize(params={begin: $scope.currentPage -1, end: $scope.numPerPage});
});
/*----------------------------------------------------------------------------------------
END Problem controller
-----------------------------------------------------------------------------------------*/