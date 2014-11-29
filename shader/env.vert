uniform vec3 lightPosition;
varying vec3 reflection;
varying float lambert;

void main(void)
{
  vec3 Normal = normalize(modelMatrix * vec4(normal, 0.0)).xyz;

  vec3 pos = normalize(modelMatrix * vec4(position, 1.0)).xyz;

  vec3 viewDirection = normalize(pos - cameraPosition);
  vec3 lightDir = normalize(pos - lightPosition);
  reflection = reflect(viewDirection, Normal);

  lambert = max(0.0, dot(Normal, lightDir));

  gl_Position = projectionMatrix * modelViewMatrix * vec4(position, 1.0);
}