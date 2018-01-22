

void setup() {
  size(600,600, P3D) ;
  
  colorMode(HSB,360,100,100,100) ;
  background(0) ;
}


void draw() {
  background_rope(0,g.colorModeA *.6) ;
  // pixel_classic() ;
  // pixel_cloud_2D() ;
  pixel_cloud_3D() ;
}



/**
 exemple
 */
void pixel_cloud_3D() {
//   cloud_3D_list_point() ;
  // cloud_3D_connector();
  cloud_3D_angle_step();
 //cloud_3D_orientation_angle_pattern_costume();
}




void pixel_classic() {
	pixel_basic() ;
  // pixel_shape() ;
	// pixel_color() ;
  //  pixel_costume_fill_stroke_strokeWeight() ;
   
  // pixel_choice_primitive_2D_shape() ;
   // pixel_primitive_2D_shape_angle() ; 
 // pixel_primitive_2D_shape_direction() ;
  // pixel_change_color() ;
   //pixel_change_color_range() ;
}




Cloud_2D cloud_2D ;
void pixel_cloud_2D() {
  int num = 10 ;
  if(cloud_2D == null ) cloud_2D = new Cloud_2D(num, r.ORDER) ;

  cloud_2D.aspect(Vec4(20,100,100,100), Vec4 (0,0,100,100), 1) ;

  cloud_2D.size(15) ;
  cloud_2D.angle(frameCount *.01);
  cloud_2D.beat(50);
  cloud_2D.pattern("SIN");
  if(mousePressed) cloud_2D.rotation(map(mouseX, 0,width,-PI,PI), true); else cloud_2D.rotation(0.01, false);

  int radius = 175;
  Vec3 pos = Vec3(width/2, height/2,0) ;
  cloud_2D.distribution(pos, radius) ;

  cloud_2D.costume(PENTAGON_ROPE) ;
  cloud_2D.show() ;
}




































