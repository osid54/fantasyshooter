shader_type canvas_item;
const float seed_variation = 0.0;
varying float elapsed_time;

void vertex() {
	elapsed_time = TIME;
}

float dot2(vec2 x) {
	return dot(x, x);
}

float rand(vec2 x) {
    return fract(cos(mod(dot(x, vec2(13.9898, 8.141)), 3.14)) * 43758.5453);
}

vec2 rand2(vec2 x) {
    return fract(cos(mod(vec2(dot(x, vec2(13.9898, 8.141)),
						      dot(x, vec2(3.4562, 17.398))), vec2(3.14))) * 43758.5453);
}

vec3 rand3(vec2 x) {
    return fract(cos(mod(vec3(dot(x, vec2(13.9898, 8.141)),
							  dot(x, vec2(3.4562, 17.398)),
                              dot(x, vec2(13.254, 5.867))), vec3(3.14))) * 43758.5453);
}

vec3 rgb2hsv(vec3 c) {
	vec4 K = vec4(0.0, -1.0 / 3.0, 2.0 / 3.0, -1.0);
	vec4 p = c.g < c.b ? vec4(c.bg, K.wz) : vec4(c.gb, K.xy);
	vec4 q = c.r < p.x ? vec4(p.xyw, c.r) : vec4(c.r, p.yzx);

	float d = q.x - min(q.w, q.y);
	float e = 1.0e-10;
	return vec3(abs(q.z + (q.w - q.y) / (6.0 * d + e)), d / (q.x + e), q.x);
}

vec3 hsv2rgb(vec3 c) {
	vec4 K = vec4(1.0, 2.0 / 3.0, 1.0 / 3.0, 3.0);
	vec3 p = abs(fract(c.xxx + K.xyz) * 6.0 - K.www);
	return c.z * mix(K.xxx, clamp(p - K.xxx, 0.0, 1.0), c.y);
}

float param_rnd(float minimum, float maximum, float seed) {
	return minimum+(maximum-minimum)*rand(vec2(seed));
}

float param_rndi(float minimum, float maximum, float seed) {
	return floor(param_rnd(minimum, maximum + 1.0, seed));
}float perlin(vec2 uv, vec2 size, int iterations, float persistence, float seed) {
	vec2 seed2 = rand2(vec2(seed, 1.0-seed));
	float rv = 0.0;
	float coef = 1.0;
	float acc = 0.0;
	for (int i = 0; i < iterations; ++i) {
		vec2 step = vec2(1.0)/size;
		vec2 xy = floor(uv*size);
		float f0 = rand(seed2+mod(xy, size));
		float f1 = rand(seed2+mod(xy+vec2(1.0, 0.0), size));
		float f2 = rand(seed2+mod(xy+vec2(0.0, 1.0), size));
		float f3 = rand(seed2+mod(xy+vec2(1.0, 1.0), size));
		vec2 mixval = smoothstep(0.0, 1.0, fract(uv*size));
		rv += coef * mix(mix(f0, f1, mixval.x), mix(f2, f3, mixval.x), mixval.y);
		acc += coef;
		size *= 2.0;
		coef *= persistence;
	}
	
	return rv / acc;
}
vec2 scale(vec2 uv, vec2 center, vec2 scale) {
	uv -= center;
	uv /= scale;
	uv += center;
	return uv;
}const float p_o1532591_cx = 0.000000000;
const float p_o1532591_cy = 0.000000000;
const float p_o1532591_scale_x = 100.000000000;
const float p_o1532591_scale_y = 100.000000000;
const float p_o6008_offset = 0.500000000;
const float p_o1630764_brightness = 0.000000000;
const float p_o1630764_contrast = 0.800000000;
const float p_o1417378_x = 64.000000000;
const float p_o1417378_y = 64.000000000;
const float p_o1417378_c = 16.000000000;
const float p_o1417378_d = 0.000000000;
const float p_o1028155_angle = 0.000000000;
const float p_o1028155_d = 0.030000000;
const float p_o1028155_a = 0.000000000;
const float p_o442279_amount = 0.200000000;
const float p_o442279_eps = 0.100000000;
const float seed_o1400683 = 0.222611755;
const float p_o1331264_brightness = 0.000000000;
const float p_o1331264_contrast = 2.000000000;
const float seed_o515796 = 0.000000000;
const float p_o515796_scale_x = 4.000000000;
const float p_o515796_scale_y = 4.000000000;
const float p_o515796_iterations = 3.000000000;
const float p_o515796_persistence = 0.500000000;
float o442279_input_d(vec2 uv, float _seed_variation_) {
float o515796_0_1_f = perlin(((uv)-vec2((elapsed_time*.01*param_rnd(-5, 5, (seed_o1400683+fract(_seed_variation_))+-0.999990)), (elapsed_time*.01*param_rnd(-5, 5, (seed_o1400683+fract(_seed_variation_))+16.000010)))), vec2(p_o515796_scale_x, p_o515796_scale_y), int(p_o515796_iterations), p_o515796_persistence, (seed_o515796+fract(_seed_variation_)));
vec4 o1331264_0_1_rgba = vec4(clamp(vec4(vec3(o515796_0_1_f), 1.0).rgb*p_o1331264_contrast+vec3(p_o1331264_brightness)+0.5-p_o1331264_contrast*0.5, vec3(0.0), vec3(1.0)), vec4(vec3(o515796_0_1_f), 1.0).a);
vec4 o1400683_0_1_rgba = o1331264_0_1_rgba;

return (dot((o1400683_0_1_rgba).rgb, vec3(1.0))/3.0);
}
vec2 o442279_slope(vec2 uv, float epsilon, float _seed_variation_) {
	return vec2(o442279_input_d(fract(uv+vec2(epsilon, 0.0)), _seed_variation_)-o442279_input_d(fract(uv-vec2(epsilon, 0.0)), _seed_variation_), o442279_input_d(fract(uv+vec2(0.0, epsilon)), _seed_variation_)-o442279_input_d(fract(uv-vec2(0.0, epsilon)), _seed_variation_));
}const float seed_o1295769 = 0.292009175;
const float p_o1295769_scale_x = 16.000000000;
const float p_o1295769_scale_y = 16.000000000;
const float p_o1295769_iterations = 3.000000000;
const float p_o1295769_persistence = 0.500000000;
float o1028155_input_in(vec2 uv, float _seed_variation_) {
vec2 o442279_0_slope = o442279_slope((uv), p_o442279_eps, _seed_variation_);
vec2 o442279_0_warp = o442279_0_slope;float o1295769_0_1_f = perlin(((uv)+p_o442279_amount*o442279_0_warp), vec2(p_o1295769_scale_x, p_o1295769_scale_y), int(p_o1295769_iterations), p_o1295769_persistence, (seed_o1295769+fract(_seed_variation_)));
vec4 o442279_0_1_rgba = vec4(vec3(o1295769_0_1_f), 1.0);

return (dot((o442279_0_1_rgba).rgb, vec3(1.0))/3.0);
}
const float seed_o432052 = 0.981263161;
float o1028155_input_hm(vec2 uv, float _seed_variation_) {
float o515796_0_1_f = perlin(((uv)-vec2((elapsed_time*.01*param_rnd(-5, 5, (seed_o432052+fract(_seed_variation_))+-0.999990)), (elapsed_time*.01*param_rnd(-5, 5, (seed_o432052+fract(_seed_variation_))+16.000010)))), vec2(p_o515796_scale_x, p_o515796_scale_y), int(p_o515796_iterations), p_o515796_persistence, (seed_o515796+fract(_seed_variation_)));
vec4 o1331264_0_1_rgba = vec4(clamp(vec4(vec3(o515796_0_1_f), 1.0).rgb*p_o1331264_contrast+vec3(p_o1331264_brightness)+0.5-p_o1331264_contrast*0.5, vec3(0.0), vec3(1.0)), vec4(vec3(o515796_0_1_f), 1.0).a);
vec4 o432052_0_1_rgba = o1331264_0_1_rgba;

return (dot((o432052_0_1_rgba).rgb, vec3(1.0))/3.0);
}
vec2 o1028155_slope(vec2 uv, float epsilon, float _seed_variation_) {
	float dx = o1028155_input_hm(fract(uv+vec2(epsilon, 0.0)), _seed_variation_)-o1028155_input_hm(fract(uv-vec2(epsilon, 0.0)), _seed_variation_);
	float dy = o1028155_input_hm(fract(uv+vec2(0.0, epsilon)), _seed_variation_)-o1028155_input_hm(fract(uv-vec2(0.0, epsilon)), _seed_variation_);
	return cos(p_o1028155_angle*0.01745329251)*vec2(dx, dy)+sin(p_o1028155_angle*0.01745329251)*vec2(-dy, dx);
}

float o1028155_dilate(vec2 uv, float _seed_variation_) {
	float e = 1.0/256.000000000;
	float v = 0.0;
	for (float x = 0.0; x <= p_o1028155_d; x += e) {
		v = max(v, o1028155_input_in(fract(uv), _seed_variation_)*(1.0-x/p_o1028155_d*p_o1028155_a));
		vec2 delta = o1028155_slope(uv, 0.0001, _seed_variation_);
		uv += e*normalize(delta);
	}
	return v;
}const float p_o6009_repeat = 1.000000000;
const float p_o6009_rotate = 0.000000000;
const float p_o6009_gradient_0_pos = 0.000000000;
const vec4 p_o6009_gradient_0_col = vec4(0.058593750, 0.005035400, 0.005035400, 1.000000000);
const float p_o6009_gradient_1_pos = 0.595820227;
const vec4 p_o6009_gradient_1_col = vec4(0.164062500, 0.036529541, 0.036529541, 1.000000000);
const float p_o6009_gradient_2_pos = 1.000000000;
const vec4 p_o6009_gradient_2_col = vec4(0.273437500, 0.041656494, 0.041656494, 1.000000000);
vec4 o6009_gradient_gradient_fct(float x) {
  if (x < p_o6009_gradient_0_pos) {
    return p_o6009_gradient_0_col;
  } else if (x < p_o6009_gradient_1_pos) {
    return mix(p_o6009_gradient_0_col, p_o6009_gradient_1_col, ((x-p_o6009_gradient_0_pos)/(p_o6009_gradient_1_pos-p_o6009_gradient_0_pos)));
  } else if (x < p_o6009_gradient_2_pos) {
    return mix(p_o6009_gradient_1_col, p_o6009_gradient_2_col, ((x-p_o6009_gradient_1_pos)/(p_o6009_gradient_2_pos-p_o6009_gradient_1_pos)));
  }
  return p_o6009_gradient_2_col;
}

void fragment() {
float _seed_variation_ = seed_variation;
vec2 o1417378_0_uv = floor(((scale((UV), vec2(0.5+p_o1532591_cx, 0.5+p_o1532591_cy), vec2(p_o1532591_scale_x, p_o1532591_scale_y)))*vec2(p_o1417378_x, p_o1417378_y)))+vec2(0.5);
vec3 o1417378_0_dither = fract(vec3(dot(vec2(171.0, 231.0), o1417378_0_uv))/vec3(103.0, 71.0, 97.0));
float o1028155_0_1_f = o1028155_dilate((o1417378_0_uv/vec2(p_o1417378_x, p_o1417378_y)), _seed_variation_);
vec3 o1417378_0_1_rgb = floor(vec3(o1028155_0_1_f)*p_o1417378_c+p_o1417378_d*(o1417378_0_dither-vec3(0.5)))/p_o1417378_c;
vec4 o1630764_0_1_rgba = vec4(clamp(vec4(o1417378_0_1_rgb, 1.0).rgb*p_o1630764_contrast+vec3(p_o1630764_brightness)+0.5-p_o1630764_contrast*0.5, vec3(0.0), vec3(1.0)), vec4(o1417378_0_1_rgb, 1.0).a);
float o6009_0_r = 0.5+(cos(p_o6009_rotate*0.01745329251)*((vec2((dot((o1630764_0_1_rgba).rgb, vec3(1.0))/3.0), p_o6008_offset)).x-0.5)+sin(p_o6009_rotate*0.01745329251)*((vec2((dot((o1630764_0_1_rgba).rgb, vec3(1.0))/3.0), p_o6008_offset)).y-0.5))/(cos(abs(mod(p_o6009_rotate, 90.0)-45.0)*0.01745329251)*1.41421356237);vec4 o6009_0_1_rgba = o6009_gradient_gradient_fct(fract(o6009_0_r*p_o6009_repeat));
vec4 o6008_0_1_rgba = o6009_0_1_rgba;
vec4 o1532591_0_1_rgba = o6008_0_1_rgba;
COLOR = o1532591_0_1_rgba;
}
