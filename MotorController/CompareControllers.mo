model CompareControllers "Comparing various controllers"
  import ControllerAndMotor.*;
  ControllerAndMotor sys_base;
  //ControllerAndMotor sys_peter(redeclare PetersController   con( <params here> ));
  ControllerAndMotor sys_patrick(redeclare PatricksController con(Kp = 8, Ki = 4));
  //ControllerAndMotor sys_alex(redeclare AlexsController    con( <params here> ));
  annotation(experiment(StartTime = 0.0, StopTime = 20, Tolerance = 1e-006));
end CompareControllers;

