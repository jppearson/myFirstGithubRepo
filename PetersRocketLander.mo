package PetersRocketLander
  // Peter Verlangieri
  // 08/6/2012
  // This package is used to simulate the landing of a rocket on the moon.
  // Also to practice the functionality of openmodelica.
  // Used to store data related to celestial bodies such as Earth, the moon,
  // asteroids, planets, comets, and starts
  class CelestialBody
    constant Real g = 6.672e-011;
    parameter Real radius;
    parameter String name;
    Real mass;
  end CelestialBody;
  // The Class Rocket defines any rocket with an inital mass, altitude, velocity,
  // acceleration, and force of gravity. Also contains a thrustController object. 
  class Rocket
    parameter String name;
    Real mass(start = 1038.358);
    Real altitude(start = 59404);
    Real velocity(start = -2003);
    // Relative to the lunar surface
    Real acceleration;
    Real thrust;
    Real gravity;
    parameter Real massLossRate = 0.000277;
    Controller TController(name = "RocketController");
  equation
    TController.altInput = altitude;
    thrust = TController.thrustOut;
    (thrust - mass * gravity) / mass = acceleration;
    der(mass) = -massLossRate * abs(thrust);
    der(altitude) = velocity;
    der(velocity) = acceleration;
  end Rocket;
  // Lands a type rocket object named apollo, on the celetrailbody object moon
  class MoonLanding
  public
    // Create object of type rocket
    Rocket apollo(name = "apollo12");
    // create object of type moon  
    CelestialBody moon(name = "moon", mass = 7.382e+022, radius = 1738000.0);
  equation
    apollo.gravity = (moon.g * moon.mass) / (apollo.altitude + moon.radius) ^ 2;
  end MoonLanding;
  // Controller is ued to take an imput altitude and control the output thrust
  // that will be applied on the rocket.
  block Controller
    parameter String name;
    Real altInput;
    Real thrustOut;
    parameter Real force1 = 36350;
    parameter Real force2 = 1308;
    parameter Real altBuffer = 9935;
  equation
    thrustOut = if altInput > altBuffer then force1 else if altInput < altBuffer and altInput > 10 then force2 else 0;
  end Controller;
end PetersRocketLander;

