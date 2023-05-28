pcb_slot_height = 1.8;
pcb_slot_width = 27;

difference() {
  $fn=256;

  cylinder(h=115, r=15);  // This is the main cylinder
  translate([0,0, -10]) cylinder(h=155, r=12.5); // The cylinder to be subtracted. The 'translate' function is used to ensure that this cylinder is centered properly.
   translate([
    pcb_slot_height / 2 * (-1),
    pcb_slot_width / 2 * (-1),
    0,
   ]) cube([
    pcb_slot_height,
    pcb_slot_width,
    120,
   ]);
   
}

// PCB Notch Top-Right
translate([pcb_slot_height / 2 - 0.027, 12.5, 0])
linear_extrude(height = 115)
  // Prevent our little notch from appearing huge.
  // Height is about 1.616mm.
  scale(0.02485593)
  rotate([0, 0, -90])
  import("pcb_notch_shape.svg");


// PCB Notch Top-Left
mirror([1, 0, 0])
translate([pcb_slot_height / 2 - 0.027, 12.5, 0])
linear_extrude(height = 115)
  scale(0.02485593)
  rotate([0, 0, -90])
  import("pcb_notch_shape.svg");

mirror([0, 1, 0]) {
    // PCB Notch Top-Right
    translate([pcb_slot_height / 2 - 0.027, 12.5, 0])
    linear_extrude(height = 115)
      // Prevent our little notch from appearing huge.
      // Height is about 1.616mm.
      scale(0.02485593)
      rotate([0, 0, -90])
      import("pcb_notch_shape.svg");


    // PCB Notch Top-Left
    mirror([1, 0, 0])
    translate([pcb_slot_height / 2 - 0.027, 12.5, 0])
    linear_extrude(height = 115)
      scale(0.02485593)
      rotate([0, 0, -90])
      import("pcb_notch_shape.svg");
}