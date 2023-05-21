// We place the structure 2.5m from the boundary and 9m from the kitchen

south_to_boundary = 2500;
west_to_kitchen = 9000;

// We design the ablutions arrangement around standard toilet cubicals,
// which convieniently the same size as a single bed.
// Toilet; 900mm c/c width and 1850mm length
// Bed; 900mm width and 1900mm length
// XXX What is c/c?

toilet_cubical = [ 1850, 900 ];

// A toilet convertable room interior dimensions are:
// - 3 toilet cubicals wide
// - 2 toilet cubicals long + 1m for passage

passage_width = 1000;
room_interior = [
  toilet_cubical.x * 2 + passage_width,
  toilet_cubical.y * 3,
];

// Using 250mm brick walls
brick_wall = 250;

// The ablutions includes 4 of these interior rooms
// Each separated by a 250mm brick wall, 3000mm high

abolution = [
  brick_wall + room_interior.x + brick_wall,
  (brick_wall + room_interior.y) * 4 + brick_wall,
  3000
];

// On the outside of the ablutions, we have a 3000mm wide serving window

window_width = 3000;
window_height = 1000;
window_y_offset = 1000;

// Doorways are 900mm wide, and 2m high

door = [ 900, brick_wall, 2000 ];
doorway = 900;
doorway_height = 2000;

x_door = [
  doorway,
  brick_wall + 20,
  doorway_height
];

y_door = [
  brick_wall + 20,
  doorway,
  doorway_height
];

// Then entire structure sits on a concrete slab
// The slab is 100mm thick, starts 200mm from the boundary,
// and extends 300mm around the ablutions

slab_thick = 100;
slab_offset = 200;
slab_extension = 300;
slab_length = abolution.y + slab_extension * 2;
slab_width = south_to_boundary - slab_offset + abolution.x + slab_extension;

slab = [
    slab_width,
    slab_length,
    slab_thick
];

translate([0, m_kitchen_heyman ]) {
    translate([
        slab_offset,
        -(west_to_kitchen + slab_length - slab_extension),
        -slab_thick
    ]) color("LightGrey") cube(slab);

    translate([
        south_to_boundary,
        -(west_to_kitchen + abolution.y)
    ]) {
        for (room = [0:1:3]) {

            translate([ 0, room * (room_interior.y + brick_wall), ]) {
                wall_east = [ abolution.x, brick_wall, abolution.z ];
                wall_north = [ brick_wall, room_interior.y, abolution.z ];
                
                // East wall
                difference() {
                    cube(wall_east);

                    if (room == 0) {
                        // Add serving window
                        translate([
                            abolution.x / 2 - window_width / 2,
                            0 - 10,
                            window_y_offset,
                        ]) cube([
                            window_width,
                            brick_wall + 20,
                            window_height
                        ]);
                    }

                    if (room > 1) {
                        // Add door to the next room
                        door_center = abolution.x / 2 - doorway / 2;
                        translate([ door_center, -10,  0 ]) cube(x_door);
                    }
                }

                door_center = room_interior.y / 2 - doorway / 2;

                // South wall
                translate([ 0, brick_wall ]) difference() {
                    cube(wall_north);

                    // Add door to the exterior
                    if (room < 2) translate([ -10, door_center, 0 ]) cube(y_door);
                }

                // North wall
                translate([ abolution.x - brick_wall, brick_wall ]) difference() {
                    cube(wall_north);

                    // Add door to the exterior
                    if (room < 2) translate([ -10, door_center, 0 ]) cube(y_door);
                }

                // West wall
                if (room == 3) translate([ 0, room_interior.y ]) cube(wall_east);

                // Place a toilet in the south west corner
                if (room == 3) {
                    translate([
                        brick_wall,
                        brick_wall + room_interior.y - toilet_cubical.y,
                        200,
                    ]) color("LightBlue") square(toilet_cubical);
                }

                // Place all toilets
                if (room == 2) {
                    for (toilet = [0:1:2]) {
                        translate([
                            brick_wall,
                            brick_wall + (toilet * toilet_cubical.y),
                            200,
                        ]) {
                            color("LightBlue") square(toilet_cubical);
                            opposite_wall = room_interior.x - toilet_cubical.x;

                            translate([ opposite_wall, 0 ])
                                color("LightBlue")
                                square(toilet_cubical);
                        }
                    }
                }

            } // translate

        } // for


    }
}