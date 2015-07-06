snmmaurya.config(function(AuthProvider, AuthInterceptProvider) {
    // Customize login
    AuthProvider.loginMethod('GET');
    AuthProvider.loginPath('/users/sign_in.json');

    // Customize logout
    AuthProvider.logoutMethod('POST');
    AuthProvider.logoutPath('/user/logout.json');

    // Customize register
    AuthProvider.registerMethod('PATCH');
    AuthProvider.registerPath('/user/sign_up.json');

    // Customize the resource name data use namespaced under
    // Pass false to disable the namespace altogether.
    AuthProvider.resourceName('customer');

    // Customize user parsing
    // NOTE: **MUST** return a truth-y expression
    AuthProvider.parse(function(response) {
        return response.data.user;
    });

    // Intercept 401 Unauthorized everywhere
    // Enables `devise:unauthorized` interceptor
    AuthInterceptProvider.interceptAuth(true);
});


// snmmaurya.controller('deviseController', function(Auth, $scope, $location) {
//   this.credentials = {
//     email: '',
//     password: ''  };

//   // this.config = {
//   //   headers: {
//   //       'X-HTTP-Method-Override': 'POST',
//   //       'X-CSRF-Token': $('meta[name=csrf-token]').attr('content')
//   //   }
//   // };


//   this.signIn = function() {
//     // Code to use 'angular-devise' component
//     //alert(this.credentials.email);
//     Auth.login(this.credentials).then(function(user) {
//       $location.path("/");
//       alert('Successfully signed in user!')
//     }, function(error) {
//       console.info('Error in authenticating user!');
//       alert('Error in signing in user!');
//     });
//   };

//   $scope.$on('devise:login', function(event, currentUser) {
//     // after a login, a hard refresh, a new tab
//   });

//   $scope.$on('devise:new-session', function(event, currentUser) {
//     // user logged in by Auth.login({...})
//   });

//   $scope.$on('devise:unauthorized', function(event, xhr, deferred) {
    
//    }); 
// });


// snmmaurya.controller('deviseController', ['Auth', '$scope', '$location', function(Auth, $scope, $location) {

//       this.credentials = { email: '', password: '' };

//       this.signIn = function() {
//         // Code to use 'angular-devise' component
//         Auth.login(this.credentials).then(function(user) {
//           $location.path("/");
//           alert('Successfully signed in user!')
//         }, function(error) {
//           console.info('Error in authenticating user!');
//           alert('Error in signing in user!');
//         });
//       }

//       $scope.$on('devise:unauthorized', function(event, xhr, deferred) {
//     deferred.reject(xhr);
// });



//    var config = {
//             headers: {
//                 'X-HTTP-Method-Override': 'POST'
//             }
//         };

       

//         $scope.$on('devise:login', function(event, currentUser) {
//             // after a login, a hard refresh, a new tab
//         });

//         $scope.$on('devise:new-session', function(event, currentUser) {
//             // user logged in by Auth.login({...})
//         });



//     }
//     ]);











// snmmaurya.controller('deviseController', function($scope, Auth, $http) {
//         // Guest user

//         this.credentials = { email: '', password: '' };


//   $scope.$on('devise:unauthorized', function(event, xhr, deferred) {
//     deferred.reject(xhr);
//   });


//   this.signIn = function() {
//         // Code to use 'angular-devise' component
//         Auth.login(this.credentials).then(function(user) {
//           $location.path("/");
//           alert('Successfully signed in user!')
//         }, function(error) {
//           console.info('Error in authenticating user!');
//           alert('Error in signing in user!');
//         });
//       };



//     });

























   snmmaurya.controller('deviseController', function($scope, Auth) {
        var credentials = {
            email: 'administrator@snmmaurya.com',
            password: 'administrator'
        };
        var config = {
            headers: {
                'X-HTTP-Method-Override': 'POST'
            }
        };

        this.signIn = function() {
        Auth.login(credentials, config).then(function(user) {
            console.log("success"+user); // => {id: 1, ect: '...'}
        }, function(error) {
            // Authentication failed...
            console.log("Failed");
        });
      };

        $scope.$on('devise:login', function(event, currentUser) {
            // after a login, a hard refresh, a new tab
        });

        $scope.$on('devise:new-session', function(event, currentUser) {
            // user logged in by Auth.login({...})
        });
    });