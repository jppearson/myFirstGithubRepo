package vehicle "Medium Level Design"
  import Modelica.SIunits.*;
  model Driver
    output Real throttle = -1 / 2500 * time ^ 2 + 1 / 25 * time "throttle must be positive on interval 0<=time<=100";
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
    final constant Real b = 1200 "drag constant, units = kg/m";
  equation
    velocity = der(position);
    acceleration = der(velocity);
    frictionForce = (friction * totalMass * velocity ^ 2) / b;
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
end vehicle;

