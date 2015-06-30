/*----------------------------------------------------------------------------------------
START Problem controller
-----------------------------------------------------------------------------------------*/
snmmaurya.controller("programmersSolutionsProblemsController", function($scope, $http, $routeParams){
  snmmaurya.console("Getting Solutions");
  url = "/api/v1/programmers/solution/"+$routeParams.solution_id+"/problems";
  $http.get(url, {format: 'json'}).success( function(response) {
    $scope.problems = response;
  });
  snmmaurya.console($scope.problems);
  snmmaurya.console("end");
});
/*----------------------------------------------------------------------------------------
END Problem controller
-----------------------------------------------------------------------------------------*/