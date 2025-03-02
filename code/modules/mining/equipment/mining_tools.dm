/*****************Pickaxes & Drills & Shovels****************/
/obj/item/pickaxe
	name = "pickaxe"
	icon = 'icons/obj/items.dmi'
	icon_state = "pickaxe"
	flags = CONDUCT
	slot_flags = ITEM_SLOT_BELT
	force = 15
	throwforce = 10
	item_state = "pickaxe"
	w_class = WEIGHT_CLASS_BULKY
	materials = list(MAT_METAL=2000) //one sheet, but where can you make them?
	origin_tech = "materials=2;engineering=3"
	attack_verb = list("ударил", "проколол", "атаковал")
	var/drill_verb = "picking"
	sharp = 1
	embed_chance = 15
	embedded_ignore_throwspeed_threshold = TRUE
	var/excavation_amount = 100
	usesound = 'sound/effects/picaxe1.ogg'
	toolspeed = 0.8


/obj/item/pickaxe/emergency
	name = "emergency disembarkation tool"
	desc = "For extracting yourself from rough landings."

/obj/item/pickaxe/safety
	name = "safety pickaxe"
	desc = "A pickaxe designed to be only effective at digging rock and ore, very ineffective as a weapon."
	force = 1
	throwforce = 1
	attack_verb = list("неэффективно ударил")

/obj/item/pickaxe/mini
	name = "compact pickaxe"
	desc = "A smaller, compact version of the standard pickaxe."
	icon_state = "minipick"
	force = 10
	throwforce = 7
	w_class = WEIGHT_CLASS_NORMAL
	materials = list(MAT_METAL = 1000)

/obj/item/pickaxe/silver
	name = "silver-plated pickaxe"
	icon_state = "spickaxe"
	item_state = "spickaxe"
	belt_icon = "silver-plated pickaxe"
	origin_tech = "materials=3;engineering=4"
	toolspeed = 0.4 //mines faster than a normal pickaxe, bought from mining vendor
	desc = "A silver-plated pickaxe that mines slightly faster than standard-issue."
	force = 17

/obj/item/pickaxe/gold
	name = "golden pickaxe"
	icon_state = "gpickaxe"
	item_state = "gpickaxe"
	belt_icon = "golden pickaxe"
	origin_tech = "materials=4;engineering=4"
	toolspeed = 0.3
	desc = "A gold-plated pickaxe that mines faster than standard-issue."
	force = 18

/obj/item/pickaxe/diamond
	name = "diamond-tipped pickaxe"
	icon_state = "dpickaxe"
	item_state = "dpickaxe"
	belt_icon = "diamond-tipped pickaxe"
	origin_tech = "materials=5;engineering=4"
	toolspeed = 0.2
	desc = "A pickaxe with a diamond pick head. Extremely robust at cracking rock walls and digging up dirt."
	force = 19

/obj/item/pickaxe/drill
	name = "mining drill"
	icon_state = "handdrill"
	item_state = "jackhammer"
	toolspeed = 0.4 //available from roundstart, faster than a pickaxe.
	hitsound = 'sound/weapons/drill.ogg'
	usesound = 'sound/weapons/drill.ogg'
	origin_tech = "materials=2;powerstorage=2;engineering=3"
	desc = "An electric mining drill for the especially scrawny."

/obj/item/pickaxe/drill/cyborg
	name = "cyborg mining drill"
	desc = "An integrated electric mining drill."


/obj/item/pickaxe/drill/cyborg/Initialize(mapload)
	. = ..()
	ADD_TRAIT(src, TRAIT_NODROP, CYBORG_ITEM_TRAIT)


/obj/item/pickaxe/drill/diamonddrill
	name = "diamond-tipped mining drill"
	icon_state = "diamonddrill"
	origin_tech = "materials=6;powerstorage=4;engineering=4"
	desc = "Yours is the drill that will pierce the heavens!"
	toolspeed = 0.1

/obj/item/pickaxe/drill/cyborg/diamond //This is the BORG version!
	name = "diamond-tipped cyborg mining drill" //To inherit the NODROP trait, and easier to change borg specific drill mechanics.
	icon_state = "diamonddrill"
	toolspeed = 0.1

/obj/item/pickaxe/drill/jackhammer
	name = "sonic jackhammer"
	icon_state = "jackhammer"
	item_state = "jackhammer"
	origin_tech = "materials=6;powerstorage=4;engineering=5;magnets=4"
	hitsound = 'sound/weapons/sonic_jackhammer.ogg'
	usesound = 'sound/weapons/sonic_jackhammer.ogg'
	desc = "Cracks rocks with sonic blasts, and doubles as a demolition power tool for smashing walls."
	toolspeed = 0.0 //the epitome of powertools, literally instant
	var/wall_toolspeed = 0.1 //instant wall breaking is bad.

/obj/item/shovel
	name = "shovel"
	desc = "A large tool for digging and moving dirt."
	icon = 'icons/obj/items.dmi'
	icon_state = "shovel"
	flags = CONDUCT
	slot_flags = ITEM_SLOT_BELT
	force = 8
	throwforce = 4
	item_state = "shovel"
	w_class = WEIGHT_CLASS_NORMAL
	materials = list(MAT_METAL=50)
	origin_tech = "materials=2;engineering=2"
	attack_verb = list("ударил", "огрел")
	hitsound = 'sound/effects/Shovel_hitting_sound.ogg'
	usesound = 'sound/effects/shovel_dig.ogg'
	toolspeed = 0.8

/obj/item/shovel/spade
	name = "spade"
	desc = "A small tool for digging and moving dirt."
	icon_state = "spade"
	item_state = "spade"
	belt_icon = "spade"
	force = 5
	throwforce = 7
	w_class = WEIGHT_CLASS_SMALL

/obj/item/shovel/safety
	name = "safety shovel"
	desc = "A large tool for digging and moving dirt. Was modified with extra safety, making it ineffective as a weapon."
	force = 1
	throwforce = 1
	attack_verb = list("неэффективно ударил")
