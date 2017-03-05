/*

										Cakes, Cookies, Icecreams, YUMMY FilterScript By RyderX :)
										
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
    pIcecream,
    pVIP
}
new PlayerInfo[MAX_PLAYERS][pInfo];
new viplabel;

forward DB_LOAD(playerid,name[],value[]);
public DB_LOAD(playerid,name[],value[])
{
	INI_Int("Cookie",PlayerInfo[playerid][pCookie]);
	INI_Int("Cake",PlayerInfo[playerid][pCake]);
	INI_Int("Icecream",PlayerInfo[playerid][pIcecream]);
	INI_Int("VIP",PlayerInfo[playerid][pVIP]);
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
	print("            Cookies: Burned!               \n");
	print("            Cakes: Taste the Cock!         \n");
	print("            Icecream: Ofk Freezes!         \n");
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

public OnPlayerDisconnect(playerid, reason)
{
   new INI:File = INI_Open(UserPath(playerid));
   INI_SetTag(File,"data");
   INI_WriteInt(File,"Cookie",PlayerInfo[playerid][pCookie]);
   INI_WriteInt(File,"Cake",PlayerInfo[playerid][pCake]);
   INI_WriteInt(File,"Icecream",PlayerInfo[playerid][pIcecream]);
   INI_WriteInt(File,"VIP",PlayerInfo[playerid][pVIP]);
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
        if(maxcookies < 0 || maxcookies > 10000000)
        {
        	return SendClientMessage( playerid, 0xF8F8F8FFF, "ERROR: {FFFFFF}highest amount is 10000000.");
		}
        else
        {
            GetPlayerName(playerid, pname, sizeof(pname));
            GetPlayerName(targetid, tname, sizeof(tname));
            format(string, sizeof(string), "{FFFF00}- {ff0000}Adm{00ffff}CMD{FFFF00} - {FFD700}%s {15ff00}has set {FFD700}%s {15ff00}Cookies Amount to {FFD700}%i{15ff00}.", pname, tname, maxcookies);
            SendClientMessageToAll(0xF8F8F8FFF, string);
            SendClientMessage(targetid, 0xF8F8f8FFF, "{f00f00}Info: {FFFFFF}use /cookieshelp for more info.");
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
        if(maxcakes < 0 || maxcakes > 1000000)
        {
        	return SendClientMessage( playerid, 0xF8F8F8FFF, "ERROR: {FFFFFF}highest amount is {15ff00}1000000.");
		}
        else
        {
            GetPlayerName(playerid, pname, sizeof(pname));
            GetPlayerName(targetid, tname, sizeof(tname));
            format(string, sizeof(string), "{FFFF00}- {ff0000}Adm{00ffff}CMD{FFFF00} - {FFD700}%s {15ff00}has set {FFD700}%s {15ff00}Cakes Amount to {FFD700}%i{15ff00}.", pname, tname, maxcakes);
            SendClientMessageToAll(0xF8F8F8FFF, string);
            //GameTextForPlayer(targetid,"~W~W~P~O~R~W! ~B~N~G~I~R~C~P~E! ~Y~C~R~A~B~K~G~E~P~S! ~R~:)",3000,3);
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
        if(maxicecream < 0 || maxicecream > 1000000)
        {
        	return SendClientMessage( playerid, 0xF8F8F8FFF, "ERROR: {FFFFFF}highest amount is {15ff00}1000000.");
		}
        else
        {
            GetPlayerName(playerid, pname, sizeof(pname));
            GetPlayerName(targetid, tname, sizeof(tname));
            format(string, sizeof(string), "{FFFF00}- {ff0000}Adm{00ffff}CMD{FFFF00} - {FFD700}%s {15ff00}has set {FFD700}%s {15ff00}IceCream Amount to {FFD700}%i{15ff00}.", pname, tname, maxicecream);
            SendClientMessageToAll(0xF8F8F8FFF, string);
            //GameTextForPlayer(targetid,"~W~W~P~O~R~W! ~B~N~G~I~R~C~P~E! ~R~ICECREAM! ~R~:)",3000,3);
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

CMD:givecookie(playerid, params[])
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
            return SendClientMessage(playerid, 0xF8F8F8FFF, "Syntax: {F00f00}/givecookie [ID] [Amount]");
        }
        if((!IsPlayerConnected(targetid)) || (targetid == INVALID_PLAYER_ID)) return SendClientMessage(playerid, 0xFF0000, "ERROR: {FFFFFF}Player isn't Connected!");
        if(maxcookies < 0 || maxcookies > 10000000) return SendClientMessage( playerid, 0xF8F8F8FFF, "ERROR: {FFFFFF}highest amount is 1000000.");
        GetPlayerName(playerid, pname, sizeof(pname));
        GetPlayerName(targetid, tname, sizeof(tname));
        format(string, sizeof(string), "{FFFF00}- {ff0000}Adm{00ffff}CMD{FFFF00} - {FFD700}%s {15ff00}has gave {FFD700}%s {FFD700}%i{15ff00}Icecreams!", pname, tname, maxcookies);
        SendClientMessageToAll(0xF8F8F8FFF, string);
        GameTextForPlayer(targetid,"~W~W~P~O~R~W! ~Y~N~G~I~R~C~P~E! ~Y~C~R~O~B~O~G~K~P~I~R~E~G~S ~R~:)",3000,3);
        SendClientMessage(playerid, 0xf9f9f9fff,"Info: {FFFFFF}/cookieshelp for more Cookies features!");
        new INI:File = INI_Open(UserPath(targetid));
        PlayerInfo[targetid][pCookie] += maxcookies;
        INI_WriteInt(File,"Cookie",maxcookies);
   	    INI_Close(File);
    }
    else
	    SendClientMessage(playerid, 0xf8F8F8FFF,"ERROR: {FFFFFF}You aren't authorized to use this command.");
    return 1;
}

CMD:givecake(playerid, params[])
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
            return SendClientMessage(playerid, 0xF8F8F8FFF, "Syntax: {F00f00}/givecake [ID] [Amount]");
        }
        if((!IsPlayerConnected(targetid)) || (targetid == INVALID_PLAYER_ID)) return SendClientMessage(playerid, 0xFF0000, "ERROR: {FFFFFF}Player isn't Connected!");
        if(maxcookies < 0 || maxcookies > 10000000) return SendClientMessage( playerid, 0xF8F8F8FFF, "ERROR: {FFFFFF}highest amount is 1000000.");
        GetPlayerName(playerid, pname, sizeof(pname));
        GetPlayerName(targetid, tname, sizeof(tname));
        format(string, sizeof(string), "{FFFF00}- {ff0000}Adm{00ffff}CMD{FFFF00} - {FFD700}%s {15ff00}has gave {FFD700}%s {FFD700}%i{15ff00}Cakes!", pname, tname, maxcookies);
        SendClientMessageToAll(0xF8F8F8FFF, string);
        GameTextForPlayer(targetid,"~W~W~P~O~R~W! ~Y~N~G~I~R~C~P~E! ~Y~C~R~A~B~K~G~E ~R~:)",3000,3);
        SendClientMessage(playerid, 0xf9f9f9fff,"Info: {FFFFFF}/cakeshelp for more Cakes features!");
        new INI:File = INI_Open(UserPath(targetid));
        PlayerInfo[targetid][pCake] += maxcookies;
        INI_WriteInt(File,"Cake",maxcookies);
   	    INI_Close(File);
    }
    else
    {
	SendClientMessage(playerid, 0xf8F8F8FFF,"ERROR: {FFFFFF}You aren't authorized to use this command.");
	}
    return 1;
}

CMD:giveicecream(playerid, params[])
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
            return SendClientMessage(playerid, 0xF8F8F8FFF, "Syntax: {F00f00}/giveiceream [ID] [Amount]");
        }
        if((!IsPlayerConnected(targetid)) || (targetid == INVALID_PLAYER_ID)) return SendClientMessage(playerid, 0xFF0000, "ERROR: {FFFFFF}Player isn't Connected!");
        if(maxcookies < 0 || maxcookies > 10000000) return SendClientMessage( playerid, 0xF8F8F8FFF, "ERROR: {FFFFFF}highest amount is 1000000.");
        GetPlayerName(playerid, pname, sizeof(pname));
        GetPlayerName(targetid, tname, sizeof(tname));
        format(string, sizeof(string), "{FFFF00}- {ff0000}Adm{00ffff}CMD{FFFF00} - {FFD700}%s {15ff00}has gave {FFD700}%s {FFD700}%i{15ff00}Icecreams!", pname, tname, maxcookies);
        SendClientMessageToAll(0xF8F8F8FFF, string);
        GameTextForPlayer(targetid,"~W~W~P~O~R~W! ~Y~N~G~I~R~C~P~E! ~Y~I~R~C~B~R~G~E~P~A~Y~M~B~E ~R~:)",3000,3);
        SendClientMessage(playerid, 0xf9f9f9fff,"Info: {FFFFFF}/icecreamshelp for more Icecream features!");
        new INI:File = INI_Open(UserPath(targetid));
        PlayerInfo[targetid][pIcecream] += maxcookies;
        INI_WriteInt(File,"Icecream",maxcookies);
   	    INI_Close(File);
    }
    else
    {
    SendClientMessage(playerid, 0xf8F8F8FFF,"ERROR: {FFFFFF}You aren't authorized to use this command.");
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
	 strcat(string,"{39f41c}Transfer 5 Cookies to 4,000$! (/transfer)\n");
     format(string, sizeof(string), string, name, PlayerInfo[playerid][pCookie]);
	 ShowPlayerDialog(playerid, 1, DIALOG_STYLE_MSGBOX, "Cookies Help", string,"Ok","");
	 return 1;
}


CMD:rocket(playerid,params[])
{
	 if(PlayerInfo[playerid][pCookie] >= 10)
	 {
	 GivePlayerWeapon(playerid, 35, 10);
	 PlayerInfo[playerid][pCookie] -= 10;
	 SendClientMessage(playerid, 0xf8f8f8fff, "{FFFF00}- {ff0000}Pla{00ffff}CMD{FFFF00} - {f00f77}You got a RPG with 10 Rounds!");
	 }
	 else
	 {
	 SendClientMessage(playerid, 0xf8f8f8fff,"ERROR:{FFFFFF} You don't have enough Cookies to buy RPG!");
	 }
	 return 1;
}

CMD:minigun(playerid,params[])
{
	 if(PlayerInfo[playerid][pCookie] >= 50)
	 {
	 GivePlayerWeapon(playerid, 38, 500);
	 PlayerInfo[playerid][pCookie] -= 50;
	 SendClientMessage(playerid, 0xf8f8f8fff, "{FFFF00}- {ff0000}Pla{00ffff}CMD{FFFF00} - {f00f77}You got a Minigun with 500 Rounds!");
	 }
	 else
	 {
	 SendClientMessage(playerid, 0xf8f8f8fff,"ERROR:{FFFFFF} You don't have enough Cookies to buy Minigun!");
	 }
	 return 1;
}

CMD:transfer(playerid,params[])
{
   if(PlayerInfo[playerid][pCookie] >= 5)
   {
	   GivePlayerMoney(playerid, 4000);
	   PlayerInfo[playerid][pCookie] -= 5;
	   SendClientMessage(playerid, 0xf8f8f8fff,"Info: {FFFF00}You've exchanged 5 cookies to 4,000$");
   }
   else
   {
   SendClientMessage(playerid, 0xf8f8f8fff,"ERROR: {FFFFFF}You don't have enough Cookies to transfer it to Money!");
   }
   return 1;
}

CMD:cakeshelp(playerid,params[])
{
	 new string[400];
	 new name[MAX_PLAYER_NAME];
	 GetPlayerName(playerid, name,sizeof(name));
	 strcat(string,"{39f41c}Hi {f7b91a}%s{39f41c}! {39f41c}you have {f7b91a}%i Cakes{39f41c}! Enjoy spending them!\n");
	 strcat(string,"{39f41c}Heal yourself by eating 2 Cakes! (/cake)\n");
	 strcat(string,"{39f41c}Transfer 2-Cakes to 4+ Cookies! (/givemecookie)\n");
	 strcat(string,"{39f41c}Annonce a Message Like 'You are Pro!'To All For 3-Cakes (/famous)\n");
     format(string, sizeof(string), string, name, PlayerInfo[playerid][pCake]);
	 ShowPlayerDialog(playerid, 1, DIALOG_STYLE_MSGBOX, "Cakes Help", string,"Ok","");
	 return 1;
}

CMD:cake(playerid,params[])
{
   if(PlayerInfo[playerid][pCake] >= 2)
   {
	   SetPlayerHealth(playerid, 100);
	   PlayerInfo[playerid][pCake] -= 2;
	   SendClientMessage(playerid, 0xf8f8f8fff,"Info: {FFFF00}You've Eated 2 Cakes!");
   }
   else
   {
   SendClientMessage(playerid, 0xf8f8f8fff,"ERROR: {FFFFFF}You don't have enough Cakes to Eat!");
   }
   return 1;
}

CMD:givemecookie(playerid,params[])
{
   if(PlayerInfo[playerid][pCake] >= 2)
   {
	   PlayerInfo[playerid][pCake] -= 2;
	   PlayerInfo[playerid][pCookie] += 4;
	   SendClientMessage(playerid, 0xf8f8f8fff,"Info: {FFFF00}You've exchanged 2 Cakes by 4 Cookies!");
   }
   else
   {
   SendClientMessage(playerid, 0xf8f8f8fff,"ERROR: {FFFFFF}You don't have enough Cakes to Exchange!");
   }
   return 1;
}

CMD:famous(playerid,params[])
{
   if(PlayerInfo[playerid][pCake] >= 3)
   {
	   PlayerInfo[playerid][pCake] -= 3;
	   SendClientMessage(playerid, 0xf8f8f8fff,"Info: {FFFF00}You've became Famous and Pro :P!");
	   new string[128];
	   new name[MAX_PLAYER_NAME];
	   GetPlayerName(playerid, name,sizeof(name));
	   format(string,sizeof(string),"~P~%s is a ~R~PRO! and ~G~FAMOUS!",name);
	   GameTextForAll(string,8000,6);
   }
   else
   {
   SendClientMessage(playerid, 0xf8f8f8fff,"ERROR: {FFFFFF}You don't have enough Cakes to spent!");
   }
   return 1;
}

CMD:icecreamshelp(playerid,params[])
{
	 new string[400];
	 new name[MAX_PLAYER_NAME];
	 GetPlayerName(playerid, name,sizeof(name));
	 strcat(string,"{39f41c}Hi {f7b91a}%s{39f41c}! {39f41c}you have {f7b91a}%i Icecreams{39f41c}! Enjoy spending them!\n");
	 strcat(string,"{39f41c}Armour yourself by eating 3 Icecream! (/icecream)\n");
	 strcat(string,"{39f41c}Become V.I.P By Exchanging 10 Icecreams for VIP! (/vip)\n");
	 strcat(string,"{39f41c}Get JetPack just for 2 Cookies! (/jetpack)\n");
     format(string, sizeof(string), string, name, PlayerInfo[playerid][pIcecream]);
	 ShowPlayerDialog(playerid, 1, DIALOG_STYLE_MSGBOX, "Icecream Help", string,"Ok","");
	 return 1;
}

CMD:icecream(playerid,params[])
{
   if(PlayerInfo[playerid][pIcecream] >= 2)
   {
	   SetPlayerArmour(playerid, 100);
	   PlayerInfo[playerid][pIcecream] -= 2;
	   SendClientMessage(playerid, 0xf8f8f8fff,"Info: {FFFF00}You've Eated 2 Icecreams!");
   }
   else
   {
   SendClientMessage(playerid, 0xf8f8f8fff,"ERROR: {FFFFFF}You don't have enough Icecream to Eat!");
   }
   return 1;
}

CMD:vip(playerid,params[])
{
   if(PlayerInfo[playerid][pIcecream] >= 10)
   {
	   PlayerInfo[playerid][pVIP] = 1;
	   PlayerInfo[playerid][pIcecream] -= 10;
	   SendClientMessage(playerid, 0xf8f8f8fff,"Info: {FFFF00}You've Bought V.I.P for 10 Icecreams! Type /vipcmds!");
   }
   else
   {
   SendClientMessage(playerid, 0xf8f8f8fff,"ERROR: {FFFFFF}You don't have enough Icecream to Spend!");
   }
   return 1;
}

//V.I.P Commands

CMD:vc(playerid, params[])
{

	if(PlayerInfo[playerid][pVIP] >= 1)
	{
		new msg[100], str[128], pname[MAX_PLAYER_NAME];
		GetPlayerName(playerid, pname,sizeof( pname));
		if(sscanf(params,"s",msg)) SendClientMessage(playerid, 0xF8f8f8fff,"Syntax: {F00f00}/vc <message>");
        format(str,sizeof(str),"{fd00cc}<V.I.P Chat> {55fd00}%s(%i): {00f6fd}%s", pname,playerid, msg);
		for(new i; i<MAX_PLAYERS; i++)
		{
			if(IsPlayerConnected(i) && PlayerInfo[i][pVIP] >= 1)
 		  	{
 			  	SendClientMessage(i,0xFA9205FF,str);
 		  	}
		}
	}
	else
	{
	    SendClientMessage(playerid, 0xf8F8F8FFF,"ERROR: {FFFF00}You must be a V.I.P membership to use this command!");
	}
	return 1;
}

CMD:blabel(playerid,params[])
{
	if(PlayerInfo[playerid][pVIP] == 1)
	{
	new string[128];
	viplabel = Create3DTextLabel("{00f88a}V.I.P", 0xF47A00FF, 30.0, 40.0, 50.0, 40.0, 0);
    Attach3DTextLabelToPlayer(viplabel, playerid, 0.0, 0.0, 0.7);
    format(string, sizeof(string), "{FFFF00}- {ff0000}v{00ffff}CMD{FFFF00} - You have enabled your V.I.P 3D Tag.");
    SendClientMessage(playerid, 0xf8f8f8fff, string);
    }
    else
    {
	SendClientMessage(playerid, 0xf8F8F8FFF,"ERROR: {FFFF00}You must be a Bronze V.I.P membership to use this command!");
	}
	return 1;
}

CMD:vheal(playerid,params[])
{
	if(PlayerInfo[playerid][pVIP] >= 1)
	{
	new string[128];
	SetPlayerHealth(playerid, 100);
    format(string, sizeof(string), "{FFFF00}- {ff0000}v{00ffff}CMD{FFFF00} - Your Health-Bare Has been Refilled!");
    SendClientMessage(playerid, 0xf8f8f8fff, string);
	}
	else
	{
	SendClientMessage(playerid, 0xf8F8F8FFF,"ERROR: {FFFF00}You must be a V.I.P membership to use this command!");
	}
	return 1;
}

CMD:varmour(playerid,params[])
{
	if(PlayerInfo[playerid][pVIP] >= 1)
	{
	new string[128];
	SetPlayerArmour(playerid, 100);
    format(string, sizeof(string), "{FFFF00}- {ff0000}v{00ffff}CMD{FFFF00} - Your Armour Has been Refilled!");
    SendClientMessage(playerid, 0xf8f8f8fff, string);
	}
	else
	{
	SendClientMessage(playerid, 0xf8F8F8FFF,"ERROR: {FFFF00}You must be a V.I.P membership to use this command!");
	}
	return 1;
}

CMD:vipskin(playerid, params[])
{
    if(PlayerInfo[playerid][pVIP] >= 1)
    {
    new string[128];
    new SkinID;

    if(sscanf(params, "i", SkinID)) return SendClientMessage(playerid, 0xf8f8f8fff, "Syntax: {F00f00}/vipskin (SkinID)");
    if(SkinID < 0 || SkinID > 311) return SendClientMessage(playerid, 0xf8f8f8fff, "ERROR: {FFFFFF}Invalid skinID (0 -> 311).");
    format(string, sizeof(string), "{FFFF00}- {ff0000}v{00ffff}CMD{FFFF00} - {ff0ff0}Your Skin has set to %d.", SkinID);
    SendClientMessage(playerid, 0xf8f8f8fff, string);
    SetPlayerSkin(playerid, SkinID);
    new INI:File = INI_Open(UserPath(playerid));
    INI_WriteInt(File,"Skin",SkinID);
    INI_Close(File);
    }
    else
    {
	SendClientMessage(playerid, 0xf8F8F8FFF,"ERROR: {FFFF00}You must be a V.I.P membership to use this command!");
    }
    return 1;
}
//

CMD:jetpack(playerid,params[])
{
	if(PlayerInfo[playerid][pIcecream] >= 2)
	{
	SetPlayerSpecialAction(playerid,SPECIAL_ACTION_USEJETPACK);
	PlayerInfo[playerid][pIcecream] -= 2;
    SendClientMessage(playerid, 0xf8f8f8fff,"Info: {FFFF00}You've Bought JetPack for 2 Icecreams!");
    }
    else
    {
    SendClientMessage(playerid, 0xf8f8f8fff,"ERROR: {FFFFFF}You don't have enough Icecreams to Spend!");
    }
    return 1;
}

CMD:vipcmds(playerid, params[])
{
	    if(PlayerInfo[playerid][pVIP] >= 1)
		{
		new string[1200];
		format(string, sizeof(string), "%s{F00F00}•V.I.P•\n\n",string);
		format(string, sizeof(string), "%s{98B0CD}1. {FFFF00}/vc -> V.I.P Chat\n", string);
		format(string, sizeof(string), "%s{98B0CD}2. {FFFF00}/vipskin -> to change your skin.\n", string);
		format(string, sizeof(string), "%s{98B0CD}3. {FFFF00}/vheal -> Heal yourself.\n", string);
		format(string, sizeof(string), "%s{98B0CD}4. {FFFF00}/varmour -> Armour yourself.\n", string);
		format(string, sizeof(string), "%s{98B0CD}5. {FFFF00}/blabel -> enable Bronze V.I.P 3D Tag.\n", string);
		format(string, sizeof(string), "%s{FFFF00}--------------------------------------------------\n", string);
		ShowPlayerDialog(playerid, 188, DIALOG_STYLE_MSGBOX, "VIP Commands", string, "OK", "Leave");
		}
		else
		{
		SendClientMessage(playerid, 0xF8F8f8FFF, "ERROR: {FFFF00}You must be a V.I.P membership to use this command!");
		}
        return 1;
}
