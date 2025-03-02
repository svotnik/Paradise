/mob/living/carbon/human
	name = "unknown"
	real_name = "unknown"
	voice_name = "unknown"
	icon = 'icons/mob/human.dmi'
	icon_state = "body_m_s"
	appearance_flags = KEEP_TOGETHER|TILE_BOUND|PIXEL_SCALE|LONG_GLIDE
	deathgasp_on_death = TRUE
	hud_possible = list(HEALTH_HUD,STATUS_HUD,ID_HUD,WANTED_HUD,IMPMINDSHIELD_HUD,IMPCHEM_HUD,IMPTRACK_HUD,SPECIALROLE_HUD,GLAND_HUD,THOUGHT_HUD,DIAG_STAT_HUD,DIAG_HUD)
	pressure_resistance = 25
	blocks_emissive = EMISSIVE_BLOCK_UNIQUE
	max_grab = GRAB_KILL
	num_legs = 0 //Populated on init through list/bodyparts
	usable_legs = 0 //Populated on init through list/bodyparts
	num_hands = 0 //Populated on init through list/bodyparts
	usable_hands = 0 //Populated on init through list/bodyparts
	status_flags = parent_type::status_flags|CANSTAMCRIT
	hud_type = /datum/hud/human
	//Marking colour and style
	var/list/m_colours = DEFAULT_MARKING_COLOURS //All colours set to #000000.
	var/list/m_styles = DEFAULT_MARKING_STYLES //All markings set to None.

	var/s_tone = 0	//Skin tone

	//Skin colour
	var/skin_colour = "#000000"

	var/lip_style = null	//no lipstick by default- arguably misleading, as it could be used for general makeup
	var/lip_color = "white"

	var/age = 30		//Player's age (pure fluff)

	var/underwear = "Nude"	//Which underwear the player wants
	var/color_underwear = "#ffffff"
	var/undershirt = "Nude"	//Which undershirt the player wants
	var/color_undershirt = "#ffffff"
	var/socks = "Nude" //Which socks the player wants
	var/backbag = 2		//Which backpack type the player has chosen. Nothing, Satchel or Backpack.

	//Equipment slots
	var/obj/item/clothing/under/w_uniform = null
	var/obj/item/shoes = null
	var/obj/item/belt = null
	var/obj/item/gloves = null
	var/obj/item/neck = null
	var/obj/item/glasses = null
	var/obj/item/l_ear = null
	var/obj/item/r_ear = null
	var/obj/item/wear_id = null
	var/obj/item/wear_pda = null
	var/obj/item/r_store = null
	var/obj/item/l_store = null
	var/obj/item/s_store = null

	var/icon/stand_icon = null

	var/voice = ""	//Instead of new say code calling GetVoice() over and over and over, we're just going to ask this variable, which gets updated in Life()

	var/datum/personal_crafting/handcrafting

	var/special_voice = "" // For changing our voice. Used by a symptom.
	var/special_tts_voice = ""

	var/hand_blood_color

	var/name_override //For temporary visible name changes

	var/xylophone = 0 //For the spoooooooky xylophone cooldown

	var/mob/remoteview_target = null
	var/meatleft = 3 //For chef item
	var/decaylevel = 0 // For rotting bodies
	var/max_blood = BLOOD_VOLUME_NORMAL // For stuff in the vessel
	var/bleed_rate = 0
	var/bleedsuppress = 0 //for stopping bloodloss

	var/heartbeat = 0
	var/receiving_cpr = FALSE

	var/datum/body_accessory/body_accessory = null
	/// Name of tail image in species effects icon file.
	var/tail
	/// Same as tail but wing
	var/wing
	/// Lazy list of all limbs we know are splinted.
	var/list/splinted_limbs
	var/original_eye_color = "#000000"

	/// Holder for the phisiology datum
	var/datum/physiology/physiology

	/// What types of mobs are allowed to ride/buckle to this mob. Only human for now
	var/static/list/can_ride_typecache = typecacheof(list(/mob/living/carbon/human))
