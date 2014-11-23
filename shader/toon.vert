uniform vec3 lightDir;
varying vec3 Normal;
varying vec3 uLightDir;

void main() {
    Normal = normalize(normal * normalMatrix);
    uLightDir = normalize(normalMatrix * lightDir);
    gl_Position = projectionMatrix * modelViewMatrix * vec4(position, 1.0);
}