/obj/item/storage/conveyor //Stores conveyor belts, click floor to make belt, use a conveyor switch on this to link all belts to that lever.
	name = "conveyor belt placer"
	desc = "This device facilitates the rapid deployment of conveyor belts."
	icon_state = "belt_placer"
	item_state = "belt_placer"
	w_class = WEIGHT_CLASS_BULKY //Because belts are large things, you know?
	can_hold = list(/obj/item/conveyor_construct)
	flags = CONDUCT
	max_w_class = WEIGHT_CLASS_BULKY
	max_combined_w_class = 28 //7 belts
	allow_quick_gather = TRUE
	allow_quick_empty = TRUE
	display_contents_with_number = TRUE
	use_to_pickup = TRUE
	origin_tech = "engineering=1"


/obj/item/storage/conveyor/bluespace
	name = "bluespace conveyor belt placer"
	desc = "This device facilitates the rapid deployment of conveyor belts. It utilises bluespace in order to hold many more belts than its regular counterpart."
	icon_state = "bluespace_belt_placer"
	item_state = "bluespace_belt_placer"
	w_class = WEIGHT_CLASS_NORMAL
	storage_slots = 50
	max_combined_w_class = 200 //50 belts
	origin_tech = "engineering=2;bluespace=1"


/obj/item/storage/conveyor/attackby(obj/item/I, mob/user, params) //So we can link belts en masse
	if(istype(I, /obj/item/conveyor_switch_construct))
		add_fingerprint(user)
		var/obj/item/conveyor_switch_construct/switch_construct = I
		var/linked = FALSE //For nice message
		for(var/obj/item/conveyor_construct/conveyor in contents)
			conveyor.id = switch_construct.id
			linked = TRUE
		if(linked)
			to_chat(user, span_notice("All belts in [src] linked with [switch_construct]."))
		return ATTACK_CHAIN_PROCEED_SUCCESS

	return ..()


/obj/item/storage/conveyor/afterattack(atom/target, mob/user, proximity, params)
	if(!proximity)
		return
	var/obj/item/conveyor_construct/conveyor = locate() in contents
	if(!conveyor)
		to_chat(user, span_warning("There are no belts in [src]."))
		return
	conveyor.afterattack(target, user, proximity, params)

