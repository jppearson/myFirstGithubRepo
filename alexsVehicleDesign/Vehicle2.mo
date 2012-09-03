package vehicle2 "Medium Level Design"
  model Driver
    parameter Real mass;
    Real throttle;
  end Driver;
  model Road
    parameter Real mu "road friction";
  end Road;
  model carInterface
    Real position(start = 0);
    Real velocity;
    Real acceleration;
    Real totalMass;
    Real drivingForce,frictionForce;
    Real netForce;
    parameter Real carMass;
    parameter Real friction;
  equation
    velocity = der(position);
    acceleration = der(velocity);
    frictionForce = friction * totalMass * 9.8;
    netForce = totalMass * acceleration;
    netForce = drivingForce - friction;
  end carInterface;
  model Tank
    Real mass "kg";
    parameter Real tareMass;
    parameter Real maxCapacity;
    Real currentFuel(start = maxCapacity);
    Real fuelRateCmd "kg/m^3";
    Real fuelRateOut;
  equation
    mass = currentFuel + tareMass;
    der(currentFuel) = -fuelRateOut;
    fuelRateOut = if currentFuel > 0 then fuelRateCmd else 0;
  end Tank;
end vehicle2;

