angular.module('CalculatorApp', [])
    .controller('CalculatorController', function($scope) {
        $scope.sumaec = function() {
            return $scope.ec1 + $scope.ec2 + $scope.ec3 + $scope.ec4 + $scope.ec5 + $scope.ec6 + $scope.ec7 + $scope.ec8 + $scope.ec9 + $scope.ec10 + $scope.ec11 + $scope.ec12;
        };
		$scope.sumaor = function() {
            return $scope.or1 + $scope.or2 + $scope.or3 + $scope.or4 + $scope.or5 + $scope.or6 + $scope.or7 + $scope.or8 + $scope.or9 + $scope.or10 + $scope.or11 + $scope.or12;
        };
		$scope.sumaca = function() {
            return $scope.ca1 + $scope.ca2 + $scope.ca3 + $scope.ca4 + $scope.ca5 + $scope.ca6 + $scope.ca7 + $scope.ca8 + $scope.ca9 + $scope.ca10 + $scope.ca11 + $scope.ca12;
        };
		$scope.sumaea = function() {
            return $scope.ea1 + $scope.ea2 + $scope.ea3 + $scope.ea4 + $scope.ea5 + $scope.ea6 + $scope.ea7 + $scope.ea8 + $scope.ea9 + $scope.ea10 + $scope.ea11 + $scope.ea12;
        };
		
		$scope.restacaec = function(){
			return ($scope.ca1 + $scope.ca2 + $scope.ca3 + $scope.ca4 + $scope.ca5 + $scope.ca6 + $scope.ca7 + $scope.ca8 + $scope.ca9 + $scope.ca10 + $scope.ca11 + $scope.ca12) - ($scope.ec1 + $scope.ec2 + $scope.ec3 + $scope.ec4 + $scope.ec5 + $scope.ec6 + $scope.ec7 + $scope.ec8 + $scope.ec9 + $scope.ec10 + $scope.ec11 + $scope.ec12);
		};
		
		$scope.restaeaor = function(){
			return ($scope.ea1 + $scope.ea2 + $scope.ea3 + $scope.ea4 + $scope.ea5 + $scope.ea6 + $scope.ea7 + $scope.ea8 + $scope.ea9 + $scope.ea10 + $scope.ea11 + $scope.ea12) - ($scope.or1 + $scope.or2 + $scope.or3 + $scope.or4 + $scope.or5 + $scope.or6 + $scope.or7 + $scope.or8 + $scope.or9 + $scope.or10 + $scope.or11 + $scope.or12);
		};
		
    });