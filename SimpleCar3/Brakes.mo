package Brakes
  import Modelica.SIunits.Mass;
  model SimpleBrake
    Modelica.SIunits.Mass brakeMass = 100;
    Real brakePedal;
    Real brakePad;
  equation
    brakePad = if brakePedal > 0 then 1 else 0;
  end SimpleBrake;
end Brakes;

