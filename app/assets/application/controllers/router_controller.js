/*----------------------------------------------------------------------------------------
START Router controller
-----------------------------------------------------------------------------------------*/
snmmaurya.config(['$routeProvider',function($routeProvider) {
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
    when('/programmers/solution/:solution_id/problems', {
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
    when('/portfolios/:id', {
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
    }).//Start Movies Routers
    when('/movies', {
      templateUrl: 'movies',
      controller: 'moviesController'
    }).
    when('/movies/:id/show', {
      templateUrl: 'movies-show',
      controller: 'moviesController'
    }).
    when('/movies/:id/edit', {
      templateUrl: 'movies-edit',
      controller: 'moviesController'
    }).
    when('/movies/new', {
      templateUrl: 'movies-new',
      controller: 'moviesController'
    }).//END Movies Routers
    when('/directives', {
      templateUrl: 'directives',
      controller: 'livesController'
    }).
    otherwise({
      redirectTo: '/'
    });
}]);
/*----------------------------------------------------------------------------------------
End Router controller
-----------------------------------------------------------------------------------------*/