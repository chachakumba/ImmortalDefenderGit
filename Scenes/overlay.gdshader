shader_type canvas_item;

uniform sampler2D sample;

void fragment() {
	vec2 new_uv = (UV + vec2(-0.5))*2.;
	vec4 col = texture(sample,new_uv);
	COLOR.rgb = col.rgb;
	float a_reduction = abs((new_uv.x + new_uv.y) * (new_uv.x + new_uv.y));
	float a_reduction2 = abs(-new_uv.x + new_uv.y);
	//COLOR.a = (a_reduction + a_reduction2) / 4.;
	COLOR.a = 0.;
}
