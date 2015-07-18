/*----------------------------------------------------------------------------------------
START Problem controller
-----------------------------------------------------------------------------------------*/
snmmaurya.controller("programmersSolutionsProblemsController", function($routeParams, $scope, $log, $http, $controller, $location, $rootScope, globalAccess, problemFactory, deviseService){
  //$controller('paginationController', {$scope: $scope});

  $scope.initialize = function(){
    $scope.getProblems();
    $scope.problem = {htmlContent: "Contribute/Write your problem here!"};
  };


  $scope.createProblem = function(){
    problemFactory.create({problem: {problem: $scope.problem.htmlContent}}).then(function(response){
      if(response.data.status == "OK")
      {
        $scope.getProblems();
      }  
    });
  };

  $scope.getProblems = function(){
    problemFactory.problems().then(function(response){
      $scope.paginationContents = response.data.problems;
      deviseService.currentUser().then(function(response){
        $scope.currentUser = response;
        console.log(response);
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
        $scope.getProblems();
      }
    });
  };

  if($routeParams.id != undefined)
  {
    $scope.getProblem($routeParams.id);
  };

  $scope.initialize();
});
/*----------------------------------------------------------------------------------------
END Problem controller
-----------------------------------------------------------------------------------------*/