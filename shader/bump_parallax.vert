uniform vec3 lightPosition;
uniform vec3 tangent;

varying vec2 vUv;
varying vec3 toLight;
varying vec3 toCamera;

void main(void)
{
    vec3 pos = normalize(modelMatrix * vec4(position, 1.0)).xyz;

    vec3 Normal = normalize(modelMatrix * vec4(normal, 0.0)).xyz;
    vec3 Tangent = normalize(modelMatrix * vec4(tangent, 0.0)).xyz;

    vec3 binormal = cross(Normal, tangent);
    mat3 tbn = mat3(
        vec3(Tangent.x, binormal.x, Normal.x),
        vec3(Tangent.y, binormal.y, Normal.y),
        vec3(Tangent.z, binormal.z, Normal.z)
    );

    toLight = lightPosition - pos;
    toLight = normalize(tbn * toLight);

    toCamera = cameraPosition - pos;
    toCamera = normalize(tbn * toCamera);

    vUv = uv;
    gl_Position = projectionMatrix * modelViewMatrix * vec4(position, 1.0);
}