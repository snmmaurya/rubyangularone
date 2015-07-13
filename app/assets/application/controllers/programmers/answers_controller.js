/*----------------------------------------------------------------------------------------
START Problem controller
-----------------------------------------------------------------------------------------*/
snmmaurya.controller("programmersSolutionsProblemsAnswersController", function($scope, $http, $routeParams, answerFactory, deviseService){
  $scope.createAnswer = function(){
    answerFactory.create({answer: {answer: $scope.answer.htmlContent}}).then(function(response){
      if(response.data.status == "OK")
      {
        $scope.getAnswers();
      }  
    });
  };

  $scope.getAnswers = function(){
    answerFactory.answers().then(function(response){
      $scope.answers = response.data;
      deviseService.currentUser().then(function(response){
        $scope.currentUser = response;
      });
    });
  };

  $scope.getAnswer = function(){
    answerFactory.answer().then(function(response){
      $scope.answer = response.data;      
    });
  };

  $scope.updateAnswer = function (answer) {
    answerFactory.update(answer).then(function(response){
      if(response.data.status == "OK")
      {
        $scope.getAnswers();
      }
    });
  };

  $scope.initialize = function(){
    $scope.getAnswers();
    $scope.answer = {htmlContent: "Contribute/Write you solution here!"};
  };
  $scope.initialize();

  if($routeParams.id != undefined)
  {
    $scope.getAnswer($routeParams.id);
  };
});
/*----------------------------------------------------------------------------------------
END Problem controller
-----------------------------------------------------------------------------------------*/