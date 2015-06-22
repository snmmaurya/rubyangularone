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
/*----------------------------------------------------------------------------------------
End Factory
-----------------------------------------------------------------------------------------*/