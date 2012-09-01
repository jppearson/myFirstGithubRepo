Package Drivers
import HighLevelDesign.*;

/* Simple Driver that travels in a direction of pi/4 and incrementally increases the throttle
   at 4 preset time intervals
*/
model DummyDriver1
  extends HighLevelDesign.Driver(driverMass = 100000);
  import Modelica.Constants.*;
  parameter Real[4] t = {100,200,300,400};
equation
  cmdBreak = 0;
  cmdDir = pi / 4;
  cmdThrottle = if time < t[1] then 100 else if time < t[2] then 200 else if time < t[3] then 400 else 800;
end DummyDriver1;


end Drivers;