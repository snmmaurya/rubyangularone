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
    when('/programmers/solutions', {
      templateUrl: 'solutions',
      controller: 'programmersSolutionsController'
    }).
    when('/programmers/solutions/:solution_id/problems', {
      templateUrl: 'problems',
      controller: 'programmersSolutionsProblemsController'
    }).
    when('/programmers/solution/:solution_id/problem/:problem_id/answers', {
      templateUrl: 'answers',
      controller: 'programmersSolutionsProblemsAnswersController'
    }).
    when('/portfolios', {
      templateUrl: 'portfolios',
      controller: 'portfoliosController'
    }).
    when('/portfolios/:portfolio_id', {
      templateUrl: 'portfolio',
      controller: 'portfolioController'
    }).
    when('/contact', {
      templateUrl: 'contact',
      controller: 'contactController'
    }).
    when('/phones/:phoneId', {
      templateUrl: 'partials/phone-detail.html',
      controller: 'PhoneDetailCtrl'
    }).
    when('/live', {
      templateUrl: 'customers',
      controller: 'customerController'
    }).
    otherwise({
      redirectTo: '/'
    });
}]);
/*----------------------------------------------------------------------------------------
End Router controller
-----------------------------------------------------------------------------------------*/