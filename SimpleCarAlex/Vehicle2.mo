package vehicle2 "Medium Level Design"
  model Driver
    Real throttle;
    parameter Real mass;
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
    netForce = drivingForce - frictionForce;
  end carInterface;
  model Tank
    Real mass "kg";
    Real currentFuel(start = maxCapacity);
    Real fuelRateCmd;
    Real fuelRateOut;
    parameter Real tareMass;
    parameter Real maxCapacity;
  equation
    mass = currentFuel + tareMass;
    der(currentFuel) = -fuelRateOut;
    fuelRateOut = if currentFuel > 0 then fuelRateCmd else 0;
  end Tank;
  model Engine
    Real e "efficiency of engine";
  end Engine;
end vehicle2;

