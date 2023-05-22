seat_height = 400;
wall_to_toilet_center = 305;
floor_to_top_tank = 740;

module toilet(cubical = [ 1850, 900 ]) {
    color("LightBlue") square(cubical);

    module cistern () {
        seat_div = 200;
        cylinder( r1=100, r2=110, h=seat_height-seat_div, center=false );
        translate([ 0, 0, seat_height-seat_div ]) cylinder( r1=110, r2=160, h=seat_div, center=false );
    }
    translate([
        wall_to_toilet_center,
        cubical.y / 2,
        0
    ]) cistern();

    tank = [ 100, 400, 300 ];
    translate([
        10,
        (cubical.y - tank.y) / 2 ,
        floor_to_top_tank - tank.z
    ]) cube(tank);

    module board() {
        alpha = 0.7;
        color("Yellow", alpha) children();
    }

    translate([ 0, 0, 100 ]) {
        wood_thickness = 20;

        // left wall
        translate([ 0, 0 ])
            board()
            cube([ cubical.x, wood_thickness, 2000 ]);

        // right wall
        translate([ 0, cubical.y - wood_thickness ])
            board()
            cube([ cubical.x, wood_thickness, 2000 ]);

        // door
        translate([ cubical.x, 0, 0 ])
            rotate([ 0, 0, 150 ])
            board()
            cube([ cubical.y, wood_thickness, 2000 ]);
    };
}

toilet();

translate([ 0, 2000, 0 ]) toilet([ 3000, 2000 ]);
