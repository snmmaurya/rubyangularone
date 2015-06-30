/*----------------------------------------------------------------------------------------
START Home controller
-----------------------------------------------------------------------------------------*/
snmmaurya.controller("homeController", function($scope, $http){
  snmmaurya.console("Getting Home");
  url = "/api/v1/home";
  $http.get(url, {format: 'json'}).success( function(response) {
    $scope.snmmaurya = response;
  });
  snmmaurya.console($scope.snmmaurya);
  snmmaurya.console("end");
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
  });
  snmmaurya.console($scope.response);
  snmmaurya.console("end");
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
    snmmaurya.console("end");
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
snmmaurya.controller("portfoliosController", function($scope, $http, $routeParams){
  snmmaurya.console("Getting Portfolio");
  url = "/api/v1/portfolios";
  $http.get(url, {format: 'json'}).success( function(response) {
    $scope.portfolios = response;
  });
  snmmaurya.console($scope.response);
  snmmaurya.console("end");
});

/*----------------------------------------------------------------------------------------
END portfolios controller
-----------------------------------------------------------------------------------------*/



/*----------------------------------------------------------------------------------------
START portfolios controller
-----------------------------------------------------------------------------------------*/
snmmaurya.controller("portfolioController", function($scope, $http, $routeParams){
  snmmaurya.console("Getting Portfolio");
  url = "/api/v1/portfolio/"+$routeParams.portfolio_id;
  $http.get(url, {format: 'json'}).success( function(response) {
    $scope.portfoio = response;
  });
  snmmaurya.console($scope.response);
  snmmaurya.console("end");
});

/*----------------------------------------------------------------------------------------
END portfolios controller
-----------------------------------------------------------------------------------------*/
