#include "nvse/PluginAPI.h"

#include "nvse/GameAPI.h"

NVSEMessagingInterface *nvse_messaging_interface;

void MessageHandler(NVSEMessagingInterface::Message *msg)
{
    if (msg->type == NVSEMessagingInterface::kMessage_DeferredInit) {
        Console_Print("Hello, NVSEMake!");
    }
}

extern "C" __declspec(dllexport) bool NVSEPlugin_Query(const NVSEInterface *nvse, PluginInfo *info)
{
    info->infoVersion = PluginInfo::kInfoVersion;

    info->name = "soilmake";

    info->version = 1;

    return true;
}

extern "C" __declspec(dllexport) bool NVSEPlugin_Load(const NVSEInterface *nvse)
{
    nvse_messaging_interface = static_cast<NVSEMessagingInterface *>(nvse->QueryInterface(kInterface_Messaging));

    nvse_messaging_interface->RegisterListener(nvse->GetPluginHandle(), "NVSE", MessageHandler);

    return true;
}
