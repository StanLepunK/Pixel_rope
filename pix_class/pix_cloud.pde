// CLOUD
/////////
void pixel_cloud() {
   // pixel_cloud_list_point() ;

 // pixel_cloud_pattern_random() ;
  //pixel_cloud_beat_pattern() ;
  // pixel_cloud_costume() ;
  // pixel_cloud_orientation_angle() ;
  pixel_cloud_orientation_angle_pattern() ;
}

void pixel_cloud_orientation_angle_pattern() {
  /**
  To use all the costum of the Pixel, unfortunatly you must use the Polar mode :(
  With a special constructor 
  */
  int num = 300 ;
  Pixel_cloud p = new Pixel_cloud(num, "3D", "ORDER", "POLAR") ;
  p.aspect(Vec4(20,100,100,100), Vec4 (0,0,100,100), 1) ;

  p.size(15) ;
  p.orientation_y(map(mouseY,0,height,-PI,PI)) ;
  p.angle(frameCount *.01);
  p.beat(6);
  p.pattern("SIN");

  int radius = 175;
  Vec3 pos = Vec3(width/2, height/2,0) ;
  p.distribution(pos, radius) ;

  p.costume("PENTA") ;
}


void pixel_cloud_orientation_angle() {
  /**
  To use all the costum of the Pixel, unfortunatly you must use the Polar mode :(
  With a special constructor 
  */
  int num = 300 ;
  Pixel_cloud p = new Pixel_cloud(num, "3D", "ORDER", "POLAR") ;
  p.aspect(Vec4(20,100,100,100), Vec4 (0,0,100,100), 1) ;

  p.size(Vec2(5, 400)) ;
  // p.orientation_x(map(mouseY,0,height,-PI,PI)) ;
  p.orientation(map(mouseX,0,width,-PI,PI),map(mouseY,0,height,-PI,PI), 0) ;

  p.angle(frameCount *.01);

  int radius = 175;
  Vec3 pos = Vec3(width/2, height/2,0) ;
  p.distribution(pos, radius) ;
  p.costume("RECT") ;
}







void pixel_cloud_costume() {
  /**
  To use all the costum of the Pixel, unfortunatly you must use the Polar mode :(
  With a special constructor 
  */
  int num = 300 ;
  Pixel_cloud p = new Pixel_cloud(num, "3D", "ORDER", "POLAR") ;
  p.aspect(Vec4(20,100,100,100), Vec4 (0,0,100,100), 1) ;

  p.size(Vec2(5, 300)) ;

  int radius = 175;
  Vec3 pos = Vec3(width/2, height/2,0) ;
  p.distribution(pos, radius) ;
  /*
  by default is "DISC"
  "POINT" "DISC" LINE" "TRI" "SQUARE"; "RECT"; "PENTA"; "HEXA";
  */

  // p.costume() ; // default costume fro POLAR distribution is DISC, for CARTESIAN distribution is POINT
  p.costume("RECT") ;
}








void pixel_cloud_list_point() {
  int num = 600 ;
  /**
   here you can choice between "2D" or "3D" give an Circle or Sphere
   and "CHAOS" or "ORDER" that change the distribution around your shape, regular or randomize
   */
  Pixel_cloud p = new Pixel_cloud(num, "3D", "CHAOS") ;

  Vec4 col = new Vec4(200, 0,100,100) ;
  p.aspect(col,1) ;
  Vec3 pos = Vec3(width/2,height/2, 0) ;
  int radius = 200 ;
  
  p.distribution(pos, radius) ;

  for(int i = 0 ; i < p.list().length ; i++ ) {
    point(p.point[i].x,p.point[i].y,p.point[i].z) ;
  }
}












void pixel_cloud_pattern_random() {
  int num = 600 ;
  Pixel_cloud p = new Pixel_cloud(num, "3D", "CHAOS") ;

  p.aspect() ;
  float radius = 200 ;
  /**
  When you use this pattern, the "ORDER" or "CHAOS" cannot be really effective, but it is !
  List of distribution pattern  "RANDOM"
                                "ROOT_RANDOM" 
                                "QUARTER_RANDOM" 
                                "2_RANDOM" 
                                "3_RANDOM" 
                                "4_RANDOM" 
                                "SPECIAL_A_RANDOM" 
                                "SPECIAL_B_RANDOM" 
  */
  p.pattern("RANDOM");
  p.distribution(Vec3(mouseX,mouseY,0), radius) ;
  for(int i = 0 ; i < p.list().length ; i++ ) {
    point(p.point[i].x,p.point[i].y,p.point[i].z) ;
  }
}


void pixel_cloud_beat_pattern() {
  int num = 600 ;
  Pixel_cloud p = new Pixel_cloud(num, "3D", "ORDER") ;

  p.aspect() ;
  int radius = 200 ;
  /**
  List of distribution pattern  "SIN"
                                "COS"
                                "SIN_TAN_COS"
                                "SIN_TAN"
                                "SIN_POW_SIN"
                                "POW_SIN_PI"
                                "SIN_TAN_POW_SIN"
  */
  // use this method to change the speed
  p.beat(mouseX /5 +1) ;
  p.pattern("SIN") ;
  p.distribution(Vec3(mouseX,mouseY,0), radius) ;
  for(int i = 0 ; i < p.list().length ; i++ ) {
    point(p.point[i].x,p.point[i].y,p.point[i].z) ;
  }
}







void pixel_cloud_connector(String type, float distance) {
  int num = 50 ;
  Pixel_cloud p = new Pixel_cloud(num, "2D", "ORDER");

  int radius = 100 ;
  p.pattern("RANDOM") ;
  p.distribution(Vec3(mouseX,mouseY,0), radius) ;
  for(int i = 0 ; i < p.list().length ; i++ ) {
    if(i > 1) 
      if(p.point[i].dist(p.point[i-1]) < distance) line(p.point[i].x,p.point[i].y,p.point[i].z, p.point[i-1].x,p.point[i-1].y,p.point[i-1].z) ;
  }
}
