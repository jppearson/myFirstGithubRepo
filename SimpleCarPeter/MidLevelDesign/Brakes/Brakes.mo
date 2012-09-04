package Brakes
  model SimpleBrake
    Real brakePedal;
    Real brakePad;
  equation
    brakePad = if brakePedal == 1 then 1 else 0;
  end SimpleBrake;
end Brakes;

