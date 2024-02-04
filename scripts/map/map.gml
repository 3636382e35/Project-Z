///@arg value
///@arg start1
///@arg stop1
///@arg start2
///@arg stop2

function map(value, start1, stop1, start2, stop2) {
    return start2 + (stop2 - start2) * ((value - start1) / (stop1 - start1));
}
