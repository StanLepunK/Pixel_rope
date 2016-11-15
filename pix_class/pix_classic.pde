void pixel_classic() {
	// pixel_basic() ;
  pixel_shape() ;
	// pixel_color() ;
   // pixel_costume_fill_stroke_strokeWeight() ;
   
   //pixel_choice_primitive_2D_shape() ;
   //pixel_primitive_2D_shape_angle() ; 
 //  pixel_primitive_2D_shape_direction() ;
  //pixel_change_color() ;
   //pixel_change_color_range() ;
}


// method
void pixel_choice_primitive_2D_shape() {
  Vec2 pos = Vec2(width/2, height/2) ;
   Vec2 size = Vec2(40) ;
   Vec4 color_shape = Vec4(random(g.colorModeX), g.colorModeY,g.colorModeZ, g.colorModeA) ;
   
   // list of String arg : "POINT", "DISC", "TRI", "SQUARE", "PENTA", "HEXA" by default the shape is DISC / ellipse in Processing
   /**
   WHEN you use the shape "POINT" you must declare this one in the CONSTRUCTOR,
   if you don't do that the SHAPE is  NOT USE immadiatly in the method aspect, because this one is before in order of rendering
   */
   Pixel p = new Pixel(pos, size, color_shape, "PENTA") ;

   p.aspect(color_shape, 1) ;
     /**
   WHEN you use the shape "POINT" you must declare this one in the CONSTRUCTOR,
   if you don't do that the SHAPE is  NOT USE immadiatly in the method aspect, because this one is before in order of rendering
   */
  //  p.costume() ;
   p.costume("PENTA") ; // you can change the shape here too, but if you have choice point in the CONSTRUCTOR, maybe the thickness can be the size and not your thickness aspect ?
}

void pixel_primitive_2D_shape_angle() {
  Vec2 pos = Vec2(width/2, height/2) ;
   Vec2 size = Vec2(mouseX) ;
   Vec4 color_shape = Vec4(sin(frameCount *.01) *g.colorModeX, g.colorModeY,g.colorModeZ, g.colorModeA) ;
   Pixel p = new Pixel(pos, size, color_shape, "PENTA") ;

   p.aspect(Vec4(0), color_shape, 1) ;
   float new_angle =  sin(frameCount *.01) *TAU ;
   p.angle(new_angle) ;
   p.costume() ;
 }

 void pixel_primitive_2D_shape_direction() {
  Vec2 pos = Vec2(width/2, height/2) ;
   Vec2 size = Vec2(mouseX) ;
   Vec4 color_shape = Vec4(sin(frameCount *.01) *g.colorModeX, g.colorModeY,g.colorModeZ, g.colorModeA) ;
   Pixel p = new Pixel(pos, size, color_shape, "PENTA") ;

   p.aspect(Vec4(0), color_shape, 1) ;
   float dir_x = sin(frameCount *.1) ;
   float dir_y = cos(frameCount *.05) ;
   float dir_z = sin(frameCount *.01) ;
   p.direction(new Vec3(dir_x,dir_y,dir_z)) ;
   p.costume() ;
 }





void pixel_change_color() {
   for (int i = 0 ; i < width ; i++) {
    float pos_y = random(height) ;
    Vec3 pos = Vec3(i, pos_y,0) ;
    Vec3 size = Vec3(pos_y *.03) ;
    Vec4 color_shape = Vec4(100, 100,100, 100) ;
    Pixel p = new Pixel(pos, size, color_shape, "POINT") ;
   // Pixel p = new Pixel(pos, size, color_shape) ;
    /**
    Problem we must change only one time the color because the algorithm start from the original color
    */
   // change_all_components_of_color(p) ;
    
   change_specific_component_of_color(p) ;
    
    // p.costume() ;
    p.costume("POINT") ; // here you can change the costume after build your class, the costume by default is DISC > Ellipse Processing
    // p.costume("TRI") ;
  }
}
// local method
void change_all_components_of_color(Pixel p) {
  p.aspect(color(350,100,100,100)) ;
}
void change_specific_component_of_color(Pixel p) {
  p.change_hue(abs(int(sin(frameCount *.001)*360)), 100, true) ;
    p.change_alpha(abs(int(sin(frameCount *.01)*100)), 100, true) ;
    p.aspect(true) ; // here we ask to apply the new color
}






void pixel_change_color_range() {
   for (int i = 0 ; i < width ; i++) {
    float pos_y = random(height) ;
    Vec3 pos = Vec3(i, pos_y,0) ;
    Vec3 size = Vec3(pos_y *.03) ;
    Vec4 color_shape = Vec4(random(g.colorModeX), random(g.colorModeY),random(g.colorModeZ), 100) ;
    Pixel p = new Pixel(pos, size, color_shape) ;
    /**
    Problem we must change only one time the color because the algorithm start from the original color,
    So if you want use the new color, you must ask that by a boolean
    */
    boolean ask_to_use_new_color = true ;
    p.change_hue(350, 180,360, ask_to_use_new_color) ; // method(int new_color, int start, int end, boolean question) ;
    p.change_hue(120,  0,180, ask_to_use_new_color) ;
    p.change_saturation(100, 0,100, ask_to_use_new_color) ;
    p.change_brightness(100, 0,100, ask_to_use_new_color) ;
    
    p.aspect(true) ;
    p.costume("TRI") ;
  }
}


void pixel_color() {
   // Pixel color chack automaticly the colorMode of your sketch.
   Vec2 pos = Vec2(width/2, height/2) ;
   Vec2 size = Vec2(20) ;
   Vec4 color_shape = Vec4(random(g.colorModeX), random(g.colorModeY),random(g.colorModeZ), 100) ;
   Pixel p = new Pixel(pos, size, color_shape) ;
   p.aspect() ;
   p.costume("POINT") ;
}


void pixel_basic() {
  for (int i = 0 ; i < width ; i++) {
    float pos_y = random(height) ;
    Vec3 pos = Vec3(i, pos_y,0) ;
    Vec3 size = Vec3(pos_y *.03) ;
    Pixel p = new Pixel(pos, size) ;
    p.aspect(Vec4(255)) ;
    p.costume("POINT") ;
  }
}

void pixel_shape() {
  Vec3 pos = Vec3(width/2,height/2,0) ;
  Vec3 size = Vec3(300) ;
  String type_shape = "LINE" ;
  Pixel p = new Pixel(pos, size, type_shape) ;
  p.aspect(Vec4(0),Vec4(255), 2) ;
  p.angle(frameCount *.1) ;
  p.costume(type_shape) ;
}


void pixel_costume_fill_stroke_strokeWeight() {
  String costume_name = ("POINT") ; 
  /*
  update the list of available shape when this one is ready.
  Shape available today
  POINT, DISC
  */
  
  for (int i = 0 ; i < width ; i++) {
    float pos_y = random(height) ;
    Vec3 pos = Vec3(i, pos_y,0) ;
    Vec3 size = Vec3(pos_y *.03) ;
    Pixel p = new Pixel(pos, size) ;
    
    Vec3 color_fill = new Vec3("RANDOM",360,100,100);
    Vec4 final_color_fill = new Vec4(color_fill.x,color_fill.y,color_fill.z,100) ;
    Vec3 color_stroke = new Vec3("RANDOM",360,100,100);
    Vec4 final_color_stroke = new Vec4(color_stroke.x,color_stroke.y,color_stroke.z,100) ;
    float thickness = 3 ;
    p.costume(costume_name) ; // the method costume must write before display because the default costume is POINT
    p.aspect(final_color_fill, final_color_stroke, thickness) ;
    
  }
}