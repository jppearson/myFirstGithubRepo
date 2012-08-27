package TransmissionComponents

connector GearSelectorInput  "Gear Selection input for a transmission"
	input Integer gear;  // This int what gear the transmission should be in.
end GearSelectorInput;

connector SearSelectorOutput   "This connector is an output from any transmission shifting model"
	output Integer gear
end GearSelectorOutput;


end TransmissionComponets;
