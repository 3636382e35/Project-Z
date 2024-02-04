	/// loopAnimation(obj, startFrame, endFrame)
	/// obj: The object whose animation needs to be looped
	/// startFrame: The starting frame index of the loop
	/// endFrame: The ending frame index of the loop
function loopAnimation(_obj, _startFrame, _endFrame){


	/// Ensure obj exists
	if !instance_exists(_obj) exit;


	if (_endFrame < _startFrame) exit; // If endFrame is less than startFrame, exit the loop

	// Ensure the animation index is within the range
	if _obj.image_index < _startFrame || _obj.image_index > _endFrame {
	    _obj.image_index = _startFrame;
	}
}