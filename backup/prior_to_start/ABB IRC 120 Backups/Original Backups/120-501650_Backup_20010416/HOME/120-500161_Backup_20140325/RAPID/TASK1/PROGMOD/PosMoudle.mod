MODULE PosMoudle
    !*****************************************************
    !Module Name: myModule
    !Version:     1.0
    !Description: -
    !Date:        -
    !Author:      -
    !*****************************************************
    
    CONST robtarget p10:=[[418.58,0.00,334.20],[0.69977,-5.36606E-06,0.714368,-1.01452E-05],[-1,-1,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget p20:=[[-1.07,-1.08,139.88],[0.0451007,-0.778367,0.0549816,-0.623769],[-1,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget p30:=[[2.03,-0.51,133.89],[0.0349432,-0.82279,0.0369736,-0.566064],[-1,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget p40:=[[4.97,-0.73,131.80],[0.0393754,-0.888543,0.0321793,-0.455966],[-1,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget p50:=[[7.35,-0.44,128.77],[0.0439458,-0.949176,0.025602,-0.310609],[-1,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget p60:=[[8.62,-0.05,125.77],[0.0466563,-0.979164,0.0202404,-0.1966],[-1,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget p70:=[[7.11,-0.05,123.96],[0.0471908,-0.984151,0.0189736,-0.16988],[-1,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget p80:=[[7.11,-0.05,123.96],[0.0406734,-0.991285,-0.0497359,-0.115008],[-1,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget p90:=[[4.75,0.00,123.15],[0.0228857,-0.987126,-0.142227,-0.0694926],[-1,-1,-2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget p100:=[[4.30,1.38,122.36],[0.0190123,-0.977767,-0.196515,-0.07065],[-1,-1,-2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget p110:=[[4.30,1.38,122.36],[0.00254443,0.877133,0.474641,0.0731204],[-1,-1,-2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget p120:=[[4.30,1.38,122.36],[0.00801003,0.838822,0.543448,0.0312508],[-1,-1,-2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget p130:=[[0.78,0.99,121.75],[0.0133946,0.729882,0.682811,0.0293496],[-1,-1,-3,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget p140:=[[395.07,52.94,69.21],[0.146773,-0.40343,-0.902897,-0.0218841],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget p150:=[[0.73,0.19,121.74],[0.00247764,0.730292,0.683065,0.00947357],[-1,-1,-3,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget p160:=[[0.62,3.16,122.50],[0.0216987,-0.999509,-0.0111852,0.0196521],[-1,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget p170:=[[0.15,1.60,122.60],[0.022889,-0.999681,-0.0106178,-0.00147162],[-1,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget p180:=[[0.33,0.75,122.56],[0.0405975,-0.99906,-0.000325195,-0.0151796],[-1,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget p190:=[[-5.04,9.32,128.15],[0.502915,0.733369,-0.411451,-0.199886],[-1,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget p200:=[[-7.89,9.59,127.41],[0.377726,0.806199,-0.437126,-0.127621],[-1,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget p210:=[[309.31,-185.13,57.93],[3.23688E-05,-0.711176,0.703014,2.50774E-05],[-1,0,-2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget p220:=[[309.31,-185.13,60.13],[3.17998E-05,-0.71117,0.70302,2.71847E-05],[-1,0,-2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget p230:=[[291.17,-178.69,59.38],[0.121864,0.177542,0.974817,-0.0579603],[-1,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget p240:=[[291.17,-178.69,59.38],[0.0237281,0.143256,0.987655,-0.0587628],[-1,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget p250:=[[294.50,-178.67,59.37],[0.0180936,0.0502125,0.996728,-0.0607034],[-1,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget p260:=[[296.33,-183.75,59.37],[0.00909617,-0.0948952,0.99347,-0.0626853],[-1,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget p270:=[[299.47,-185.58,56.25],[0.0201912,0.533122,-0.843665,0.060031],[-1,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget p280:=[[309.31,-185.13,57.93],[3.23688E-05,-0.711176,0.703014,2.50774E-05],[-1,0,-2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget p290:=[[309.31,-185.13,60.13],[3.17998E-05,-0.71117,0.70302,2.71847E-05],[-1,0,-2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    PERS robtarget pCCD2Cali:=[[225.89,-308.11,153.7],[6.08179E-05,-0.667482,0.744626,7.205E-05],[-1,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    PERS robtarget pCCD1:=[[27.95,-311.09,91.58],[1.85446E-06,0.676478,-0.736463,-3.54034E-05],[-1,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    PERS robtarget pPick:=[[-122.06,-373,87.55],[3.74264E-05,-0.659781,0.751458,3.53401E-05],[-2,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    PERS robtarget pInsert:=[[-0.86,-3.35,187.75],[0.0282224,-0.704061,0.044424,-0.708187],[-1,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    PERS robtarget pPickInkpad:=[[95.96,-268.40,36.54],[6.16608E-05,-0.66748,0.744628,7.40731E-05],[-1,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    PERS robtarget pCCD1Cali:=[[27.95,-311.09,91.58],[1.85446E-06,0.676478,-0.736463,-3.54034E-05],[-1,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
ENDMODULE