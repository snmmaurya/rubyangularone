/*----------------------------------------------------------------------------------------
Start Factory
-----------------------------------------------------------------------------------------*/
snmmaurya.factory("solutionsFactory", function($resource){
   var factory = {};
    factory.getSolutions = $resource('/get_solutions', {}, {
        'query': {method: 'GET', isArray: true}
    });
    return factory;
});

snmmaurya.factory("employmentsFactory", function($resource){
	var factory = {};
	factory.getEmployments = $resource("/about", {}, { 
		"query": {method: "GET", isArray: true}
	});
	return factory;
});


snmmaurya.factory("administratorFactory", function($resource){
	var factory = {};
	factory.getAdministrator = $resource("/administrator_profile", {}, { 
		"query": {method: "GET", isArray: true}
	});
	return factory;
});

snmmaurya.factory("customerFactory", function($resource){
  var factory = {};
  var customers = [
    {name: "Snm", email: "snmmaurya@gmail.com", contact: "7718078973"},
    {name: "Deepak", email: "snmmaurya@gmail.com", contact: "7718078973"},
    {name: "Sandhya", email: "snmmaurya@gmail.com", contact: "7718078973"},
    {name: "Manish", email: "snmmaurya@gmail.com", contact: "7718078973"},
  ];

  factory.getCustomers = function(){
    return customers;
  }

  factory.getCustomer = function(customer){
    return customers;
  }

  factory.setCustomer = function(customer){
    customers.push(customer);
  }
  return factory;
});



/*----------------------------------------------------------------------------------------
START Movie Factory
-----------------------------------------------------------------------------------------*/
snmmaurya.factory('MovieFactory', function($resource, $http) {
 var movieFactoryBaseUrl = "/api/v1/movies/";
 var factory = {};

 factory.getMovies = function(){
  return $http.get(movieFactoryBaseUrl, {format: 'json'});
 }

 factory.getMovie = function(id){
  return $http.get(movieFactoryBaseUrl+""+id+"/edit", {format: 'json'});
 }

 factory.createMovie = function (movie) {
   return $http.post(movieFactoryBaseUrl, movie);
 }

 factory.updateMovie = function (movie) {
   return $http.put(movieFactoryBaseUrl+""+movie.id, movie);
 }

factory.deleteMovie = function (movie) {
  return $http.delete(movieFactoryBaseUrl+""+movie.id).then(function (status) {
    return status.data;
  });
}
 return factory;
});
/*----------------------------------------------------------------------------------------
END Movie Factory
-----------------------------------------------------------------------------------------*/



snmmaurya.factory('friendsFactory', function($resource, $location) {
  return $resource("/api/v1"+$location.path());
});


/*----------------------------------------------------------------------------------------
End Factory
-----------------------------------------------------------------------------------------*/