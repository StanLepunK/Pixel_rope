

void setup() {
  size(600,600, P3D) ;
  
  colorMode(HSB,360,100,100,100) ;
  background(0) ;
}


void draw() {
  if(!keyPressed)background_rope(0,g.colorModeA *.05) ;
  // pixel_classic() ;
  // pixel_cloud_2D() ;
 pixel_cloud_3D() ;
}



/**
cloud 2D
*/
Cloud_2D cloud_2D ;
void pixel_cloud_2D() {
  int num = 1000;
  if(cloud_2D == null ) cloud_2D = new Cloud_2D(num, r.ORDER) ;

  
  //cloud_2D.angle_step(map(mouseX,0,width,0,TAU));
  cloud_2D.angle_step(PI/6);
  


  cloud_2D.size(2) ;
  cloud_2D.angle(frameCount *.001);

 cloud_2D.growth(.0001);
 cloud_2D.beat(4);
 cloud_2D.behavior("SIN");
  if(mousePressed) cloud_2D.rotation(map(mouseX, 0,width,-PI,PI), true); else cloud_2D.rotation(0.01, false);

  int radius = height /3;
  Vec3 pos = Vec3(width/2, height/2,0);
  cloud_2D.spiral(4);
  cloud_2D.range(.5, 3.9);
  cloud_2D.update(pos,radius) ;

  // cloud_2D.aspect(Vec4(20,100,100,15), Vec4 (0), 1);
  // cloud_2D.costume(PENTAGON_ROPE) ;
  float red_val = abs (sin(frameCount *.01) *50);
  cloud_2D.aspect(Vec4(0), Vec4 (red_val,100,100,20), .5);
  cloud_2D.costume(POINT_ROPE) ;
  cloud_2D.show() ;

}


/**
cloud 3D
*/
void pixel_cloud_3D() {
//   cloud_3D_list_point() ;
  // cloud_3D_connector();
 //  cloud_3D_angle_step();
 cloud_3D_orientation_angle_behavior_costume();
}



/**
Pixel classic
*/
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







































