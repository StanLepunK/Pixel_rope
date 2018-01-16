pixmotion is an extends of Pix class

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