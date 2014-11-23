uniform vec3 lightPosition;
uniform vec3 tangent;

varying vec2 vUv;
varying vec3 light;
varying vec3 camera;

void main(void)
{
  vec3 binormal = cross(tangent,normal);
  mat3 tbn = mat3(
    vec3(tangent.x, binormal.x, normal.x),
    vec3(tangent.y, binormal.y, normal.y),
    vec3(tangent.z, binormal.z, normal.z)
  );

  light = position - lightPosition;
  light = normalize(tbn * normal);

   camera = position - cameraPosition;
   camera = normalize(tbn * camera);

  vUv = uv;
  gl_Position = projectionMatrix * modelViewMatrix * vec4(position, 1.0);
}