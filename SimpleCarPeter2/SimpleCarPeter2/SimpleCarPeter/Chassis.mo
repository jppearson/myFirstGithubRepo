package Chassis
  import SimpleCarPeter.MidLevelDesign.*;
  import Modelica.Mechanics.*;

  model SimpleChassis
    extends ChassisInterface;
    Rotational.Components.IdealRollingWheel simpleWheel(radius = 0.5, useSupportT = true);
    Translational.Components.Mass mass(m = 1000);
  equation
    connect(simpleWheel.flangeR,power);
    connect(simpleWheel.flangeT,mass.flange_a);
    connect(simpleWheel.supportT,roadSurface);
  end SimpleChassis;
end Chassis;

