/*
	File: fn_openTAWVD.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Called via addAction and opens the TAW View Distance Menu
*/
waitUntil {time > 10};
if(!createDialog "TAW_VD") exitWith {hint "Something went wrong, the menu won't open?"};
disableSerialization;

ctrlSetText[2902, format["%1", tawvd_foot]];
ctrlSetText[2912, format["%1", tawvd_car]];
ctrlSetText[2922, format["%1", tawvd_air]];
ctrlSetText[2942, format["%1", tawvd_object]];

//Setup the sliders
{
	slidersetRange [_x select 0,100, _x select 2];
	((findDisplay 2900) displayCtrl (_x select 0)) sliderSetSpeed [100,100,100];
	sliderSetPosition[_x select 0, _x select 1];
} foreach [[2901,tawvd_foot,ADF_VD_foot],[2911,tawvd_car,ADF_VD_vehicle],[2921,tawvd_air,ADF_VD_air],[2941,tawvd_object,12000]];

((finddisplay 2900) displayCtrl 2931) cbSetChecked tawvd_syncObject;

if(tawvd_syncObject) then {
	ctrlEnable [2941,false];
} else {
	ctrlEnable [2941,true];
};