/*----------------------------------------------------------------------------------------
Start Services
-----------------------------------------------------------------------------------------*/
snmmaurya.service("mineService", function(){

  this.data = {};

  this.getData = function(){
    return data;
  };
});


app.factory('Scopes', function ($rootScope) {
    var mem = {};
 
    return {
        store: function (key, value) {
            mem[key] = value;
        },
        get: function (key) {
            return mem[key];
        }
    };
});

/*----------------------------------------------------------------------------------------
End Services
-----------------------------------------------------------------------------------------*/