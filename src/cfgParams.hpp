class Params
{
    class BSM_Param_DayTime
    {
        title="Time Of Day";
        texts[]={ "Morning", "Day", "Evening", "Night", "Random", "Daytime", "Nighttime" };
        values[]={ 6, 12, 18, 0, 24, 25, 26 };
        default = 24;
    };
    class BSM_Param_TimeMultiplier
	{
	    title="Time Multiplier (Fasttime)";
		values[]={ 1, 6, 12, 24, 36, 60 };
		texts[]={"1:1 (Normal)", "1:6 (Day = 4 Hours)", "1:12 (Day = 2 Hours)", "1:24 (Day = 1 Hour)", "1:36 (Day = 40 Minutes)", "1:60 (Day = 24 Minutes)"} ;
		livechanges = 1;
		code = "if(isserver) then {setTimeMultiplier _this;};";
		default = 60;
	};
};
