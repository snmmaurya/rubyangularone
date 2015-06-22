var NAMESPACE = NAMESPACE || {};
NAMESPACE.problemSearchParams = {keyword: "", per_page: 10};
NAMESPACE.problemInitialKeyword = "";
NAMESPACE.problemKeyPressController = true;

NAMESPACE.answerSearchParams = {keyword: "", per_page: 10};
NAMESPACE.answerInitialKeyword = "";
NAMESPACE.answerKeyPressController = true;

NAMESPACE = (function($, window, document, snmmaurya){
  snmmaurya.solutions ={

  	searchProblemsAjaxRequest: function(){
      $("#problems").html("<div class='text-center'><i class='fa fa-2x global_color fa-refresh fa-spin mine'></i></div>");
      var url = JSON.stringify(NAMESPACE.problemSearchParams).split("\"").join("").split(":").join("=").split(",").join("&");
      url = escape("/programmers/solutions/" + $("#url-params").attr("data-solution-id")+ "/problems/") + "?" + url.substring(1, url.length-1);
      $.ajax({
        url: url,
        type: "Get",
        dataType: "script",
        complete: function(){
        }
      });
    },

    searchProblems: function(){
      $(".problem-filters-container #keyword").on("keydown focus", function(){
        if(NAMESPACE.problemKeyPressController ==  true){
          NAMESPACE.problemInitialKeyword = $(this).val();
        }
        NAMESPACE.problemKeyPressController = false;
      });  
      $(".problem-filters-container #keyword").on("paste keyup", function(){
      	NAMESPACE.problemSearchParams["keyword"] = $(".problem-filters-container #keyword").val();
        if(NAMESPACE.problemInitialKeyword != NAMESPACE.problemSearchParams["keyword"])
        {
      	 NAMESPACE.solutions.searchProblemsAjaxRequest();
        }
        NAMESPACE.problemKeyPressController = true;
      });
      $(".problem-filters-container .solutions_per_page").on("change", function(){
      	NAMESPACE.problemSearchParams["per_page"] = this.value;
      	NAMESPACE.solutions.searchProblemsAjaxRequest();
      });
    }, 




    searchAnswersAjaxRequest: function(){
      $("#answers").html("<div class='text-center'><i class='fa fa-2x global_color fa-refresh fa-spin mine'></i></div>");
      var url = JSON.stringify(NAMESPACE.answerSearchParams).split("\"").join("").split(":").join("=").split(",").join("&");
      url = escape("/programmers/solutions/" + $("#url-params").attr("data-solution-id")+ "/problems/" + $("#url-params").attr("data-problem-id")+ "/answers/") + "?" + url.substring(1, url.length-1);
      $.ajax({
        url: url,
        type: "Get",
        dataType: "script",
        complete: function(){
        }
      });
    },

    searchAnswers: function(){
      $(".answer-search-filter #keyword").on("keydown focus", function(){
        if(NAMESPACE.answerKeyPressController ==  true){
          NAMESPACE.answerInitialKeyword = $(this).val();
        }
        NAMESPACE.answerKeyPressController = false;
      });  
      $(".answer-search-filter #keyword").on("paste keyup", function(){
        NAMESPACE.answerSearchParams["keyword"] = $(".answer-search-filter #keyword").val();
        if(NAMESPACE.answerInitialKeyword != NAMESPACE.answerSearchParams["keyword"])
        {
         NAMESPACE.solutions.searchAnswersAjaxRequest();
        }
        NAMESPACE.answerKeyPressController = true;
      });
      $(".answer-search-filter .answers_per_page").on("change", function(){
        NAMESPACE.answerSearchParams["per_page"] = this.value;
        NAMESPACE.solutions.searchAnswersAjaxRequest();
      });
    },


    textEditor: function(){
      $("#text-etitor").wysihtml5();
    },

    previewContent: function(){
      $("#text-etitor").on("blur", function(){
        $(".preview-content well p").html($(this).val())
        $(".preview-content").fadeIn();
      });
    }

    
  };
  return snmmaurya;
})(jQuery, this, this.document, NAMESPACE);