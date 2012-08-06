model ControllerAndMotor
  import Modelica.Blocks;
  import Controllers.*;
  Blocks.Sources.Sine sinsig(amplitude = 0.2, freqHz = 0.3, offset = 1.0);
  replaceable PController con(Kp = 0.4);
  Blocks.Continuous.TransferFunction motor(a = {0.8,0.1});
equation
  connect(sinsig.y,con.command);
  connect(con.driver,motor.u);
  connect(motor.y,con.sensor);
end ControllerAndMotor;

