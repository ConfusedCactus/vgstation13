/*
//////////////////////////////////////

Voice Change

	Very Very noticable.
	Lowers resistance considerably.
	Decreases stage speed.
	Reduced transmittable.
	Fatal Level.

Bonus
	Changes the voice of the affected mob. Causing confusion in communication.

//////////////////////////////////////
*/

/datum/symptom/voice_change

	name = "Voice Change"
	stealth = -2
	resistance = -3
	stage_speed = -3
	transmittable = -1
	level = 6

/datum/symptom/voice_change/Activate(var/datum/disease/advance/A)
	..()
	if(prob(SYMPTOM_ACTIVATION_PROB))

		var/mob/living/carbon/M = A.affected_mob
		switch(A.stage)
			if(1, 2, 3, 4)
				to_chat(M, "<span class='notice'>[pick("Your throat hurts.", "You clear your throat.")]</span>")
			else
				if(ishuman(M))
					var/mob/living/carbon/human/H = M
					var/random_name = H.species.makeName(H.gender,H)
					H.SetSpecialVoice(random_name)

	return

/datum/symptom/voice_change/End(var/datum/disease/advance/A)
	..()
	if(ishuman(A.affected_mob))
		var/mob/living/carbon/human/H = A.affected_mob
		H.UnsetSpecialVoice()
	return
