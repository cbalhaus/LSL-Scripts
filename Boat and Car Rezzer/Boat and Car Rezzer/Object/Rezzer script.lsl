//:AUTHOR: Ferd Frederix

// Used to rez boats, cars, and airplanes when the prior rezzed vehicle is moved out of range
// First add a llDie() to the rezzed objects 'unsit' section.   HWen your visitor unsits, the vehicle will poof.
// Put the script in a prim and add the vehicle.  
// Edit the prim and object at the same time, when the object appears. Move them together where you want them.  
// Then make the box with this script invisible.


float scantime = 10; // keep this slow
float scandistance =1;    // keep this small

default
{
    state_entry() {
        llSensorRepeat(llGetInventoryName(INVENTORY_OBJECT,0),"",SCRIPTED|ACTIVE|PASSIVE,scandistance,PI,scantime);
    }  
    no_sensor() {
        llRezObject(llGetInventoryName(INVENTORY_OBJECT,0),llGetPos(),<0,0,0>,llGetRot(),0);
    }
    changed(integer what){
        if (what & CHANGED_INVENTORY) {
            llResetScript();
        }
    }
}