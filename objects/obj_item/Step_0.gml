curvPosition += curvSpeed;
if (curvPosition > 1)
	curvPosition = 1;
var _curveStruct = animcurve_get(curve);
var _chennel_x = animcurve_get_channel(_curveStruct, "X");
var _chennel_y = animcurve_get_channel(_curveStruct, "Y");
var _value_x = animcurve_channel_evaluate(_chennel_x, curvPosition);
var _value_y = animcurve_channel_evaluate(_chennel_y, curvPosition);
x = xstart + _value_x;
y = ystart + _value_y;