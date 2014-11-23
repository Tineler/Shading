varying vec3 Normal;
varying vec3 uLightDir;

void main() {
    vec4 color;
    float intensity;
    intensity = dot(Normal, uLightDir);

    if (intensity > 0.8) color = vec4(0.8,0.8,1.0,1.0);
    else if (intensity > 0.6) color = vec4(0.3,0.3,0.6,1.0);
    else if (intensity > 0.3) color = vec4(0.2,0.2,0.4,1.0);
    else color = vec4(0.1,0.1,0.2,1.0);

    gl_FragColor = color;
}