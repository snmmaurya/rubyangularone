/*----------------------------------------------------------------------------------------
START Home controller
-----------------------------------------------------------------------------------------*/
snmmaurya.controller("homeController", function($scope, $http){
  snmmaurya.console("Getting Home");
  url = "/api/v1/home";
  $http.get(url, {format: 'json'}).success( function(response) {
    $scope.snmmaurya = response;
    snmmaurya.console($scope.snmmaurya);
  });  
});

/*----------------------------------------------------------------------------------------
END Home controller
-----------------------------------------------------------------------------------------*/


/*----------------------------------------------------------------------------------------
START About controller
-----------------------------------------------------------------------------------------*/
snmmaurya.controller("aboutController", function($scope, $http){
  snmmaurya.console("Getting About");
  url = "/api/v1/about";
  $http.get(url, {format: 'json'}).success( function(response) {
    $scope.response = response;
    snmmaurya.console($scope.response);
  });
});

/*----------------------------------------------------------------------------------------
END About controller
-----------------------------------------------------------------------------------------*/



/*----------------------------------------------------------------------------------------
END contact controller
-----------------------------------------------------------------------------------------*/
snmmaurya.controller("contactController", function($scope, $http){
    $scope.contactMessageStatus = {message: ""};
    $scope.createContact = function(contactData){
      snmmaurya.console("Submitting Contact From Data");
      url = "/api/v1/contact";
      $http({ url: url, method: 'POST', format: 'json', data: contactData, headers: { 'Content-Type': 'application/json' } }).success( function(response) {
      if(response.status == "OK")
      {
        $scope.contactMessageStatus = {message: "Thanks for contact", class: "notice alert alert-success"};
        clearForm();
      } 
      else
      {
        $scope.contactMessageStatus = {message: "Error, Please try later", class: "notice alert alert-danger"};
      } 
    });
    
  }
  $scope.clearForm = function(){
    $scope.contactForm.$setPristine();
  }  
});
/*----------------------------------------------------------------------------------------
END contact controller
-----------------------------------------------------------------------------------------*/


/*----------------------------------------------------------------------------------------
START portfolios controller
-----------------------------------------------------------------------------------------*/
snmmaurya.controller("portfoliosController", function($scope, $http, $routeParams, $modal, $log, $controller){
  $controller('ModelController', {$scope: $scope});
  snmmaurya.console("Getting Portfolios");
  url = "/api/v1/portfolios";
  $http.get(url, {format: 'json'}).success( function(response) {
    $scope.portfolios = response;
    snmmaurya.console($scope.portfolios);
  });
});

/*----------------------------------------------------------------------------------------
END portfolios controller
-----------------------------------------------------------------------------------------*/



/*----------------------------------------------------------------------------------------
START portfolios controller
-----------------------------------------------------------------------------------------*/
snmmaurya.controller("portfolioController", function($scope, $http, $routeParams){
  snmmaurya.console("Getting Portfolio");
  url = "/api/v1/portfolios/"+$routeParams.id;
  $http.get(url, {format: 'json'}).success( function(response) {
    $scope.portfolio = response;
    snmmaurya.console($scope.portfolio);
  });
});

/*----------------------------------------------------------------------------------------
END portfolios controller
-----------------------------------------------------------------------------------------*/
