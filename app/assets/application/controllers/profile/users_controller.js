/*----------------------------------------------------------------------------------------
START Users controller
-----------------------------------------------------------------------------------------*/
snmmaurya.controller("usersController", function($scope, $http, $routeParams, userFactory){
  $scope.getUser = function(){
    userFactory.getUser().then(function(response){
      $scope.user = response.data;
      console.log(response.data[0]);
    });
  };

  $scope.initialize = function(){
    $scope.getUser();
  };
  $scope.initialize();
});
/*----------------------------------------------------------------------------------------
END Users controller
-----------------------------------------------------------------------------------------*/