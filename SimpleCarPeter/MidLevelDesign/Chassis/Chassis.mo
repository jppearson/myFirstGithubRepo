package chassis

/*
partial model ChassisInterface
	Modelica.Mechanics.Rotational.Flange_a power;
	Modelica.Mechanics.Translational.Flange_b wheel;
	Modelica.Mechanics.Translational.Interfaces.Flange_a road;
	Modelica.Blocks.Interfaces.Outport speed;
	Modelica.Mechanics.Rotational.Interfaces.Flange_a wheel;
end ChassisInterface;
*/

model SimpleChassis
    extends chassisInterface;
equation

end SimpleChassis;

end chassis;