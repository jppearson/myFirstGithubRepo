package Dogfight
  partial class Object
    Real mass;
  end Object;
  model FuelTank
    extends Object;
    parameter Real tareMass "mass when empty";
    parameter Real maxCapacity "maximum mass of fuel to carry";
    Real fuelMass(start = maxCapacity);
  equation
    assert(fuelMass >= 0);
    mass = fuelMass + tareMass;
    der(fuelMass) = if fuelMass == 0 then 0 else if fuelFlowRate > 0 then 0 else fuelFlowRate;
    outOfFuel = if fuelMass == 0 then true else false;
  end FuelTank;
  model FuelPump
    extends Object;
    parameter Real dP "max delta pressure";
    parameter Real A "pipe cross sectional area";
    parameter Real timeConstant;
    parameter Real Mdot;
    parameter Real C = 1 "oriface constant";
    constant Real rho = 1000 "fuel density kg/m^3";
  equation
    Mdot = C * A * sqrt(2 * rho * dP);
  end FuelPump;
  model Vehicle
  end Vehicle;
  model Simulation
  end Simulation;
  model Thruster
    extends Object;
    Real thrust "thrst produced by thruster";
    Real bearing "actual bearing (direction) that the thruster is pointing";
    Real bearingCmd "requested bearing for the thruster to point";
    parameter Real timeConstant "time const. governing the relationship between cmded bearing & actual bearing";
    parameter Real K "asympotic max thrust";
    parameter Real r "fuel burn rate";
    parameter Real n "fuel burn efficiency";
    Blocks.Continuous.TransferFunction tf(b = {1}, a = {timeConstant,1});
  equation
    bearingCmd = tf.u;
    bearing = tf.y;
    thrust = K * (1 - e ^ (-r / n));
  end Thruster;
  model positionController
  end positionController;
  model chasedVehicle
  end chasedVehicle;
  model chasingVehicle
  end chasingVehicle;
end Dogfight;

