/*
* CLOUD 3D exemple
* v 0.0.2
*/
Cloud_3D cloud_3D_angle ;
float angle_ref;
float angle_distribution = 0 ;
void cloud_3D_angle_step() {
  int num = 300 ;
  
  if(mousePressed)angle_distribution = map(mouseX, 0,width,0,TAU);

  if(cloud_3D_angle == null || angle_ref != angle_distribution) {
    angle_ref = angle_distribution;
    // cloud_3D_angle = new Cloud_3D(num, P3D, angle_distribution);
    cloud_3D_angle = new Cloud_3D(num, P3D, r.ORDER, r.CARTESIAN);
    //cloud_3D_angle = new Cloud_3D(num, P3D, r.ORDER, r.POLAR);
  }

  float red_val = abs (sin(frameCount *.01) *50);
  cloud_3D_angle.aspect(Vec4(red_val,100,100,100), Vec4(red_val,100,100,100), 100) ;


  cloud_3D_angle.size(2);
  //cloud_3D_angle.spiral(10);
  // printArray(cloud_3D_angle.list());
  // cloud_3D.orientation_y(map(mouseY,0,height,-PI,PI)) ;
  // cloud_3D_angle.angle(frameCount *.01);
 cloud_3D_angle.beat(8);
  // cloud_3D_angle.behavior("SIN");
  //cloud_3D.behavior("SIN_TAN_POW_SIN");
  // cloud_3D.behavior("POW_SIN_PI");
  cloud_3D_angle.behavior("SIN_POW_SIN");

  int radius = int(width *.3);
  Vec3 pos = Vec3(width/2, height/2,0) ;
  cloud_3D_angle.size(pos);
  cloud_3D_angle.pos(pos);
  cloud_3D_angle.update();

  //cloud_3D_angle.costume(PENTAGON_ROPE) ;
  cloud_3D_angle.costume(POINT_ROPE) ;
  cloud_3D_angle.show() ;
}










  /**
  To use all the costum of the Pixel, unfortunatly you must use the Polar mode :(
  With a special constructor 
  */
Cloud_3D cloud_3D ;
void cloud_3D_orientation_angle_behavior_costume() {
  int num = 200 ;
  if(cloud_3D == null) cloud_3D = new Cloud_3D(num, P3D, r.ORDER, r.POLAR);
  // if(mousePressed) p.polar(true) ; else p.polar(false);
  float red_val = abs ( sin(frameCount *.01) *50) ;
  cloud_3D.aspect(Vec4(red_val,100,100,15), Vec4(0), .1) ;

  if(mousePressed) {
    cloud_3D.rotation_x(map(mouseX, 0,width, -PI, PI), true);
    cloud_3D.rotation_z(map(mouseY, 0,height, -PI, PI), true);
  } else {
    cloud_3D.rotation_y(.01, false);
    cloud_3D.rotation_z(.005, false);
  }

  // cloud_3D.rotation_fx_x(.005, false); // not interesting
  cloud_3D.ring(.01, false);
  // cloud_3D.helmet(.005, false);

  cloud_3D.size(width *abs(sin(frameCount *.01)));
  // cloud_3D.orientation_y(map(mouseY,0,height,-PI,PI)) ;
  // cloud_3D.angle(frameCount *.01);
  cloud_3D.beat(8);
  //cloud_3D.behavior("SIN");
  //cloud_3D.behavior("SIN_TAN_POW_SIN");
  // cloud_3D.behavior("POW_SIN_PI");
  cloud_3D.behavior("SIN_POW_SIN");

  int radius = int(width *.66);
  Vec3 pos = Vec3(width/2, height/2,0);
  cloud_3D.radius(radius);
  cloud_3D.pos(pos);
  cloud_3D.update();

  cloud_3D.costume(PENTAGON_ROPE) ;
  cloud_3D.show() ;
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
  p.size(radius);
  p.pos(pos);
  p.update();

  for(int i = 0 ; i < p.list().length ; i++ ) {
    point(p.list()[i].x,p.list()[i].y,p.list()[i].z) ;
  }
}





void cloud_3D_connector() {
  float dist_min_to_connect = 10.5 ;
  int num = 50 ;
  Cloud_3D p = new Cloud_3D(num, P2D, r.ORDER);

  int radius = 100 ;
  p.behavior("RANDOM") ;
  p.size(radius) ;
  p.pos(Vec3(mouseX,mouseY,0));
  p.update();
  // p.update(Vec3(mouseX,mouseY,0), radius) ;
  for(int i = 0 ; i < p.list().length ; i++ ) {
    if(i > 1) 
      if(p.list()[i].dist(p.list()[i-1]) < dist_min_to_connect) line(p.list()[i].x,p.list()[i].y,p.list()[i].z, p.list()[i-1].x,p.list()[i-1].y,p.list()[i-1].z) ;
  }
}
