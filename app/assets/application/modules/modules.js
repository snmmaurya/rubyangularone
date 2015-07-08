var globalModule = angular.module('globalModule', []);

globalModule.factory('factoryName', function() {/* stuff here */});

globalModule.directive('directiveName', function() {/* stuff here */});

globalModule.service("flashMessage", function(){

  this.message = {message: '', type: ''};

  this.getFlashMessage = function(){
    return this.message;
  };
  this.setFlashMessage = function(message, type='success'){
    this.message = {message: message,  type: type}
  };
});