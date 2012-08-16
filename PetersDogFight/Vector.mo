model Vector
  import Modelica.Math.*;
  Real x(start = 0);
  Real y(start = 0);
  Real theta;
  Real magnitude;
equation
  theta = atan(y / x);
  magnitude = sqrt(x ^ 2 + y ^ 2);
end Vector;

