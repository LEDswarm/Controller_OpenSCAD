pcb_slot_height = 1.8;
pcb_slot_width = 27;
pcb_notch_scale = 0.02485593;

// Default screw length for the LED are 3 millimeters.
led_screw_length = 3.0;
bottom_screw_length = 3.0;

// The height of the controller base in millimeters, not including the LED base and diffusor attachment.
controller_height = 115;
controller_radius = 15;
bottom_height_padding = 0;
bottom_torus_distance = 3;
led_base_height = 10;
led_board_diameter = 23;
// The center of the o-ring can be translated inwards using this variable to adjust the pressure to a functional setting when the diffusor is attached.
led_oring_deepness = 0.2;

circle_resolution_fn = 48;

color([0, 0.5, 0.7])
difference() {
  $fn=circle_resolution_fn;

  cylinder(h=controller_height, r=15);  // This is the main cylinder
  translate([0,0, -10]) cylinder(h=controller_height * 1.5, r=12.5); // The cylinder to be subtracted. The 'translate' function is used to ensure that this cylinder is centered properly.
   translate([
    pcb_slot_height / 2 * (-1),
    pcb_slot_width / 2 * (-1),
    0,
   ])
   cube([
    pcb_slot_height,
    pcb_slot_width,
    controller_height * 1.2,
   ]);

    // Screw Hole 1
    // The extra of two units here, undone again by the cylinder height, is a safety margin to ensure that the difference() works as intended
     translate([
        controller_radius - 1.25,
        0,
        -2,
    ])
        cylinder(h=bottom_screw_length + 2, r=0.75);


    // Screw Hole 2
     mirror([1, 0, 0])
     translate([
        controller_radius - 1.25,
        0,
        -2,
    ])
        cylinder(h=bottom_screw_length + 2, r=0.75);
}



// LED Base
color([0, 0.8, 0.9])
difference() {
    $fn=circle_resolution_fn;
    translate([0, 0, controller_height])
        cylinder(h=led_base_height, r=led_board_diameter / 2);

    // O-Ring Cutout (Torus)
    translate([0, 0, controller_height + led_base_height / 2 - 0.75])
        rotate_extrude(convexity = 10)
        translate([led_board_diameter / 2 - led_oring_deepness, 0, 0])
        scale([1, 1, 1])
        circle(1.5);

    // Screw Hole 1
     translate([
        0,
        ((led_board_diameter / 2) - 2),
        controller_height + led_base_height - led_screw_length,
    ])
        cylinder(h=led_base_height + 15, r=1);

    // Screw Hole 2
     translate([
        0,
        ((led_board_diameter / 2) - 2) * -1,
        controller_height + led_base_height - led_screw_length,
    ])
        cylinder(h=led_base_height + 15, r=1);

    // Inner Cutout
    translate([0, 0, controller_height - 5])
        cylinder(h=led_base_height + 10, r=(led_board_diameter / 2) - 4);
}

$fn=circle_resolution_fn;


// LED Base Ring
translate([0, 0, controller_height])
color([0, 0.8, 0.9])
difference() {
    $fn=circle_resolution_fn;

    cylinder(h=1, r=15);
    translate([0, 0, -1])
    cylinder(h=led_base_height + 2, r=led_board_diameter / 2);
}

// PCB Notch Top-Right
color([0, 0.5, 0.7])
translate([pcb_slot_height / 2 - 0.037, 12.5, bottom_height_padding])
linear_extrude(height = controller_height - bottom_height_padding)
  // Prevent our little notch from appearing huge.
  // Height is about 1.616mm.
  scale(pcb_notch_scale)
  rotate([0, 0, -90])
  import("pcb_notch_2.svg");

// PCB Notch Top-Left
color([0, 0.5, 0.7])
mirror([1, 0, 0])
translate([pcb_slot_height / 2 - 0.037, 12.5, bottom_height_padding])
linear_extrude(height = controller_height - bottom_height_padding)
  scale(pcb_notch_scale)
  rotate([0, 0, -90])
  import("pcb_notch_2.svg");

mirror([0, 1, 0]) {
    // PCB Notch Top-Right
    color([0, 0.5, 0.7])
    translate([pcb_slot_height / 2 - 0.037, 12.5, bottom_height_padding])
    linear_extrude(height = controller_height - bottom_height_padding)
      // Prevent our little notch from appearing huge.
      // Height is about 1.616mm.
      scale(pcb_notch_scale)
      rotate([0, 0, -90])
      import("pcb_notch_2.svg");


    // PCB Notch Top-Left
    color([0, 0.5, 0.7])
    mirror([1, 0, 0])
    translate([pcb_slot_height / 2 - 0.037, 12.5, bottom_height_padding])
    linear_extrude(height = controller_height - bottom_height_padding)
      scale(pcb_notch_scale)
      rotate([0, 0, -90])
      import("pcb_notch_2.svg");
}