var ngApp = angular.module('portsTest', []);

// create the controller and inject Angular's $scope
ngApp.controller('mainController', function ($scope) {

    $scope.name = "test";

    var node = document.getElementById("elmComponent");
    var app = Elm.Main.embed(node);

    app.ports.check.subscribe(function (word) {
        var email = getUserEmailFromDB(word);
        app.ports.emailResponse.send(email);
    });

    function getUserEmailFromDB(username) {
        return username + "@example.com";
    }

    // create a message to display in our view
    $scope.$watch('name', function () {
        app.ports.nameResponse.send($scope.name);
        var email = getUserEmailFromDB($scope.name);
        app.ports.emailResponse.send(email);
    });
});