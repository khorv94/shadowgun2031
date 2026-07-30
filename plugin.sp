#include <sourcemod>
 
public Plugin myinfo =
{
	name = "Shadowrun 2031",
	author = "Koose",
	description = "My first plugin ever",
	version = "1.0",
	url = "http://www.sourcemod.net/"
};

public void OnPluginStart()
{
	PrintToServer("Hello world!");
}