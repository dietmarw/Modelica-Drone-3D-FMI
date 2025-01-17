within DroneSimulation.Tests;
model controlModuleTest
  Electrical.controlModule controlModule(maxTilt=0.05, samplePeriod=0.01)
    annotation (Placement(transformation(extent={{-30,8},{-10,28}})));
   Mechanical.Chassis.Examples.droneChassis droneChassis1(length=0.25, m=0.5)
     annotation (Placement(transformation(extent={{46,6},{96,26}})));
  Electrical.propeller propellerRev(k=1)
    annotation (Placement(transformation(extent={{8,38},{28,58}})));
  Electrical.propeller propellerRev3(k=1)
    annotation (Placement(transformation(extent={{8,-4},{28,16}})));
  Electrical.propeller propellerRev1
    annotation (Placement(transformation(extent={{8,16},{28,36}})));
  Electrical.propeller propellerRev2
    annotation (Placement(transformation(extent={{8,-24},{28,-4}})));
  inner Modelica.Mechanics.MultiBody.World world(n(displayUnit="1") = {0,0,
      -1})
    annotation (Placement(transformation(extent={{60,60},{80,80}})));
  Blocks.Routing.RealExtendMultiple realExtendMultiple
    annotation (Placement(transformation(extent={{-58,8},{-38,28}})));
  Modelica.Blocks.Sources.Ramp ramp(          duration=0.5, height=5)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-80,-50})));
  Sensors.GPS gPS annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={18,-40})));
  Sensors.Accelerometer accelerometer
    annotation (Placement(transformation(extent={{8,-76},{28,-56}})));
  Modelica.Blocks.Continuous.FirstOrder firstOrder1(
    T=0.2,
    y_start=0,
    initType=Modelica.Blocks.Types.Init.InitialOutput)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-80,-20})));
  Modelica.Blocks.Sources.Constant const(k=0)
    annotation (Placement(transformation(extent={{-92,36},{-72,56}})));
  Blocks.Sources.circlePath circlePath
    annotation (Placement(transformation(extent={{-92,10},{-72,30}})));
  Modelica.Blocks.Sources.Constant const1(k=0)
    annotation (Placement(transformation(extent={{10,-36},{-10,-16}})));
equation
  connect(propellerRev.frame_a, droneChassis1.frame_a1) annotation (Line(
      points={{28,48},{36,48},{36,22},{46,22}},
      color={95,95,95},
      thickness=0.5));
  connect(propellerRev3.frame_a, droneChassis1.frame_a2) annotation (Line(
      points={{28,6},{32,6},{32,14},{46,14}},
      color={95,95,95},
      thickness=0.5));
  connect(propellerRev2.frame_a, droneChassis1.frame_a3) annotation (Line(
      points={{28,-14},{36,-14},{36,10},{46,10}},
      color={95,95,95},
      thickness=0.5));
  connect(propellerRev1.frame_a, droneChassis1.frame_a) annotation (Line(
      points={{28,26},{32,26},{32,18},{46,18}},
      color={95,95,95},
      thickness=0.5));
  connect(propellerRev.position, controlModule.y1) annotation (Line(points={{5.8,48},
           {-2,48},{-2,24},{-9,24}},          color={0,0,127}));
  connect(propellerRev1.position, controlModule.y) annotation (Line(points=
          {{5.8,26},{0,26},{0,20},{-9,20}}, color={0,0,127}));
  connect(propellerRev3.position, controlModule.y2) annotation (Line(points=
         {{5.8,6},{0,6},{0,16},{-9,16}}, color={0,0,127}));
  connect(propellerRev2.position, controlModule.y3) annotation (Line(points=
         {{5.8,-14},{-2,-14},{-2,12},{-9,12}}, color={0,0,127}));
  connect(controlModule.position, realExtendMultiple.y) annotation (Line(
        points={{-32,18},{-37,18}},                   color={0,0,127}));
  connect(gPS.frame_a, droneChassis1.frame_a3) annotation (Line(
      points={{28,-40},{36,-40},{36,10},{46,10}},
      color={95,95,95},
      thickness=0.5));
  connect(gPS.y, controlModule.GPS) annotation (Line(points={{7,-40},{-26,-40},
          {-26,6}},       color={0,0,127}));
  connect(accelerometer.frame_a, droneChassis1.frame_a3) annotation (Line(
      points={{28,-66},{36,-66},{36,10},{46,10}},
      color={95,95,95},
      thickness=0.5));
  connect(accelerometer.y, controlModule.Gyero) annotation (Line(points={{7,-66},
          {-20,-66},{-20,6}},       color={0,0,127}));
  connect(ramp.y, firstOrder1.u)
    annotation (Line(points={{-80,-39},{-80,-32}},   color={0,0,127}));
  connect(controlModule.yaw, const.y) annotation (Line(points={{-32,26},{-36,
          26},{-36,46},{-71,46}},      color={0,0,127}));
  connect(firstOrder1.y, realExtendMultiple.u2) annotation (Line(points={{
          -80,-9},{-80,2},{-64,2},{-64,12},{-58,12}}, color={0,0,127}));
  connect(circlePath.y, realExtendMultiple.u)
    annotation (Line(points={{-71,24},{-58,24}}, color={0,0,127}));
  connect(circlePath.y1, realExtendMultiple.u1) annotation (Line(points={{
          -71,16},{-66,16},{-66,18},{-58,18}}, color={0,0,127}));
  connect(controlModule.Height, const1.y) annotation (Line(points={{-14,6},
          {-14,-26},{-11,-26}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)),
    __Dymola_Commands(file="drone_animation_setup.mos"
        "drone_animation_setup"),
    experiment(StopTime=10));
end controlModuleTest;
