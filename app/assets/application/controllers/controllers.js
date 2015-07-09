'use strict';

var snmmaurya = angular.module("snmmaurya", ["ngRoute", "ngResource", "ui.bootstrap", "Devise", "globalModule", "xeditable"]);


snmmaurya.run(function(editableOptions) {
  editableOptions.theme = 'bs3'; // bootstrap3 theme. Can be also 'bs2', 'default'
});
/*----------------------------------------------------------------------------------------
START Header controller
-----------------------------------------------------------------------------------------*/
snmmaurya.controller("headerController", function($scope, $http){
	$scope.title = "Snm Maurya";
});
/*----------------------------------------------------------------------------------------
ENE Header controller
-----------------------------------------------------------------------------------------*/


/*----------------------------------------------------------------------------------------
START Menu controller
-----------------------------------------------------------------------------------------*/
snmmaurya.controller("menuController", function($scope, $http, flashMessage){
  snmmaurya.console("Getting Current User");
  url = "/api/v1/get_current_user";
  $http.get(url, {format: 'json'}).success( function(response) {
    $scope.current_user = response;
    snmmaurya.console($scope.current_user);
  });

  $scope.$on('$routeChangeStart', function(next, current) { 
    $scope.flashMessage = flashMessage.getFlashMessage();
  });
});
/*----------------------------------------------------------------------------------------
END Menu controller
-----------------------------------------------------------------------------------------*/


/*----------------------------------------------------------------------------------------
START Solutions controller
-----------------------------------------------------------------------------------------*/
snmmaurya.controller("footerSolutions", function($scope, $http){
  snmmaurya.console("Getting Solutions");
  url = "/api/v1/footer_solutions";
  $http.get(url, {format: 'json'}).success( function(response) {
    $scope.response = response;
    snmmaurya.console($scope.response);
  });
});

/*----------------------------------------------------------------------------------------
END Solutions controller
-----------------------------------------------------------------------------------------*/


/*----------------------------------------------------------------------------------------
Start Custom Methods
-----------------------------------------------------------------------------------------*/
snmmaurya.console = function(information){
  if(Object.prototype.toString.call(information) === '[object String]'){
   console.log("------------------------ "+ information + " ------------------------");
  }
  else{
    console.log(information==undefined ? "Requested Data Not Found" : information); 
  }
};
/*----------------------------------------------------------------------------------------
END Custom Methods
-----------------------------------------------------------------------------------------*/