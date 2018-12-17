// units are in centimeters unless otherwise stated
axle_diameter = 0.54;
base_diameter = 9.5;
top_diameter  = axle_diameter + 2;
height        = 6;
nozzle_diameter = 0.04; //0.4mm in centimeters

servings_per_day = 4;
num_days_capacity = 3;
num_sections = servings_per_day * num_days_capacity;

translate([0,0,height/2]){
    difference(){
        union(){
                cylinder(height, d1=base_diameter, d2=top_diameter, center=true, $fn=num_sections);
                
            translate([0,0,-height/2]){
                for ( i = [0:num_sections]){
                    rotate(a=[0,0,i*360/num_sections]){
                        cube([nozzle_diameter*2,base_diameter/2,height]);
                    }
                }
            }
        }
        cylinder(height, d=axle_diameter, center=true, $fn=20);
    }
    
}