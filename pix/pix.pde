

void setup() {
  size(600,600, P3D) ;
  
  colorMode(HSB,360,100,100,100) ;
  background(0) ;
}


void draw() {
  background_rope(0) ;
  // pixel_classic() ;
  pixel_cloud() ;
}



/**
 exemple
 */
void pixel_cloud() {
//   pixel_cloud_list_point() ;

 // pixel_cloud_pattern_random() ;
  // pixel_cloud_beat_pattern() ;
  // pixel_cloud_costume() ;
  //pixel_cloud_orientation_angle() ;
 pixel_cloud_orientation_angle_pattern();
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





































