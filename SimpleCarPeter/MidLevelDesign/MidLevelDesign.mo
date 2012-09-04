package MidLevelDesign

import Modelica.Mechanics.Rotational.Interfaces.Flange_a;
import Modelica.Mechanics.Rotational.Interfaces.Flange_b;

partial model TransmissionInterface "Transmission Interface"
	//This is a basic transmission Interface
	//TransmissionComponents.GearSelectorInput gear_selector;    // Gear_selctor Input
	Modelica.Mechanics.Rotational.Interfaces.Flange_a driveline;  // Connection to the driveline
	Modelica.Mechanics.Rotational.Interfaces.Flange_b engine;  //Connection to the engine
end TransmissionInterface;


partial model ShiftStrategyInterface
	//This is a basic interface for any shift strategy model. It connects to the axle of the car and using
	//the tire radius connects the axle of the car and using the tire radius, computes the vehicles translational speed.
	//This speed is then used to determine the appropriate gear which is then assigned to the output gear selector
		parameter Modelica.SIunits.Length tire_radius "Tire Radius";
		Real kph "Vehicle Speed";
		transmissionComponents.GearSelectorOutput gear_request;
		Modelica.Mechanics.Rotational.Interfaces.Flange_a wheel;
	equation
		kph = der(wheel.phi)*tire_radius*60*60/1000;
		wheel.tau = 0;
end ShiftStrategyInterface;


partial model ChassisInterface
	Modelica.Mechanics.Rotational.Flange_a power;
	Modelica.Mechanics.Translational.Flange_b wheel;
	Modelica.Mechanics.Translational.Interfaces.Flange_a road;
	Modelica.Blocks.Interfaces.Outport speed;
	Modelica.Mechanics.Rotational.Interfaces.Flange_a wheel;
end ChassisInterface;

partial model EngineInterface
	RealInput throttle;
	Flange_a crankshaft;
	Atmosphere.Gas intake;
	Atmosphere.Gas exhaust;
end EngineInterface;

		
end MidLevelDesign;
