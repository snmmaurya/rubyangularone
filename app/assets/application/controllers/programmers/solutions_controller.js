/*----------------------------------------------------------------------------------------
START Solutions controller
-----------------------------------------------------------------------------------------*/
snmmaurya.controller("programmersSolutionsController", function($scope, $http){
  snmmaurya.console("Getting Solutions");
  url = "/api/v1/programmers/solutions";
  $http.get(url, {format: 'json'}).success( function(response) {
    $scope.response = response;    
    snmmaurya.console($scope.response);
  });
});
/*----------------------------------------------------------------------------------------
END Solutions controller
-----------------------------------------------------------------------------------------*/