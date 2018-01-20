Cloud, Cloud_2D and Cloud_3D is an extends of Pix class



CLOUD
--
master method available for CLOUD_2D and CLOUD_3D

ANGLE
--
void angle(float angle)

void list()
> return the arraylist of Vec3 coord of point of this Pixel cloud


Pattern
--
void pattern(String pattern);


Beat
--
void beat(int n);

parameters: int n give the size of the beat



MISC
must be documented
--


Distribution ???
--

void distribution(Vec3 pos, float radius);

void distribution_surface_polar();

void distribution_surface_cartesian();

float distribution_pattern(float range, String pattern_distribution);




CLOUD_2D
--
this class use a pixel position to make a cloud pixel in 3D.

Constructor
--
Cloud_2D(int num);


Cloud_2D(int num, int distribution);


METHOD
--
ROTATION
--
rotation(float var, boolean static_rotation);
>parameter: 
float var define the speed or the distance of rotation
boolean static_rotation definie if var is the speed or the distance of rotation, if it's true var is use like distance







CLOUD_3D
--
this class use a pixel position to make a cloud pixel in 3D.

Constructor
--
Cloud_3D(int num);
> the render default is P2D, and an r.ORDER distribution whith a r.CARTESIAN build

Cloud_3D(int num, String renderer_dimension, int distribution);

Cloud_3D(int num, String renderer_dimension, int distribution, int build);


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



ROTATION
--
rotation_x(float var, boolean static_rotation);
>parameter: 
float var define the speed or the distance of rotation
boolean static_rotation definie if var is the speed or the distance of rotation, if it's true var is use like distance

rotation_y(float var, boolean static_rotation);

rotation_z(float var, boolean static_rotation);










































