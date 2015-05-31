// Foot patrols Spawn on Demand / Despawn
// Countryside, 500 radius

if (!ADF_HC_execute) exitWith {}; // Autodetect: execute on the HC else execute on the server

// tFP1 (trigger Foot Patrols 1)
if ((isNil "g1") && (_this select 0 == "1A")) exitWith {
	g1 = [getPos tFP1, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OI_reconSentry")] call BIS_fnc_spawnGroup;
	[g1, getPos tFP1, 500, 7, "MOVE", "SAFE", "YELLOW", "LIMITED", "COLUMN", "this spawn CBA_fnc_taskSearchHouse", [1,4,9]] call CBA_fnc_taskPatrol;
};
if (_this select 0 == "1B") exitWith {if !(isNil "g1") then {{deleteVehicle _x} forEach units g1; deleteGroup g1; g1 = nil};};

// tFP2
if ((isNil "g2") && (_this select 0 == "2A")) exitWith {
	g2 = [getPos tFP2, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OI_reconSentry")] call BIS_fnc_spawnGroup;
	[g2, getPos tFP2, 500, 7, "MOVE", "SAFE", "YELLOW", "LIMITED", "COLUMN", "this spawn CBA_fnc_taskSearchHouse", [1,4,9]] call CBA_fnc_taskPatrol;
};
if (_this select 0 == "2B") exitWith {if !(isNil "g2") then {{deleteVehicle _x} forEach units g2; deleteGroup g2; g2 = nil};};

// tFP3
if ((isNil "g3") && (_this select 0 == "3A")) exitWith {
	g3 = [getPos tFP3, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OI_reconSentry")] call BIS_fnc_spawnGroup;
	[g3, getPos tFP3, 500, 7, "MOVE", "SAFE", "YELLOW", "LIMITED", "COLUMN", "this spawn CBA_fnc_taskSearchHouse", [1,4,9]] call CBA_fnc_taskPatrol;
};
if (_this select 0 == "3B") exitWith {if !(isNil "g3") then {{deleteVehicle _x} forEach units g3; deleteGroup g3; g3 = nil};};

// tFP4
if ((isNil "g4") && (_this select 0 == "4A")) exitWith {
	g4 = [getPos tFP4, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OI_reconSentry")] call BIS_fnc_spawnGroup;
	[g4, getPos tFP4, 500, 7, "MOVE", "SAFE", "YELLOW", "LIMITED", "COLUMN", "this spawn CBA_fnc_taskSearchHouse", [1,4,9]] call CBA_fnc_taskPatrol;
};
if (_this select 0 == "4B") exitWith {if !(isNil "g4") then {{deleteVehicle _x} forEach units g4; deleteGroup g4; g4 = nil};};

// tFP5
if ((isNil "g5") && (_this select 0 == "5A")) exitWith {
	g5 = [getPos tFP5, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OI_reconSentry")] call BIS_fnc_spawnGroup;
	[g5, getPos tFP5, 500, 7, "MOVE", "SAFE", "YELLOW", "LIMITED", "COLUMN", "this spawn CBA_fnc_taskSearchHouse", [1,4,9]] call CBA_fnc_taskPatrol;
};
if (_this select 0 == "5B") exitWith {if !(isNil "g5") then {{deleteVehicle _x} forEach units g5; deleteGroup g5; g5 = nil};};

// tFP6
if ((isNil "g6") && (_this select 0 == "6A")) exitWith {
	g6 = [getPos tFP6, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OI_reconSentry")] call BIS_fnc_spawnGroup;
	[g6, getPos tFP6, 500, 7, "MOVE", "SAFE", "YELLOW", "LIMITED", "COLUMN", "this spawn CBA_fnc_taskSearchHouse", [1,4,9]] call CBA_fnc_taskPatrol;
};
if (_this select 0 == "6B") exitWith {if !(isNil "g6") then {{deleteVehicle _x} forEach units g6; deleteGroup g6; g6 = nil};};

// tFP20 - armored platoon
if ((isNil "g20") && (isNil "g21") && (isNil "g22") && (_this select 0 == "20A")) exitWith {
	g20 = [getMarkerPos "mArm_1", EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OI_reconSentry")] call BIS_fnc_spawnGroup;
	g21 = [getMarkerPos "mArm_2", EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OI_reconSentry")] call BIS_fnc_spawnGroup;
	g22 = [getMarkerPos "mArm_3", EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfTeam")] call BIS_fnc_spawnGroup;
	[g22, getMarkerPos "mArm_3", 250, 4, "MOVE", "SAFE", "YELLOW", "LIMITED", "COLUMN", "", [5,10,30]] call CBA_fnc_taskPatrol;
	sleep 128;
	g23 = CreateGroup EAST; 
	_p = g23 createUnit ["O_Soldier_F",getPosASL tFP20,[],0,"SERGEANT"]; _p setDir 250; _p moveInGunner oStat_20;
	sleep 145;
	_p = g23 createUnit ["O_Soldier_F",getPosASL tFP20,[],0,"SERGEANT"]; _p setDir 260; _p moveInGunner oStat_21;
};
if (_this select 0 == "20B") exitWith {
	if !(isNil "g20") then {{deleteVehicle _x} forEach units g20; deleteGroup g20; g20 = nil};
	if !(isNil "g21") then {{deleteVehicle _x} forEach units g21; deleteGroup g21; g21 = nil};
	if !(isNil "g22") then {{deleteVehicle _x} forEach units g22; deleteGroup g22; g22 = nil};
	if !(isNil "g23") then {{deleteVehicle _x} forEach units g23; deleteGroup g23; g23 = nil};
};

// tFP30 - Pano CP
if ((isNil "g30") && (isNil "g31") && (_this select 0 == "30A")) exitWith {
	g30 = [getPos tFP30, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OI_reconSentry")] call BIS_fnc_spawnGroup;	
	g31 = CreateGroup EAST; 
	_p = g31 createUnit ["O_Soldier_F",getPosASL tFP30,[],0,"SERGEANT"]; _p setDir 250; _p moveInGunner oStat_30;
};
if (_this select 0 == "30B") exitWith {
	if !(isNil "g30") then {{deleteVehicle _x} forEach units g30; deleteGroup g30; g30 = nil};
	if !(isNil "g31") then {{deleteVehicle _x} forEach units g31; deleteGroup g31; g31 = nil};
};

