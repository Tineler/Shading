uniform vec3 lightPosition;
varying vec3 reflection;
varying float lambert;

void main(void)
{
  vec3 viewDirection = normalize(position - cameraPosition);
  reflection = reflect(viewDirection, normal);

  lambert = max(0.0, dot(normal, lightPosition));

  gl_Position = projectionMatrix * modelViewMatrix * vec4(position, 1.0);
}