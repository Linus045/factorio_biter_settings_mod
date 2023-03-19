data:extend({
   {
      type = "bool-setting",
      name = "linus-mod-enable-biters",
      setting_type = "runtime-global",
      default_value = false,
      per_user = false,
      order = "a"
   },
   {
      type = "bool-setting",
      name = "linus-mod-enable-chat-messages",
      setting_type = "runtime-global",
      default_value = true,
      order = "a"
   },
   {
      type = "int-setting",
      name = "linus-mod-max_expansion_distance",
      setting_type = "runtime-global",
      default_value = 2,
      per_user = false,
      order = "b"
   },
   {
      type = "int-setting",
      name = "linus-mod-friendly_base_influence_radius",
      setting_type = "runtime-global",
      default_value = 2,
      per_user = false,
      order = "b"
   },
   {
      type = "int-setting",
      name = "linus-mod-enemy_building_influence_radius",
      setting_type = "runtime-global",
      default_value = 2,
      per_user = false,
      order = "b"
   },
   {
      type = "double-setting",
      name = "linus-mod-building_coefficient",
      setting_type = "runtime-global",
      default_value = 0.1,
      per_user = false,
      order = "c"
   },
   {
      type = "double-setting",
      name = "linus-mod-other_base_coefficient",
      setting_type = "runtime-global",
      default_value = 2.0,
      per_user = false,
      order = "c"
   },
   {
      type = "double-setting",
      name = "linus-mod-neighbouring_chunk_coefficient",
      setting_type = "runtime-global",
      default_value = 0.5,
      per_user = false,
      order = "c"
   },
   {
      type = "double-setting",
      name = "linus-mod-neighbouring_base_chunk_coefficient",
      setting_type = "runtime-global",
      default_value = 0.4,
      per_user = false,
      order = "c"
   },
   {
      type = "double-setting",
      name = "linus-mod-max_colliding_tiles_coefficient",
      setting_type = "runtime-global",
      default_value = 0.9,
      per_user = false,
      order = "c"
   },
   {
      type = "int-setting",
      name = "linus-mod-settler_group_min_size",
      setting_type = "runtime-global",
      default_value = 5,
      value = 5,
      per_user = false,
      order = "d"
   },
   {
      type = "int-setting",
      name = "linus-mod-settler_group_max_size",
      setting_type = "runtime-global",
      default_value = 20,
      value = 20,
      per_user = false,
      order = "d"
   },
   {
      type = "int-setting",
      name = "linus-mod-min_expansion_cooldown",
      setting_type = "runtime-global",
      default_value = 14400,
      value = 14400,
      per_user = false,
      order = "e"
   },
   {
      type = "int-setting",
      name = "linus-mod-max_expansion_cooldown",
      setting_type = "runtime-global",
      default_value = 216000,
      per_user = false,
      order = "e"
   }
})
