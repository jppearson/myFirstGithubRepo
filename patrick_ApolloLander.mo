package ApolloLander

  model Body "Generic Physical Body"
    Real mass;
    String name;
  end Body;
  
  model CelestialBody "Celestial Body"
    extends Body;
    constant Real g = 6.672e-011;
    parameter Real radius;
  end CelestialBody;
  
  model ThrustController "Proportional controller"
    Real altitudeInput;
    Real thrustOutput;
    parameter Real kp;
  equation
    thrustOutput = kp * altitudeInput;
  end ThrustController;
  
  model Rocket "Generic Rocket"
    extends Body;
    parameter Real massLossRate = 0.000277;
    Real altitude(start = 59404);
    Real velocity(start = -2003);
    Real acceleration;
    Real thrust;
    Real gravity;
    ThrustController controller(kp = 1.025);
  equation
    controller.altitudeInput = altitude;
    thrust = controller.thrustOutput;
    thrust - mass * (if altitude > 0 then gravity else 0) = mass * acceleration;
    der(mass) = -massLossRate * abs(thrust);
    der(altitude) = velocity;
    der(velocity) = acceleration;
    when altitude <= 0 then
      reinit(altitude, 0);
      reinit(velocity, 0);
    end when;
  end Rocket;
  
end ApolloLander;

