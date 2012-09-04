package Headlights
  model SimpleHeadLight
    Real timeOfDay;
    Real lightBulb;
  equation
    lightBulb = if timeOfDay == 1 then 0 else 1;
  end SimpleHeadLight;
end Headlights;

