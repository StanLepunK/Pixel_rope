


// method
void pixel_choice_primitive_2D_shape() {
  vec2 pos = vec2(width/2, height/2) ;
  vec2 size = vec2(40) ;
  vec4 color_shape = vec4(random(g.colorModeX), g.colorModeY,g.colorModeZ, g.colorModeA) ;
   
   /**
   WHEN you use the shape "POINT" you must declare this one in the CONSTRUCTOR,
   if you don't do that the SHAPE is  NOT USE immadiatly in the method aspect, because this one is before in order of rendering
   */
   Pixel p = new Pixel(this,pos,size,color_shape) ;

   p.aspect(color_shape, 1) ;
     /**
   WHEN you use the shape "POINT" you must declare this one in the CONSTRUCTOR,
   if you don't do that the SHAPE is  NOT USE immadiatly in the method aspect, because this one is before in order of rendering
   */
    p.costume(PENTAGON) ;
  //  p.costume(PENTAGON_ROPE) ; // you can change the shape here too, but if you have choice point in the CONSTRUCTOR, maybe the thickness can be the size and not your thickness aspect ?
   p.show() ;
}

void pixel_primitive_2D_shape_angle() {
  vec2 pos = vec2(width/2, height/2) ;
   vec2 size = vec2(mouseX) ;
   vec4 color_shape = vec4(sin(frameCount *.01) *g.colorModeX, g.colorModeY,g.colorModeZ, g.colorModeA) ;
   Pixel p = new Pixel(this,pos, size, color_shape) ;
   p.costume(PENTAGON);
   p.aspect(vec4(0), color_shape, 1) ;
   float new_angle =  sin(frameCount *.01) *TAU ;
   p.costume_angle(new_angle) ;
   p.show() ;
 }

 void pixel_primitive_2D_shape_direction() {
  // Don't work, cartesian direction is a problem 
  vec2 pos = vec2(width/2, height/2) ;
   vec2 size = vec2(mouseX) ;
   vec4 color_shape = vec4(sin(frameCount *.01) *g.colorModeX, g.colorModeY,g.colorModeZ, g.colorModeA) ;
   Pixel p = new Pixel(this,pos, size, color_shape) ;
   p.costume(PENTAGON);

   p.aspect(vec4(0), color_shape, 1) ;
   float dir_x = sin(frameCount *.1) ;
   float dir_y = cos(frameCount *.05) ;
   float dir_z = sin(frameCount *.01) ;
   p.direction(new vec3(dir_x,dir_y,dir_z)) ;
   p.show() ;
 }





void pixel_change_color() {
   for (int i = 0 ; i < width ; i++) {
    float pos_y = random(height) ;
    vec3 pos = vec3(i, pos_y,0) ;
    vec3 size = vec3(pos_y *.03) ;
    vec4 color_shape = vec4(100, 100,100, 100) ;
    Pixel p = new Pixel(this,pos, size, color_shape);
    p.costume(POINT);
   // Pixel p = new Pixel(pos, size, color_shape) ;
    /**
    Problem we must change only one time the color because the algorithm start from the original color
    */
   // change_all_components_of_color(p) ;
    
   change_specific_component_of_color(p) ;
    
    // p.costume() ;
    p.show() ; ; // here you can change the costume after build your class, the costume by default is DISC > Ellipse Processing
    // p.costume("TRI") ;
  }
}
// local method
void change_all_components_of_color(Pixel p) {
  p.aspect(color(350,100,100,100)) ;
}
void change_specific_component_of_color(Pixel p) {
  p.set_hue(abs(int(sin(frameCount *.001)*360)), 100, true) ;
  p.set_alpha(abs(int(sin(frameCount *.01)*100)), 100, true) ;
  p.aspect(true) ; // here we ask to apply the new color
}






void pixel_change_color_range() {
   for (int i = 0 ; i < width ; i++) {
    float pos_y = random(height) ;
    vec3 pos = vec3(i, pos_y,0) ;
    vec3 size = vec3(pos_y *.03) ;
    vec4 color_shape = vec4(random(g.colorModeX), random(g.colorModeY),random(g.colorModeZ), 100) ;
    Pixel p = new Pixel(this, pos, size, color_shape) ;
    /**
    Problem we must change only one time the color because the algorithm start from the original color,
    So if you want use the new color, you must ask that by a boolean
    */
    boolean ask_to_use_new_color = true ;
    p.set_hue(350, 180,360, ask_to_use_new_color) ; // method(int new_color, int start, int end, boolean question) ;
    p.set_hue(120,  0,180, ask_to_use_new_color) ;
    p.set_saturation(100, 0,100, ask_to_use_new_color) ;
    p.set_brightness(100, 0,100, ask_to_use_new_color) ;
    
    p.aspect(true) ;
    p.costume(TRIANGLE) ;
    p.show() ;
  }
}


void pixel_color() {
   // Pixel color chack automaticly the colorMode of your sketch.
   vec2 pos = vec2(width/2, height/2) ;
   vec2 size = vec2(20) ;
   vec4 color_shape = vec4(random(g.colorModeX), random(g.colorModeY),random(g.colorModeZ), 100) ;
   Pixel p = new Pixel(this, pos, size, color_shape) ;
   p.aspect() ;
   p.costume(POINT) ;
   p.show() ;
}


void pixel_basic() {
  for (int i = 0 ; i < width ; i++) {
    float pos_y = random(height) ;
    vec3 pos = vec3(i, pos_y,0) ;
    vec3 size = vec3(pos_y *.03) ;
    Pixel p = new Pixel(this, pos, size) ;
    p.aspect(vec4(255));
    p.costume(POINT);
    p.show() ;
  }
}

void pixel_shape() {
  int costume_ID = POINT; 

  vec3 pos = vec3(width/2,height/2,0) ;
  vec3 size = vec3(300) ;
  Pixel p = new Pixel(this, pos, size) ;
  p.costume(costume_ID);
  p.aspect(vec4(0),vec4(255), 2) ;
  p.costume_angle(frameCount *.1) ;
  p.show() ;
}


void pixel_costume_fill_stroke_strokeWeight() {
  int costume_ID = POINT; 
  /*
  update the list of available shape when this one is ready.
  Shape available today
  POINT, DISC
  */
  
  for (int i = 0 ; i < width ; i++) {
    float pos_y = random(height) ;
    vec3 pos = vec3(i, pos_y,0) ;
    vec3 size = vec3(pos_y *.03) ;
    Pixel p = new Pixel(this, pos, size) ;
    vec3 color_fill = vec3().rand(vec2(0,360),vec2(0,100),vec2(0,100));
    // vec3 color_fill = new vec3("RANDOM",360,100,100);
    vec4 final_color_fill = new vec4(color_fill.x,color_fill.y,color_fill.z,100) ;
    vec3 color_stroke = vec3().rand(vec2(0,360),vec2(0,100),vec2(0,100));
    //vec3 color_stroke = new vec3("RANDOM",360,100,100);
    vec4 final_color_stroke = new vec4(color_stroke.x,color_stroke.y,color_stroke.z,100) ;
    float thickness = 3 ;
    
    p.aspect(final_color_fill, final_color_stroke, thickness) ;
    p.costume(costume_ID) ; // the method costume must write before display because the default costume is POINT
    p.show() ;
    
  }
}