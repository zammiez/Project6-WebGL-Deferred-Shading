
#version 100
precision highp float;
precision highp int;

#define NUM_GBUFFERS 2

uniform sampler2D u_gbufs[NUM_GBUFFERS];
uniform sampler2D u_depth;

varying vec2 v_uv;

void main() {
    //vec4 gb0 = texture2D(u_gbufs[0], v_uv);
    //vec4 gb1 = texture2D(u_gbufs[1], v_uv);
    vec4 gb2 = texture2D(u_gbufs[1], v_uv);
    //vec4 gb3 = texture2D(u_gbufs[3], v_uv);
    float depth = texture2D(u_depth, v_uv).x;
    // TODO: Extract needed properties from the g-buffers into local variables
	vec3 colmap = gb2.xyz; 
	
    if (depth == 1.0) {
        gl_FragColor = vec4(0, 0, 0, 0); // set alpha to 0
        return;
    }

    // TODO: replace this
	colmap = clamp(colmap,0.0,1.0);
	gl_FragColor = vec4(0.2*colmap,1.0);//vec4(0.1, 0.1, 0.1, 1); 
}
