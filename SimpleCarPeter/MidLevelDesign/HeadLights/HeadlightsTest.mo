package HeadlightsTest
  import Headlights.*;
  model SimpleHeadlightsTest
    Headlights.SimpleHeadlight headlight(timeOfDay = 0);
    Headlights.SimpleHeadlight headlight2(timeOfDay = 1);
  end SimpleHeadlightsTest;
end HeadlightsTest;

