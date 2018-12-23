<%--
  Created by IntelliJ IDEA.
  User: SIZ
  Date: 12/11/2018
  Time: 4:35 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <title>Title</title>
    <script src="/js/jquery-3.3.1.min.js"></script>
    <script src="/js/bootstrap.min.js"></script>

    <link href="/css/bootstrap.min.css" type="text/css" rel="stylesheet">
    <link href="/css/HeaderNav.css" type="text/css" rel="stylesheet">
    <%--雪花背景--%>
    <link href="/snow/css/style.css" type="text/css"   rel="stylesheet">
</head>
<body>
    <div>
        <script src="/snow/js/three.min.js"></script>

        <script id="vertexShader" type="x-shader/x-vertex">
                void main() {
                    gl_Position = vec4( position, 1.0 );
                }
            </script>
        <script id="fragmentShader" type="x-shader/x-fragment">
          uniform vec2 u_resolution;
          uniform vec2 u_mouse;
          uniform float u_time;
          uniform sampler2D u_noise;

          #define PI 3.141592653589793
          #define TAU 6.

          const float multiplier = 25.5;

          const float zoomSpeed = 10.;
          const int layers = 10;

          const int octaves = 5;

          vec2 hash2(vec2 p)
          {
            vec2 o = texture2D( u_noise, (p+0.5)/256.0, -100.0 ).xy;
            return o;
          }

          mat2 rotate2d(float _angle){
              return mat2(cos(_angle),sin(_angle),
                          -sin(_angle),cos(_angle));
          }

          vec3 hsb2rgb( in vec3 c ){
            vec3 rgb = clamp(abs(mod(c.x*6.0+vec3(0.0,4.0,2.0),
                                     6.0)-3.0)-1.0,
                             0.0,
                             1.0 );
            rgb = rgb*rgb*(3.0-2.0*rgb);
            return c.z * mix( vec3(1.0), rgb, c.y);
          }

          float hash(vec2 p)
          {
            float o = texture2D( u_noise, (p+0.5)/256.0, -100.0 ).x;
            return o;
          }
          float noise(vec2 uv) {
            vec2 id = floor(uv);
            vec2 subuv = fract(uv);
            vec2 u = subuv * subuv * (3. - 2. * subuv);
            float a = hash(id);
            float b = hash(id + vec2(1., 0.));
            float c = hash(id + vec2(0., 1.));
            float d = hash(id + vec2(1., 1.));
            return mix(mix(a, b, u.x), mix(c, d, u.x), u.y);
          }
          float fbm(in vec2 uv) {
            float s = .0;
            float m = .0;
            float a = .5;
            for(int i = 0; i < octaves; i++) {
              s += a * noise(uv);
              m += a;
              a *= .5;
              uv *= 2.;
            }
            return s / m;
          }

          vec3 domain(vec2 z){
            return vec3(hsb2rgb(vec3(atan(z.y,z.x)/TAU,1.,1.)));
          }
          vec3 colour(vec2 z) {
              return domain(z);
          }

          // The render function is where we render the pattern to be added to the layer
          vec3 render(vec2 uv, float scale, vec3 colour) {
            vec2 id = floor(uv);
            vec2 subuv = fract(uv);
            vec2 rand = hash2(id);
            float bokeh = abs(scale) * 1.;

            float particle = 0.;

            if(length(rand) > 1.3) {
              vec2 pos = subuv-.5;
              float field = length(pos);
              particle = smoothstep(.3, 0., field);
              particle += smoothstep(.4, 0.34 * bokeh, field);
            }
            return vec3(particle*2.);
          }

          vec3 renderLayer(int layer, int layers, vec2 uv, inout float opacity, vec3 colour, float n) {
            vec2 _uv = uv;
            // Scale
            // Generating a scale value between zero and 1 based on a mod of u_time
            // A frequency of 10 dixided by the layer index (10 / layers * layer)
            float scale = mod((u_time + zoomSpeed / float(layers) * float(layer)) / zoomSpeed, -1.);
            uv *= 20.; // The initial scale. Increasing this makes the cells smaller and the "speed" apepar faster
            uv *= scale*scale; // then modifying the overall scale by the generated amount
            // uv *= 1. + ( ( n*.5 ) * ( length(_uv) ) );
            // uv += .5*float(layer);
            uv = rotate2d(u_time / 10.) * uv; // rotarting
            uv += vec2(25. + sin(u_time*.1)) * float(layer); // ofsetting the UV by an arbitrary amount to make the layer appear different

            // render
            vec3 pass = render(uv * multiplier, scale, colour) * .2; // render the pass

             // this is the opacity of the layer fading in from the "bottom"
            opacity = 1. + scale;
            float _opacity = opacity;

            // pass += n * .5 * mix(vec3(0., .5, 1.5), vec3(1., .5, 0.), opacity);

            // This is the opacity of the layer fading out at the top (we want this minimal, hence the smoothstep)
            float endOpacity = smoothstep(0., 0.4, scale * -1.);
            opacity += endOpacity;

            return pass * _opacity * endOpacity;
          }

          void main() {
              vec2 uv = (gl_FragCoord.xy - 0.5 * u_resolution.xy);

              if(u_resolution.y < u_resolution.x) {
                uv /= u_resolution.y;
              } else {
                uv /= u_resolution.x;
              }

              // uv.y += cos(u_time * .1) * .5;
              // uv.x += sin(u_time * .1) * .5;

              // float n = fbm(uv * 3. - 2.);
              float n = fbm((uv + vec2(sin(u_time*.1), u_time*.1)) * 2. - 2.);

              vec3 colour = vec3(0.);
              // colour = n * mix(vec3(0., .5, 1.5), vec3(1., .5, -.1), n);
              colour = n * mix(vec3(0., .5, 1.5), clamp(vec3(1., .5, .25)*2., 0., 1.), n);
              // colour -= n*n*n*n*.4;
              // colour += smoothstep(.8, 2.5, sin(n*n*n*8.))*.4;

              float opacity = 1.;
              float opacity_sum = 1.;

              for(int i = 1; i <= layers; i++) {
                colour += renderLayer(i, layers, uv, opacity, colour, n);
                opacity_sum += opacity;
              }

              colour /= opacity_sum;

              gl_FragColor = vec4(clamp(colour * 20., 0., 1.),1.0);
          }
        </script>
        <div id="container" touch-action="none"></div>
        <script src="snow/js/index.js"></script>
    </div>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-2 column">
        </div>
        <div class="col-md-10 column">
            <div class="row">
                <div class="col-md-4">
                    <div class="thumbnail">
                        <img alt="300x200" src="v3/default4.jpg" />
                        <div class="caption">
                            <h3>
                                Thumbnail label
                            </h3>
                            <p>
                                Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.
                            </p>
                            <p>
                                <a class="btn btn-primary" href="#">Action</a> <a class="btn" href="#">Action</a>
                            </p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="thumbnail">
                        <img alt="300x200" src="v3/default5.jpg" />
                        <div class="caption">
                            <h3>
                                Thumbnail label
                            </h3>
                            <p>
                                Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.
                            </p>
                            <p>
                                <a class="btn btn-primary" href="#">Action</a> <a class="btn" href="#">Action</a>
                            </p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="thumbnail">
                        <img alt="300x200" src="v3/default6.jpg" />
                        <div class="caption">
                            <h3>
                                Thumbnail label
                            </h3>
                            <p>
                                Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.
                            </p>
                            <p>
                                <a class="btn btn-primary" href="#">Action</a> <a class="btn" href="#">Action</a>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

    <div class="container">
        <div class="row clearfix">
            <div class="col-md-12 column">

            </div>
        </div>
    </div>
</body>
</html>




