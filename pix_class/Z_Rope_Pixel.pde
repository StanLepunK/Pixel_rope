/**
CLASS PIX 0.2.0
* @author Stan le Punk
* @see https://github.com/StanLepunK/Pixel
*/

public interface Pixel_Constants {
  static public final String RANDOM = "RANDOM";
}



// MOTHER CLASS
// No contructor in this Class

abstract class Pix implements Pixel_Constants  {
// class Pix implements Pixel_Constants{
  // P3D mode
  Vec3 pos, new_pos ;
  Vec3 size  ;
  // Vec2 angle ;
  float angle = 0 ;
  
  // in cartesian mode
  Vec3 dir = null ;

  Vec3 grid_position ;
  int ID, rank ;
  int costume_ID = 0 ; // 0 is for point
  Vec4 colour, new_colour  ;
  
  // use for the motion
  float field = 1.0 ;


  void init_mother_arg() {
    pos = Vec3(width/2, height/2,0 ) ;
    new_pos = pos.copy() ;
    size = Vec3(1) ;
    // angle = Vec2(0);
    grid_position = pos.copy() ;
    // give a WHITE color to the pixel
    if(g.colorMode == 3 ) colour = Vec4(0, 0, g.colorModeZ, g.colorModeA) ; else colour = Vec4(g.colorModeX, g.colorModeY, g.colorModeZ, g.colorModeA) ;
    new_colour = colour.copy() ;

    int ID = 0 ;
    int rank = -1 ;
  }
  
  
  // RETURN color in Vec4
  // test the color mode to return the good data for each component
  Vec4 int_color_to_vec4_color(int c) {
    Vec4 color_temp = Vec4() ;
    if(g.colorMode == 3 ) color_temp = Vec4(hue(c), saturation(c), brightness(c),alpha(c)) ;
    else color_temp = Vec4(red(c),green(c), blue(c),alpha(c)) ;
    return Vec4(color_temp) ;
  }






  /** 
  SETTING
  */
  // ID
  void change_ID(int ID) {  
    this.ID = ID ; 
  }
  

  // size
  void size(float size_pix) {
    size = Vec3(size_pix) ;
  }
  void size(float size_x, float size_y) {
    size = Vec3(size_x, size_y, 1) ;
  }
  void size(float size_x, float size_y, float size_z) {
    size = Vec3(size_x, size_y, size_z) ;
  }

  void size(Vec2 size_pix) {
    size = Vec3(size_pix.x, size_pix.y, 1) ;
  }
  void size(Vec3 size_pix) {
    size = Vec3(size_pix.x, size_pix.y, size_pix.z) ;
  }

  // angle
  void angle(float angle) {
    this.angle = angle ;
  }

  
  // normal direction
  void direction(Vec3 dir) {
    this.dir = dir ;
  }

  void direction(float x, float y, float z) {
    this.dir = Vec3(x,y,z) ;
  }

  void direction_x(float x) {
    dir.x = x ;
  }

  void direction_y(float y) {
    dir.y = y ;
  }
  void direction_z(float z) {
    dir.z = z ;
  }

  // set costume
  void costume(int costume_ID) {
    this.costume_ID = costume_ID ;
  }







  /**
  ASPECT
  */
  //without effect
  // basic

  /**
  improve methode to check if the stroke must be Stroke or noStroke()
  */
  void aspect() {
    float thickness = 1 ;
    aspect(colour, colour, thickness) ;
  }

  void aspect(boolean new_colour_choice) {
    float thickness = 1 ;
    Vec4 color_choice = Vec4() ;
    if(new_colour_choice) color_choice = new_colour.copy() ; else color_choice = colour.copy() ;
    aspect(color_choice, color_choice, thickness) ;
  }

  void aspect(boolean new_colour_choice, float thickness) {
    Vec4 color_choice = Vec4() ;
    if(new_colour_choice) color_choice = new_colour.copy() ; else color_choice = colour.copy() ;

    if(thickness <= 0) { 
      noStroke() ;
      fill(color_choice.r,color_choice.g,color_choice.b,color_choice.a) ;

    } else { 
      strokeWeight(thickness) ;
      stroke(color_choice.r,color_choice.g,color_choice.b,color_choice.a) ;
      fill(color_choice.r,color_choice.g,color_choice.b,color_choice.a) ;
    }
  }

  void aspect(float thickness) {
    if(thickness <= 0) { 
      noStroke() ;
      fill(colour.r,colour.g,colour.b,colour.a) ;

    } else { 
      strokeWeight(thickness) ;
      stroke(colour.r,colour.g,colour.b,colour.a) ;
      fill(colour.r,colour.g,colour.b,colour.a) ;
    }
  }

  void aspect(int c) {
    float thickness = 1 ;
    Vec4 color_pix = int_color_to_vec4_color(c).copy() ;
    aspect(color_pix, color_pix, thickness) ;
  }

  void aspect(Vec4 color_pix) {
    float thickness = 1 ;
    aspect(color_pix, color_pix, thickness) ;
  }

  void aspect(Vec4 color_pix, float thickness) {
    aspect(color_pix, color_pix, thickness) ;
  }
  
  
  // main method aspect
  void aspect(Vec4 color_fill, Vec4 color_stroke, float thickness) {
    if(color_fill.a <= 0 && color_stroke.a <= 0) {
      noStroke() ; 
      noFill() ;
    } else {
      if (renderer_P3D()) {
        // stroke part
        if(thickness <= 0 || color_stroke.a <= 0 ) noStroke() ; else {
          if(costume_ID == POINT_ROPE) {
            strokeWeight((size.x + size.y + size.z)/3) ; 
          } else strokeWeight(thickness) ;
          stroke(color_stroke.r, color_stroke.g, color_stroke.b, color_stroke.a) ;
        }
        // fill part
        if (color_fill.a <= 0 ) noFill() ; else fill(color_fill.r,color_fill.g, color_fill.b, color_fill.a) ;
      } else {
        // stroke part
        if(thickness <= 0 || color_stroke.a <= 0 ) noStroke() ; 
        else {
          if(costume_ID == POINT_ROPE) { 
            strokeWeight((size.x + size.y + size.z)/3) ;
          } else strokeWeight(thickness) ;
          stroke(color_stroke.r, color_stroke.g, color_stroke.b, color_stroke.a) ;
        }
        // fill part
        if (color_fill.a <= 0 ) noFill() ; else fill(color_fill.r,color_fill.g, color_fill.b, color_fill.a) ;
      }
    }
  }




  //with effect
  /**
  Methode must be refactoring, very weird
  */
  /*
  void aspect(int diam, PVector effectColor) {
    strokeWeight(diam) ;
    stroke(new_colour.r, effectColor.x *new_colour.g, effectColor.y *new_colour.b, effectColor.z *new_colour.a) ;
  }
  */
  // END ASPECT
  /////////////
  
  
  
  
  
  /**
  CHANGE COLOR
  */
  //direct change HSB
  void change_hue(int new_hue, int target_color, boolean use_new_colour) {
    change_hue(new_hue, target_color, target_color +1, use_new_colour) ;
  }
  void change_saturation(int new_sat, int target_color, boolean use_new_colour) {
    change_saturation(new_sat, target_color, target_color +1, use_new_colour) ;
  }
  void change_brightness(int new_bright, int target_color, boolean use_new_colour) {
    change_brightness(new_bright, target_color, target_color +1, use_new_colour) ;
  }
  //direct change RGB
  void change_red(int new_red, int target_color, boolean use_new_colour) {
    change_red(new_red, target_color, target_color +1, use_new_colour) ;
  }
  void change_green(int new_green, int target_color, boolean use_new_colour) {
    change_green(new_green, target_color, target_color +1, use_new_colour) ;
  }
  void change_blue(int new_blue, int target_color, boolean use_new_colour) {
    change_blue(new_blue, target_color, target_color +1, use_new_colour) ;
  }
  //direct change ALPHA
  void change_alpha(int new_alpha, int target_color, boolean use_new_colour) {
    change_alpha(new_alpha, target_color, target_color +1, use_new_colour) ;
  }
  
  // change with range
  // HSB change
  void change_hue(int new_hue, int start, int end, boolean use_new_colour) {
    float hue_temp ; ;
    if(!use_new_colour) hue_temp = change_color_component_from_specific_component("hue", colour.r, new_hue, start, end) ; 
    else hue_temp = change_color_component_from_specific_component("hue", new_colour.r, new_hue, start, end) ;
    new_colour = Vec4(hue_temp, new_colour.y, new_colour.z, new_colour.w)  ;
  }
  void change_saturation(int new_saturation, int start, int end, boolean use_new_colour) {
    float saturation_temp ;
    if(!use_new_colour) saturation_temp = change_color_component_from_specific_component("saturation", colour.g, new_saturation, start, end) ;
    else saturation_temp = change_color_component_from_specific_component("saturation", new_colour.g, new_saturation, start, end) ;
    new_colour = Vec4(new_colour.x, saturation_temp, new_colour.z, new_colour.w)  ;
  }
  void change_brightness(int new_brightness, int start, int end, boolean use_new_colour) {
    float brightness_temp ;
    if(!use_new_colour) brightness_temp = change_color_component_from_specific_component("brightness", colour.b, new_brightness, start, end) ;
    else brightness_temp = change_color_component_from_specific_component("brightness", new_colour.b, new_brightness, start, end) ;
    new_colour = Vec4(new_colour.x, new_colour.y, brightness_temp, new_colour.w)  ;
  }
  // RGB change
  void change_red(int new_red, int start, int end, boolean use_new_colour) {
    float red_temp ;
    if(!use_new_colour) red_temp = change_color_component_from_specific_component("red", colour.r, new_red, start, end) ;
    else red_temp = change_color_component_from_specific_component("red", new_colour.r, new_red, start, end) ;
    new_colour = Vec4(red_temp, new_colour.y, new_colour.z, new_colour.w)  ;
  }
  void change_green(int new_green, int start, int end, boolean use_new_colour) {
    float green_temp ;
    if(!use_new_colour) green_temp = change_color_component_from_specific_component("green", colour.g, new_green, start, end) ;
    else green_temp = change_color_component_from_specific_component("green", new_colour.g, new_green, start, end) ;
    new_colour = Vec4(new_colour.x, green_temp, new_colour.z, new_colour.w)  ;
  }
  void change_blue(int new_blue, int start, int end, boolean use_new_colour) {
    float blue_temp ;
    if(!use_new_colour) blue_temp = change_color_component_from_specific_component("blue", colour.b, new_blue, start, end) ;
    else blue_temp = change_color_component_from_specific_component("blue", new_colour.b, new_blue, start, end) ;
    new_colour = Vec4(new_colour.x, new_colour.y, blue_temp, new_colour.w)  ;
  }

  // ALPHA change
  void change_alpha(int new_alpha, int start, int end, boolean use_new_colour) {
    float alpha_temp ;
    if(!use_new_colour) alpha_temp = change_color_component_from_specific_component("alpha", colour.a, new_alpha, start, end) ;
    else alpha_temp = change_color_component_from_specific_component("alpha", new_colour.a, new_alpha, start, end) ;
    new_colour = Vec4(new_colour.x, new_colour.y, new_colour.z, alpha_temp)  ;
  }



  // INTERNAL method to change color
  float change_color_component_from_specific_component (String which_component, float original_component, int new_component, int start_range, int end_range) {
    if (start_range < end_range ) {
      if(original_component >= start_range && original_component <= end_range) original_component = new_component ; 
    } else if (start_range > end_range) {
      if( (original_component >= start_range && original_component <= roof(which_component)) || original_component <= end_range) { 
        original_component = new_component ;
      }
    }        
    return original_component ;
  }
  
  //
  float roof(String which_component) {
    float roof = 1 ;
    switch(which_component) {
      case "HUE" : roof = g.colorModeX ; break ; 
      case "SATURATION" : roof = g.colorModeY ; break ; 
      case "BRIGHTNESS" : roof = g.colorModeZ ; break ; 
      case "RED" : roof = g.colorModeX ; break ; 
      case "GREEN" : roof = g.colorModeY ; break ; 
      case "BLUE" :  roof = g.colorModeZ ; break ;
      case "ALPHA" :  roof = g.colorModeA ; break ; 

      case "hue" :  roof = g.colorModeX ; break ; 
      case "saturation" :  roof = g.colorModeY ; break ; 
      case "brightness" :  roof = g.colorModeZ ; break ;  
      case "red" :  roof = g.colorModeX ; break ; 
      case "green" :  roof = g.colorModeY ; break ; 
      case "blue" :  roof = g.colorModeZ ; break ;
      case "alpha" :  roof = g.colorModeA ; break ; 

      case "Hue" :  roof = g.colorModeX ; break ;  
      case "Saturation" :  roof = g.colorModeY ; break ;  
      case "Brightness" :  roof = g.colorModeZ ; break ; 
      case "Red" :  roof = g.colorModeX ; break ; 
      case "Green" :  roof = g.colorModeY ; break ; 
      case "Blue" :  roof = g.colorModeZ ; break ; 
      case "Alpha" :  roof = g.colorModeA ; break ;
    }
    return roof ;
  }
}
// END MOTHER CLASS
//////////////////////

















/**
CHILD CLASS

*/
/**
PIXEL CLOUD

*/
class Pixel_cloud extends Pix {
// class Pixel_cloud extends Pix implements Pixel_Constants {
  int num ;
  float beat_ref = .001 ;
  float beat = .001 ;
  String pattern = "RADIUS" ;
  Vec3 [] point, point_normal ;
  String cloud_2D_or_3D, order_or_Chaos ;
  boolean polar_build = false ;

  Vec3 orientation = Vec3(0,PI/2,0) ; 
  float radius = 1 ;
  




  Pixel_cloud(int num, String cloud_2D_or_3D, String order_or_Chaos) {
    init_mother_arg() ;
    this.num = num ;
    this.cloud_2D_or_3D = cloud_2D_or_3D ;
    this.order_or_Chaos = order_or_Chaos ;
    point = new Vec3[num] ;
    point_normal = new Vec3[num] ;
    init(cloud_2D_or_3D, order_or_Chaos) ;
  }
  
  /*
  Use this constructor if you want build a cartesian sphere with a real coord in the 3D space, you must ask a "POINT" costume
  */
  Pixel_cloud(int num, String cloud_2D_or_3D, String order_or_Chaos, String build) {
    init_mother_arg() ;
    if(build == "POLAR") polar_build = true ; else polar_build = false ;
    this.num = num ;
    this.cloud_2D_or_3D = cloud_2D_or_3D ;
    this.order_or_Chaos = order_or_Chaos ;
    point = new Vec3[num] ;
    point_normal = new Vec3[num] ;
    init(cloud_2D_or_3D, order_or_Chaos) ;
    costume_ID = ELLIPSE_ROPE ;
  }

/**
  // BUILD
  //////////
*/
    // internal method
  void init(String cloud_2D_or_3D, String order_or_Chaos) {
    if(cloud_2D_or_3D == "2D") cartesian_pos_2D(order_or_Chaos) ; else {
      if(polar_build) polar_pos_3D(order_or_Chaos) ;  else cartesian_pos_3D(order_or_Chaos) ; 
    }
  }

  void cartesian_pos_2D(String order_or_chaos) {
    float angle = TAU / num ;
    float tetha  = angle ;
    for(int i = 0 ; i < num ; i++ ) {
      if(order_or_chaos == "ORDER") point_normal[i] = Vec3(cos(tetha),sin(tetha), 0 ) ; else {
        tetha  = random(-PI, PI) ;
        point_normal[i] = Vec3(cos(tetha),sin(tetha), 0 ) ;
      }
      tetha += angle ;
    }
  }

  void cartesian_pos_3D(String order_or_chaos) {
    if(order_or_chaos == "ORDER") {
      // sted and root maybe must be define somewhere ????
      float step = PI * (3 - sqrt(5.)) ; 
      float root = PI ;
      point_normal = list_cartesian_fibonacci_sphere (num, step, root) ;
    } else {
      for(int i = 0 ; i < point.length ; i++ ) {
        float tetha  = random(-PI, PI) ;
        float phi  = random(-TAU, TAU) ;
        point_normal[i] = Vec3(cos(tetha) *cos(phi),
                        cos(tetha) *sin(phi), 
                        sin(tetha) ) ; 
      }
    }
  }


  void polar_pos_3D(String order_or_chaos) {
    float step = TAU ;
    if(order_or_chaos == "ORDER") {
      for (int i = 0; i < point_normal.length ; i++) {
        
        point[i] = Vec3() ;
        point[i].x = distribution_polar_fibonacci_sphere(i, num, step).x ;
        point[i].y = distribution_polar_fibonacci_sphere(i, num, step).y ;
        point[i].z = 0  ;
      }
    } else {
      for (int i = 0; i < point_normal.length ; i++) {
        int which = floor(random(num)) ;
        point[i] = Vec3() ;
        point[i].x = distribution_polar_fibonacci_sphere(which, num, step).x ;
        point[i].y = distribution_polar_fibonacci_sphere(which, num, step).y ;
        point[i].z = 0  ;
      }
    }
  }
  /**
  END BUILD
  */






  // DISPLAY
  //////////////
  
  // external method
  void beat(int n) {
    this.beat = beat_ref *n ;
  }


   // return list of point
  Vec3 [] list() {
    return point ;
  }
  // change orientation
  void orientation(Vec3 orientation) {
    this.orientation = orientation ;
  }

   void orientation(float x, float y, float z) {
    this.orientation = Vec3(x,y,z) ;
  }

  void orientation_x(float orientation_x) {
    this.orientation = Vec3(orientation_x,0,0) ;
  }
  void orientation_y(float orientation_y) {
    this.orientation = Vec3(0,orientation_y,0) ;
  }
  void orientation_z(float orientation_z) {
    this.orientation = Vec3(0,0,orientation_z) ;
  }




  // pattern
  void pattern(String pattern) {
    this.pattern = pattern ;
  }


/**
  // distribution inside
  */
  /*
  void distribution_inside(Vec3 pos, int radius) {
    this.pos = pos ;
    float new_radius = radius  ;
    for (int i = 0 ; i < point.length ; i++) {
      point[i] = point_normal[i].copy() ;
      new_radius = distribution_pattern(radius, pattern) ;
      point[i].mult(new_radius) ;
      point[i].add(pos) ;
    }
  }
  */
  
/*
  void distribution_inside(Vec3 pos, int radius, String pattern_distribution) {
    float new_radius = radius  ;
    for (int i = 0 ; i < point.length ; i++) {
      point[i] = point_normal[i].copy() ;
      new_radius = distribution_pattern(radius, pattern_distribution) ;
      point[i].mult(new_radius) ;
      point[i].add(pos) ;
    }
  }
  */
  /**
  distribution_surface
  */
  void distribution(Vec3 pos, float radius) {
    this.pos = pos ;
    this.radius = radius ;
    if(polar_build)  distribution_surface_polar() ; else distribution_surface_cartesian() ;
  }
  // distribution surface cartesian

  void distribution_surface_polar() {
    if(pattern != "RADIUS") radius = abs(distribution_pattern(radius, pattern)) ;
  }

 // distribution surface cartesian
 void distribution_surface_cartesian() {

    float radius_temp = radius  ;
    for (int i = 0 ; i < point.length ; i++) {
      point[i] = point_normal[i].copy() ;
      if(pattern != "RADIUS") radius_temp = distribution_pattern(radius, pattern) ;
      point[i].mult(radius_temp) ;
      point[i].add(pos) ;
    }
  }
  
  /**
  distribution pattern
  */
  // internal method
  float distribution_pattern(float range, String pattern_distribution) {
    float pos = 1 ;
    float normal_distribution = 1 ;
    
    float root_1 = 0 ;
    float root_2 = 0 ;
    float root_3 = 0 ;
    float root_4 = 0 ;
     if(pattern_distribution.contains("RANDOM")) {
      root_1 = random(1) ;
      if(pattern_distribution.contains("2") || pattern_distribution.contains("3") || pattern_distribution.contains("4")|| pattern_distribution.contains("SPECIAL")) {
        root_2 = random(1) ;
        root_3 = random(1) ;
        root_4 = random(1) ;
      }
    }

    float t = 0 ;
    if(pattern_distribution.contains("SIN") || pattern_distribution.contains("COS")) t = frameCount *beat ;
    float factor_1_2 = 1.2 ;
    float factor_0_5 = .5 ;
    float factor_12_0 = 12. ;
    float factor_10_0 = 10. ;
    
    if(pattern_distribution == "RANDOM") normal_distribution = root_1 ;
    else if(pattern_distribution == "ROOT_RANDOM") normal_distribution = sqrt(root_1) ;
    else if(pattern_distribution == "QUARTER_RANDOM") normal_distribution = 1 -(.25 *root_1) ;
    
    else if(pattern_distribution == "2_RANDOM") normal_distribution = root_1 *root_2 ;

    else if(pattern_distribution == "3_RANDOM") normal_distribution = root_1 *root_2 *root_3 ;

    else if(pattern_distribution == "4_RANDOM") normal_distribution = root_1 *root_2 *root_3 *root_4 ;
    else if(pattern_distribution == "SPECIAL_A_RANDOM") normal_distribution = .25 *( root_1 +root_2 +root_3 +root_4) ;
    else if(pattern_distribution == "SPECIAL_B_RANDOM") {
      float temp = root_1 -root_2 +root_3 -root_4 ;
      if(temp < 0) temp += 4 ;
      normal_distribution = .25 *temp ;
    }

    else if(pattern_distribution == "SIN") normal_distribution = sin(t) ;
    else if(pattern_distribution == "COS") normal_distribution = cos(t) ;
    else if(pattern_distribution == "SIN_TAN_COS") normal_distribution = sin(tan(cos(t) *factor_1_2)) ;
    else if(pattern_distribution == "SIN_TAN") normal_distribution = sin(tan(t)*factor_0_5) ;
    else if(pattern_distribution == "SIN_POW_SIN") normal_distribution = sin(pow(8.,sin(t))) ;
    else if(pattern_distribution == "POW_SIN_PI") normal_distribution = pow(sin((t) *PI), factor_12_0) ;
    else if(pattern_distribution == "SIN_TAN_POW_SIN") normal_distribution = sin(tan(t) *pow(sin(t),factor_10_0)) ;



    pos = range *normal_distribution ;
    return pos ;
  }
  
  
  
  
  
  
  


 



 
  
  
  
  /**
  // COSTUME and display
  // child method
  */
  void show() {
    if (renderer_P3D()) give_points_to_costume_3D() ; else  give_points_to_costume_2D() ;
  }
  
  // local method
  void give_points_to_costume_2D() {
    for(int i  = 0 ; i < point.length ;i++) {
      // method from mother class need pass info arg
      costume_rope(point[i], size, angle, costume_ID) ;
    }
  }
  void give_points_to_costume_3D() {
    if(!polar_build) {
      for(int i  = 0 ; i < point.length ;i++) {
        // method from mother class need pass info arg
        costume_rope(point[i], size, angle, costume_ID) ;
      }
    } else {
      // method from here don't need to pass info about arg
      costume_3D_local_polar() ;
    }
  }
  
  // internal
  void costume_3D_local_polar() {
   start_matrix() ;
   translate(pos) ;
    for(int i = 0 ; i < num ;i++) {
      start_matrix() ;
      /**
      super effect
      float rot = (map(mouseX,0,width,-PI,PI)) ;
      dir_pol[i].y += rot ;
      */
      rotateYZ(Vec2(point[i].x,point[i].y)) ;

      Vec3 pos_primitive = Vec3(radius,0,0) ;
      translate(pos_primitive) ;

      start_matrix() ;
      rotateXYZ(orientation) ;
      Vec3 pos_local_primitive = Vec3() ;
      Vec2 orientation_polar = Vec2() ;
      costume_rope(pos_local_primitive, size, angle, orientation_polar, costume_ID) ;
      stop_matrix() ;
      stop_matrix() ;
    }
   stop_matrix() ;

  }
  /**
  // END COSTUME
  */
}
/**
END CLASS PIXEL CLOUD
*/














/**
Class pixel Basic

*/
class Pixel extends Pix  {
  // CONSTRUCTOR
  
  // PIXEL 2D
  Pixel(Vec2 pos_2D) {
    init_mother_arg() ;
    this.pos = new Vec3(pos_2D.x,pos_2D.y, 0)  ;
  }

  Pixel(Vec2 pos_2D, Vec2 size_2D) {
    init_mother_arg() ;
    this.pos = new Vec3(pos_2D.x,pos_2D.y, 0)  ;
    this.size = new Vec3(size_2D.x,size_2D.y,0) ; ;
  }
  
  // Constructor plus color components
  Pixel(Vec2 pos_2D, Vec4 color_vec) {
    init_mother_arg() ;
    this.pos = new Vec3(pos_2D.x,pos_2D.y, 0)  ;
    colour = Vec4(color_vec) ;
    new_colour = Vec4(colour) ;
    
  }

  Pixel(Vec2 pos_2D, Vec2 size_2D, Vec4 color_vec) {
    init_mother_arg() ;
    this.pos = new Vec3(pos_2D.x,pos_2D.y, 0)  ;
    this.size = new Vec3(size_2D.x,size_2D.y,0) ;
    colour = Vec4(color_vec) ;
    new_colour = Vec4(colour) ;
  }

  // Constructor with costume indication
  Pixel(Vec2 pos_2D, Vec2 size_2D, int costume_ID) {
    init_mother_arg() ;
    this.costume_ID = costume_ID ;
    this.pos = new Vec3(pos_2D.x,pos_2D.y, 0)  ;
    this.size = new Vec3(size_2D.x,size_2D.y,0) ; ;
  }
  
  // Constructor plus color components
  Pixel(Vec2 pos_2D, Vec4 color_vec, int costume_ID) {
    init_mother_arg() ;
    this.costume_ID = costume_ID ;
    this.pos = new Vec3(pos_2D.x,pos_2D.y, 0)  ;
    colour = color_vec.copy() ;
    new_colour = colour.copy() ;
    
  }

  Pixel(Vec2 pos_2D, Vec2 size_2D, Vec4 color_vec, int costume_ID) {
    init_mother_arg() ;
    this.costume_ID = costume_ID ;
    this.pos = new Vec3(pos_2D.x,pos_2D.y, 0)  ;
    this.size = new Vec3(size_2D.x,size_2D.y,0) ;
    colour = color_vec.copy() ;
    new_colour = colour.copy() ;
  }

  // Constructor plus color components
  Pixel(Vec2 pos_2D, int colour_int, int costume_ID) {
    init_mother_arg() ;
    this.costume_ID = costume_ID ;
    this.pos = new Vec3(pos_2D.x,pos_2D.y, 0)  ;
    colour = int_color_to_vec4_color(colour_int) ;
    new_colour = Vec4(colour) ;
  }

  Pixel(Vec2 pos_2D, Vec2 size_2D, int colour_int, int costume_ID) {
    init_mother_arg() ;
    this.costume_ID = costume_ID ;
    this.pos = new Vec3(pos_2D.x,pos_2D.y, 0)  ;
    this.size = new Vec3(size_2D.x,size_2D.y,0) ;
    colour = int_color_to_vec4_color(colour_int) ;
    new_colour = Vec4(colour) ;
  }



  //PIXEL 3D
  Pixel(Vec3 pos_3D) {
    init_mother_arg() ;
    this.pos = pos_3D  ;
  }

  Pixel(Vec3 pos_3D, Vec3 size_3D) {
    init_mother_arg() ;
    this.pos = pos_3D ;
    this.size = size_3D ;
  }
  // constructor plus color component
  Pixel(Vec3 pos_3D,  Vec4 color_vec) {
    init_mother_arg() ;
    this.pos = pos_3D ;
    colour = color_vec.copy() ;
    new_colour = colour.copy() ;
  }
  
  Pixel(Vec3 pos_3D, Vec3 size_3D, Vec4 color_vec) {
    init_mother_arg() ;
    this.pos = pos_3D ;
    this.size = size_3D ;
    colour = color_vec.copy() ;
    new_colour = colour.copy() ;
  }

  // with costume indication
  Pixel(Vec3 pos_3D, Vec3 size_3D, int costume_ID) {
    init_mother_arg() ;
    this.costume_ID = costume_ID ;
    this.pos = pos_3D ;
    this.size = size_3D ;
  }
  // constructor plus color component
  Pixel(Vec3 pos_3D,  Vec4 color_vec, int costume_ID) {
    init_mother_arg() ;
    this.costume_ID = costume_ID ;
    this.pos = pos_3D ;
    colour = color_vec.copy() ;
    new_colour = colour.copy() ;
  }
  
  Pixel(Vec3 pos_3D, Vec3 size_3D, Vec4 color_vec, int costume_ID) {
    init_mother_arg() ;
    this.costume_ID = costume_ID ;
    this.pos = pos_3D ;
    this.size = size_3D ;
    colour = color_vec.copy() ;
    new_colour = colour.copy() ;
  }

  
  //RANK PIXEL CONSTRUCTOR
  Pixel(int rank) {
    init_mother_arg() ;
    this.rank = rank ;
  }
  
  Pixel(int rank, Vec2 grid_position_2D) {
    init_mother_arg() ;
    this.rank = rank ;
    this.grid_position = new Vec3(grid_position_2D.x,grid_position_2D.y,0) ;
  }
  Pixel(int rank, Vec3 grid_position) {
    init_mother_arg() ;
    this.rank = rank ;
    this.grid_position = grid_position ;
  }
  
  // METHOD

  // set summit
  void set_summits(int summits) {
    if(summits == 1) this.costume_ID = POINT_ROPE ;
    else if(summits == 2) this.costume_ID  = LINE_ROPE ;
    else if(summits == 3) this.costume_ID  = TRIANGLE_ROPE ;
    else if(summits == 4) this.costume_ID  = SQUARE_ROPE ;
    else if(summits == 5) this.costume_ID  = PENTAGON_ROPE ;
    else if(summits == 6) this.costume_ID  = HEXAGON_ROPE ;
    else if(summits == 7) this.costume_ID  = HEPTAGON_ROPE ;
    else if(summits == 8) this.costume_ID  = OCTOGON_ROPE ;
    else if(summits == 9) this.costume_ID  = NONAGON_ROPE ;
    else if(summits == 10) this.costume_ID  = DECAGON_ROPE ;
    else if(summits == 11) this.costume_ID  = HENDECAGON_ROPE ;
    else if(summits == 12) this.costume_ID  = DODECAGON_ROPE ;
    else if(summits > 12) this.costume_ID  = ELLIPSE_ROPE ;
  }



  // show
  void show() {
    if (renderer_P3D()) {
      costume_rope(pos, size, angle, dir, costume_ID) ;
    } else {
      costume_rope(pos, size, angle, costume_ID) ;
    }
  }
}
/**
END CLASS PIXEL

*/























/**
PIXEL MOTION 0.0.2
*/
class Pixel_motion extends Pix  {
    /**
    Not sure I must keep the arg field and life
  */
  float field = 1.0 ;
  float life = 1.0 ;

  // CONSTRUCTOR 2D
  Pixel_motion(Vec2 pos_2D, float field, int colour_int) {
    init_mother_arg() ;
    this.pos = Vec3(pos_2D) ;
    this.field = field ;
    colour = int_color_to_vec4_color(colour_int) ;
    new_colour = Vec4(colour) ;
  }

  Pixel_motion(Vec2 pos_2D, float field, Vec4 colour_vec) {
    init_mother_arg() ;
    this.pos = Vec3(pos_2D) ;
    this.field = field ;
    colour = Vec4(colour_vec) ;
    new_colour = Vec4(colour) ;
  }

  Pixel_motion(Vec2 pos_2D, float field) {
    init_mother_arg() ;
    this.pos = Vec3(pos_2D) ;
    this.field = field ;
  }
  
  // CONSTRUCTOR 3D
  Pixel_motion(Vec3 pos, float field, int colour_int) {
    init_mother_arg() ;
    this.pos = Vec3(pos) ;
    this.field = field ;
    colour = int_color_to_vec4_color(colour_int) ;
    new_colour = Vec4(colour) ;
  }

  Pixel_motion(Vec3 pos, float field, Vec4 colour_vec) {
    init_mother_arg() ;
    this.pos = Vec3(pos) ;
    this.field = field ;
    colour = Vec4(colour_vec) ;
    new_colour = Vec4(colour) ;
  }

  Pixel_motion(Vec3 pos, float field) {
    init_mother_arg() ;
    this.pos = Vec3(pos) ;
    this.field = field ;
  }


  


  /**
  Motion ink
  */
  void motion_ink_2D() {
    int size_field = 1 ;
    float speed_dry = 0 ;
    motion_ink_2D(size_field, speed_dry) ;
  }

  void motion_ink_2D(float speed_dry) {
    int size_field = 1 ;
    motion_ink_2D(size_field, speed_dry) ;
  }

  void motion_ink_2D(int size_field) {
    float speed_dry = 0 ;
    motion_ink_2D(size_field, speed_dry) ;
  }


  // with external var
  void motion_ink_2D(int size_field, float speed_dry) {
    if (field > 0 ) { 
      if(speed_dry != 0 ) field -= abs(speed_dry) ;
      float rad;
      float angle;
      rad = random(-1,1) *field *size_field;
      angle = random(-1,1) *TAU;
      pos.x += rad * cos(angle);
      pos.y += rad * sin(angle);
    }
  }



  // 3D
  void motion_ink_3D() {
    int size_field = 1 ;
    float speed_dry = 0 ;
    motion_ink_3D(size_field, speed_dry) ;
  }

  void motion_ink_3D(float speed_dry) {
    int size_field = 1 ;
    motion_ink_3D(size_field, speed_dry) ;
  }

  void motion_ink_3D(int size_field) {
    float speed_dry = 0 ;
    motion_ink_3D(size_field, speed_dry) ;
  }

  // with external var
  void motion_ink_3D(int size_field, float speed_dry) {
    if (field > 0 ) { 
      if(speed_dry != 0 ) field -= abs(speed_dry) ;
      float rad;
      float angle;
      rad = random(-1,1) *field *size_field;
      angle = random(-1,1) *TAU;
      pos.x += rad * cos(angle);
      pos.y += rad * sin(angle);
      pos.z += rad * cos(angle);
    }
  }




  


  
  
  
  /**
  This part must be refactoring, is really a confusing way to code
  For example why we use PImage ????
  Why do we use 'wind', can't we use 'motion' instead ????
  
  //UPDATE POSITION with the wind
  void update_position_2D(PVector effectPosition, PImage pic) {
    Vec2 dir_2D = norm_dir("DEG",effectPosition.x) ;
    
    velocity_2D = Vec2 (  1.0 *dir_2D.x *effectPosition.y  + random(-effectPosition.z) ,
                      1.0 *dir_2D.y *effectPosition.y  + random(-effectPosition.z))   ;
    pos_2D.add(wind_2D) ;
    //keep the pixel in the scene
    if (pos_2D.x< 0)          pos_2D.x= pic.width;
    if (pos_2D.x> pic.width)  pos_2D.x=0;
    if (pos_2D.y< 0)          pos_2D.y= pic.height;
    if (pos_2D.y> pic.height) pos_2D.y=0;
  }
  
  
  
  //return position with display size
  Vec2 position_2D(PVector effectPosition, PImage pic) {
    Vec2 dir_2D = norm_dir("DEG",effectPosition.x) ;

    new_pos_2D = pos_2D.copy() ;
    
    direction_2D = Vec2 (  1.0 *dir_2D.x *effectPosition.y  + random(-effectPosition.z, effectPosition.z) ,
                      1.0 *dir_2D.y *effectPosition.y  + random(-effectPosition.z, effectPosition.z))   ;
                  
    new_pos_2D.add(wind_2D) ;
    //keep the pixel in the scene
    if (new_pos_2D.x< 0)          new_pos_2D.x= pic.width;
    if (new_pos_2D.x> pic.width)  new_pos_2D.x=0;
    if (new_pos_2D.y< 0)          new_pos_2D.y= pic.height;
    if (new_pos_2D.y> pic.height) new_pos_2D.y=0;
    
    return new_pos_2D ;
  }
  */
  /**
  End of method who must be refactoring
  */
}