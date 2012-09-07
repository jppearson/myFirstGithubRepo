package Chassis
  import MidLevelDesign.*;
  /*
  partial model ChassisInterface
		Modelica.SIUnits.Mass chassisMass;
		Modelica.SIUnits.Mass totalVehicleMass;
    	Modelica.Mechanics.Rotational.Flange_b power;
	 	Modelica.Mechanics.Rotational.Interfaces.Flange_a wheel;
	  	Modelica.Mechanics.Translational.Interfaces.Flange_a road;
		Real steeringWheel;
		Real brakes;
     Modelica.Blocks.Interfaces.Outport speed;
  end ChassisInterface;
*/
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

