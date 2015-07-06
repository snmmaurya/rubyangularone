snmmaurya.directive('ngWelcome', function() {
  return {
    restrict: 'AE',
    template: 'Welcome at My Site!'
  }
});


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