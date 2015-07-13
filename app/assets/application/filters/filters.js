snmmaurya.filter('escapeHtml', function () {
  var entityMap = {
      "&": "&amp;",
      "<": "&lt;",
      ">": "&gt;",
      '"': '&quot;',
      "'": '&#39;',
      "/": '&#x2F;'
  };

  return function(str) {
      return String(str).replace(/[&<>"'\/]/g, function (s) {
          return entityMap[s];
      });
  }
});


snmmaurya.filter('prettyHtml', function ($sce) {
  return function(htmlCode) {
    return $sce.trustAsHtml(htmlCode);
  }
});


snmmaurya.filter('limitText', function () {
  return function(data) {
    return data.substring(0,100);
  }
});

