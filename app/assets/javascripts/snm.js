var NAMESPACE = NAMESPACE || {};
NAMESPACE = (function($, window, document, snmmaurya){
  snmmaurya.snm ={

    navbarActivation: function(url){
      $("ul.navbar-nav li a").on
    },

    textEditor: function(){
      $(".text-etitor").wysihtml5();
    },

  };
  return snmmaurya;
})(jQuery, this, this.document, NAMESPACE);