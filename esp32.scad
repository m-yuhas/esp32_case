wall = 3;
inner_x = 29;
inner_y = 60;
inner_z = 10 + wall;
connector_z = 8;
connector_x = inner_x - 4;
connector_offset = -2;
eps = 0.01;
stub_offset = 0.1;

// Bottom portion of the case
difference(){
  minkowski(){
    cube([inner_x, inner_y, wall]);
    cylinder(r=wall, h=inner_z);
  }
  translate([0, 0, wall]) cube([inner_x, inner_y, inner_z + eps]);
  translate([(inner_x - connector_x) / 2, -wall, wall + connector_offset]) cube([connector_x, wall + eps, connector_z]);
}

// Lid
difference(){
  union() {
    translate([40, 0, 0]){
      minkowski(){
        cube([inner_x, inner_y, wall]);
        cylinder(r=wall, h=eps);
      }
    }
    translate([40 + stub_offset, stub_offset, wall - eps]) cube([wall, wall, wall]);
    translate([40 + stub_offset, inner_y - wall - stub_offset, wall - eps]) cube([wall, wall, wall]);
    translate([40 + inner_x - wall - stub_offset, stub_offset, wall - eps]) cube([wall, wall, wall]);
    translate([40 + inner_x - wall - stub_offset, inner_y - wall - stub_offset, wall - eps]) cube([wall, wall, wall]);
  }
  translate([40 + inner_x / 4, -wall + eps, wall / 2]) cube([inner_x / 2, wall / 2 + eps, wall / 2 + 2 * eps]);
}