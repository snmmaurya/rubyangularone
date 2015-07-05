snmmaurya.factory("configurationFactory", function(){
  var factory = {};
  factory.urlPrefix = function(){
    return "/api/v1/";
  }
  factory.fullUrlPrefix = function(url){
    return factory.urlPrefix+""+url;
  }
  return factory;
});