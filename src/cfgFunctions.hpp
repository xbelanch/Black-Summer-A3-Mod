class CfgFunctions
{
    class BSM
    {
        class Sandbox
        {
            file = "Sandbox";
        };
        class Common
        {
            file = "Common";
            class Bootstrap  { preInit = 0; postInit = 1; recompile = 0; }; // WIP
            class initLocalPlayer { preInit = 0; postInit = 0; recompile = 0; }; // WIP
            class getPlayersNear { }; // OK


        };
        class Schedule
        {
            file = "Schedule";
        };
        class Server
        {
            file = "Server";
            class initServer { preInit = 0; postInit = 0; recompile = 0; };
            class initPlayer { }; // EMPTY
            class missionTriggers { }; // WIP
        };
        class Spawning
        {
            file = "Spawning";
            class spawnPlane { }; // OK
            class spawnAerodrome { }; // EMPTY
        };
        class Environment
        {
            file = "Environment";
            class setWeather { }; // OK
            class setTime { }; // EMPTY

        };
        class Debug
        {
            file = "Debug";
            class log { }; // OK
            class inspect { }; // OK
        };
    };
};
