package Headlights
  model SimpleHeadlight
	Modelica.SIunits.Mass headlightMass = 100;
    Real timeOfDay;
    Real lightBulb;
  equation
    lightBulb = if timeOfDay > 0 then 0 else 1;
  end SimpleHeadlight;
end Headlights;

