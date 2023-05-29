pcb_slot_height = 1.8;
pcb_slot_width = 27;
pcb_notch_scale = 0.02485593;

// The height of the controller without the diffusor attached.
controller_height = 130;

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