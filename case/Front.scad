$fn = 30;

diameter = 5;
wall_thickness = 3;

module hole(x, y)
{
    translate([x, y, 0]) cylinder(d=diameter, h=100, center=true);
}

module O()
{
    translate([diameter/2, diameter/2, 0])
    { 
        // left
        hole(0, 1.5*diameter);
        hole(0, 3.5*diameter);
        hole(0, 5.5*diameter);

        // bottom
        hole(1.5*diameter, 0);
        hole(3.5*diameter, 0);

        // top
        hole(1.5*diameter, 7*diameter);
        hole(3.5*diameter, 7*diameter);

        // right
        hole(5*diameter, 1.5*diameter);
        hole(5*diameter, 3.5*diameter);
        hole(5*diameter, 5.5*diameter);
    }
}

module P()
{
    translate([diameter/2, diameter/2, 0])
    {
        // left
        hole(0, 0);
        hole(0, 2*diameter);
        hole(0, 4*diameter);
        hole(0, 6*diameter);

        // bow
        hole(2*diameter, 7*diameter);
        hole(2*diameter, 3*diameter);
        hole(3.5*diameter, 4*diameter);
        hole(3.5*diameter, 6*diameter);
    }
}

module E()
{
    translate([diameter/2, diameter/2, 0])
    {
        // left
        hole(0, 1.5*diameter);
        hole(0, 3.5*diameter);
        hole(0, 5.5*diameter);

        // bottom
        hole(1.5*diameter, 0);
        hole(3.5*diameter, 0);

        // top
        hole(1.5*diameter, 7*diameter);
        hole(3.5*diameter, 7*diameter);
        
        // center
        hole(2.5*diameter, 3.5*diameter);
    }
}

module N()
{
    translate([diameter/2, diameter/2, 0])
    { 
        // left
        hole(0, 0);
        hole(0, 2.2*diameter);
        hole(0, 4.4*diameter);
        hole(0, 6.6*diameter);
        
        // right
        hole(4.5*diameter, 0);
        hole(4.5*diameter, 2.2*diameter);
        hole(4.5*diameter, 4.4*diameter);
        hole(4.5*diameter, 6.6*diameter);
        
        hole(1.75*diameter, 4*diameter);
        hole(2.75*diameter, 2*diameter);
    }
}


difference() {
    cube([180, 60, 20]);
    translate([18, 10, 0])
    {
        O();
        translate([8.75*diameter, 0, 0]) P();
        translate([16*diameter, 0, 0]) E();
        translate([23*diameter, 0, 0]) N();
    }
    translate([wall_thickness, wall_thickness, -1]) cube([180-2*wall_thickness, 60-2*wall_thickness, 18]);
}