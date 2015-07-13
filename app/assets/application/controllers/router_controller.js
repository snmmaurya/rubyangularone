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
    when('/programmers/solutions/:solution_id/problems', {
      templateUrl: 'problems',
      controller: 'programmersSolutionsProblemsController'
    }).
    when('/programmers/solutions/:solution_id/problems/:problem_id/answers', {
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
    when('/lives', {
      templateUrl: 'lives',
      controller: 'livesController'
    }).
    when('/thank_you', {
      templateUrl: '/assets/templates/thank_you.html',
      controller: 'thankYouController'
    }).
    when("/profile/users/:user_id", {
      templateUrl: '/assets/templates/profile/users/show.html',
      controller: 'usersController'
    }).
    otherwise({
      redirectTo: '/'
    });
}]);



snmmaurya.config(['$routeProvider',function($routeProvider) {
  $routeProvider.
    when('/signin', {
      templateUrl: '/assets/templates/devise/sessions/new.html',
      controller: 'sessionsController'
    }).
    when('/signup', {
      templateUrl: '/assets/templates/devise/registrations/new.html',
      controller: 'registrationsController'
    }).
    otherwise({
      redirectTo: '/'
    });
}]);



snmmaurya.config(['$routeProvider',function($routeProvider) {
  $routeProvider.
    when('/livecruds', {
      templateUrl: 'livecruds',
      controller: 'livecrudsController'
    }).
    when('/livecruds/:id/show', {
      templateUrl: 'livecruds-show',
      controller: 'livecrudsController'
    }).
    when('/livecruds/:id/edit', {
      templateUrl: 'livecruds-edit',
      controller: 'livecrudsController'
    }).
    when('/livecruds/new', {
      templateUrl: 'livecruds-new',
      controller: 'livecrudsController'
    }).
    otherwise({
      redirectTo: '/'
    });
}]);


snmmaurya.config(['$routeProvider',function($routeProvider) {
  $routeProvider.
    when('/studies/books', {
      templateUrl: '/assets/templates/studies/books/index.html',
      controller: 'booksController'
    }).
    when('/studies/books/:book_id/lessions', {
      templateUrl: '/assets/templates/studies/lessions/index.html',
      controller: 'lessionsController'
    }).
    when('/studies/books/:book_id/lessions/:id', {
      templateUrl: '/assets/templates/studies/lessions/show.html',
      controller: 'lessionsController'
    }).
    otherwise({
      redirectTo: '/'
    });
}]);

/*----------------------------------------------------------------------------------------
End Router controller
-----------------------------------------------------------------------------------------