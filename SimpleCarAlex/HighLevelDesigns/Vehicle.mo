package vehicle
  model Driver
    Real Throttle;
  end Driver;
  model Road
    parameter Real mu "road friction";
  end Road;
  model carInterface
    Real position(start = 0);
    Real velocity;
    Real acceleration;
    parameter Real totalMass = 100;
    Real drivingForce,frictionForce;
    Real netForce;
    parameter Real friction;
  equation
    velocity = der(position);
    acceleration = der(velocity);
    frictionForce = friction * totalMass * 9.8;
    netForce = totalMass * acceleration;
    netForce = drivingForce - friction;
  end carInterface;
end vehicle;

