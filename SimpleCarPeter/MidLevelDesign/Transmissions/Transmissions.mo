package Transmissions

import MidLevelDesign.*;

model SingleSpeedTransmission
	extends MidLevelDesign.TransmissionInterface;
equation
	connect(engine, driveline);
end SingleSpeedTransmission;


connector GearSelectorInput  "Gear Selection input for a transmission"
	input Integer gear;  // This int what gear the transmission should be in.
end GearSelectorInput;

connector GearSelectorOutput   "This connector is an output from any transmission shifting model"
	output Integer gear;
end GearSelectorOutput;


end Transmissions;



//partial model TransmissionInterface "Transmission Interface"
	// This is a basic transmission Interface */
	//TransmissionComponents.GearSelectorInput gear_selector;    // Gear_selctor Input
	//Modelica.Mechanics.Rotational.Interfaces.Flange_a driveline;  // Connection to the driveline
	//Modelica.Mechanics.Rotational.Interfaces.Flange_b engine;  //Connection to the engine
//end TransmissionInterface;



