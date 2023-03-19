local function apply_biter_expansion_settings()
	local settings = settings.global
	game.map_settings.enemy_expansion.enabled = settings["linus-mod-enable-biters"].value
	game.map_settings.enemy_expansion.max_expansion_distance = settings["linus-mod-max_expansion_distance"].value
	game.map_settings.enemy_expansion.friendly_base_influence_radius = settings["linus-mod-friendly_base_influence_radius"].value
	game.map_settings.enemy_expansion.enemy_building_influence_radius = settings["linus-mod-enemy_building_influence_radius"].value
	game.map_settings.enemy_expansion.building_coefficient = settings["linus-mod-building_coefficient"].value
	game.map_settings.enemy_expansion.other_base_coefficient = settings["linus-mod-other_base_coefficient"].value
	game.map_settings.enemy_expansion.neighbouring_chunk_coefficient = settings["linus-mod-neighbouring_chunk_coefficient"].value
	game.map_settings.enemy_expansion.neighbouring_base_chunk_coefficient = settings["linus-mod-neighbouring_base_chunk_coefficient"].value
	game.map_settings.enemy_expansion.max_colliding_tiles_coefficient = settings["linus-mod-max_colliding_tiles_coefficient"].value
	game.map_settings.enemy_expansion.settler_group_min_size = settings["linus-mod-settler_group_min_size"].value
	game.map_settings.enemy_expansion.settler_group_max_size = settings["linus-mod-settler_group_max_size"].value
	game.map_settings.enemy_expansion.min_expansion_cooldown = settings["linus-mod-min_expansion_cooldown"].value
	game.map_settings.enemy_expansion.max_expansion_cooldown = settings["linus-mod-max_expansion_cooldown"].value

	game.print({"", "Adjusted Linus Mod Settings."})
end

local function convert_to_gps_string(map_location)
	local x =  math.floor(map_location.x)
	local y =  math.floor(map_location.y)
	return "[gps=" .. x .. "," .. y .. "]"
end

local function ping_entity_on_map(entity)
	local should_print_messages = settings.global["linus-mod-enable-chat-messages"].value

	for i, ply in pairs(game.players) do
		if ply then
			-- check if chunk is covered by fog of war
			local chunk_charted = ply.force.is_chunk_charted(entity.surface, { entity.position.x / 32, entity.position.y / 32})
			if chunk_charted then
				if should_print_messages then
					game.print({"", "New base build in" .. entity.surface.name .. " at " .. convert_to_gps_string(entity.position) .. "!"})
				end
				ply.add_custom_alert(entity, {
					type = "item",
					name = "land-mine"
				} , "Biters build a new base in " .. entity.surface.name .. "!", true)
			end
		end
	end

end


script.on_event(defines.events.on_biter_base_built ,function(data)
	local ent = data.entity
	
	if ent.type ~= "unit-spawner" then
		return
	end

	-- get nearby entities
	local entities = ent.surface.find_entities_filtered({position = ent.position, radius = 30})

	local baseExtended = false
	for	k, v in pairs(entities) do
		if v ~= ent and not baseExtended then 			
			-- if we find other spawners nearby this is only an expansion and not a new base
			if v.type == "unit-spawner" then
				-- game.print({"", "Name: " .. v.name .. "Type: " .. v.type .." at [gps=" .. ent.position.x .. "," .. ent.position.y .. "]"})
				baseExtended = true
			end
		end
	end

	-- notify user about new spawned base
	if not baseExtended then
		ping_entity_on_map(ent)
	end
end)

script.on_init(function ()
	apply_biter_expansion_settings()	
end)

script.on_configuration_changed(function(data)
	apply_biter_expansion_settings()		
end)

script.on_event(defines.events.on_runtime_mod_setting_changed,function ()
	apply_biter_expansion_settings()
end)

-- local counter = 1

-- script.on_event(defines.events.on_gui_opened, function()

-- 	local tbl = {}
-- 	for _, p in pairs(game.virtual_signal_prototypes) do
-- 		tbl[#tbl + 1] = p.name
-- 	end

-- 	game.print({"", tbl[counter]})

-- 	for i, ply in pairs(game.players) do
-- 		if ply and ply.character then
-- 			ply.add_custom_alert(ply.character, {
-- 				type = "item",
-- 				-- name = tbl[counter]
-- 				name = "land-mine"
-- 				-- "signal-unknown"
-- 			} , "Test", true)
-- 		end
-- 	end
-- 	counter = counter + 1;
-- end)

