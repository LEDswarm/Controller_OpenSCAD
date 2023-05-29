pcb_slot_height = 1.8;
pcb_slot_width = 27;
pcb_notch_scale = 0.02485593;

// The height of the controller base in millimeters, not including the LED base and diffusor attachment.
controller_height = 115;
led_base_height = 10;
led_board_diameter = 23;

circle_resolution_fn = 48;

difference() {
  $fn=256;

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
   
}
// LED Base
difference() {
    $fn=circle_resolution_fn;
    translate([0, 0, controller_height])
        cylinder(h=led_base_height, r=led_board_diameter / 2);

    translate([0, 0, controller_height + led_base_height / 2 - 0.75])
        rotate_extrude(convexity = 10)
        translate([led_board_diameter / 2 - 0.2, 0, 0])
        scale([1, 1, 1])
        circle(1.5);
}

$fn=circle_resolution_fn;

// LED Base Ring
translate([0, 0, controller_height])
difference() {
    $fn=circle_resolution_fn;

    cylinder(h=1, r=15);
    translate([0, 0, -1])
    cylinder(h=led_base_height + 2, r=led_board_diameter / 2);
}

// PCB Notch Top-Right
translate([pcb_slot_height / 2 - 0.037, 12.5, 0])
linear_extrude(height = controller_height)
  // Prevent our little notch from appearing huge.
  // Height is about 1.616mm.
  scale(pcb_notch_scale)
  rotate([0, 0, -90])
  import("pcb_notch_2.svg");


// PCB Notch Top-Left
mirror([1, 0, 0])
translate([pcb_slot_height / 2 - 0.037, 12.5, 0])
linear_extrude(height = controller_height)
  scale(pcb_notch_scale)
  rotate([0, 0, -90])
  import("pcb_notch_2.svg");

mirror([0, 1, 0]) {
    // PCB Notch Top-Right
    translate([pcb_slot_height / 2 - 0.037, 12.5, 0])
    linear_extrude(height = controller_height)
      // Prevent our little notch from appearing huge.
      // Height is about 1.616mm.
      scale(pcb_notch_scale)
      rotate([0, 0, -90])
      import("pcb_notch_2.svg");


    // PCB Notch Top-Left
    mirror([1, 0, 0])
    translate([pcb_slot_height / 2 - 0.037, 12.5, 0])
    linear_extrude(height = controller_height)
      scale(pcb_notch_scale)
      rotate([0, 0, -90])
      import("pcb_notch_2.svg");
}