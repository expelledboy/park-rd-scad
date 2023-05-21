include <measurements.scad>

translate([ 0, m_kitchen_heyman ]) {
  translate([ f_house_to_boundary, 0 ])
    cube(house);

  translate([ m_palm_to_boundary, -m_palm_to_kitchen, ])
    color("Green")
    cylinder(5000, m_palm_radius);
}

translate([ m_storage_room_width, 0, 0 ]) {
  cube(maids_room);

  translate([ maids_room.x, 0, 0 ]) {
    cube(fire_room);

    translate([ fire_room.x, 0, 0 ]) {
      cube(shower_area);
    }
  }
}

translate([ property.x-m_entrace_width-shed.x, 0, 0 ])
  cube(shed);

translate([ property.x-m_entrace_width-pio_room.x, shed.y, 0 ])
  cube(pio_room);

translate([ property.x-m_boundary_to_north_borehole, m_heyman_to_borehole, 0]) {
  color("Blue")
  circle(500);
}

for (i = [0:500:property.y]) {
  translate([ m_servitude_width,i, 0 ])
    color("Black")
    cylinder(50, 50);
}

include <ablutions.scad>

color("honeydew", 0.1) square(property);
