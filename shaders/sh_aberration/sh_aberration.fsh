//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform float u_Distance;

void main()
{
    vec4 Color1 = texture2D( gm_BaseTexture, v_vTexcoord )/3.0;
    vec4 Color2 = texture2D( gm_BaseTexture, v_vTexcoord+0.002*u_Distance )/3.0;
    vec4 Color3 = texture2D( gm_BaseTexture, v_vTexcoord-0.002*u_Distance )/3.0;
    Color1 *= 2.0;
    Color2.g = 0.0;
    Color2.b = 0.0;
    Color3.r = 0.0;
    gl_FragColor = v_vColour * (Color1 + Color2 + Color3);
}

