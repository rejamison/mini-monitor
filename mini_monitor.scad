/*
 * Mini Monitor Stand for JBtek 10" LCD
 * http://www.amazon.com/Resolution-1280x800-Raspberry-EJ101IA-01G-Rasbperry/dp/B00S4EWF6G/ref=sr_1_1?ie=UTF8&qid=1440910133&sr=8-1&keywords=jbtek+10&pebp=1440910135520&perid=0W8D878F37HSWKFJ2N2P
 * 
 * 150mm (5.86")
 * 230mm (9.03")
 * 2mm (0.07")
 *
 * visible size
 * 138mm x 219mm
 */
$fn = 100;

//bezel_left();
//bezel_right();
frame();
//base();
//short_peg();
//long_peg();
//top();
//exploded();

module bezel_left() {
    difference() {
        bezel();
        translate([-1,120,-1]) cube([200,400,100]);
    }
}

module bezel_right() {
    difference() {
        bezel();
        translate([-1,-1,-1]) cube([200,121,100]);
    }
}

module exploded() {
    gap = 20;
    translate([-2.5,-2.5,0]) base();
    rotate([0,0,225]) translate([-10,-10,150 + gap * 2]) top();
    translate([25,20,190]) rotate([0,30,45]) short_peg();
    translate([15,10,260]) rotate([0,-30,45]) long_peg();
    translate([100,100,155]) rotate([45,-90,0]) translate([0,-120,0]) bezel();
    translate([80,80,155]) rotate([45,-90,0]) translate([0,-120,0]) frame();
    translate([90,90,155]) rotate([45,-90,0]) translate([2.5,-113.6,2.1]) %cube([150,230,2]);
}

module base() {
    cylinder(d=30,h=5);
    translate([2.5,2.5,0]) cylinder(d1=30,d2=20,h=150);
    translate([2.5,2.5,150]) cylinder(d=9,h=20);
    rotate([0,0,0]) {
        translate([0,-15,0]) cube(size=[100,30,5]);
        translate([100,0,0]) cylinder(d=30,h=5);
        translate([32,-18,0]) rotated_prism(4,40,40,0,0,90);
    }
    rotate([0,0,90]) {
        translate([0,-15,0]) cube(size=[100,30,5]);
        translate([100,0,0]) cylinder(d=30,h=5);
        translate([32,-22,0]) rotated_prism(4,40,40,0,0,90);
    }
}

module top() {
    difference() {
        translate([10,10,0]) cylinder(d=20,h=60);
        translate([10,10,-1]) cylinder(d=9.5,h=24);
    }
    
    translate([1,8,0]) rotate([0,-90,-90]) difference() {
        union() {
            translate([0,-5,0]) cube(size=[10,5,4]);
            translate([5,-5,0]) cylinder(d=10,h=4);
            translate([0,-7.5,0]) cube(size=[5,10,4]);
        }
        translate([5,-5,-1]) cylinder(d=3.5,h=6);
    }
    
    translate([5,8,60]) rotate([0,90,0]) rotate([0,-90,-90]) difference() {
        union() {
            translate([0,-5,0]) cube(size=[10,5,4]);
            translate([5,-5,0]) cylinder(d=10,h=4);
        }
        translate([5,-5,-1]) cylinder(d=3.5,h=6);
    }
}


module short_peg() {
    difference() {
        union() {
            cube(size=[50,8,8]);
            translate([0,8,4]) rotate([90,0,0]) cylinder(h=8,d=8);
            translate([50,8,4]) rotate([90,0,0]) cylinder(h=8,d=8);
            translate([-1.5,0,0]) cube(size=[53,8,4]);
        }
        translate([-5,1.5,-1]) cube(size=[12,5,10]);
        translate([0,9,4]) rotate([90,0,0]) cylinder(d=3.5,h=10);
        translate([43,1.5,-1]) cube(size=[12,5,10]);
        translate([50,9,4]) rotate([90,0,0]) cylinder(d=3.5,h=10);
    }
}


module long_peg() {
    difference() {
        union() {
            cube(size=[70,8,8]);
            translate([0,8,4]) rotate([90,0,0]) cylinder(h=8,d=8);
            translate([70,8,4]) rotate([90,0,0]) cylinder(h=8,d=8);
            translate([-1.5,0,0]) cube(size=[73,8,4]);
        }
        translate([-5,1.5,-1]) cube(size=[12,5,10]);
        translate([0,9,4]) rotate([90,0,0]) cylinder(d=3.5,h=10);
        translate([63,1.5,-1]) cube(size=[12,5,10]);
        translate([70,9,4]) rotate([90,0,0]) cylinder(d=3.5,h=10);
    }
}

module bezel() {
    difference() {
        cube(size=[160,240,7]);
        translate([2.5,6,2]) cube(size=[151,231,12]);
        translate([11,10.5,-1]) cube(size=[138,219,14]);
    }
    translate([78,0,7]) cube([4,6,4]);
    translate([78,237,7]) cube([4,3,4]);
    translate([0,117,7]) cube([3,6,4]);
    translate([153.5,117,7]) cube([6.5,6,4]);
}

module frame() {
    difference() {
        union() {
            translate([0,110,7]) cube(size=[160,20,3]);
            translate([75,0,7]) cube(size=[10,240,3]);
            
            translate([46.25,73.75,7]) {
                difference() {
                    union() {
                        cube(size=[67.5,92.5,3]);
                        translate([67.5-3.25,3.25,0]) cylinder(d=4.7,h=9);
                        translate([67.5-2.75,92.5-12,0]) cylinder(d=4.7,h=9);
                        translate([4.5,4,0]) cylinder(d=4.7,h=9);
                        translate([4.75,92.5-3,0]) cylinder(d=4.7,h=9);
                    }
                    translate([67.5-3.25,3.25,-1]) cylinder(d=3.1,h=11);
                    translate([67.5-2.75,92.5-12,-1]) cylinder(d=3.1,h=11);
                    translate([4.5,4,-1]) cylinder(d=3.1,h=11);
                    translate([4.75,92.5-3,-1]) cylinder(d=3.1,h=11);
                    
                    translate([67.5-3.25,3.25,4]) cylinder(d=3.5,h=11);
                    translate([67.5-2.75,92.5-12,4]) cylinder(d=3.5,h=11);
                    translate([4.5,4,4]) cylinder(d=3.5,h=11);
                    translate([4.75,92.5-3,4]) cylinder(d=3.5,h=11);
                }
            }
            
            // mount for button panel
            //rotate([0,0,-90]) translate([-50,42,11]) %cube([16.2, 76, 1.5]);
            translate([75,50.0,10]) cube([10,1.5,3]);
            translate([75,49.5,10]) rotated_prism(10,0.5,3,0,180,0);
            translate([75,32.1,10]) cube([10,1.5,3]);
            translate([75,33.6,10]) rotated_prism(10,0.5,3,180,0,0);

            // tabs
            translate([5,118,10]) {
                difference() {
                    union() {
                        cube(size=[10,4,5]);
                        rotate([-90,0,0]) translate([5,-5,0]) cylinder(d=10,h=4);
                    }
                    rotate([-90,0,0]) translate([5,-5,-1]) cylinder(d=3,h=6);
                }
            }
            translate([142,118,10]) {
                difference() {
                    union() {
                        cube(size=[10,4,5]);
                        rotate([-90,0,0]) translate([5,-5,0]) cylinder(d=10,h=4);
                    }
                    rotate([-90,0,0]) translate([5,-5,-1]) cylinder(d=3,h=6);
                }
            }
        }
        translate([78,-1,6]) cube([4,7,6]);
        translate([78,237,6]) cube([4,4,6]);
        translate([-1,117,6]) cube([4,6,6]);
        translate([153.5,117,6]) cube([7.5,6,6]);
        translate([85,130,0]) cube([22.5,30,20]);
        translate([52.5,130,0]) cube([22.5,30,20]);
        translate([85,80,0]) cube([22.5,30,20]);
        translate([52.5,80,0]) cube([22.5,30,20]);
    }
}

module prism(l, w, h) {
   polyhedron(
           points=[[0,0,0], [l,0,0], [l,w,0], [0,w,0], [0,w,h], [l,w,h]],
           faces=[[0,1,2,3],[5,4,3,2],[0,4,5,1],[0,3,4],[5,2,1]]
           );
   
}
module rotated_prism(l, w, h, a, b, c) {
    translate([l/2,w/2,h/2]) rotate([a,b,c]) translate([-l/2,-w/2,-h/2]) prism(l,w,h);
}
