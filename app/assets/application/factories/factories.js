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
End Factory
-----------------------------------------------------------------------------------------*/