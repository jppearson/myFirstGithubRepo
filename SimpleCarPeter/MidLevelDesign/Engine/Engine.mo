/* SimpleEngine Model that creates a generic torque source from the standard modelica library
   and uses it to drive the crankshaft. The intake is connected directly to the exhaust at this time
*/
model SimpleEngine
      extends engineInterface;
      parameter Modelica.SIunits.Torque maxTorque = 100;
      Modelica.Mechanics.Rotational.Sources.Torque torque;
      Modelica.Mechanics.Rotational.Interfaces.Flange_a crankshaft;
equation
	torque.tau = throttle * maxTorque;
	connect(torque.flange, crankshaft);
	connect(intake,exhaust);
end SimpleEngine
