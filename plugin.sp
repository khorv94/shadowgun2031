#include <sourcemod>
 
public Plugin myinfo =
{
	name = "Shadowrun 2031",
	author = "Kirsten Horvath",
	description = "CS:S Mod based on Shadowrun(2007)",
	version = "1.0",
	url = "http://www.sourcemod.net/"
};

public void OnPluginStart()
{
	PrintToServer("Hello world!");
}