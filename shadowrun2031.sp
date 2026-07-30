#include <sourcemod>
#include <sdktools>
#include <sdkhooks>
 
public Plugin myinfo =
{
	name = "Shadowrun 2031",
	author = "Kirsten Horvath",
	description = "CS:S Mod based on Shadowrun(2007)",
	version = "1.0",
	url = "http://www.sourcemod.net/"
};


// public Handle:g_hAdminFlag;

public void OnPluginStart()
{
    // g_hAdminFlag = CreateConVar("admin_skins_flag", "z", "Flag für Admin-Skins");
    HookEvent("player_spawn", Event_PlayerSpawn, EventHookMode_Post);
    PrecacheModels();
}

public void PrecacheModels()
{
    PrecacheModel("models/player/ics/t_human/t_leet.mdl", true);
    PrecacheModel("models/player/ics/ct_human/urban.mdl", true);
    PrecacheModel("models/player/ics/t_dwarf/t_arctic.mdl", true);
    PrecacheModel("models/player/ics/t_elf/t_guerilla.mdl", true);
    PrecacheModel("models/player/ics/t_troll/terror.mdl", true);
    PrecacheModel("models/player/ics/ct_elf/ct_gign.mdl", true);
    PrecacheModel("models/player/ics/ct_dwarf/ct_gsg9.mdl", true);
    PrecacheModel("models/player/ics/ct_troll/ct_sas.mdl", true);
    PrintToServer("Models successfully preloaded.");
}

// Add Materials to Download List
public void OnClientConnected(int client)
{
    // Adding T side model files to the download list
    AddFileToDownloadsTable("models/player/ics/t_human/t_leet.mdl");
    AddFileToDownloadsTable("models/player/ics/t_human/t_leet.dx80.vtx");
    AddFileToDownloadsTable("models/player/ics/t_human/t_leet.dx90.vtx");
    AddFileToDownloadsTable("models/player/ics/t_human/t_leet.phy");
    AddFileToDownloadsTable("models/player/ics/t_human/t_leet.sw.vtx");
    AddFileToDownloadsTable("models/player/ics/t_human/t_leet.vvd");
    
    AddFileToDownloadsTable("models/player/ics/t_elf/t_guerilla.dx80.vtx");
    AddFileToDownloadsTable("models/player/ics/t_elf/t_guerilla.dx90.vtx");
    AddFileToDownloadsTable("models/player/ics/t_elf/t_guerilla.mdl");
    AddFileToDownloadsTable("models/player/ics/t_elf/t_guerilla.phy");
    AddFileToDownloadsTable("models/player/ics/t_elf/t_guerilla.sw.vtx");
    AddFileToDownloadsTable("models/player/ics/t_elf/t_guerilla.vvd");
    
    AddFileToDownloadsTable("models/player/ics/t_dwarf/t_arctic.dx80.vtx");
    AddFileToDownloadsTable("models/player/ics/t_dwarf/t_arctic.dx90.vtx");
    AddFileToDownloadsTable("models/player/ics/t_dwarf/t_arctic.mdl");
    AddFileToDownloadsTable("models/player/ics/t_dwarf/t_arctic.phy");
    AddFileToDownloadsTable("models/player/ics/t_dwarf/t_arctic.sw.vtx");
    AddFileToDownloadsTable("models/player/ics/t_dwarf/t_arctic.vvd");
    
    AddFileToDownloadsTable("models/player/ics/t_troll/terror.dx80.vtx");
    AddFileToDownloadsTable("models/player/ics/t_troll/terror.dx90.vtx");
    AddFileToDownloadsTable("models/player/ics/t_troll/terror.mdl");
    AddFileToDownloadsTable("models/player/ics/t_troll/terror.phy");
    AddFileToDownloadsTable("models/player/ics/t_troll/terror.sw.vtx");
    AddFileToDownloadsTable("models/player/ics/t_troll/terror.vvd");

    
	// Adding CT side model files to the download list
    AddFileToDownloadsTable("models/player/ics/ct_human/urban.mdl");
    AddFileToDownloadsTable("models/player/ics/ct_human/urban.dx80.vtx");
    AddFileToDownloadsTable("models/player/ics/ct_human/urban.dx90.vtx");
    AddFileToDownloadsTable("models/player/ics/ct_human/urban.phy");
    AddFileToDownloadsTable("models/player/ics/ct_human/urban.sw.vtx");
    AddFileToDownloadsTable("models/player/ics/ct_human/urban.vvd");
    
    AddFileToDownloadsTable("models/player/ics/ct_elf/ct_gign.dx80.vtx");
    AddFileToDownloadsTable("models/player/ics/ct_elf/ct_gign.dx90.vtx");
    AddFileToDownloadsTable("models/player/ics/ct_elf/ct_gign.mdl");
    AddFileToDownloadsTable("models/player/ics/ct_elf/ct_gign.phy");
    AddFileToDownloadsTable("models/player/ics/ct_elf/ct_gign.sw.vtx");
    AddFileToDownloadsTable("models/player/ics/ct_elf/ct_gign.vvd");
    
    AddFileToDownloadsTable("models/player/ics/ct_dwarf/ct_gsg9.dx80.vtx");
    AddFileToDownloadsTable("models/player/ics/ct_dwarf/ct_gsg9.dx90.vtx");
    AddFileToDownloadsTable("models/player/ics/ct_dwarf/ct_gsg9.mdl");
    AddFileToDownloadsTable("models/player/ics/ct_dwarf/ct_gsg9.phy");
    AddFileToDownloadsTable("models/player/ics/ct_dwarf/ct_gsg9.sw.vtx");
    AddFileToDownloadsTable("models/player/ics/ct_dwarf/ct_gsg9.vvd");
    
    AddFileToDownloadsTable("models/player/ics/ct_troll/ct_sas.dx80.vtx");
    AddFileToDownloadsTable("models/player/ics/ct_troll/ct_sas.dx90.vtx");
    AddFileToDownloadsTable("models/player/ics/ct_troll/ct_sas.mdl");
    AddFileToDownloadsTable("models/player/ics/ct_troll/ct_sas.phy");
    AddFileToDownloadsTable("models/player/ics/ct_troll/ct_sas.sw.vtx");
    AddFileToDownloadsTable("models/player/ics/ct_troll/ct_sas.vvd");

    
	// Adding material files to the download list
    AddFileToDownloadsTable("materials/models/player/ics/ct_human/ct_urban.vmt");
    AddFileToDownloadsTable("materials/models/player/ics/ct_human/ct_urban.vtf");

    // Example of adding additional material files
    AddFileToDownloadsTable("materials/models/player/ics/ct_elf/ct_gign.vmt");
    AddFileToDownloadsTable("materials/models/player/ics/ct_elf/ct_gign.vtf");
    AddFileToDownloadsTable("materials/models/player/ics/ct_elf/ct_gign_glass.vmt");

    AddFileToDownloadsTable("materials/models/player/ics/ct_dwarf/ct_gsg9.vmt");
    AddFileToDownloadsTable("materials/models/player/ics/ct_dwarf/ct_gsg9.vtf");

    AddFileToDownloadsTable("materials/models/player/ics/ct_troll/ct_sas.vmt");
    AddFileToDownloadsTable("materials/models/player/ics/ct_troll/ct_sas.vtf");
    AddFileToDownloadsTable("materials/models/player/ics/ct_troll/ct_sas_glass.vmt");

    AddFileToDownloadsTable("materials/models/player/ics/t_troll/t_phoenix.vmt");
    AddFileToDownloadsTable("materials/models/player/ics/t_troll/t_phoenix.vtf");

    AddFileToDownloadsTable("materials/models/player/ics/t_dwarf/t_arctic.vmt");
    AddFileToDownloadsTable("materials/models/player/ics/t_dwarf/t_arctic.vtf");

    AddFileToDownloadsTable("materials/models/player/ics/t_elf/t_guerilla.vmt");
    AddFileToDownloadsTable("materials/models/player/ics/t_elf/t_guerilla.vtf");

    AddFileToDownloadsTable("materials/models/player/ics/t_human/t_leet.vmt");
    AddFileToDownloadsTable("materials/models/player/ics/t_human/t_leet.vtf");
    AddFileToDownloadsTable("materials/models/player/ics/t_human/t_leet_glass.vmt");
}

public Action:Event_PlayerSpawn(Event event, const char[] name, bool dontBroadcast)
{
    int client = GetClientOfUserId(GetEventInt(event, "userid"));

    if (IsClientInGame(client)) // && IsPlayerAdmin(client))
    {
        PrecacheModel("models/player/ics/t_human/t_leet.mdl", true); // Caching the model
		PrecacheModel("models/player/ics/t_troll/terror.mdl", true); // Caching the model
		PrecacheModel("models/player/ics/t_dwarf/t_arctic.mdl", true); // Caching the model
		PrecacheModel("models/player/ics/t_elf/t_guerilla.mdl", true); // Caching the model		
		PrecacheModel("models/player/ics/ct_troll/ct_sas.mdl", true); // Caching the model
		PrecacheModel("models/player/ics/ct_dwarf/ct_gsg9.mdl", true); // Caching the model
		PrecacheModel("models/player/ics/ct_elf/ct_gign.mdl", true); // Caching the model
		PrecacheModel("models/player/ics/ct_human/urban.mdl", true); // Caching the model
        SetPlayerSkin(client);
    }   
    return Plugin_Continue;
}

// bool:IsPlayerAdmin(int client)
// {
//     bool isAdmin = GetUserAdmin(client) != INVALID_ADMIN_ID;
//     return isAdmin;
// }

void SetPlayerSkin(int client)
{
    char modelPath[PLATFORM_MAX_PATH];

    int team = GetClientTeam(client);

    
	// Check the client's current models
    char currentModel[PLATFORM_MAX_PATH];
    GetClientModel(client, currentModel, sizeof(currentModel));

    // T side
    if (team == 2) 
    {
        if (StrContains(currentModel, "leet") != -1)
        {
            Format(modelPath, sizeof(modelPath), "models/player/ics/t_human/t_leet.mdl");
        }
        else if (StrContains(currentModel, "arctic") != -1)
        {
            Format(modelPath, sizeof(modelPath), "models/player/ics/t_dwarf/t_arctic.mdl");
        }
        else if (StrContains(currentModel, "guerilla") != -1)
        {
            Format(modelPath, sizeof(modelPath), "models/player/ics/t_elf/t_guerilla.mdl");
        }
        else if (StrContains(currentModel, "t_phoenix") != -1)
        {
            Format(modelPath, sizeof(modelPath), "models/player/ics/t_troll/terror.mdl");
        }
    }
    // CT side
    else if (team == 3) 
    {
        if (StrContains(currentModel, "urban") != -1)
        {
            Format(modelPath, sizeof(modelPath), "models/player/ics/ct_human/urban.mdl");
        }
        else if (StrContains(currentModel, "gign") != -1)
        {
            Format(modelPath, sizeof(modelPath), "models/player/ics/ct_elf/ct_gign.mdl");
        }
        else if (StrContains(currentModel, "gsg9") != -1)
        {
            Format(modelPath, sizeof(modelPath), "models/player/ics/ct_dwarf/ct_gsg9.mdl");
        }
        else if (StrContains(currentModel, "sas") != -1)
        {
            Format(modelPath, sizeof(modelPath), "models/player/ics/ct_troll/ct_sas.mdl");
        }
    }
    
    ApplyModel(client, modelPath);
    ApplyMaterials(modelPath);
    PrintToServer("Model and materials set for players %N", client);
}

void ApplyModel(int client, const char[] modelPath)
{
    if (IsValidClient(client) && IsValidModel(modelPath))
    {
        SetEntityModel(client, modelPath);
    }
    else
    {
        PrintToServer("Error assigning the model for player: %N", client);
    }
}

bool:IsValidClient(int client)
{
    return client > 0 && client <= MaxClients && IsClientInGame(client);
}

bool:IsValidModel(const char[] model)
{
    return model[0] != '\0'; // Check whether the model path is not empty.
}

void ApplyMaterials(const char[] modelPath)
{
    char materialPath[PLATFORM_MAX_PATH];

    if (StrContains(modelPath, "ct_human") != -1)
    {
        Format(materialPath, sizeof(materialPath), "materials/models/player/ics/ct_human/ct_urban.vmt");
        AddFileToDownloadsTable("materials/models/player/ics/ct_human/ct_urban.vtf");
    }
    else if (StrContains(modelPath, "ct_elf") != -1)
    {
        Format(materialPath, sizeof(materialPath), "materials/models/player/ics/ct_elf/ct_gign.vmt");
        AddFileToDownloadsTable("materials/models/player/ics/ct_elf/ct_gign.vtf");
        AddFileToDownloadsTable("materials/models/player/ics/ct_elf/ct_gign_glass.vmt");
    }
    else if (StrContains(modelPath, "ct_dwarf") != -1)
    {
        Format(materialPath, sizeof(materialPath), "materials/models/player/ics/ct_dwarf/ct_gsg9.vmt");
        AddFileToDownloadsTable("materials/models/player/ics/ct_dwarf/ct_gsg9.vtf");
    }
    else if (StrContains(modelPath, "ct_troll") != -1)
    {
        Format(materialPath, sizeof(materialPath), "materials/models/player/ics/ct_troll/ct_sas.vmt");
        AddFileToDownloadsTable("materials/models/player/ics/ct_troll/ct_sas.vtf");
        AddFileToDownloadsTable("materials/models/player/ics/ct_troll/ct_sas_glass.vmt");
    }
    else if (StrContains(modelPath, "t_troll") != -1)
    {
        Format(materialPath, sizeof(materialPath), "materials/models/player/ics/t_troll/t_phoenix.vmt");
        AddFileToDownloadsTable("materials/models/player/ics/t_troll/t_phoenix.vtf");
    }
    else if (StrContains(modelPath, "t_dwarf") != -1)
    {
        Format(materialPath, sizeof(materialPath), "materials/models/player/ics/t_dwarf/t_arctic.vmt");
        AddFileToDownloadsTable("materials/models/player/ics/t_dwarf/t_arctic.vtf");
    }
    else if (StrContains(modelPath, "t_elf") != -1)
    {
        Format(materialPath, sizeof(materialPath), "materials/models/player/ics/t_elf/t_guerilla.vmt");
        AddFileToDownloadsTable("materials/models/player/ics/t_elf/t_guerilla.vtf");
    }
    else if (StrContains(modelPath, "t_human") != -1)
    {
        Format(materialPath, sizeof(materialPath), "materials/models/player/ics/t_human/t_leet.vmt");
        AddFileToDownloadsTable("materials/models/player/ics/t_human/t_leet.vtf");
        AddFileToDownloadsTable("materials/models/player/ics/t_human/t_leet_glass.vmt");
    }

    int hModel = CreateEntityByName("prop_dynamic_override");
if (hModel != -1)
{
    DispatchKeyValue(hModel, "model", modelPath);
    DispatchSpawn(hModel);
    SetVariantString(materialPath);
    AcceptEntityInput(hModel, "SetMaterial");
    RemoveEdict(hModel);
}
