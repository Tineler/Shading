varying vec3 reflection;
varying float lambert;
uniform float mixValue;
uniform samplerCube cube;
uniform vec3 primaryColor;

void main(void)
{
  vec3 baseColor = textureCube(cube, reflection).rgb;

  vec3 diffuse = primaryColor * lambert;

  gl_FragColor = vec4(mix(baseColor, diffuse, mixValue), 1.0);
}