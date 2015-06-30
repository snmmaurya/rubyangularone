snmmaurya.controller("customerController", function($scope, $http, customerFactory){

  $scope.addCustomer = function(customer){
    customerFactory.setCustomer(customer);
    $scope.reset();

    // $scope.contactForm.name = "";
    // $scope.customerData.email = "";
    // $scope.customerData.contact = "";
    // customerData = {};
    // $scope.initCustomers();
    // alert($scope.customerData.email);
  }

 $scope.reset = function() {
             var original = $scope.contactForm;
             console.log(original)
   // $scope.customerData= angular.copy(original)
   // $scope.customerForm.$setPristine()
   // $scope.customerData.name = '';
   };



  // $scope.reset = function() {
  //       $scope.customerForm.$setPristine();
  //       // $scope.model = '';
  // }

  $scope.initCustomers = function(){
    $scope.customers = customerFactory.getCustomers();
  }

  $scope.initCustomers();
});