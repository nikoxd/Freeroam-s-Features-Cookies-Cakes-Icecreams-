/*

										Cake Cookies Icecream YUMMY FilterScript By RyderX :)
										
										*/

//-----------------------
#define FILTERSCRIPT
//-----------------------
#include <a_samp>
#include <zcmd>
#include <sscanf>
#include <YSI\y_ini>
#define PATH "User/%s.ini"

enum pInfo
{
    pCookie,
    pCake,
    pIcecream
}
new PlayerInfo[MAX_PLAYERS][pInfo];


forward LoadUser_data(playerid,name[],value[]);
public LoadUser_data(playerid,name[],value[])
{
	INI_Int("Cookie",PlayerInfo[playerid][pCookie]);
	INI_Int("Cake",PlayerInfo[playerid][pCake]);
	INI_Int("Icecream",PlayerInfo[playerid][pIcecream]);
 	return 1;
}

stock UserPath(playerid)
{
	new string[128],pname[MAX_PLAYER_NAME];
	GetPlayerName(playerid,pname,sizeof(pname));
	format(string,sizeof(string),PATH,pname);
	return string;
}

public OnFilterScriptInit()
{
	print("\n========================================");
	print("Freeroam Features..... Has been >>LOADED<<\n");
	print("            Cookies: Loaded               \n");
	print("            Cakes: Taste the Cock         \n");
	print("            Icecream: Ofk Freezes         \n");
	print("            Scripter: RyderX            \n");
	print("     Result of Bugs Searching: NO BUGS  \n");
	print("WARNING: If you Found any bug or Error or Problem\n");
	print("     Just Contact RyderX From this Link\n");
	print("------------------------------------------------------\n");
	print("     http://forum.sa-mp.com/member.php?u=287311    \n");
	print("------------------------------------------------------\n");
	print("       Thanks For using This system!          \n");
	print("==========================================\n");
	return 1;
}

public OnPlayerConnect(playerid)
{
	return 1;
}
   
public OnPlayerDisconnect(playerid, reason)
{
   new INI:File = INI_Open(UserPath(playerid));
   INI_SetTag(File,"data");
   INI_WriteInt(File,"Cookie",PlayerInfo[playerid][pCookie]);
   INI_WriteInt(File,"Cake",PlayerInfo[playerid][pCake]);
   INI_WriteInt(File,"Icecream",PlayerInfo[playerid][pIcecream]);
   INI_Close(File);
   return 1;
}


//  -       - Rcon Commands         -          -//
CMD:setcookie(playerid, params[])
{
    if(IsPlayerAdmin(playerid))
    {
        new
             string[400],
             pname[MAX_PLAYER_NAME],
             tname[MAX_PLAYER_NAME],
             targetid,
             maxcookies;

		if(sscanf(params, "ii", targetid, maxcookies))
        {
            return SendClientMessage(playerid, 0xF8F8F8FFF, "Syntax: {F00f00}/setcookie [ID] [Amount]");
        }
        for(new i=0;i<MAX_PLAYERS; i++) continue; {
                 if((!IsPlayerConnected(targetid)) || (targetid == INVALID_PLAYER_ID))
                {
                       SendClientMessage(playerid, 0xFF0000, "ERROR: {FFFFFF}Player isn't Connected!");
                }
	}
        if(maxcookies < 0 || maxcookies > 100000000000)
        {
        	return SendClientMessage( playerid, 0xF8F8F8FFF, "ERROR: {FFFFFF}highest amount is 100000000000.");
		}
        else
        {
            GetPlayerName(playerid, pname, sizeof(pname));
            GetPlayerName(targetid, tname, sizeof(tname));
            format(string, sizeof(string), "{a0a1a1}[INFO] {FFD700}%s {99bec3}has set {FFD700}%s {15ff00}Cookies {99bec3}Amount to {FFD700}%i{99bec3}.", pname, tname, maxcookies);
            SendClientMessageToAll(0xF8F8F8FFF, string);
            GameTextForPlayer(targetid,"~W~W~P~O~R~W! ~B~N~G~I~R~C~P~E! ~Y~C~R~O~B~O~G~K~P~I~R~E~G~S ~R~:)",3000,3);
            SendClientMessage(targetid, 0xF8F8f8FFF, "{a0a1a1}Info: {FFFFFF}use /cookieshelp for more info.");
            new INI:File = INI_Open(UserPath(targetid));
            PlayerInfo[targetid][pCookie] = maxcookies;
            INI_WriteInt(File,"Cookie",maxcookies);
       	    INI_Close(File);
            return 1;
        }
    }
    else
    {
	    SendClientMessage(playerid, 0xf8F8F8FFF,"ERROR: {FFFFFF}You aren't authorized to use this command.");
    }
    return 1;
}

CMD:setcake(playerid, params[])
{
    if(IsPlayerAdmin(playerid))
	{
        new string[400],
             pname[MAX_PLAYER_NAME],
             tname[MAX_PLAYER_NAME],
             targetid,
             maxcakes;

		if(sscanf(params, "ii", targetid, maxcakes))
        {
            return SendClientMessage(playerid, 0xF8F8F8FFF, "Syntax: {F0f00f}/setcake [ID] [Amount]");
        }
        for(new i=0;i<MAX_PLAYERS; i++) continue; {
                 if((!IsPlayerConnected(targetid)) || (targetid == INVALID_PLAYER_ID))
                {
                       SendClientMessage(playerid, 0xFF0000, "ERROR: {FFFFFF}Player isn't Connected!");
                }
	}
        if(maxcakes < 0 || maxcakes > 100000000000)
        {
        	return SendClientMessage( playerid, 0xF8F8F8FFF, "ERROR: {FFFFFF}highest amount is {15ff00}100000000000.");
		}
        else
        {
            GetPlayerName(playerid, pname, sizeof(pname));
            GetPlayerName(targetid, tname, sizeof(tname));
            format(string, sizeof(string), "{a0a1a1}[INFO] {FFD700}%s {99bec3}has set {FFD700}%s {15ff00}Cakes {99bec3}Amount to {FFD700}%i{99bec3}.", pname, tname, maxcakes);
            SendClientMessageToAll(0xF8F8F8FFF, string);
            GameTextForPlayer(targetid,"~W~W~P~O~R~W! ~B~N~G~I~R~C~P~E! ~Y~C~R~A~B~K~G~E~P~S! ~R~:)",3000,3);
            SendClientMessage(targetid, 0xF8F8f8FFF, "{f00f00}Info: {FFFFFF}use /cakeshelp for more info.");
            new INI:File = INI_Open(UserPath(targetid));
            PlayerInfo[targetid][pCake] = maxcakes;
            INI_WriteInt(File,"Cake",maxcakes);
       	    INI_Close(File);
            return 1;
        }
    }
    else
    {
	    SendClientMessage(playerid, 0xf8F8F8FFF,"ERROR: {FFFFFF}You are not authorized to use this command.");
    }
    return 1;
}

CMD:seticecream(playerid, params[])
{
    if(IsPlayerAdmin(playerid))
    {
        new string[400],
             pname[MAX_PLAYER_NAME],
             tname[MAX_PLAYER_NAME],
             targetid,
             maxicecream;

		if(sscanf(params, "ii", targetid, maxicecream))
        {
            return SendClientMessage(playerid, 0xF8F8F8FFF, "Syntax: {F0f00f}/seticecream [ID] [Amount]");
        }
        for(new i=0;i<MAX_PLAYERS; i++) continue; {
                 if((!IsPlayerConnected(targetid)) || (targetid == INVALID_PLAYER_ID))
                {
                       SendClientMessage(playerid, 0xFF0000, "ERROR: {FFFFFF}Player isn't Connected!");
                }
	}
        if(maxicecream < 0 || maxicecream > 100000000000)
        {
        	return SendClientMessage( playerid, 0xF8F8F8FFF, "ERROR: {FFFFFF}highest amount is {15ff00}100000000000.");
		}
        else
        {
            GetPlayerName(playerid, pname, sizeof(pname));
            GetPlayerName(targetid, tname, sizeof(tname));
            format(string, sizeof(string), "{a0a1a1}[INFO] {FFD700}%s {99bec3}has set {FFD700}%s {15ff00}Icecream {99bec3}Amount to {FFD700}%i{99bec3}.", pname, tname, maxicecream);
            SendClientMessageToAll(0xF8F8F8FFF, string);
            GameTextForPlayer(targetid,"~W~W~P~O~R~W! ~B~N~G~I~R~C~P~E! ~R~ICECREAM! ~R~:)",3000,3);
            SendClientMessage(targetid, 0xF8F8f8FFF, "{f00f00}Info: {FFFFFF}use /icecreamhelp for more info.");
            new INI:File = INI_Open(UserPath(targetid));
            PlayerInfo[targetid][pIcecream] = maxicecream;
            INI_WriteInt(File,"Icecream",maxicecream);
       	    INI_Close(File);
            return 1;
        }
    }
    else
    {
	    SendClientMessage(playerid, 0xf8F8F8FFF,"ERROR: {FFFFFF}You are not authorized to use this command.");
    }
    return 1;
}

// -            -                     -                   -


// -          -    Normal Commands          -          -                //

CMD:cookieshelp(playerid,params[])
{
	 new string[400];
	 new name[MAX_PLAYER_NAME];
	 GetPlayerName(playerid, name,sizeof(name));
	 strcat(string,"{39f41c}Hi {f7b91a}%s{39f41c}! {39f41c}you have {f7b91a}%i Cookies{39f41c}! Enjoy spending them!\n");
	 strcat(string,"{39f41c}Get Rocket Launcher with 10 rounds just by spending {f7b91a}10 {39f41c}Cookies! (/rocket)\n");
	 strcat(string,"{39f41c}Get Mini-gun with 500 rounds just by spending {f7b91a}50 {39f41c}Cookies! (/minigun)\n");
     format(string, sizeof(string), string, name, PlayerInfo[playerid][pCookie]);
	 ShowPlayerDialog(playerid, 1, DIALOG_STYLE_MSGBOX, "Cookies Help", string,"Ok","");
	 return 1;
}

CMD:minigun(playerid,params[])
{
	 if(PlayerInfo[playerid][pCookie] > 50)
	 {
	 GivePlayerWeapon(playerid, 38, 500);
	 SendClientMessage(playerid, 0xf8f8f8fff, "{FFFF00}- {ff0000}Pla{00ffff}CMD{FFFF00} - {f00f77}You got a Minigun with 500 Rounds!");
	 }
	 else
	 {
	 SendClientMessage(playerid, 0xf8f8f8fff,"ERROR:{FFFFFF} You don't have enough Cookies to buy RPG!");
	 }
	 return 1;
}

COMMAND:givecookie(playerid, params[])
{
    if(IsPlayerAdmin(playerid)) // change this to your admin system.
    {
        new target;
        new amount;
        if(sscanf(params, "ud", target, amount)) return SendClientMessage(playerid, 0xf8f8f8fff, "Syntax: {f00f00}/givecookie [playerid] [amount]");
		{
            new str[128];
            format(str, sizeof(str), "Your Cookies is now %d .", amount);
            SendClientMessage(playerid, 0xFFFFFFF, str);
            PlayerInfo[playerid][pCookie] == amount; //change to your system.
            new INI:File = INI_Open(UserPath(target));
            INI_WriteInt(File,"Cookie",amount);
       	    INI_Close(File);
        }
    }
    else SendClientMessage(playerid, -1, "Urm... This command is not scripted yet. Use /help to see new commands.");
    return 1;
}

