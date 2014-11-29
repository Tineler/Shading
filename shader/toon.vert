uniform vec3 lightDir;
varying vec3 Normal;
varying vec3 uLightDir;

void main() {
    Normal = normalize(normalMatrix * normal);
    uLightDir = normalize(viewMatrix * vec4(-lightDir, 0.0)).xyz;
    gl_Position = projectionMatrix * modelViewMatrix * vec4(position, 1.0);
}