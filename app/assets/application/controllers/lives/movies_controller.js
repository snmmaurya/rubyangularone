snmmaurya.controller("moviesController", function($controller, $scope, $http, $location, $routeParams, MovieFactory){
  $controller('ModelController', {$scope: $scope});
  $scope.getMovies = function(){
    MovieFactory.getMovies().then(function(response){
      $scope.movies = response.data;
    });
  }

  $scope.getMovie = function(id){
    MovieFactory.getMovie(id).then(function(response){
      $scope.movie = response.data;
    });
  };


  $scope.createMovie = function (movie) {
    MovieFactory.createMovie(movie).then(function(response){
      $scope.response ={status: response.data.status };
    });
  };

  $scope.updateMovie = function (movie) {
    MovieFactory.updateMovie(movie).then(function(response){
      $scope.response ={status: response.data.status };
    });
  };

  $scope.deleteMovie = function (movie) {
    if(confirm("Are you sure?"))
    {
      MovieFactory.deleteMovie(movie); $scope.init();
    }
    else
    {
      return false;
    }    
  };
 
  $scope.init = function(){
    $scope.getMovies();
  };

  $scope.init();

  if($routeParams.id != undefined)
  {
    $scope.getMovie($routeParams.id);
  };
});