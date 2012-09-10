package vehicle2 "Medium Level Design"
  import Modelica.SIunits.*;
  model Driver
    output Real throttle;
    parameter Mass mass;
  end Driver;
  model carInterface
    Position position(start = 0);
    Velocity velocity;
    Acceleration acceleration;
    Mass totalMass;
    input Force drivingForce;
    Force frictionForce;
    Force netForce;
    parameter Mass carMass;
    parameter Mass friction;
    final constant Acceleration g = 9.80665;
  equation
    velocity = der(position);
    acceleration = der(velocity);
    frictionForce = if velocity >= 0 then friction * totalMass * g else 0;
    netForce = totalMass * acceleration;
    netForce = drivingForce - frictionForce;
  end carInterface;
  model Tank
    Mass mass;
    Mass currentFuel(start = maxCapacity);
    input Real fuelRateCmd;
    output Real fuelRateOut;
    parameter Mass tareMass;
    parameter Mass maxCapacity;
  equation
    fuelRateCmd = fuelRateOut;
    mass = currentFuel + tareMass;
    der(currentFuel) = if currentFuel >= 0 then -fuelRateOut else 0;
  end Tank;
  model Engine
    input Real fuelBurnRate;
    output Force force;
    parameter Real r "how much force is made by burning fuel";
  end Engine;
end vehicle2;

