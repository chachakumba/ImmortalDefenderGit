shader_type canvas_item;

uniform sampler2D bwtexture;
uniform vec3 color;
uniform float alpha_multiplier = 1;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	vec4 alpha = texture(bwtexture,UV);
	
	COLOR.rgb = color.rgb;
	COLOR.a = alpha.r * alpha.r * alpha_multiplier;
}