PIXEL_ROPE 0.2.0 – 2016-2018
--
>Class to storage a pixel data, with different info like position, color, alpha...


Information
--
> When you use the color component of the MOTHER class Pix, the colorMode is checked and the color data is adapted.

>By default the shape is POINT, and the argument size is use for the strokeWeight to give the pixel size

>For the moment the argument direction cartesian or polar is not used.


--
Default Arg of the class
--
P3D mode
--
Vec3 pos, new_pos ;

Vec3 size = Vec3(1) ;

Vec3 direction, acceleration, velocity ; 

Vec2 orientation ;

Vec3 grid_position ;

Vec4 color_fill, color_stroke, new_color_fill, new_color_stroke ;

int ID = 0 ;

int rank = -1 ;
int costume_ID = POINT_ROPE ;


Vec4 original_color, new_color   ;



SHAPE available for the PIXEL
--
>see https://github.com/StanLepunK/Costume_rope



CLASS
--




METHODS
--
show
--
pix.show() ; 

set
--
pix.set_costume(int ID) ;

size
--
pix.size(float x) ;

pix.size(float x, float y) ;

pix.size(float x, float y, float y) ;

pix.size(Vec2 xy) ;

pix.size(Vec2 xyz) ;


normal direction
--
>Not used now

pix.direction(Vec3 dir) ;

pix.direction(float x, float y, float z) ;

pix.direction_x(float x) ;

pix.direction_y(float y) ;

pix.direction_z(float z) ;


ASPECT
--
@ aspect define fill, stroke and strokeWeight
> basic
void aspect();
> use the size for the strokeWeight, and the int original color for the fill and the stroke

> advance mode use method who change color component

void aspect(boolean new_or_original_color);
>TRUE you ask to use the new-color if you have change this one before

void aspect(float thickness); 
> use thickness to define the strokeWeight

void aspect(boolean new_or_original_color,float thickness);
> TRUE you ask to use the new-color if you have change this one before + use thickness to define the strokeWeight

void aspect(int color_arg); 
> use the int arg for the fill and the stroke

void aspect(Vec4 color_arg);
> use the vec arg for the fill and the stroke

void aspect(Vec4 color_arg, float thickness);

void aspect(Vec4 color arg_fill, Vec4 color arg_stroke, float thickness);

info : if you don't use the method with the thivkness, the strokeWeight is based on the size of your Pixel






















PIXEL extends Pix
--
Constructor
--
> Costume is DISC like the shape ellipse of Processing by default
> Size is 1
> ID is 0
> Rank -1

The other Arg are not set

Pixel pix = new Pixel (int rank);

Pixel pix = new Pixel (int rank, Vec2 grid_position);

Pixel pix = new Pixel (int rank, Vec3 grid_position);

Pixel pix = new Pixel (Vec2 pos);

Pixel pix = new Pixel (Vec3 pos);

Pixel pix = new Pixel (Vec2 pos, Vec2 size);

Pixel pix = new Pixel (Vec3 pos, Vec3 size);

Pixel pix = new Pixel (Vec2 pos, Vec4 color);

Pixel pix = new Pixel (Vec3 pos, VVec4 color);

Pixel pix = new Pixel (Vec2 pos, Vec2 size, Vec4 color);

Pixel pix = new Pixel (Vec3 pos, Vec3 size, Vec4 color);

with costume
--
Pixel pix = new Pixel (Vec2 pos, Vec2 size, String costume);

Pixel pix = new Pixel (Vec3 pos, Vec3 size, String costume);
Pixel pix = new Pixel (Vec2 pos, Vec4 color, String costume);

Pixel pix = new Pixel (Vec3 pos, VVec4 color, String costume);

Pixel pix = new Pixel (Vec2 pos, Vec2 size, Vec4 color, String costume);

Pixel pix = new Pixel (Vec3 pos, Vec3 size, Vec4 color, String costume);

with summits
Pixel pix = new Pixel (Vec2 pos, Vec2 size, int summits);

Pixel pix = new Pixel (Vec3 pos, Vec3 size, int summits);

Pixel pix = new Pixel (Vec2 pos, Vec4 color, int summits);

Pixel pix = new Pixel (Vec3 pos, VVec4 color, int summits);

Pixel pix = new Pixel (Vec2 pos, Vec2 size, Vec4 color, int summits);

Pixel pix = new Pixel (Vec3 pos, Vec3 size, Vec4 color, int summits);







Change specific color
--
int new_component_color is the new component color for your pix
int target_compoent_color is the component that must be changed
boolean use_new_color indicate if you want change the component from the original color or from a new component color, can be util when you make a lot change on a same pixel.
void set_red (int new_component_color, int target_color_component, boolean use_new_color);

void change_green (int new_component_color, int target_color_component, boolean use_new_color);

void set_blue (int new_component_color, int target_color_component, boolean use_new_color);

void set_hue (int new_component_color, int target_color_component, boolean use_new_color);

void set_saturation	(int new_component_color, int target_color_component, boolean use_new_color);

void set_brightness	(int new_component_color, int target_color_component, boolean use_new_color);

void set_alpha	(int new_component_color, int target_color_component, boolean use_new_color);

Change color in range of color
--
int min_range & int max_range is the target color range must be change by a specific color.
void set_red (int new_component_color, int min_range, int max_range, boolean use_new_color);

void change_green (int new_component_color, int min_range, int max_range, boolean use_new_color);

void set_blue (int new_component_color, int min_range, int max_rang, boolean use_new_color);

void set_hue (int new_component_color, int min_range, int max_range, boolean use_new_color);

void set_saturation	(int new_component_color, int min_range, int max_range, boolean use_new_color);

void set_brightness	(int new_component_color, int min_range, int max_range, boolean use_new_color);

void set_alpha	(int new_component_color, int min_range, int max_range, boolean use_new_color) ;

























Pixcloud
--
this class use a pixel position to make a cloud pixel.

Constructor
--
Pixcloud(int num);
> the render default is P2D, and an r.ORDER distribution whith a r.CARTESIAN build

Pixcloud(int num, String renderer_dimension, int distribution);

Pixcloud(int num, String renderer_dimension, int distribution, int build);


Parameters:
int num : define the numbers of points of this pixel

String renderer_dimension : you can choice P2D or P3D, note you can choice P2D when your are in the P3D processing rendering, but not P3D when you are in P2D rendering.

int distribution: choice between r.CHAOS or r.ORDER

int build : choice between r.POLAR or r.CARTESIAN, with the cartesian distribution you can catch the cloud pixel position, but it's really beautiful rendering !



Method
--
ORIENTATION
--
change the orientation of each facets of the sphere
void orientation_x(float x);

void orientation_y(float y);

void orientation_z(float z);

void orientation(Vec3 orientation);

void orientation(float x, float y, float z);



ANGLE
--
void angle(float angle)

you can call the list of point of your pix_cloud class with list()
@ return Vec3 array
void list()


MISC
must be documented
--
Pattern
--
void pattern(String pattern);

Beat
--
void beat(int n);
>n give the size of the beat

Distribution ???
--

void distribution(Vec3 pos, float radius);

void distribution_surface_polar();

void distribution_surface_cartesian();

float distribution_pattern(float range, String pattern_distribution);

























PIXEL MOTION
--
Constructor
--
> constructor 2D
Pixel_motion(Vec2 pos, float field, int colour_int);

Pixel_motion(Vec2 pos, float field, Vec4 colour_vec);

Pixel_motion(Vec2 pos, float field);

> constructor 3D
Pixel_motion(Vec3 pos, float field, int colour_int);

Pixel_motion(Vec3 pos, float field, Vec4 colour_vec);

Pixel_motion(Vec3 pos, float field);



Method
--
when ink is not dry I image it move on paper... we give to this move a field and a time before to be dry and decame static.
by default the field is 1 pixel, very small and the time to dry is null or "zero" give to the ink a move totally free :)

void motion_ink_2D();

void motion_ink_2D(float speed_dry);

void motion_ink_2D(int size_field);

void motion_ink_2D(int size_field, float speed_dry);


void motion_ink_3D();

void motion_ink_3D(float speed_dry);

void motion_ink_3D(int size_field);

void motion_ink_3D(int size_field, float speed_dry);



