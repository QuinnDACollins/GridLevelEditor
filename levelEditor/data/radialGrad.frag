#ifdef GL_ES
precision mediump float;
#endif

uniform float u_time;
uniform vec2 u_resolution;
uniform float velocity;

void main(){
	float pct = 0.0;
	vec2 st = gl_FragCoord.xy/u_resolution;

	vec2 tC = vec2(0.5)-st;
    pct = sqrt(tC.x*tC.x+tC.y*tC.y);
	pct = smoothstep(0.0, 0.5, pct);
	vec3 color = vec3(pct, 1.0, 0.3);
	gl_FragColor = vec4(color, 1.0);
}
