/*----------------------------------------------------------------------------------------
START Problem controller
-----------------------------------------------------------------------------------------*/
snmmaurya.controller("programmersSolutionsProblemsAnswersController", function($scope, $http, $routeParams){
  snmmaurya.console("Getting Solutions");
  url = "/api/v1/programmers/solution/"+$routeParams.solution_id+"/problem/"+$routeParams.problem_id+"/answers";
  $http.get(url, {format: 'json'}).success( function(response) {
    $scope.answers = response;
  });
  snmmaurya.console($scope.answers);
  snmmaurya.console("end");
});
/*----------------------------------------------------------------------------------------
END Problem controller
-----------------------------------------------------------------------------------------*/