package Brakes
  import Modelica.SIunits.*;
  model SimpleBrake
    Modelica.SIunits.Mass brakeMass = 100;
    Real brakePedal;
    Real brakePad;
  equation
    brakePad = if brakePedal > 0 then 0 else 1;
  end SimpleBrake;
end Brakes;

