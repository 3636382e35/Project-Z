///@arg curr_val
///@arg target_val
///@arg change_amount
function approach(curr_val, target_val, change_amount){
	if curr_val < target_val {
		curr_val += change_amount;
		curr_val = min(curr_val, target_val);
	} else {
		curr_val -= change_amount;
		curr_val = max(curr_val, target_val);
	}
	return curr_val;
}