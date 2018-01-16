
/**
CLASS PIX 
v 0.2.1
2016-2018
* @author Stan le Punk
* @see https://github.com/StanLepunK/Pixel
*/




// MOTHER CLASS
// No contructor in this Class

abstract class Pix {
//abstract class Pix implements Pixel_Constants  {
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
    pos = Vec3(width/2, height/2,0) ;
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
    if(g.colorMode == 3 ) color_temp = Vec4(hue(c),saturation(c),brightness(c),alpha(c)) ;
    else color_temp = Vec4(red(c),green(c),blue(c),alpha(c)) ;
    return Vec4(color_temp) ;
  }






  /** 
  SETTING
  */
  // ID
  public void set_ID(int ID) {  
    this.ID = ID ; 
  }
  

  // size
  public void size(float size_pix) {
    size = Vec3(size_pix) ;
  }
  public void size(float size_x, float size_y) {
    size = Vec3(size_x, size_y, 1) ;
  }
  public void size(float size_x, float size_y, float size_z) {
    size = Vec3(size_x, size_y, size_z) ;
  }

  public void size(Vec2 size_pix) {
    size = Vec3(size_pix.x, size_pix.y, 1) ;
  }
  public void size(Vec3 size_pix) {
    size = Vec3(size_pix.x, size_pix.y, size_pix.z) ;
  }

  // angle
  public void angle(float angle) {
    this.angle = angle ;
  }

  
  // normal direction
  public void direction(Vec3 dir) {
    this.dir = dir ;
  }

  public void direction(float x, float y, float z) {
    this.dir = Vec3(x,y,z) ;
  }

  public void direction_x(float x) {
    dir.x = x ;
  }

  public void direction_y(float y) {
    dir.y = y ;
  }
  public void direction_z(float z) {
    dir.z = z ;
  }

  // set costume
  public void costume(int costume_ID) {
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
  public void aspect() {
    float thickness = 1 ;
    aspect(colour, colour, thickness) ;
  }

  public void aspect(boolean new_colour_choice) {
    float thickness = 1 ;
    Vec4 color_choice = Vec4() ;
    if(new_colour_choice) color_choice = new_colour.copy() ; else color_choice = colour.copy() ;
    aspect(color_choice, color_choice, thickness) ;
  }

  public void aspect(boolean new_colour_choice, float thickness) {
    Vec4 color_choice = Vec4() ;
    if(new_colour_choice) color_choice = new_colour.copy() ; else color_choice = colour.copy() ;

    if(thickness <= 0) { 
      noStroke() ;
      fill(color_choice) ;

    } else { 
      strokeWeight(thickness) ;
      stroke(color_choice) ;
      fill(color_choice) ;
    }
  }

  public void aspect(float thickness) {
    if(thickness <= 0) { 
      noStroke() ;
      fill(colour) ;

    } else { 
      strokeWeight(thickness) ;
      stroke(colour) ;
      fill(colour) ;
    }
  }

  public void aspect(int c) {
    float thickness = 1 ;
    Vec4 color_pix = int_color_to_vec4_color(c).copy() ;
    aspect(color_pix, color_pix, thickness) ;
  }

  public void aspect(Vec4 color_pix) {
    float thickness = 1 ;
    aspect(color_pix, color_pix, thickness) ;
  }

  public void aspect(Vec4 color_pix, float thickness) {
    aspect(color_pix, color_pix, thickness) ;
  }
  
  
  // main method aspect
  public void aspect(Vec4 color_fill, Vec4 color_stroke, float thickness) {
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
          stroke(color_stroke) ;
        }
        // fill part
        if (color_fill.a <= 0 ) {
          noFill() ; 
        } else {
          fill(color_fill) ;
        }
      } else {
        // stroke part
        if(thickness <= 0 || color_stroke.a <= 0 ) noStroke() ; 
        else {
          if(costume_ID == POINT_ROPE) { 
            strokeWeight((size.x + size.y + size.z)/3) ;
          } else strokeWeight(thickness) ;
          stroke(color_stroke) ;
        }
        // fill part
        if (color_fill.a <= 0 ) {
          noFill() ; 
        } else {
          fill(color_fill) ;
        }
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
  void set_hue(int new_hue, int target_color, boolean use_new_colour) {
    set_hue(new_hue, target_color, target_color +1, use_new_colour) ;
  }
  void set_saturation(int new_sat, int target_color, boolean use_new_colour) {
    set_saturation(new_sat, target_color, target_color +1, use_new_colour) ;
  }
  void set_brightness(int new_bright, int target_color, boolean use_new_colour) {
    set_brightness(new_bright, target_color, target_color +1, use_new_colour) ;
  }
  //direct change RGB
  void set_red(int new_red, int target_color, boolean use_new_colour) {
    set_red(new_red, target_color, target_color +1, use_new_colour) ;
  }
  void set_green(int new_green, int target_color, boolean use_new_colour) {
    set_green(new_green, target_color, target_color +1, use_new_colour) ;
  }
  void set_blue(int new_blue, int target_color, boolean use_new_colour) {
    set_blue(new_blue, target_color, target_color +1, use_new_colour) ;
  }
  //direct change ALPHA
  void set_alpha(int new_alpha, int target_color, boolean use_new_colour) {
    set_alpha(new_alpha, target_color, target_color +1, use_new_colour) ;
  }
  
  // change with range
  // HSB change
  void set_hue(int new_hue, int start, int end, boolean use_new_colour) {
    float hue_temp ; ;
    if(!use_new_colour) hue_temp = set_color_component_from_specific_component("hue", colour.r, new_hue, start, end) ; 
    else hue_temp = set_color_component_from_specific_component("hue", new_colour.r, new_hue, start, end) ;
    new_colour = Vec4(hue_temp, new_colour.y, new_colour.z, new_colour.w)  ;
  }
  void set_saturation(int new_saturation, int start, int end, boolean use_new_colour) {
    float saturation_temp ;
    if(!use_new_colour) saturation_temp = set_color_component_from_specific_component("saturation", colour.g, new_saturation, start, end) ;
    else saturation_temp = set_color_component_from_specific_component("saturation", new_colour.g, new_saturation, start, end) ;
    new_colour = Vec4(new_colour.x, saturation_temp, new_colour.z, new_colour.w)  ;
  }
  void set_brightness(int new_brightness, int start, int end, boolean use_new_colour) {
    float brightness_temp ;
    if(!use_new_colour) brightness_temp = set_color_component_from_specific_component("brightness", colour.b, new_brightness, start, end) ;
    else brightness_temp = set_color_component_from_specific_component("brightness", new_colour.b, new_brightness, start, end) ;
    new_colour = Vec4(new_colour.x, new_colour.y, brightness_temp, new_colour.w)  ;
  }
  // RGB change
  void set_red(int new_red, int start, int end, boolean use_new_colour) {
    float red_temp ;
    if(!use_new_colour) red_temp = set_color_component_from_specific_component("red", colour.r, new_red, start, end) ;
    else red_temp = set_color_component_from_specific_component("red", new_colour.r, new_red, start, end) ;
    new_colour = Vec4(red_temp, new_colour.y, new_colour.z, new_colour.w)  ;
  }
  void set_green(int new_green, int start, int end, boolean use_new_colour) {
    float green_temp ;
    if(!use_new_colour) green_temp = set_color_component_from_specific_component("green", colour.g, new_green, start, end) ;
    else green_temp = set_color_component_from_specific_component("green", new_colour.g, new_green, start, end) ;
    new_colour = Vec4(new_colour.x, green_temp, new_colour.z, new_colour.w)  ;
  }
  void set_blue(int new_blue, int start, int end, boolean use_new_colour) {
    float blue_temp ;
    if(!use_new_colour) blue_temp = set_color_component_from_specific_component("blue", colour.b, new_blue, start, end) ;
    else blue_temp = set_color_component_from_specific_component("blue", new_colour.b, new_blue, start, end) ;
    new_colour = Vec4(new_colour.x, new_colour.y, blue_temp, new_colour.w)  ;
  }

  // ALPHA change
  void set_alpha(int new_alpha, int start, int end, boolean use_new_colour) {
    float alpha_temp ;
    if(!use_new_colour) alpha_temp = set_color_component_from_specific_component("alpha", colour.a, new_alpha, start, end) ;
    else alpha_temp = set_color_component_from_specific_component("alpha", new_colour.a, new_alpha, start, end) ;
    new_colour = Vec4(new_colour.x, new_colour.y, new_colour.z, alpha_temp)  ;
  }



  // INTERNAL method to change color
  float set_color_component_from_specific_component (String which_component, float original_component, int new_component, int start_range, int end_range) {
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
CLOUD
*/
class Cloud extends Pix implements Rope_Constants {
  int num ;
  float beat_ref = .001 ;
  float beat = .001 ;
  String pattern = "RADIUS";
  Vec3 [] coord;
  int distribution;
  String renderer_dimension;
  float radius = 1;
  Vec3 orientation;

  boolean polar_build;


  Cloud(int num, String renderer_dimension) {
    init_mother_arg();
    this.num = num ;
    coord = new Vec3[num];
    choice_renderer_dimension(renderer_dimension);
  }

  protected void init() {
    if(renderer_dimension == P2D) {
      cartesian_pos_2D() ; 
    } else {
      if(polar_build) {
        polar_pos_3D(); 
      } else {
        cartesian_pos_3D(); 
      }
    }
  }
  
  protected void cartesian_pos_2D() {
    cartesian_pos_2D(0);
  }

  
  protected void cartesian_pos_2D(float dist) {
    float angle = TAU / num ;
    float tetha = dist + angle ;
    println("je suis là", tetha, dist,frameCount);
    // tetha  += angle ;
    for(int i = 0 ; i < num ; i++ ) {
      if(distribution == ORDER) {
        coord[i] = Vec3(cos(tetha),sin(tetha), 0 ) ; 
      } else {
        tetha = random(-PI, PI) ;
        coord[i] = Vec3(cos(tetha),sin(tetha), 0 ) ;
      }
      tetha += angle ;
    }
  }

  protected void cartesian_pos_3D() {
    if(distribution == ORDER) {
      // step and root maybe must be define somewhere ????
      float step = PI * (3 - sqrt(5.)) ; 
      float root = PI ;
      coord = list_cartesian_fibonacci_sphere (num, step, root) ;
    } else {
      for(int i = 0 ; i < coord.length ; i++ ) {
        float tetha  = random(-PI, PI) ;
        float phi  = random(-TAU, TAU) ;
        coord[i] = Vec3(cos(tetha) *cos(phi),
                        cos(tetha) *sin(phi), 
                        sin(tetha) ) ; 
      }
    }
  }


  protected void polar_pos_3D() {
    float step = TAU ;
    if(distribution == ORDER) {
      for (int i = 0; i < coord.length ; i++) {      
        coord[i] = Vec3() ;
        coord[i].x = distribution_polar_fibonacci_sphere(i, num, step).x ;
        coord[i].y = distribution_polar_fibonacci_sphere(i, num, step).y ;
        coord[i].z = 0  ;
      }
    } else {
      for (int i = 0; i < coord.length ; i++) {
        int which = floor(random(num)) ;
        coord[i] = Vec3() ;
        coord[i].x = distribution_polar_fibonacci_sphere(which, num, step).x ;
        coord[i].y = distribution_polar_fibonacci_sphere(which, num, step).y ;
        coord[i].z = 0  ;
      }
    }
  }





  protected void choice_renderer_dimension(String dimension) {
    if(dimension == P3D) {
      this.renderer_dimension = P3D ;
    } else {
      this.renderer_dimension = P2D ;
    }
  }


  protected void give_points_to_costume_2D() {
    for(int i  = 0 ; i < coord.length ;i++) {
      costume_rope(coord[i], size, angle, costume_ID) ;
    }
  }

  public void beat(int n) {
    this.beat = beat_ref *n ;
  }

  public Vec3 [] list() {
    return coord;   
  }

  public void pattern(String pattern) {
    this.pattern = pattern ;
  }

  // distribution surface cartesian
  protected void distribution_surface_polar() {
    if(pattern != "RADIUS") {
      radius = abs(distribution_pattern(radius, pattern)) ;
    }
  }

 // distribution surface cartesian
 protected void distribution_surface_cartesian() {
    float radius_temp = radius;

    for (int i = 0 ; i < coord.length ; i++) {
      if(pattern != "RADIUS") {
        radius_temp = distribution_pattern(radius, pattern);
      }
      coord[i].mult(radius_temp) ;
      coord[i].add(pos) ;
    }
  }
  
  /**
  distribution pattern
  */
  // internal method
  protected float distribution_pattern(float range, String pattern_distribution) {
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
}



/**
CLOUD 3D
*/
class Cloud_2D extends Cloud {
 
  public Cloud_2D(int num) {
    super(num,P3D);
    // choice_renderer_dimension(renderer_dimension);
    this.distribution = ORDER;
    orientation = Vec3(0,PI/2,0); 
    init() ;
  }

  public Cloud_2D(int num, int distribution) {
    super(num,P2D);
    this.distribution = distribution ;
    init();
  }
  float dist ;
  public void rotation(float speed) {
    dist += speed ;
    cartesian_pos_2D(dist);
  }



  public void distribution(Vec3 pos, float radius) {
    this.pos.set(pos) ;
    this.radius = radius ;
    distribution_surface_cartesian() ;
  }

  public void show() {
    give_points_to_costume_2D();
  }
}











/**
CLOUD 3D
*/
class Cloud_3D extends Cloud {
 
  public Cloud_3D(int num) {
    super(num,P3D);
    // choice_renderer_dimension(renderer_dimension);
    this.distribution = ORDER;
    orientation = Vec3(0,PI/2,0); 
    init() ;
  }

  /*
  Use this constructor if you want build a cartesian sphere with a real coord in the 3D space, you must ask a "POINT" costume
  */
  public Cloud_3D(int num, String renderer_dimension, int distribution) {
    super(num, renderer_dimension);
    this.distribution = distribution ;
    orientation = Vec3(0,PI/2,0); 
    init();
  }

  public Cloud_3D(int num, String renderer_dimension, int distribution, int type) {
    super(num, renderer_dimension);
    
    if(renderer_dimension == P2D && type == r.POLAR) {
      printErr("class Cloud_3D cannot work good with 2D String renderer_dimension and type int r.POLAR");
    }

    this.distribution = distribution ;
    orientation = Vec3(0,PI/2,0);
    if(type == r.POLAR) {
      polar(true);
    } else {
      polar(false);
    }
    init() ;
  }



  // change orientation
  public void orientation(Vec3 orientation) {
    orientation(orientation.x, orientation.y, orientation.z);
  }

  public void orientation_x(float orientation_x) {
    orientation(orientation.x, 0,0);
  }

  public void orientation_y(float orientation_y) {
    orientation(0, orientation.y,0);
  }

  public void orientation_z(float orientation_z) {
    orientation(0,0,orientation.z);
  }

  public void orientation(float x, float y, float z) {
     if(!polar_build) {
      printErrTempo(180, "void orientation() class Cloud work only with type r.POLAR");
    }
    this.orientation = Vec3(x,y,z) ;
  }





  /**
  * distribution_surface
  */

  public void polar(boolean polar_is) {
    this.polar_build = polar_is;
  }

  public void distribution(Vec3 pos, float radius) {
    this.pos.set(pos) ;
    this.radius = radius ;
    if(polar_build) {
      distribution_surface_polar() ; 
    } else {
      distribution_surface_cartesian() ;
    }
  }


  /**
  * Show
  */
  public void show() {
    if (renderer_P3D() && renderer_dimension == P3D) {
      give_points_to_costume_3D(); 
    } else {
      give_points_to_costume_2D();
    }
  }

  protected void give_points_to_costume_3D() {
    if(!polar_build) {
      for(int i  = 0 ; i < coord.length ;i++) {
        // method from mother class need pass info arg
        costume_rope(coord[i], size, angle, costume_ID) ;
      }
    } else {
      // method from here don't need to pass info about arg
      costume_3D_polar() ;
    }
  }
  
  // internal
  protected void costume_3D_polar() {
   start_matrix() ;
   translate(pos) ;
    for(int i = 0 ; i < num ;i++) {
      start_matrix() ;
      /**
      super effect
      float rot = (map(mouseX,0,width,-PI,PI)) ;
      dir_pol[i].y += rot ;
      */
      rotateYZ(Vec2(coord[i].x,coord[i].y)) ;

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
}



















/**
Class pixel Basic
v 0.0.2
*/
class Pixel extends Pix  {
  // CONSTRUCTOR
  
  // PIXEL 2D
  public Pixel(Vec2 pos_2D) {
    init_mother_arg() ;
    this.pos = new Vec3(pos_2D.x,pos_2D.y, 0)  ;
  }

  public Pixel(Vec2 pos_2D, Vec2 size_2D) {
    init_mother_arg() ;
    this.pos = new Vec3(pos_2D.x,pos_2D.y, 0)  ;
    this.size = new Vec3(size_2D.x,size_2D.y,0) ; ;
  }
  
  // Constructor plus color components
  public Pixel(Vec2 pos_2D, Vec4 color_vec) {
    init_mother_arg() ;
    this.pos = new Vec3(pos_2D.x,pos_2D.y, 0)  ;
    colour = Vec4(color_vec) ;
    new_colour = Vec4(colour) ;
    
  }

  public Pixel(Vec2 pos_2D, Vec2 size_2D, Vec4 color_vec) {
    init_mother_arg() ;
    this.pos = new Vec3(pos_2D.x,pos_2D.y, 0)  ;
    this.size = new Vec3(size_2D.x,size_2D.y,0) ;
    colour = Vec4(color_vec) ;
    new_colour = Vec4(colour) ;
  }

  // Constructor with costume indication
  public Pixel(Vec2 pos_2D, Vec2 size_2D, int costume_ID) {
    init_mother_arg() ;
    this.costume_ID = costume_ID ;
    this.pos = new Vec3(pos_2D.x,pos_2D.y, 0)  ;
    this.size = new Vec3(size_2D.x,size_2D.y,0) ; ;
  }
  
  // Constructor plus color components
  public Pixel(Vec2 pos_2D, Vec4 color_vec, int costume_ID) {
    init_mother_arg() ;
    this.costume_ID = costume_ID ;
    this.pos = new Vec3(pos_2D.x,pos_2D.y, 0)  ;
    colour = color_vec.copy() ;
    new_colour = colour.copy() ;
    
  }

  public Pixel(Vec2 pos_2D, Vec2 size_2D, Vec4 color_vec, int costume_ID) {
    init_mother_arg() ;
    this.costume_ID = costume_ID ;
    this.pos = new Vec3(pos_2D.x,pos_2D.y, 0)  ;
    this.size = new Vec3(size_2D.x,size_2D.y,0) ;
    colour = color_vec.copy() ;
    new_colour = colour.copy() ;
  }

  // Constructor plus color components
  public Pixel(Vec2 pos_2D, int colour_int, int costume_ID) {
    init_mother_arg() ;
    this.costume_ID = costume_ID ;
    this.pos = new Vec3(pos_2D.x,pos_2D.y, 0)  ;
    colour = int_color_to_vec4_color(colour_int) ;
    new_colour = Vec4(colour) ;
  }

  public Pixel(Vec2 pos_2D, Vec2 size_2D, int colour_int, int costume_ID) {
    init_mother_arg() ;
    this.costume_ID = costume_ID ;
    this.pos = new Vec3(pos_2D.x,pos_2D.y, 0)  ;
    this.size = new Vec3(size_2D.x,size_2D.y,0) ;
    colour = int_color_to_vec4_color(colour_int) ;
    new_colour = Vec4(colour) ;
  }



  //PIXEL 3D
  public Pixel(Vec3 pos_3D) {
    init_mother_arg() ;
    this.pos = pos_3D  ;
  }

  public Pixel(Vec3 pos_3D, Vec3 size_3D) {
    init_mother_arg() ;
    this.pos = pos_3D ;
    this.size = size_3D ;
  }
  // constructor plus color component
  public Pixel(Vec3 pos_3D,  Vec4 color_vec) {
    init_mother_arg() ;
    this.pos = pos_3D ;
    colour = color_vec.copy() ;
    new_colour = colour.copy() ;
  }
  
  public Pixel(Vec3 pos_3D, Vec3 size_3D, Vec4 color_vec) {
    init_mother_arg() ;
    this.pos = pos_3D ;
    this.size = size_3D ;
    colour = color_vec.copy() ;
    new_colour = colour.copy() ;
  }

  // with costume indication
  public Pixel(Vec3 pos_3D, Vec3 size_3D, int costume_ID) {
    init_mother_arg() ;
    this.costume_ID = costume_ID ;
    this.pos = pos_3D ;
    this.size = size_3D ;
  }
  // constructor plus color component
  public Pixel(Vec3 pos_3D,  Vec4 color_vec, int costume_ID) {
    init_mother_arg() ;
    this.costume_ID = costume_ID ;
    this.pos = pos_3D ;
    colour = color_vec.copy() ;
    new_colour = colour.copy() ;
  }
  
  public Pixel(Vec3 pos_3D, Vec3 size_3D, Vec4 color_vec, int costume_ID) {
    init_mother_arg() ;
    this.costume_ID = costume_ID ;
    this.pos = pos_3D ;
    this.size = size_3D ;
    colour = color_vec.copy() ;
    new_colour = colour.copy() ;
  }

  
  //RANK PIXEL CONSTRUCTOR
  public Pixel(int rank) {
    init_mother_arg() ;
    this.rank = rank ;
  }
  
  public Pixel(int rank, Vec2 grid_position_2D) {
    init_mother_arg() ;
    this.rank = rank ;
    this.grid_position = new Vec3(grid_position_2D.x,grid_position_2D.y,0) ;
  }
  public Pixel(int rank, Vec3 grid_position) {
    init_mother_arg() ;
    this.rank = rank ;
    this.grid_position = grid_position ;
  }
  
  // METHOD

  // set summit
  private void set_summits(int summits) {
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
  public void show() {
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