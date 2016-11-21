
local destructive = false

mobs:register_arrow("mobs_doom:fireball_2", {
   visual = "sprite",
   visual_size = {x = 1, y = 1},
   textures = {"doom_fireshot.png"},
   velocity = 8,
   tail = 0, -- enable tail

   hit_player = function(self, player)
      player:punch(self.object, 1.0, {
         full_punch_interval = 1.0,
         damage_groups = {fleshy = 2},
      }, nil)
   end,
   
   hit_mob = function(self, player)
      player:punch(self.object, 1.0, {
         full_punch_interval = 1.0,
         damage_groups = {fleshy = 2},
      }, nil)
   end,

   hit_node = function(self, pos, node)
      self.object:remove()
   end,
})

mobs:register_arrow("mobs_doom:fireball", {
   visual = "sprite",
   visual_size = {x = 1, y = 1},
   textures = {"doom_fireshot2.png"},
   velocity = 12,
   tail = 0, -- enable tail

   hit_player = function(self, player)
      player:punch(self.object, 1.0, {
         full_punch_interval = 1.0,
         damage_groups = {fleshy = 3},
      }, nil)
   end,
   
   hit_mob = function(self, player)
      player:punch(self.object, 1.0, {
         full_punch_interval = 1.0,
         damage_groups = {fleshy = 3},
      }, nil)
   end,

   hit_node = function(self, pos, node)
      self.object:remove()
   end,
})

if destructive == true then
mobs:register_arrow("mobs_doom:fireball_3", {
   visual = "sprite",
   visual_size = {x = 1, y = 1},
   textures = {"doom_fireshot.png"},
   velocity = 3,
   tail = 1, -- enable tail
   tail_texture = "doom_flame2.png",

   hit_player = function(self, player)
      player:punch(self.object, 1.0, {
         full_punch_interval = 1.0,
         damage_groups = {fleshy = 2},
      }, nil)
   end,
   
   hit_mob = function(self, player)
      player:punch(self.object, 1.0, {
         full_punch_interval = 1.0,
         damage_groups = {fleshy = 2},
      }, nil)
   end,

   hit_node = function(self, pos, node)
      mobs:explosion(pos, 1, 1, 1)
   end,
})

mobs:register_arrow("mobs_doom:rocket", {
   visual = "sprite",
   visual_size = {x = 0.5, y = 0.5},
   textures = {"doom_rocket.png"},
   velocity = 8,
   tail = 1, -- enable tail
   tail_texture = "doom_rocket_smoke.png",

   hit_player = function(self, player)
      player:punch(self.object, 1.0, {
         full_punch_interval = 1.0,
         damage_groups = {fleshy = 3},
      }, nil)
   end,
   
   hit_mob = function(self, player)
      player:punch(self.object, 1.0, {
         full_punch_interval = 1.0,
         damage_groups = {fleshy = 3},
      }, nil)
   end,

   hit_node = function(self, pos, node)
      mobs:explosion(pos, 2, 1, 1)
   end,
})
else

mobs:register_arrow("mobs_doom:fireball_3", {
   visual = "sprite",
   visual_size = {x = 1, y = 1},
   textures = {"doom_fireshot.png"},
   velocity = 3,
   tail = 1, -- enable tail
   tail_texture = "doom_flame2.png",

   hit_player = function(self, player)
      player:punch(self.object, 1.0, {
         full_punch_interval = 1.0,
         damage_groups = {fleshy = 2},
      }, nil)
   end,
   
   hit_mob = function(self, player)
      player:punch(self.object, 1.0, {
         full_punch_interval = 1.0,
         damage_groups = {fleshy = 2},
      }, nil)
   end,

   hit_node = function(self, pos, node)
      self.object:remove()
   end,
})

mobs:register_arrow("mobs_doom:rocket", {
   visual = "sprite",
   visual_size = {x = 0.5, y = 0.5},
   textures = {"doom_rocket.png"},
   velocity = 8,
   tail = 1, -- enable tail
   tail_texture = "doom_rocket_smoke.png",

   hit_player = function(self, player)
      player:punch(self.object, 1.0, {
         full_punch_interval = 1.0,
         damage_groups = {fleshy = 3},
      }, nil)
   end,
   
   hit_mob = function(self, player)
      player:punch(self.object, 1.0, {
         full_punch_interval = 1.0,
         damage_groups = {fleshy = 3},
      }, nil)
   end,

   hit_node = function(self, pos, node)
      self.object:remove()
   end,
})
end

mobs:register_arrow("mobs_doom:fireball_4", {
   visual = "sprite",
   visual_size = {x = 1, y = 1},
   textures = {"doom_plasma.png"},
   velocity = 6,
   tail = 0, -- enable tail

   hit_player = function(self, player)
      player:punch(self.object, 1.0, {
         full_punch_interval = 1.0,
         damage_groups = {fleshy = 3},
      }, nil)
   end,
   
   hit_mob = function(self, player)
      player:punch(self.object, 1.0, {
         full_punch_interval = 1.0,
         damage_groups = {fleshy = 3},
      }, nil)
   end,

   hit_node = function(self, pos, node)
      self.object:remove()
   end,
})

mobs:register_mob("mobs_doom:skull", {
   type = "monster",
   passive = false,
   attacks_monsters = true,
   damage = 1,
   reach = 3,
   attack_type = "dogfight",
   shoot_interval = 2.5,
   arrow = "mobs_doom:fireball",
   shoot_offset = 1,
   hp_min = 20,
   hp_max = 35,
   armor = 80,
   collisionbox = {-0.4, -0.1, -0.4, 0.4, 1.5, 0.4},
   visual = "mesh",
   mesh = "lost_soul.b3d",
   textures = {
      {"mobs_lost_soul.png"},
   },
   blood_texture = "doom_flame.png",
   visual_size = {x=3, y=3},
   makes_footstep_sound = true,
   walk_velocity = 3,
   run_velocity = 5,
   jump = true,
   fly = true,
   do_custom = function(self)
   local apos = self.object:getpos()
		local part = minetest.add_particlespawner(
			12, --amount
			0.3, --time
			{x=apos.x-0.3, y=apos.y+0.6, z=apos.z-0.3}, --minpos
			{x=apos.x+0.3, y=apos.y+0.6, z=apos.z+0.3}, --maxpos
			{x=-0, y=-0, z=-0}, --minvel
			{x=0, y=0, z=0}, --maxvel
			{x=0,y=1.5,z=0}, --minacc
			{x=0.5,y=1.5,z=0.5}, --maxacc
			1, --minexptime
			2, --maxexptime
			3, --minsize
			5, --maxsize
			false, --collisiondetection
			"doom_flame.png" --texture
		)
   end,
   fall_speed = 0,
   stepheight = 10,
   water_damage = 2,
   lava_damage = 0,
   light_damage = 0,
   view_range = 20,
   animation = {
      speed_normal = 10,
      speed_run = 20,
      walk_start = 20,
      walk_end = 40,
      stand_start = 1,
      stand_end = 20,
      run_start = 20,
      run_end = 40,
      punch_start = 40,
      punch_end = 65,
   },
})

mobs:register_spawn("mobs_doom:skull", {"fire:basic_flame","default:leaves", "hell:soul_stone"}, 20, 0, 15000, 2, 31000)
   
mobs:register_egg("mobs_doom:skull", "Lost Soul", "wool_orange.png", 1)

mobs:register_mob("mobs_doom:cacodemon", {
   type = "monster",
   passive = false,
   attacks_monsters = true,
   damage = 8,
   reach = 3,
   attack_type = "shoot",
   shoot_interval = 2.5,
   arrow = "mobs_doom:fireball_4",
   shoot_offset = 1,
   hp_min = 40,
   hp_max = 55,
   armor = 80,
   collisionbox = {-0.9, -0.2, -0.9, 0.9, 1.5, 0.9},
   visual = "mesh",
   mesh = "cacodemon.b3d",
   textures = {
      {"mobs_cacodemon.png"},
   },
   blood_amount = 80,
   blood_texture = "doom_plasma.png",
   visual_size = {x=2, y=2},
   makes_footstep_sound = true,
   walk_velocity = 3,
   run_velocity = 5,
   jump = true,
   fly = true,
   fall_speed = 0,
   stepheight = 10,
   water_damage = 2,
   lava_damage = 0,
   light_damage = 0,
   view_range = 20,
   animation = {
      speed_normal = 10,
      speed_run = 20,
      walk_start = 1,
      walk_end = 20,
      stand_start = 1,
      stand_end = 20,
      run_start = 1,
      run_end = 20,
      shoot_start = 20,
      shoot_end = 40,
   },
})

mobs:register_spawn("mobs_doom:cacodemon", {"fire:basic_flame","default:lava_flowing", "hell:soul_stone"}, 20, 0, 15000, 2, 31000)
   
mobs:register_egg("mobs_doom:cacodemon", "Cacodemon", "wool_red.png", 1)

mobs:register_mob("mobs_doom:cyberdemon", {
	type = "monster",
	passive = false,
	reach = 6,
	damage = 2,
	attack_type = "shoot",
   shoot_interval = 1.5,
   arrow = "mobs_doom:rocket",
   shoot_offset = -1,
	hp_min = 132,
	hp_max = 172,
	armor = 100,
	collisionbox = {-0.9, 0, -0.9, 0.9, 6.5, 0.9},
	visual = "mesh",
	mesh = "cyberdemon.b3d",
	textures = {
		{"mobs_cyberdemon2.png"},
	},
   blood_amount = 90,
	blood_texture = "doom_blood_effect.png",
	visual_size = {x=2, y=2},
	makes_footstep_sound = true,
	walk_velocity = 1,
	run_velocity = 2.1,
	sounds = {
		random = "mobs_stone_monster",
		attack = "mobs_stone_monster",
	},
	jump = true,
	drops = {
		{name = "default:mese", chance = 2, min = 1, max = 1},
		{name = "mobs:meat_raw", chance = 1, min = 3, max = 5},
	},
	on_activate = function(self)
	self.texchanged = false
	end,
	do_custom = function(self)
		local pos = self.object:getpos()
		local node = minetest.get_node({x=pos.x, y=pos.y-1, z=pos.z}).name
		if node == "hell:soul_stone" and self.texchanged == false then
		self.object:set_properties({textures = {"mobs_cyberdemon.png"}})
		self.textchanged = true
		end
	end,
	water_damage = 0,
	lava_damage = 0,
	light_damage = 0,
	view_range = 15,
	animation = {
		speed_normal = 10,
		speed_run = 15,
		walk_start = 20,
		walk_end = 40,
		run_start = 20,
		run_end = 40,
		stand_start = 64,
		stand_end = 80,
		shoot_start = 1,
		shoot_end = 15,

	},
})

mobs:register_spawn("mobs_doom:cyberdemon", {"nether:stone","default:dirt_with_grass", "hell:soul_stone"}, 20, 0, 35000, 2, 31000)

mobs:register_egg("mobs_doom:cyberdemon", "Cyberdemon", "wool_red.png", 1)

mobs:register_mob("mobs_doom:pinky", {
   type = "monster",
   passive = false,
   attacks_monsters = true,
   damage = 2,
   reach = 3,
   attack_type = "dogfight",
   hp_min = 60,
   hp_max = 75,
   armor = 80,
   collisionbox = {-0.8, -0, -0.8, 0.8, 1.9, 0.8},
   visual = "mesh",
   mesh = "pinky.b3d",
   textures = {
      {"mobs_pinky.png"},
   },
   blood_amount = 80,
   blood_texture = "doom_blood_effect.png",
   visual_size = {x=3, y=3},
   makes_footstep_sound = true,
   walk_velocity = 2,
   run_velocity = 4,
   jump = true,
   drops = {
      {name = "mobs:meat_raw", chance = 2, min = 2, max = 3},
   },
   water_damage = 0,
   lava_damage = 0,
   light_damage = 0,
   view_range = 20,
   animation = {
      speed_normal = 20,
      speed_run = 30,
      walk_start = 1,
      walk_end = 20,
      stand_start = 20,
      stand_end = 40,
      run_start = 1,
      run_end = 20,
      punch_start = 40,
      punch_end = 60,
   },
})

mobs:register_spawn("mobs_doom:pinky", {"default:sandstone_brick","nether:stone", "hell:soul_stone"}, 20, 0, 15000, 2, 31000)
   
mobs:register_egg("mobs_doom:pinky", "Pinky", "wool_pink.png", 1)

mobs:register_mob("mobs_doom:mancubus", {
   type = "monster",
   passive = false,
   attacks_monsters = true,
   damage = 4,
   reach = 2,
   attack_type = "shoot",
   shoot_interval = 2.5,
	dogshoot_switch = 2,
	dogshoot_count = 0,
	dogshoot_count_max =5,
   arrow = "mobs_doom:fireball_3",
   shoot_offset = 0.5,
   hp_min = 50,
   hp_max = 65,
   armor = 100,
   collisionbox = {-0.8, 0, -0.8, 0.8, 3, 0.8},
   visual = "mesh",
   mesh = "mancubus.b3d",
   textures = {
      {"mobs_mancubus2.png"},
   },
   blood_amount = 80,
   blood_texture = "doom_blood_effect.png",
   visual_size = {x=2, y=2},
   makes_footstep_sound = true,
   walk_velocity = 0.5,
   run_velocity = 1,
   jump = true,
   drops = {
      {name = "mobs:meat_raw", chance = 1, min = 1, max = 2},
   },
	on_activate = function(self)
	self.texchanged = false
	end,
	do_custom = function(self)
		local pos = self.object:getpos()
		local node = minetest.get_node({x=pos.x, y=pos.y-1, z=pos.z}).name
		if node == "hell:soul_stone" and self.texchanged == false then
		self.object:set_properties({textures = {"mobs_mancubus.png"}})
		self.textchanged = true
		end
	end,
   water_damage = 2,
   lava_damage = 0,
   light_damage = 0,
   view_range = 20,
   animation = {
      speed_normal = 10,
      speed_run = 20,
      walk_start = 20,
      walk_end = 40,
      stand_start = 45,
      stand_end = 65,
      run_start = 20,
      run_end = 40,
	  shoot_start = 1,
	  shoot_end = 15,
   },
})

mobs:register_spawn("mobs_doom:mancubus", {"default:stone","default:sand", "hell:soul_stone"}, 20, 0, 15000, 2, 31000)
   
mobs:register_egg("mobs_doom:mancubus", "Mancubus", "default_sand.png", 1)

mobs:register_mob("mobs_doom:imp", {
   type = "monster",
   passive = false,
   attacks_monsters = true,
   damage = 2,
   reach = 2,
   attack_type = "dogshoot",
   shoot_interval = 2.5,
	dogshoot_switch = 2,
	dogshoot_count = 0,
	dogshoot_count_max =5,
   arrow = "mobs_doom:fireball_2",
   shoot_offset = 0.5,
   hp_min = 30,
   hp_max = 45,
   armor = 80,
   collisionbox = {-0.5, 0, -0.6, 0.6, 3, 0.6},
   visual = "mesh",
   mesh = "imp.b3d",
   textures = {
      {"mobs_imp.png"},
   },
   blood_amount = 80,
   blood_texture = "doom_blood_effect.png",
   visual_size = {x=2, y=2},
   makes_footstep_sound = true,
   walk_velocity = 2.5,
   run_velocity = 3.5,
   jump = true,
   drops = {
      {name = "default:coal_lump", chance = 1, min = 1, max = 2},
   },
   water_damage = 2,
   lava_damage = 0,
   light_damage = 0,
   view_range = 20,
   animation = {
      speed_normal = 10,
      speed_run = 20,
      walk_start = 35,
      walk_end = 55,
      stand_start = 1,
      stand_end = 30,
      run_start = 35,
      run_end = 55,
      punch_start = 60,
      punch_end = 80,
	  shoot_start = 80,
	  shoot_end = 100,
   },
})

mobs:register_spawn("mobs_doom:imp", {"default:dirt", "default:gravel", "hell:soul_stone"}, 20, 0, 15000, 2, 31000)
   
mobs:register_egg("mobs_doom:imp", "Imp", "default_dirt.png", 1)

mobs:register_mob("mobs_doom:hellbaron", {
   type = "monster",
   passive = false,
   attacks_monsters = true,
   damage = 3,
   reach = 2,
   attack_type = "dogshoot",
   shoot_interval = 2.5,
	dogshoot_switch = 2,
	dogshoot_count = 0,
	dogshoot_count_max =5,
   arrow = "mobs_doom:fireball",
   shoot_offset = 0.5,
   hp_min = 80,
   hp_max = 95,
   armor = 80,
   collisionbox = {-0.5, 0, -0.6, 0.6, 3, 0.6},
   visual = "mesh",
   mesh = "hellbaron.b3d",
   textures = {
      {"mobs_hellbaron.png"},
   },
   blood_amount = 80,
   blood_texture = "doom_blood_effect.png",
   visual_size = {x=1, y=1},
   makes_footstep_sound = true,
   walk_velocity = 2,
   run_velocity = 3.5,
   jump = true,
   drops = {
      {name = "default:steel_ingot", chance = 1, min = 1, max = 5},
   },
	on_activate = function(self)
	self.texchanged = false
	end,
	do_custom = function(self)
		local pos = self.object:getpos()
		local node = minetest.get_node({x=pos.x, y=pos.y-1, z=pos.z}).name
		if node == "hell:soul_stone" and self.texchanged == false then
		self.object:set_properties({textures = {"mobs_hellbaron2.png"}})
		self.textchanged = true
		end
	end,
   water_damage = 2,
   lava_damage = 0,
   light_damage = 0,
   view_range = 20,
   animation = {
      speed_normal = 10,
      speed_run = 20,
      walk_start = 51,
      walk_end = 75,
      stand_start = 1,
      stand_end = 25,
      run_start = 51,
      run_end = 75,
      punch_start = 25,
      punch_end = 50,
	  shoot_start = 25,
	  shoot_end = 50,
   },
})

mobs:register_spawn("mobs_doom:hellbaron", {"default:lava_source", "default:stone", "hell:soul_stone"}, 20, 0, 15000, 2, 31000)
   
mobs:register_egg("mobs_doom:hellbaron", "Hell Baron", "default_dirt.png", 1)