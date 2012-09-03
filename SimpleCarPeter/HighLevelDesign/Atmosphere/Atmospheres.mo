Package Atmospheres

import HighLevelDesign.*;
import AtmosphereComponents.*;

model simpleAtmosphere "Simple Atmosphere at STP"
      extends HighLevelDesign.AtmosphereInterface;
      air.P = 101325 "Pascals";
      air.T = 273 "Kalvin";
      timeOfDay = 1 "DayTime";
equation
end simpleAtmosphere

model hotAtmosphere "Simple Atmosphere at STP"
      extends HighLevelDesign.AtmosphereInterface;
      air.P = 103000;
      air.T = 311;
equation
end simpleAtmosphere

end Atmospheres

