// CLOUD
/////////

  /**
  To use all the costum of the Pixel, unfortunatly you must use the Polar mode :(
  With a special constructor 
  */
  Cloud_3D cloud_3D ;
void cloud_3D_orientation_angle_pattern() {
  int num = 200 ;
  if(cloud_3D == null) cloud_3D = new Cloud_3D(num, P3D, r.CHAOS, r.POLAR) ;
  // if(mousePressed) p.polar(true) ; else p.polar(false);
  cloud_3D.aspect(Vec4(20,100,100,15), Vec4 (0,0,0,0), .1) ;
  cloud_3D.rotation(.01);
  cloud_3D.size(30);
  // cloud_3D.orientation_y(map(mouseY,0,height,-PI,PI)) ;
  cloud_3D.angle(frameCount *.01);
  cloud_3D.beat(8);
  //cloud_3D.pattern("SIN");
  //cloud_3D.pattern("SIN_TAN_POW_SIN");
  // cloud_3D.pattern("POW_SIN_PI");
  cloud_3D.pattern("SIN_POW_SIN");

  int radius = int(width *.66);
  Vec3 pos = Vec3(width/2, height/2,0) ;
  cloud_3D.distribution(pos, radius) ;

  cloud_3D.costume(PENTAGON_ROPE) ;
  cloud_3D.show() ;
}



/**
  To use all the costum of the Pixel, unfortunatly you must use the Polar mode :(
  With a special constructor 
*/
void cloud_3D_orientation_angle() {

  int num = 300 ;
  Cloud_3D p = new Cloud_3D(num, P3D, r.ORDER, r.POLAR) ;
  p.aspect(Vec4(20,100,100,100), Vec4 (0,0,100,100), 1) ;

  p.size(Vec2(5, 400)) ;
  // p.orientation_x(map(mouseY,0,height,-PI,PI)) ;
  p.orientation(map(mouseX,0,width,-PI,PI),map(mouseY,0,height,-PI,PI), 0) ;

  p.angle(frameCount *.01);

  int radius = 175;
  Vec3 pos = Vec3(width/2, height/2,0) ;
  p.distribution(pos, radius) ;
  p.costume(RECT_ROPE) ;
  p.show() ;
}






  /**
  To use all the costum of the Pixel, unfortunatly you must use the Polar mode :(
  With a special constructor 
  */
void cloud_3D_costume() {
  int num = 300 ;
  Cloud_3D p = new Cloud_3D(num, P3D, r.ORDER, r.POLAR) ;
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
  p.costume(RECT_ROPE) ;
  p.show() ;
}







  /**
   here you can choice between "2D" or "3D" give an Circle or Sphere
   and "CHAOS" or "ORDER" that change the distribution around your shape, regular or randomize
   */
void cloud_3D_list_point() {
  int num = 600 ;

  Cloud_3D p = new Cloud_3D(num, P3D, r.CHAOS) ;

  Vec4 col = new Vec4(200, 0,100,100) ;
  p.aspect(col,1) ;
  Vec3 pos = Vec3(width/2,height/2, 0) ;
  int radius = 200 ;
  
  p.distribution(pos, radius) ;

  for(int i = 0 ; i < p.list().length ; i++ ) {
    point(p.list()[i].x,p.list()[i].y,p.list()[i].z) ;
  }
}












void cloud_3D_pattern_random() {
  int num = 600 ;
  Cloud_3D p = new Cloud_3D(num, P3D, r.CHAOS) ;

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
    point(p.list()[i].x,p.list()[i].y,p.list()[i].z) ;
  }
}


void cloud_3D_beat_pattern() {
  int num = 600 ;
  Cloud_3D p = new Cloud_3D(num, P3D, r.ORDER) ;

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
    point(p.list()[i]) ;
  }
}







void cloud_3D_connector(String type, float distance) {
  int num = 50 ;
  Cloud_3D p = new Cloud_3D(num, P2D, r.ORDER);

  int radius = 100 ;
  p.pattern("RANDOM") ;
  p.distribution(Vec3(mouseX,mouseY,0), radius) ;
  for(int i = 0 ; i < p.list().length ; i++ ) {
    if(i > 1) 
      if(p.list()[i].dist(p.list()[i-1]) < distance) line(p.list()[i].x,p.list()[i].y,p.list()[i].z, p.list()[i-1].x,p.list()[i-1].y,p.list()[i-1].z) ;
  }
}
