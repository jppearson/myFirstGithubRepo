package Transmissions
  import Modelica.SIunits.Mass;
  import Modelica.Mechanics.Rotaional.Interfaces.*;
  partial model TransmissionInterface "Transmission Interface"
    Modelica.SIunits.Mass transmissionMass;
    Modelica.Mechanics.Rotational.Interfaces.Flange_a driveline;
    Modelica.Mechanics.Rotational.Interfaces.Flange_b engine;
  end TransmissionInterface;
  model SingleSpeedTransmission
    extends TransmissionInterface(transmissionMass = 200);
  equation
    connect(engine,driveline);
  end SingleSpeedTransmission;
end Transmissions;

