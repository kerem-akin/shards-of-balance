
 function ScreenShake(_magnitude,_frames) // triggers screenahke effect
{
	with(OCamera) // uses ocamera and its properties
	{
			if (_magnitude > shake_remain) //check magnitude
			{
				shake_magnitude = _magnitude; // sets shake magnitude 
				shake_remain = _magnitude; // sets shake amount
				shake_length = _frames; // sets shake duration
			}
	}
}