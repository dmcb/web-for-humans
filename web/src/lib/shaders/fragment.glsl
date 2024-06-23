varying vec2 vUv;
varying vec3 vPosition;
varying vec3 vNormal;
uniform vec3 color;

void main() {
  float face = step(0.5, dot(vNormal, vec3(0, 0, 1.)));
  vec3 adjustedColor = step(0.5, color * dot(vNormal, vec3(100, 100, 0))) * 0.5 + color * 0.5;
  vec3 finalColor = mix(adjustedColor, vec3(1., 1., 1.), face);

  gl_FragColor = vec4(finalColor, 1.);
}