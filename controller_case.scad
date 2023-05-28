pcb_slot_height = 1.8;
pcb_slot_width = 27;

difference() {
  $fn=150;

  cylinder(h=115, r=15);  // This is the main cylinder
  translate([0,0, -1]) cylinder(h=125, r=12.5); // The cylinder to be subtracted. The 'translate' function is used to ensure that this cylinder is centered properly.
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