// Credit: https://madebyevan.com/shaders/grid/

varying vec2 vUv;
varying vec3 vPosition;
uniform vec3 color;

void main() {
  float face = step(0.01, vPosition.z * -1.0);
  vec3 mixedColor = mix(vec3(1., 1., 1.), color, face);

  gl_FragColor = vec4(mixedColor, 1.);
}