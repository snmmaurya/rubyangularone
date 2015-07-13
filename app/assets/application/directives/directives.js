/*----------------------------------------------------------------------------------------
Start ngWelcome directive
-----------------------------------------------------------------------------------------*/
snmmaurya.directive('ngWelcome', function() {
  return {
    restrict: 'AE',
    template: 'Welcome at My Site!'
  }
});
/*----------------------------------------------------------------------------------------
END ngWelcome directive
-----------------------------------------------------------------------------------------*/


/*----------------------------------------------------------------------------------------
Start flashMessage directive
-----------------------------------------------------------------------------------------*/
snmmaurya.directive('flashMessage', function ($timeout) {
    return {
      restrict: 'E',
      templateUrl: '/assets/templates/shared/flash_message.html',
      scope: true, /*share scope between flashes directives*/
      link: function (scope) {
        scope.flashes = [];
        scope.$on('flashMessage', function (event, flash) {
          var newLength = scope.flashes.push({type: flash.type, message: flash.message});
          $timeout(function() {
            scope.flashes.splice((newLength-1), 1);
          }, 3000);
        });
      }
    };
  });
/*----------------------------------------------------------------------------------------
END flashMessage directive
-----------------------------------------------------------------------------------------*/


/*----------------------------------------------------------------------------------------
Start snmColor directive
-----------------------------------------------------------------------------------------*/
snmmaurya.directive("snmColor", function() {
  return {
    restrict: 'AE',
    replace: true, //if true core element will be replaced with given template
    template: '<div style="background-color:{{color}}">{{color}}</div>',
    link: function(scope, elem, attrs) {
      elem.bind('click', function() {
        elem.css('background-color', 'white');
        scope.$apply(function() {
          scope.color = "white";
        });
      });
      elem.bind('mouseover', function() {
        elem.css('cursor', 'pointer');
      });
    }
  }
});
/*----------------------------------------------------------------------------------------
END snmColor directive
-----------------------------------------------------------------------------------------*/