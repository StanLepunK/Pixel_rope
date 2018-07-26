Cloud, Cloud_2D and Cloud_3D is an extends of Pix class



*CLOUD

master method available for CLOUD_2D and CLOUD_3D

int length()
>return the num of pixel of Cloud

void list()
> return the arraylist of Vec3 coord of point of this Pixel cloud

BEHAVIOR
--
void set_behavior(String behavior);
>you can choice between few bahavior often it's mathematical ones.


SPIRAL
void spiral(int num);
>parameters: int num must be upper to '0'

RANGE
--
void range(float min, float max);
>it's a multiplicator apply to radius, it's use in relation with the behavior to define the minimum radius and the maximum


TIME
--
void time_count(int value);
>to pass count, this count is used with method beat(), maybe more in the future. by default the Processing frameCount is using.

TEMPO
--
void set_tempo(int n);
>parameters: int n give the tempo, when trigonometric distribution is used.
@see void set_behavior();


RADIUS
--
void set_radius(float radius);
>parameters float radius, change the radius of Cloud




GROWTH
--
void growth(float angle_growth);

float get_growth();

void growth_size(float total_growth);


ROTATION
--
void rotation(float rotation, boolean static_rot);

float get_rotation();










CLOUD_2D extends CLOUD
--
this class use a pixel position to make a cloud pixel in 3D.

Constructor
--
class Cloud_2D(int num);

class Cloud_2D(int num, int distribution);

class public Cloud_2D(int num, int distribution, float angle_step);

parameters:
int num : quantity of points in the cloud
int distribution: at this moment two type of distribution 
r.ORDER > regular distribution
r.CHAOS > random distribution
float angle_step define the angle between the point, by default it's > TWO_PI div by num






METHOD
--
UPDATE
--
void update();


SHOW
--
void show();


















CLOUD_3D extends CLOUD
--
this class use a pixel position to make a cloud pixel in 3D.

Constructor
--
Cloud_3D(int num);
> the render default is P2D, and an int distribution r.ORDER, int type r.CARTESIAN

class Cloud_3D(int num, String renderer_dimension, int distribution);

class Cloud_3D(int num, String renderer_dimension, int distribution, int type);

class Cloud_3D(int num, String renderer_dimension, float step_angle);
>this constructor work with int distribution = r.ORDER and with int type = r.CARTESIAN

parameters:
int num : quantity of points in the cloud
int distribution: at this moment two type of distribution 
String renderer_dimension define if it's 2D or 3D rendering, use var P2D or P3D
r.ORDER > regular distribution
r.CHAOS > random distribution
float angle_step define the angle between the point, by default it's > TWO_PI div by num


Parameters:
int num : define the numbers of points of this pixel

String renderer_dimension : you can choice P2D or P3D, note you can choice P2D when your are in the P3D processing rendering, but not P3D when you are in P2D rendering.

int distribution: choice between r.CHAOS or r.ORDER

int build : choice between r.POLAR or r.CARTESIAN, with the cartesian distribution you can catch the cloud pixel position, but it's really beautiful rendering !



METHOD
--
UPDATE
--
void update();

void update(Vec pos);

SHOW
--
void show();

ORIENTATION
--
change the orientation of each facets of the sphere
void orientation_x(float x);

void orientation_y(float y);

void orientation_z(float z);

void orientation(Vec3 orientation);

void orientation(float x, float y, float z);



ROTATION
--
rotation_x(float var, boolean static_rotation);
>parameter: 
float var define the speed or the distance of rotation
boolean static_rotation definie if var is the speed or the distance of rotation, if it's true var is use like distance

rotation_y(float var, boolean static_rotation);

rotation_z(float var, boolean static_rotation);










































