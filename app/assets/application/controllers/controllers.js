// var snmmaurya = angular.module("snmmaurya", ["ngRoute", "ui.bootstrap", "ngResource"]);
var snmmaurya = angular.module("snmmaurya", ["ngRoute", "ngResource"]);


//Site header part
snmmaurya.controller("headerController", function($scope, $http){
	$scope.title = "Snm Maurya"
});

//Site Menu part
snmmaurya.controller("menuController", function($scope, $http){
  snmmaurya.console("Getting Current User");
  url = "/api/v1/get_current_user";
  $http.get(url, {format: 'json'}).success( function(response) {
    $scope.current_user = response;
  });
  snmmaurya.console($scope.current_user);
  snmmaurya.console("end");
});

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
START About controller
-----------------------------------------------------------------------------------------*/
snmmaurya.controller("footerSolutions", function($scope, $http){
  snmmaurya.console("Getting Solutions");
  url = "/api/v1/footer_solutions";
  $http.get(url, {format: 'json'}).success( function(response) {
    $scope.response = response;
  });
  snmmaurya.console($scope.response);
  snmmaurya.console("end");
});

/*----------------------------------------------------------------------------------------
END About controller
-----------------------------------------------------------------------------------------*/


//Site footer part
snmmaurya.controller("contactController", function($scope, $http){
    $scope.contactMessageStatus = {message: ""};
    $scope.createContact = function(contactData){
      snmmaurya.console("Submitting Contact From Data");
      url = "/create_contact";
      $http({ url: url, method: 'POST', format: 'json', data: contactData, headers: { 'Content-Type': 'application/json' } }).success( function(response) {
      if(response.status == "OK")
      {
        $scope.contactMessageStatus = {message: "Thanks for contact", class: "notice alert alert-success"};
      } 
      else
      {
        $scope.contactMessageStatus = {message: "Error, Please try later", class: "notice alert alert-danger"};
      } 
    });
    snmmaurya.console("end");
  }
});


/*----------------------------------------------------------------------------------------
START Site solutions part
-----------------------------------------------------------------------------------------*/
snmmaurya.controller("solutions_controller", function($scope, $http, solutionsFactory){
  snmmaurya.console("Getting Solutions from solutionsFactory");
  $scope.solutions = solutionsFactory.getSolutions.query();
  snmmaurya.console($scope.solutions);
  snmmaurya.console("END");
});
/*----------------------------------------------------------------------------------------
END Site solutions part
-----------------------------------------------------------------------------------------*/


/*----------------------------------------------------------------------------------------
START Site About part
-----------------------------------------------------------------------------------------*/
// snmmaurya.controller("aboutController", function($scope, $http, employmentsFactory, administratorFactory){
//   snmmaurya.console("Getting Employments from employmentsFactory");
//   $scope.employments = employmentsFactory.getEmployments.query();
//   snmmaurya.console("Getting Admin profile from administratorFactory");  
//   $scope.profile = administratorFactory.getAdministrator.query();
//   snmmaurya.console($scope.profile);
//   snmmaurya.console($scope.profile.infos);  
//   snmmaurya.console("END");
// });
/*----------------------------------------------------------------------------------------
END Site About part
-----------------------------------------------------------------------------------------*/

//Site programmers solutions part
snmmaurya.controller("programmersSolutionsController", function($scope, $http){

    snmmaurya.console("Getting solutions");
    var url="/programmers/solutions";
    $http.get(url, {format: 'json'}).success( function(response) {
      // angular.forEach(response, function(solution, key) {
      //   solutions.push(solution);
      // }); 
    $scope.solutions = response;
    });
    snmmaurya.console($scope.solutions);
    snmmaurya.console("End");
});



snmmaurya.controller("programmersSolutionsProblemsController", function($scope, $http, $routeParams, $controller){
  // $controller('paginationController', {$scope: $scope});
  // getProblemsFactory.setProblems();
  // $scope.paginationContents = getProblemsFactory.getProblems();
  snmmaurya.console("Getting solution's problem");
  $scope.url="/programmers/solutions/"+$routeParams.solution_id+"/problems";
  snmmaurya.console("End");
});




//Site body part
snmmaurya.controller("body_controller", function($scope){
	
});


/*----------------------------------------------------------------------------------------
Start Pagination controller
-----------------------------------------------------------------------------------------*/
snmmaurya.controller('paginationController', function ($scope, $log, $http, $controller) {
  $scope.totalItems = 64;
  $scope.currentPage = 1;
  $scope.maxSize = 5;
  $scope.bigTotalItems = 175;
  $scope.bigCurrentPage = 1;
  $scope.perPage = 10;

   $scope.setPage = function (pageNo) {
    $scope.currentPage = pageNo;
  };

  $scope.pageChanged = function() {
    $log.log('Page changed to: ' + $scope.currentPage);
  };

  // $scope.$watch('currentPage + perPage', function() {
  //   var begin = (($scope.currentPage - 1) * $scope.perPage)
  //   , end = begin + $scope.perPage;
  //   snmmaurya.console("Getting solution's problems");
  //   $http.get($scope.url, {format: 'json'}).success( function(response) {
  //   $scope.paginationContents = response; //$scope.todos.slice(begin, end);;
  //   });
  //   snmmaurya.console("End");
  // });
});
/*----------------------------------------------------------------------------------------
End Pagination controller
-----------------------------------------------------------------------------------------*/


// snmmaurya.controller('paginationController', function ($scope, $log, $http, $controller) {
//   // $controller('programmersSolutionsProblemsController', {$scope: $scope});

//   // $scope.paginationContents = Array.new(5);
//   $scope.totalItems = 64;
//   $scope.currentPage = 1;
//   $scope.setPage = function (pageNo) {
//     $scope.currentPage = pageNo;
//   };

//   $scope.pageChanged = function() {
//     $log.log('Page changed to: ' + $scope.currentPage);
//   };

//   $scope.maxSize = 5;
//   $scope.bigTotalItems = 175;
//   $scope.bigCurrentPage = 1;
//   $scope.numPerPage = 10;


//     $scope.$watch('currentPage + numPerPage', function() {
//     var begin = (($scope.currentPage - 1) * $scope.numPerPage)
//     , end = begin + $scope.numPerPage;
//     snmmaurya.console("Getting solutions");
//     $http.get($scope.url, {format: 'json'}).success( function(response) {
//     $scope.paginationContents = response;
//     });
//     snmmaurya.console("End"+$scope.url);
// });

// });



//Site pagination part
snmmaurya.controller("XpaginationController", function($scope){
   $scope.filteredTodos = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]
  ,$scope.currentPage = 1
  ,$scope.numPerPage = 2
  ,$scope.maxSize = 5;
  
  $scope.makeTodos = function() {
    $scope.todos = [];
    for (i=1;i<=1000;i++) {
      $scope.todos.push({ text:'todo '+i, done:false});
    }
  };
  $scope.makeTodos(); 
  
  $scope.$watch('currentPage + numPerPage', function() {
    var begin = (($scope.currentPage - 1) * $scope.numPerPage)
    , end = begin + $scope.numPerPage;
    
    $scope.filteredTodos = $scope.todos.slice(begin, end);
});
});


/*----------------------------------------------------------------------------------------
START Router controller
-----------------------------------------------------------------------------------------*/
snmmaurya.config(['$routeProvider',
function($routeProvider) {
  $routeProvider.
    when('/', {
      templateUrl: 'home',
      controller: 'homeController'
    }).
    when('/about', {
      templateUrl: 'about',
      controller: 'aboutController'
    }).    
    when('/solutions', {
      templateUrl: 'solutions',
      controller: 'solutions_controller'
    }).
    when('/programmers/solutions', {
      templateUrl: 'programmersSolutions',
      controller: 'programmersSolutionsController'
    }).
    when('/programmers/solution/problems/:solution_id', {
      templateUrl: 'programmersSolutionsProblems',
      controller: 'programmersSolutionsProblemsController'
    }).
    when('/contact', {
      templateUrl: 'contact',
      controller: 'contactController'
    }).
    when('/phones/:phoneId', {
      templateUrl: 'partials/phone-detail.html',
      controller: 'PhoneDetailCtrl'
    }).
    otherwise({
      redirectTo: '/'
    });
}]);
/*----------------------------------------------------------------------------------------
End Router controller
-----------------------------------------------------------------------------------------*/



//Custom methods
snmmaurya.console = function(information){
  if(Object.prototype.toString.call(information) === '[object String]'){
	 console.log("################# "+ information+ " #################");
  }
  else{
    console.log(information); 
  }
}