snmmaurya.config(function(AuthProvider, AuthInterceptProvider) {
    // Customize login
    AuthProvider.loginMethod('GET');
    AuthProvider.loginPath('/users/sign_in.json');

    // Customize logout
    AuthProvider.logoutMethod('DELETE');
    AuthProvider.logoutPath('/users/sign_out.json');

    // Customize register
    AuthProvider.registerMethod('POST');
    AuthProvider.registerPath('/users.json');

    // Customize the resource name data use namespaced under
    // Pass false to disable the namespace altogether.
    AuthProvider.resourceName('user');

    // Customize user parsing
    // NOTE: **MUST** return a truth-y expression
    AuthProvider.parse(function(response) {
        return response.data.user;
    });

    // Intercept 401 Unauthorized everywhere
    // Enables `devise:unauthorized` interceptor
    AuthInterceptProvider.interceptAuth(true);
});


    snmmaurya.controller('deviseController', function(Auth, $scope, $http) {
        this.credentials = {
            email: 'administrator@snmmaurya.com',
            password: 'administrator'
        };

         this.configuration = {
            headers: {
                'X-HTTP-Method-Override': 'POST'
            }
        };

        this.signIn = function(){
          Auth.login(this.credentials, this.configuration).then(function(user) {
              console.log(user); // => {id: 1, ect: '...'}
          }, function(error) {
              // Authentication failed...
          });
        };

        $scope.$on('devise:login', function(event, currentUser) {
            // after a login, a hard refresh, a new tab
            alert(currentUser);
        });

        $scope.$on('devise:new-session', function(event, currentUser) {
            // user logged in by Auth.login({...})
            alert(currentUser);
        });

        $scope.$on('devise:unauthorized', function(event, xhr, deferred) {
          deferred.reject(xhr);
        });
    });