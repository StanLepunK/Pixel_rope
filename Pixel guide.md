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
Vec3 size = Vec3(1) ;

int ID = 0 ;

int costume_ID = POINT_ROPE ;




SHAPE available for the PIXEL
--
>see https://github.com/StanLepunK/Costume_rope



CLASS
--




METHOD
--
SHOW
--
void show() ; 


SET
--

COSTUME
--
void set_costume(int ID) ;

void costume_angle(float angle)
>parameters float angle, set the angle start when costume() is used

size
--
void size(float x) ;

void size(float x, float y) ;

void size(float x, float y, float y) ;

void size(Vec2 xy);

void size(Vec2 xyz);

POSITION
--
void pos(iVec pos);

void pos(Vec pos);

void pos(int x, int y);

void pos(int x, int y, int z);


NORMAL DIRECTION
--
>Not used now

void dir(Vec3 dir) ;

void dir(float x, float y, float z) ;

void dir_x(float x) ;

void dir_y(float y) ;

void dir_z(float z) ;


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























