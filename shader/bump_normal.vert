uniform vec3 lightPosition;
uniform vec3 tangent;

varying vec2 vUv;
varying vec3 toLight;
varying vec3 toCamera;

void main(void)
{
    vec3 binormal = cross(normal, tangent);
    mat3 tbn = mat3(
        vec3(tangent.x, binormal.x, normal.x),
        vec3(tangent.y, binormal.y, normal.y),
        vec3(tangent.z, binormal.z, normal.z)
    );

    toLight = lightPosition - position;
    toLight = normalize(tbn * toLight);

    toCamera = cameraPosition - position;
    toCamera = normalize(tbn * toCamera);

    vUv = uv;
    gl_Position = projectionMatrix * modelViewMatrix * vec4(position, 1.0);
}