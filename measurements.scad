m_kitchen_heyman = 47500;
m_kitchen_park= 56500;
m_property_width = 32000;

property = [
  m_property_width,
  m_kitchen_heyman + m_kitchen_park,
];

f_wall_height = 3000;

f_house_to_boundary = 6000;
f_house_width = 20000;
f_house_length = 25000;

house = [
  f_house_width,
  f_house_length,
  f_wall_height,
];

m_palm_radius = 500;
m_palm_to_boundary = 10400;
m_palm_to_kitchen = 5900;

m_servants_quarters_length = 5300;

m_storage_room_width = 2200;
m_maids_room_north_to_boundary = 6050;
m_maids_room_width = m_maids_room_north_to_boundary - m_storage_room_width;

maids_room = [
  m_maids_room_width,
  m_servants_quarters_length,
  f_wall_height
];

m_fire_room_width = 2700;
m_fire_room_length = 3000;

fire_room = [
  m_fire_room_width,
  m_fire_room_length,
  f_wall_height
];

m_shower_area_width = 1600;

shower_area = [
  m_shower_area_width,
  m_servants_quarters_length,
  f_wall_height
];

m_shed_length = 14900;
m_shed_width = 6750;
m_shed_height_west = 3100;

shed = [
  m_shed_length,
  m_shed_width,
  m_shed_height_west
];

m_entrace_width = 5600;
m_heyman_to_pio_west = 10800;
m_pio_room_width = 3300;
m_pio_room_length = m_heyman_to_pio_west - m_shed_width;

pio_room = [
  m_pio_room_width,
  m_pio_room_length,
  f_wall_height
];

m_heyman_to_borehole = 12000;
m_boundary_to_north_borehole = 6300;

m_servitude_width = 2000;