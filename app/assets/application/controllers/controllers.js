'use strict';

var snmmaurya = angular.module("snmmaurya", ["ngRoute", "ngResource", "ui.bootstrap", "Devise", "globalModule", "xeditable", "deviseModule", "ngAnimate", "textAngular"]);


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
snmmaurya.controller("menuController", function(globalAccess, $scope, $http, flashMessage, $controller, deviseService, $timeout){
  $scope.$on('$routeChangeStart', function(next, current) {
    $scope.flash = false;

    $scope.flashes = flashMessage.getFlashMessage();

    if($scope.flashes.message !="")
    {
      $scope.flash = true;
      $timeout(function () { $scope.flash = false; }, 5000);
    }

    deviseService.currentUser().then(function(user) {
      $scope.currentUser = user;
    }, function(error) { });

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
START Menu controller
-----------------------------------------------------------------------------------------*/
snmmaurya.controller("thankYouController", function(globalAccess, $location, $scope, $http, flashMessage, $controller, deviseService, $timeout){
  $scope.email = globalAccess.getGlobalAccess("email");
  flashMessage.setFlashMessage("Please confirm you email, by openeing and following confirmatin link.", "success");
  $timeout(function () { $location.path("/") }, 5000);
});
/*----------------------------------------------------------------------------------------
END Menu controller
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