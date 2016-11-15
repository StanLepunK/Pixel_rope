
// Background jan 2016 version 0.3

float MAX_RATIO_DEPTH = 6.9 ;


// BACKGROUND 3D
////////////////

// Background normal
////////////////////
void background_norm_P3D(Vec4 bg) {
  background_norm_P3D(bg.x, bg.y, bg.z, bg.a) ;
}

void background_norm_P3D(Vec3 bg) {
  background_norm_P3D(bg.x, bg.y, bg.z, 1) ;
}

void background_norm_P3D(float c, float a) {
  background_norm_P3D(c, c, c, a) ;
}

void background_norm_P3D(float c) {
  background_norm_P3D(c, c, c, 1) ;
}

void background_norm_P3D(float r,float g, float b) {
  background_norm_P3D(r, g, b, 1) ;
}



void background_norm_P3D(float r_c, float g_c, float b_c, float a_c) {
  float x = map(r_c,0,1, 0, g.colorModeX) ;
  float y = map(g_c,0,1, 0, g.colorModeY) ;
  float z = map(b_c,0,1, 0, g.colorModeZ) ;
  float a = map(a_c,0,1, 0, g.colorModeA) ;
  noStroke() ;
  fill(x, y, z, a) ;
  int canvas_x = width *100 ;
  int canvas_y = height *100 ;
  int pos_x = - canvas_x /2 ;
  int pos_y = - canvas_y /2 ;
  // this problem of depth is not clarify, is must refactoring
  int pos_z = int( -height *MAX_RATIO_DEPTH) ;
  pushMatrix() ;
  translate(0,0,pos_z) ;
  rect(pos_x,pos_y,canvas_x, canvas_y) ;
  popMatrix() ;
}



// BACKGROUND 2D
/////////////////

void background_norm(Vec4 bg) {
  background_norm(bg.x,bg.y,bg.z,bg.a) ;
}


void background_norm(Vec3 bg) {
  background_norm(bg.x,bg.y,bg.z,1) ;
}

void background_norm(float c) {
  background_norm(c,c,c,1) ;
}

void background_norm(float c, float a) {
  background_norm(c,c,c,a) ;
}

void background_norm(float r,float g,float b) {
  background_norm(r,g,b,1) ;
}


void background_norm(float r_c,float g_c,float b_c,float a_c) {
  float x = map(r_c,0,1, 0, g.colorModeX) ;
  float y = map(g_c,0,1, 0, g.colorModeY) ;
  float z = map(b_c,0,1, 0, g.colorModeZ) ;
  float a = map(a_c,0,1, 0, g.colorModeA) ;
  noStroke() ;
  fill(x, y, z, a) ;
  rect(0,0,width, height) ;
}