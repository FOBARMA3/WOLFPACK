diag_log "ADF RPT: Init - executing init_client.sqf"; // Reporting. Do NOT edit/remove

player createDiarySubject ["Wolfpack Log","Wolfpack Log"];
player createDiaryRecord ["Wolfpack Log",["Wolf Communications Log","
<br/><br/><font color='#6c7169'>Le Wolfpack Log est le carnet de toutes les coms radio entre WOLF et le TOC<br/>
Les messages sont logués une fois portés à l écran. Tous les messages sont horo datés et sauvegardès dans l ordre d apparition.</font>
<br/><br/>
"]];

ADF_fnc_MOTS = {player allowDamage false; MotsActive = true};
ADF_fnc_MOTS_captive = {params ["_c"]; player setCaptive _c};

waitUntil {scriptDone ADF_getLoadOut}; // Wait till all units have their gear before continuing

sleep 3; // Loadout finished > pri weapon loaded

while {time < 25} do {
	if !(isNil "SOR_SSC_1") then {SOR_SSC_1 assignAsCargo vWolf_1; SOR_SSC_1 moveInCargo vWolf_1;}; sleep 0.035;
	if !(isNil "SOR_RM_1") then {SOR_RM_1 assignAsDriver vWolf_1; SOR_RM_1 moveInDriver vWolf_1;}; sleep 0.035;
	if !(isNil "SOR_UAV_1") then {SOR_UAV_1 assignAsCargo vWolf_1; SOR_UAV_1 moveInCargo vWolf_1;}; sleep 0.035;
	if !(isNil "SOR_RMM_1") then {SOR_RMM_1 assignAsCargo vWolf_1; SOR_RMM_1 moveInCargo vWolf_1;}; sleep 0.035;

	if !(isNil "SOR_RTL_1") then {SOR_RTL_1 assignAsCargo vWolf_2; SOR_RTL_1 moveInCargo vWolf_2;}; sleep 0.035;
	if !(isNil "SOR_RS_2") then {SOR_RS_2 assignAsDriver vWolf_2; SOR_RS_2 moveInDriver vWolf_2;}; sleep 0.035;
	if !(isNil "SOR_RS_3") then {SOR_RS_3 assignAsCargo vWolf_2; SOR_RS_3 moveInCargo vWolf_2;}; sleep 0.035;
	if !(isNil "SOR_RS_4") then {SOR_RS_4 assignAsCargo vWolf_2; SOR_RS_4 moveInCargo vWolf_2;}; sleep 0.035;
	if !(isNil "SOR_DEM_1") then {SOR_DEM_1 assignAsCargo vWolf_2; SOR_DEM_1 moveInCargo vWolf_2;}; sleep 0.035;
	
	if !(isNil "SOR_RTL_2") then {SOR_RTL_2 assignAsCargo vWolf_3; SOR_RTL_2 moveInCargo vWolf_3;}; sleep 0.035;
	if !(isNil "SOR_RS_5") then {SOR_RS_5 assignAsDriver vWolf_3; SOR_RS_5 moveInDriver vWolf_3;}; sleep 0.035;
	if !(isNil "SOR_RS_6") then {SOR_RS_6 assignAsCargo vWolf_3; SOR_RS_6 moveInCargo vWolf_3;}; sleep 0.035;
	if !(isNil "SOR_RS_7") then {SOR_RS_7 assignAsCargo vWolf_3; SOR_RS_7 moveInCargo vWolf_3;}; sleep 0.035;
	if !(isNil "SOR_AT_1") then {SOR_AT_1 assignAsCargo vWolf_3; SOR_AT_1 moveInCargo vWolf_3;};
};

if (!ADF_debug) then {waitUntil {ADF_missionInit}; sleep 5};

["TOC","JSOC TOC","JSOC TOC: Net. Contrôle radio. Parlez."] call ADF_fnc_MessageParser; sleep 9;
["WOLF","","Wolf: WOLF Parlez. Fort et clair. Parlez."] call ADF_fnc_MessageParser; sleep 12;
["TOC","JSOC TOC","JSOC TOC: Commandant, les identifiants sont les suivants :<br/><br/>TOC: Big foot. Break.<br />Votre identifiant: Phoenix. Terminé."] call ADF_fnc_MessageParser; sleep 30;
["TOC","JSOC TOC","Big Foot: Phoenix, dirigez vous vers le point RV. Break.<br/><br/>A RV vous rencontrerez notre contact local, Nikos Fotopoulos. Collationnez !"] call ADF_fnc_MessageParser; sleep 12;
["WOLF","","Phoenix: Reçu Big Foot, se rendre sur RV et rencontrer contact local. Terminé."] call ADF_fnc_MessageParser; sleep 40;
["TOC","JSOC TOC","Big Foot: Phoenix: Ne vous inquitez pas du bateau sur votre nord ouest. Break.<br/> C est un chalutier espion sovietique. Break.<br/>Nous avons brouillé ses coms. Il ne devrait pas perturber votre opération. Terminé."] call ADF_fnc_MessageParser;

ADF_fnc_Retaliate = {
	sleep 120;		
	["TOC","JSOC TOC","Big Foot: Phoenix, message prioritaire."] call ADF_fnc_MessageParser; sleep 9;
	["WOLF","","Phoenix: Envoyez message."] call ADF_fnc_MessageParser; sleep 9;
	["TOC","JSOC TOC","Big Foot: SatNav nous informe qu un hélico KAJMAN vient de décoller de l'héliport d'Abdera et se dirige vers FRINI. ETA 3 Mikes. Terminé."] call ADF_fnc_MessageParser; sleep 14;
	["WOLF","","Phoenix: Suivi. Terminé."] call ADF_fnc_MessageParser; sleep 12;
};

ADF_msg_kallaziz = {
	["WOLF","","Phoenix: Big Foot,  de Phoenix. Message à transmettre."] call ADF_fnc_MessageParser; sleep 11;
	["TOC","JSOC TOC","Big Foot: Prêt transmettez Phoenix."] call ADF_fnc_MessageParser; sleep 10;
	["WOLF","","Phoenix: Big Foot, le colis est empaqueté. Collationnez"] call ADF_fnc_MessageParser; sleep 11;
	["TOC","JSOC TOC","Big Foot: Attendez. Terminé."] call ADF_fnc_MessageParser; sleep 22;
	["TOC","JSOC TOC","Big Foot: Colis empaqueté confirmé. Urgent/<br /><br />Procedez exfiltration vers Victor. Collationnez !"] call ADF_fnc_MessageParser; sleep 14;
	["WOLF","","Phoenix: Reçu. Victor pour notre retour à la maison. Terminé."] call ADF_fnc_MessageParser; 
};

ADF_msg_rv = {
	if (rvDone) exitWith {};
	["WOLF","","Phoenix: Big Foot de Phoenix. Nous sommes à RV."] call ADF_fnc_MessageParser; sleep 7;
	["TOC","JSOC TOC","Big Foot: Reçu Phoenix. Votre contact devrait être dans l église. Terminé."] call ADF_fnc_MessageParser;
};

ADF_msg_nikos = {
	rvDone = true;
	["NONE","Nikos Fotopoulos","Phoenix, bienvenue sur Altis. Mon nom est Nikos Fotopoulos. Je suis votre contact sur Altis."] call ADF_fnc_MessageParser; sleep 11;
	["NONE","Nikos Fotopoulos","Je viens juste d'être en contact avec Big Foot pour un bulletin. Votre mission est la suivante:<br/><br/>1. Dirigea vous discretement vers la base de Frini<br/>2. Observez la base et attendez que le colis arrive par hélico.<br/>3. Le colis est le Maj. F. Kallaziz, la tête du CSAT Intelligence Services. Eliminez le colis.<br/>4. Puis rendez vous discretement au point d´extiltration Cap. Agrios où vous embarquerez dans un bateau patrouilleur.<br/><br/>J ai pris la liberté de marquer la position sur votre carte.Bonne chance commandant."] call ADF_fnc_MessageParser; sleep 24;
	["WOLF","","Phoenix: Merci Nikos."] call ADF_fnc_MessageParser; sleep 5;
	["WOLF","","Phoenix: Big Foot, message. Terminé."] call ADF_fnc_MessageParser; sleep 7;
	["TOC","JSOC TOC","Big Foot: Envoyez message."] call ADF_fnc_MessageParser; sleep 8;
	["WOLF","","Phoenix: Avons été briefé par notre contact. Break.</br>Sommes prêts pour exécuter notre mission. Terminé."] call ADF_fnc_MessageParser; sleep 5;
	["TOC","JSOC TOC","Big Foot: Reçu Phoenix. Pas d´info complémentaire à rajouter pour le moment. Terminé."] call ADF_fnc_MessageParser; sleep 8;
};

ADF_fnc_kallazizActive = {
	sleep 190;
	["TOC","JSOC TOC","Big Foot: Phoenix, demandons CR de situation. Terminé."] call ADF_fnc_MessageParser; sleep 11;
	private ["_p","_msg"];
	_p = getPosASL (leader (group player));
	_msg = format ["Phoenix: Pappa %3. Break.<br/>Position Pappa Victor %1 . %2. Terminé.",round (_p select 0), round (_p select 1), {alive _x} count (allPlayers - entities "HeadlessClient_F")];
	["WOLF","",_msg] call ADF_fnc_MessageParser; sleep 11;
	["TOC","JSOC TOC","Big Foot: Reçu Phoenix. Terminé."] call ADF_fnc_MessageParser; sleep 11;
	waitUntil {sleep 2; kallaziz_active};
	["TOC","JSOC TOC","Big Foot: Phoenix, message terminé."] call ADF_fnc_MessageParser; sleep 8;
	["WOLF","","Phoenix: Envoyez message. Terminé."] call ADF_fnc_MessageParser; sleep 11;
	["TOC","JSOC TOC","Big Foot: Phoenix, Satnav vient juste d.identifier un hélico se dirigeant vers Frini base. Break.</br>Ce doit être le colis. Prenez position pour l'emmener. Parlez"] call ADF_fnc_MessageParser; sleep 22;
	["WOLF","","Phoenix: Reçu. Terminé."] call ADF_fnc_MessageParser;
};

ADF_fnc_exfil = {
	["NONE","Neptune","Phoenix, C´est Neptune. Nous sommes chez vous. ETA 3 mikes. Terminé."] call ADF_fnc_MessageParser; sleep 14;
	["WOLF","","Phoenix: Reçu Neptune. Terminé."] call ADF_fnc_MessageParser;
	ADF_endMission = true;
	
	waitUntil {sleep 1; wpEnd};
	Sleep 10;
	if (!alive Kallaziz_1) exitWith {
		_l = ["tLayer"] call BIS_fnc_rscLayer; 
		_l cutText ["", "BLACK", 10];
		["<img size= '10' shadow='false' image='Img\wpintro.paa'/><br/><br/><t size='.7' color='#FFFFFF'>Day 01 | Le Colis</t>",0,0,3,4] spawn BIS_fnc_dynamicText;
		sleep 5;
		['END1',true,5] call BIS_fnc_endMission;
	};
	if (alive Kallaziz_1) exitWith {["END2",false,5] call BIS_fnc_endMission;};
};

