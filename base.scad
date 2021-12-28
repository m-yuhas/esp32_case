// Constants
eps = 0.01;
pi = 3.14159;

// Global dimensions
lower_r = 55;
upper_r = 65;
height = 25;
thickness = 3;
inset_phi = 3;

// Surrounding Text
//outside_text="
//故人具雞黍，邀我至田家。綠樹村邊合，青山郭外斜。開軒面場圃，把酒話桑蔴。待到重陽日，還來就菊花。";
outside_text="故人具雞黍 邀我至田家 綠樹村邊合 青山郭外斜 開軒面場圃 把酒話桑蔴 待到重陽日 還來就菊花 ";


// Draw the decorative text around the outside of the base
module decoration_text(string, r_upper, r_lower, h, phi) {
  char_size = 2 * pi * r_lower / len(string);
  for(i = [0 : len(string) - 1]) {
    rotate(i * 360 / len(string))
      translate([0, r_lower + char_size / 2, 0])
        rotate([90 + atan((r_upper - r_lower) / h), 0, 180])
          linear_extrude(phi + eps) text(
            string[i],
            font = "KaiTi:style=Regular",
            size = char_size,
            valign = "center",
            halign = "center");
  }
}

// Ring around the base in which to place text.
module inset(h, r_upper, r_lower, d, phi) {
  theta = atan((r_upper - r_lower) / h);
  difference() {
    translate([0, 0, d]) cylinder(
      h=h - 2 * d,
      r1=r_upper,
      r2=r_upper,
      center=false);
    translate([0, 0, d - eps]) cylinder(
      h=h - 2 * d + 2 * eps,
      r1=r_lower + d * tan(theta) - phi / 2,
      r2=r_lower + (h - d) * tan(theta) - phi /2,
      center=false);
  }
}


difference() {
  cylinder(
    h=height,
    r1=lower_r,
    r2=upper_r,
    center=false);
  translate([0, 0, thickness]) cylinder(
    h=height - thickness + eps,
    r1=lower_r + thickness * ((upper_r - lower_r) / height - 1),
    r2=upper_r - thickness,
    center=false); 
    inset(
    h=height,
    r_upper=upper_r,
    r_lower=lower_r,
    d=7.5,
    phi=thickness);
};
translate([0, 0, height / 2]) decoration_text(
  string=outside_text,
  r_upper=upper_r - thickness / 2 - eps,
  r_lower=lower_r - thickness / 2 - eps,
  h=height,
  phi=thickness);
    
