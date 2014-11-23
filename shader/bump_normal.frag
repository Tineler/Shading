uniform sampler2D colorMap;
uniform sampler2D normalMap;
uniform vec3 ambientColor;
uniform vec3 diffuseColor;
uniform vec3 spectColor;
uniform float shininess;

varying vec2 vUv;
varying vec3 light;
varying vec3 camera;

void main(void)
{
    vec3 TextColor = texture2D(colorMap, vUv).rgb;
    vec3 norm = texture2D(normalMap, vUv).rgb;
    norm = 2.0*norm-1.0;

    vec3 halfVector = normalize(light + camera);
    float lambert = max(0.0, dot(norm, light));
    float phong = max(0.0, dot(norm, halfVector));
    float specularPower = pow(phong, shininess);

    vec3 diffuse = diffuseColor*lambert;
    vec3 specular = spectColor*specularPower;

    vec3 color = ambientColor*TextColor + diffuse*TextColor+specular;
    gl_FragColor = vec4(color, 1.0);
}