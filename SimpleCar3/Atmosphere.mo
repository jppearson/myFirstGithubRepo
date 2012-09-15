package Atmosphere
  import Modelica.SIunits.Pressure;
  import Modelica.SIunits.Temperature;
  partial model AtmosphereInterface
    parameter Modelica.SIunits.Pressure P;
    parameter Modelica.SIunits.Temperature T;
    parameter Real timeOfDay;
  end AtmosphereInterface;
  model SimpleAtmosphere "Simple Atmosphere at STP"
    extends AtmosphereInterface(P = 101325, T = 273, timeOfDay = 1);
  end SimpleAtmosphere;
  model HotAtmosphere "Simple Atmosphere during hotter conditons"
    extends AtmosphereInterface(P = 103000, T = 311, timeOfDay = 1);
  end HotAtmosphere;
end Atmosphere;

