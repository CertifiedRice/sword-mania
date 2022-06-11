local ServerScriptService = game:GetService("ServerScriptService")
local Cmdr = require(ServerScriptService.Cmdr)

Cmdr:RegisterDefaultCommands()
Cmdr:RegisterHooksIn(ServerScriptService.Hooks.Permissions)