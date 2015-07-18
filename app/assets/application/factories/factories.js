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



/*----------------------------------------------------------------------------------------
START Answer Factory
-----------------------------------------------------------------------------------------*/
snmmaurya.factory('answerFactory', function($resource, $http, $routeParams) {
 var factory = {};
 var answerFactoryBaseUrl = "";

 factory.createUrl = function(){
    answerFactoryBaseUrl = "/api/v1/programmers/solutions/"+$routeParams.solution_id+"/problems/"+$routeParams.problem_id+"/answers";
 };

 factory.answers = function(){
  factory.createUrl();
  return $http.get(answerFactoryBaseUrl, {format: 'json'});
 }

 factory.getAnswer = function(id){
  factory.createUrl();
  return $http.get(answerFactoryBaseUrl+""+id+"/edit", {format: 'json'});
 }

 factory.create = function (answer) {
   factory.createUrl();
   return $http.post(answerFactoryBaseUrl, answer);
 }

 factory.update = function (answer) {
   factory.createUrl(); 
   console.log(answerFactoryBaseUrl+" "+answer);
   return $http.put(answerFactoryBaseUrl+"/"+answer.id, {answer: {answer: answer.answer}});
 }

factory.deleteAnswer = function (answer) {
  factory.createUrl();
  return $http.delete(answerFactoryBaseUrl+""+answer.id).then(function (status) {
    return status.data;
  });
}
 return factory;
});
/*----------------------------------------------------------------------------------------
END Answer Factory
-----------------------------------------------------------------------------------------*/




/*----------------------------------------------------------------------------------------
START Answer Factory
-----------------------------------------------------------------------------------------*/
snmmaurya.factory('problemFactory', function($resource, $http, $routeParams) {
 var factory = {};
 var answerFactoryBaseUrl = "";

 factory.createUrl = function(){
    problemFactoryBaseUrl = "/api/v1/programmers/solutions/"+$routeParams.solution_id+"/problems/";
 };

 factory.problems = function(){
  factory.createUrl();
  return $http.get(problemFactoryBaseUrl, {format: 'json'});
 }

 factory.getProblem = function(id){
  factory.createUrl();
  return $http.get(problemFactoryBaseUrl+""+id, {format: 'json'});
 }

 factory.create = function (problem) {
   factory.createUrl();
   return $http.post(problemFactoryBaseUrl, problem);
 }

 factory.update = function (problem) {
   factory.createUrl(); 
   console.log(problemFactoryBaseUrl+" "+problem);
   return $http.put(problemFactoryBaseUrl+"/"+problem.id, {problem: {problem: problem.problem}});
 }

factory.deleteAnswer = function (problem) {
  factory.createUrl();
  return $http.delete(problemFactoryBaseUrl+""+problem.id).then(function (status) {
    return status.data;
  });
}
 return factory;
});
/*----------------------------------------------------------------------------------------
END Answer Factory
-----------------------------------------------------------------------------------------*/



/*----------------------------------------------------------------------------------------
START User Factory
-----------------------------------------------------------------------------------------*/
snmmaurya.factory('userFactory', function($resource, $http, $routeParams) {
 var factory = {};
 var userFactoryBaseUrl = "";

 factory.createUrl = function(){
    userFactoryBaseUrl = "/api/v1/profile/users/"+$routeParams.user_id;
 };

 factory.getUser = function(){
  factory.createUrl();
  return $http.get(userFactoryBaseUrl, {format: 'json'});
 };

 return factory;
});
/*----------------------------------------------------------------------------------------
END User Factory
-----------------------------------------------------------------------------------------*/





snmmaurya.factory('friendsFactory', function($resource, $location) {
  return $resource("/api/v1"+$location.path());
});


/*----------------------------------------------------------------------------------------
End Factory
-----------------------------------------------------------------------------------------*/