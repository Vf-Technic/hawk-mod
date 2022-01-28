-- Hawk Mods
-- January 2022
-- https://github.com/mrbid/Minetest-Worldmods

-- Space Carrot
minetest.register_craftitem("hawk:space_carrot", {
	description = "Teleportation Carrot",
	inventory_image = "space_carrot.png",
	wield_image = "space_carrot.png",
	on_use = function(itemstack, user)
		minetest.sound_play("portal_open", {
			pos = user:get_pos(),
			gain = 1.0,
			max_hear_distance = 5,
		})
		user:set_hp(user:get_hp() + 5)
		user:set_pos({x = math.random(-30000, 30000), y = math.random(5000, 16000), z = math.random(-30000, 30000)})
		itemstack:take_item(1)
		return itemstack
	end,
})

minetest.register_craft({
	output = "hawk:space_carrot",
	recipe = {
		{"", "default:obsidian", ""},
		{"default:obsidian", "farming:carrot_gold", "default:obsidian"},
		{"", "default:obsidian", ""},
	}
})

-- Chocolate Coin
minetest.register_craftitem("hawk:chocolate_coin", {
	description = "Chocolate Minegeld",
	inventory_image = "minegeld_cent_25.png",
	wield_image = "minegeld_cent_25.png",
	on_use = function(itemstack, user)
		minetest.sound_play("item_drop_pickup", {
			pos = user:get_pos(),
			gain = 1.0,
			max_hear_distance = 5,
		})
		user:set_hp(user:get_hp() + 5)
		if math.random(1, 10) == 1 then
			minetest.sound_play("toaster", {
				pos = user:get_pos(),
				gain = 1.0,
				max_hear_distance = 5,
			})
			minetest.add_item({x=user:get_pos().x, y=user:get_pos().y, z=user:get_pos().z}, "currency:minegeld_cent_10")
			minetest.chat_send_player(user:get_player_name(), "You found 10 cent.")
		end
		itemstack:take_item(1)
		return itemstack
	end,
})

minetest.register_craft({
	output = "hawk:chocolate_coin",
	recipe = {
		{"bbq:foil", "farming:chocolate_dark", "technic:gold_dust"},
	}
})

-- Chocolate Eclair
minetest.register_craftitem("hawk:chocolate_eclair", {
	description = "Chocolate Eclair",
	inventory_image = "chocolate_eclair.png",
	wield_image = "chocolate_eclair.png",
	on_use = function(itemstack, user)
		minetest.sound_play("item_drop_pickup", {
			pos = user:get_pos(),
			gain = 1.0,
			max_hear_distance = 5,
		})
		user:set_hp(user:get_hp() + 5)
		minetest.place_node(user:get_pos(), {name="petz:poop"})
		itemstack:take_item(1)
		return itemstack
	end,
})

minetest.register_craft({
	output = "hawk:chocolate_eclair 8",
	recipe = {
		{"farming:bread", "farming:chocolate_dark", ""},
	}
})

-- Mystery Cookie
minetest.register_craftitem("hawk:mystery_cookie", {
	description = "Mystery Cookie",
	inventory_image = "mystery_cookie.png",
	wield_image = "mystery_cookie.png",
	on_use = function(itemstack, user)
		minetest.sound_play("item_drop_pickup", {
			pos = user:get_pos(),
			gain = 1.0,
			max_hear_distance = 5,
		})
		user:set_hp(user:get_hp() + 5)

		local size = 0.1+math.random()*3.2
		minetest.chat_send_player(user:get_player_name(), "You are now " .. string.format("%.2f", size) .. "% of your normal scale.")
		resize_mod.set_size(user, size)

		minetest.after(33, function()
			resize_mod.set_size(user, 1)
			minetest.sound_play("item_drop_pickup", {
				pos = user:get_pos(),
				gain = 1.0,
				max_hear_distance = 5,
			})
			minetest.chat_send_player(user:get_player_name(), "You are normal sized again.")
		end)

		itemstack:take_item(1)
		return itemstack
	end,
})

minetest.register_craft({
	output = "hawk:mystery_cookie",
	recipe = {
		{"farming:cookie", "dye:violet", ""},
	}
})

-- Sick Cookie
minetest.register_craftitem("hawk:sick_cookie", {
	description = "Sick Cookie",
	inventory_image = "sick_cookie.png",
	wield_image = "sick_cookie.png",
	on_use = function(itemstack, user)
		minetest.sound_play("mobs_kitten", {
			pos = user:get_pos(),
			gain = 1.0,
			max_hear_distance = 5,
		})
		user:set_hp(user:get_hp() + 5)
		minetest.add_entity(user:get_pos(), "mobs_animal:kitten")
		minetest.add_entity(user:get_pos(), "mobs_animal:kitten")
		minetest.add_entity(user:get_pos(), "mobs_animal:kitten")
		minetest.add_entity(user:get_pos(), "mobs_animal:kitten")
		minetest.add_entity(user:get_pos(), "mobs_animal:kitten")
		minetest.add_entity(user:get_pos(), "mobs_animal:kitten")
		itemstack:take_item(1)
		return itemstack
	end,
})

minetest.register_craft({
	output = "hawk:sick_cookie",
	recipe = {
		{"farming:cookie", "dye:green", "currency:minegeld_100"},
	}
})

-- InvHack Sword
minetest.register_tool("hawk:blood_sucker", {
	description = "Bone breaker",
	inventory_image = "blood_sucker.png",
	--wield_scale = {x=3,y=3,z=3},
	tool_capabilities = {
		full_punch_interval = 1.5,
		max_drop_level=5,
		groupcaps={
			choppy={times={[1]=1.00, [2]=0.10, [3]=0.01}, uses=200, maxlevel=3},
		},
		damage_groups = {fleshy=90},
	},
	sound = {breaks = "default_tool_breaks"},
})

minetest.register_craft({
	output = "hawk:blood_sucker",
	recipe = {
			{'default:steel_ingot','default:steel_ingot','default:steel_ingot'},
			{'default:steel_ingot','default:stick',''},
			{'','default:stick',''},
	}
})
-- samosa
if hawk.flight then
  dofile(path .. "/flight.lua")
  
end 
