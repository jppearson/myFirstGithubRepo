package Atmospheres
  //Peter Verlangieri
  //September 1, 2012
  import HighLevelDesign.*;
  //import AtmosphereComponents.*;
  model SimpleAtmosphere "Simple Atmosphere at STP"
    extends HighLevelDesign.AtmosphereInterface(P = 101325, T = 273, timeOfDay = 1);
  end SimpleAtmosphere;
  model HotAtmosphere "Simple Atmosphere during hotter conditons"
    extends HighLevelDesign.AtmosphereInterface(P = 103000, T = 311, timeOfDay = 1);
  end HotAtmosphere;
end Atmospheres;

