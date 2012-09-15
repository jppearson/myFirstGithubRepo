package Chassis
  import Modelica.Mechanics.Translational.Components.Mass;
  import Modelica.Mechanics.Rotational.Interfaces.Flange_b;
  import Modelica.Mechanics.Translational.Interfaces.Flange_a;
  import Modelica.Mechanics.Rotational.Components.IdealRollingWheel;
  import Modelica.SIunits.*;
  import Modelica.Mechanics.Rotatioanl.Components.Inertia;
  partial model ChassisInterface
    Modelica.SIunits.Mass chassisMass;
    Modelica.SIunits.Mass driverMass;
    Modelica.SIunits.Mass transmissionMass;
    Modelica.SIunits.Mass engineMass;
    Modelica.SIunits.Mass headlightMass;
    Modelica.SIunits.Mass brakesMass;
    Modelica.SIunits.Mass totalMass;
    Modelica.Mechanics.Rotational.Interfaces.Flange_b power;
    Modelica.Mechanics.Translational.Interfaces.Flange_a roadSurface;
    Real steeringWheel;
    Real brakes;
  equation
    totalMass = chassisMass + driverMass + transmissionMass + engineMass;
  end ChassisInterface;
  //+ headlightMass + brakesMass;
  model SimpleChassis
    extends ChassisInterface(chassisMass = 100);
    Modelica.Mechanics.Rotational.Components.Inertia inertia(J = 1);
    Modelica.Mechanics.Translational.Components.Mass mass(L = 0, m = 600);
    Modelica.Mechanics.Rotational.Components.IdealRollingWheel simpleWheel(radius = 0.5, useSupportT = true);
  equation
    connect(power,inertia.flange_a);
    connect(inertia.flange_b,simpleWheel.flangeR);
    connect(simpleWheel.flangeT,mass.flange_a);
    connect(simpleWheel.supportT,roadSurface);
  end SimpleChassis;
  //connect(totalMass,mass.m);
end Chassis;

