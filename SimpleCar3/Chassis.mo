package Chassis
  import Modelica.Mechanics.Translational.Components.Mass;
  import Modelica.Mechanics.Rotational.Interfaces.Flange_b;
  import Modelica.Mechanics.Translational.Interfaces.Flange_a;
  import Modelica.Mechanics.Rotational.Components.IdealRollingWheel;
  //import Modelica.SIunits.Mass;
  import Modelica.Mechanics.Rotatioanl.Components.Inertia;
  partial model ChassisInterface
    //Modelica.SIunits.Mass chassisMass();
    //Modelica.SIunits.Mass totalVehicleMass();
    Modelica.Mechanics.Rotational.Interfaces.Flange_b power;
    Modelica.Mechanics.Translational.Interfaces.Flange_a roadSurface;
    //Real steeringWheel;
    //Real brakes;
    //Modelica.Blocks.Interfaces.Outport speed;
  end ChassisInterface;
  model SimpleChassis
    extends ChassisInterface;
    //(chassisMass = 100);
    Modelica.Mechanics.Rotational.Components.Inertia inertia(J = 1);
    Modelica.Mechanics.Translational.Components.Mass mass(L = 0, m = 1);
    Modelica.Mechanics.Rotational.Components.IdealRollingWheel simpleWheel(radius = 0.5, useSupportT = true);
    //Modelica.Mechanics.Translational.Components.Mass mass(m = 1000);
  equation
    connect(power,inertia.flange_a);
    connect(inertia.flange_b,simpleWheel.flangeR);
    connect(simpleWheel.flangeT,mass.flange_a);
    connect(simpleWheel.supportT,roadSurface);
  end SimpleChassis;
end Chassis;

