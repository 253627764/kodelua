if kode == nil then return end

local modules_init_ = {
	"role",
	nil,
}

-- moduleName = {skippedModel, skippedService}
local skip_ = {
	test = {true}
}

local facade_ = kode.facade
facade_:skip(skip_)
facade_:registerModules(modules_init_)

-- Event.checkEvents()

--[[
Usage:
local roleModel = app.model("role") 					-- "app.modules.role.role_m"
local talentModel = app.model("role", "talent") 		-- "app.modules.role.talent_m"
--]]
function app.model(module, model)
	return facade_:loadModel(module, model)
end

--[[
Usage:
local roleService = app.service("role") 					-- "app.modules.role.role_s"
local talentService = app.service("role", "talent") 		-- "app.modules.role.talent_s"
--]]
function app.service(module, service)
	return facade_:loadService(module, service)
end

--[[
Usage:
local rolePane = app.view("role") 				-- "app.modules.role.view.rolepane"
local talentPane = app.view("role", "talent") 	-- "app.modules.role.view.talentpane"
--]]
function app.view(module, view)
	return facade_:loadView(module,view)
end

--[[
Usage:
local roleVo = app.vo("role") 						-- "app.modules.role.role_vo"
local talentVo = app.vo("role", "talent") 			-- "app.modules.role.talent_vo"
--]]
function app.vo(module, vo)
	return facade_:loadvo(module, vo)
end

--[[

建议使用新的接口 by Andy

Usage:

local roleModel = ns.model.role 					-- "app.modules.role.role_m"
local talentModel = ns.model.role_talent			-- "app.modules.role.talent_m"

local roleService = ns.service.role 				-- "app.modules.role.role_s"
local talentService = ns.service.role_talent		-- "app.modules.role.talent_s"

local rolePane = ns.view.role 						-- "app.modules.role.view.rolepane"
local talentPane = ns.view.role_talent 				-- "app.modules.role.view.talentpane"

local roleVo = ns.vo.role 							-- "app.modules.role.role_vo"
local talentVo = ns.vo.role_talent				 	-- "app.modules.role.talent_vo"

--]]

_G.BaseController = facade_:loadController("base")
_G.BaseModel = facade_:loadModel("base")
_G.BaseService = facade_:loadService("base")