package Transmissions
  import SimpleCarPeter.MidLevelDesign.*;
  import Modelica.Mechanics.*;
  model SingleSpeedTransmission
    extends MidLevelDesign.TransmissionInterface(transmissionMass = 200);
  equation
    connect(engine,driveline);
  end SingleSpeedTransmission;
  connector GearSelectorInput "Gear Selection input for a transmission"
    input Integer gear "What int the transmission should be in";
  end GearSelectorInput;
  connector GearSelectorOutput "This connector is an output from any transmission shifting model"
    output Integer gear;
  end GearSelectorOutput;
end Transmissions;

