// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function findNearestDivisorTo100(number){
	var nearest_divisor = 1;
    var nearest_difference = 1000000; // Initialize with a large number

    for (var i = 1; i <= number; i++) {
        var quotient = number / i;
        if (quotient == floor(quotient) && abs(quotient - 100) < nearest_difference) {
            nearest_divisor = i;
            nearest_difference = abs(quotient - 100);
        }
    }

    return nearest_divisor;
}