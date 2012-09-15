package vehicle2 "Medium Level Design"
  import Modelica.SIunits.*;
  import Modelica.Math.*;
  model Map
    Real[2] vehicleLocation;
  end Map;
  model Driver
    output Real throttle = -1 / 2500 * time ^ 2 + 1 / 25 * time "throttle must be positive on interval 0<=time<=100";
    parameter Mass mass;
  end Driver;
  model carInterface
    Real direction "units in radians";
    Position[2] position(start = {0,0});
    Velocity[2] velocity;
    Acceleration[2] acceleration;
    Mass totalMass;
    input Force[2] drivingForce;
    Force[2] frictionForce;
    Force[2] netForce;
    parameter Mass carMass;
    parameter Mass friction;
    final constant Real b = 1200 "drag constant, units = kg/m";
  equation
    direction = arctan(position[2] / position[1]);
    velocity[1] = der(position[1]);
    acceleration[1] = der(velocity[1]);
    frictionForce[1] = (friction * totalMass * velocity[1] ^ 2) / b;
    netForce[1] = totalMass * acceleration[1];
    netForce[1] = drivingForce[1] - frictionForce[1];
    velocity[2] = der(position[2]);
    acceleration[2] = der(velocity[2]);
    frictionForce[2] = (friction * totalMass * velocity[2] ^ 2) / b;
    netForce[2] = totalMass * acceleration[2];
    netForce[2] = drivingForce[2] - frictionForce[2];
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
    output Force[2] force;
    parameter Real r "how much force is made by burning fuel";
  end Engine;
end vehicle2;

