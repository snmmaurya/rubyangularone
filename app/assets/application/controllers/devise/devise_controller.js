/*----------------------------------------------------------------------------------------
START Devise specific configuration
-----------------------------------------------------------------------------------------*/
snmmaurya.config(function(AuthProvider, AuthInterceptProvider, $locationProvider, $httpProvider) {
  $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content');
  $httpProvider.defaults.headers.common['ClientType'] = 'browser';
  AuthProvider.loginMethod('POST');
  AuthProvider.loginPath('/users/sign_in.json');
  AuthProvider.logoutMethod('DELETE');
  AuthProvider.logoutPath('/users/sign_out.json');
  AuthProvider.registerMethod('POST');
  AuthProvider.registerPath('/users.json');
  //AuthProvider.resourceName('user'); namespaced under like user[:email] here user is namespace

  //Parse response after Auth.currentUser
  AuthProvider.parse(function(response) {
      return response.data;
  });

  // Intercept 401 Unauthorized everywhere | Enables `devise:unauthorized` interceptor
  AuthInterceptProvider.interceptAuth(true);
});
/*----------------------------------------------------------------------------------------
END Devise specific configuration
-----------------------------------------------------------------------------------------*/



/*----------------------------------------------------------------------------------------
START Sessions controller
-----------------------------------------------------------------------------------------*/
snmmaurya.controller('sessionsController', function(Auth, $controller, $scope, $http, flashMessage, $location, $rootScope) {
  $controller('ModelController', {$scope: $scope});
  $scope.credentials = {
      email: '',
      password: '',
      login: ''
  };

  $scope.configuration = {
    headers: {
        'X-HTTP-Method-Override': 'POST'
    }
  };

  $scope.signIn = function(){    
    $scope.credentials.login = $scope.credentials.email;
    console.log($scope.credentials);
    Auth.login($scope.credentials).then(function(user) {      
      flashMessage.setFlashMessage("Signed in Successfully", 'success');      
       $location.path('/');
       $scope.ok(); //Close model pup up here!
    }, function(error) {
        //flashMessage.setFlashMessage(error.data.error, 'success');
        $scope.loginError = true;
        $scope.message = {message: "Login Error: "+error.data.error+" If you forgot password try to restore your password using forgot password button.", type: "danger"};
    });
  };

  $scope.$on('devise:unauthorized', function(event, xhr, deferred) {
    deferred.reject(xhr);
  });

  $scope.$on('devise:login', function(event, currentUser) {
    $scope.isAuthenticated = true;
  });

  $scope.$on('devise:new-session', function(event, currentUser) {
    $scope.isAuthenticated = true;
  });

  $scope.$on('devise:logout', function(event, oldCurrentUser) {
    $scope.isAuthenticated = false;
  });


  $scope.signOut = function() {
    Auth.logout().then(function(oldUser) {
     flashMessage.setFlashMessage("Signed Out Successfully", 'success');
      $location.path("/");
    }, function(error) {
    });
  };

  $scope.currentUser = function(){
    Auth.currentUser().then(function(user) {
      $scope.currentUser = user;
    }, function(error) { snmmaurya.console("User is not authenticated")});
  };

  Auth.currentUser().then(function(user) {
    $scope.isAuthenticated = true;
  }, function(error) {
  });
});
/*----------------------------------------------------------------------------------------
END Sessions controller
-----------------------------------------------------------------------------------------*/


/*----------------------------------------------------------------------------------------
START Registrations controller
-----------------------------------------------------------------------------------------*/
snmmaurya.controller('registrationsController', function(Auth, $scope, $http, flashMessage, $location, $rootScope, globalAccess) {
  $scope.credentials = {
    email: 'administrator@snmmaurya.com',
    username: 'administrator',
    password: 'administrator',
    password_confirmation: 'administrator',
    infos_attributes: [{fname: 'Sawana', lname: 'Maurya'}]
  };

  $scope.configuration = {
    headers: {
        'X-HTTP-Method-Override': 'POST'
    }
  };

  $scope.signUp = function(){
    Auth.register($scope.credentials).then(function(registeredUser) {
      globalAccess.setGlobalAccess("email", $scope.credentials.email);
      $rootScope.$evalAsync(function() {
      $location.path("/thank_you");
    });

    }, function(error) {
      $scope.errors = error.data.errors;
      $scope.errorExists = true;
      console.log("Registration falied")
    });
  };

  $scope.$on('devise:new-registration', function(event, user) {
    $scope.isAuthenticated = true;
  });
});
/*----------------------------------------------------------------------------------------
END Registrations controller
-----------------------------------------------------------------------------------------*/