/*----------------------------------------------------------------------------------------
START Solutions controller
-----------------------------------------------------------------------------------------*/
snmmaurya.controller("programmersSolutionsProblemsController", function($scope, $http){
  snmmaurya.console("Getting Solutions");
  url = "/api/v1/programmers";
  $http.get(url, {format: 'json'}).success( function(response) {
    $scope.response = response;
  });
  snmmaurya.console($scope.response);
  snmmaurya.console("end");
});

/*----------------------------------------------------------------------------------------
END Solutions controller
-----------------------------------------------------------------------------------------*/
