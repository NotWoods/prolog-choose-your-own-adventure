/* beginning instructions */
start :-
    write('You are at a prolog conference and have been logical for 7 hours straight.'), nl,
    write('Taking advantage of all of the free soda and coffee supplied at the event,'), nl,
    write('you realize that your bladder is quite full.'), nl,
    write('GOTO (lost_in_school)').

/* describes a location */

describe(lost_in_school) :-
    write('However, you don’t know where the bathroom is.'), nl,
    write('Do you wander around? (friend)'), nl,
    write('Do you go pee in a bush? (people_walking_by)'), nl,
    write('Do you look at the building directory? (janitor_closet)').

describe(friend) :-
    write('You bump into your friend from your haskell class.'), nl,
    write('She needs to tell you something.'), nl,
    write('Do you listen to her? (drones_on)'), nl,
    write('Do you avoid conversation? (kicks_bladder)').

describe(drones_on) :-
    write('You friend begins to ramble on about algorithms and functional programming.'), nl,
    write('You can\'t hold on for much longer.'), nl,
    write('Do you say you need to go? (need_to_go)'), nl,
    write('Do you cut her off? (kicks_bladder)').

describe(kicks_bladder) :-
    write('Your friend throws a fit and kicks you in the bladder.'), nl,
    write('GOTO (peed_pants)').

describe(need_to_go) :-
    write('You really need to go.'), nl,
    write('You begin to hallucinate about waterfalls.'), nl,
    write('You run home.'), nl,
    write('GOTO (forgot_key)').

describe(forgot_key) :-
    write('You reach in your back pocket and find that you forgot your keys.'), nl,
    write('No one is home.'), nl,
    write('Do you find a public bathroom? (public_bathroom)'), nl,
    write('Do you call your roomate a wait? (peed_pants)').

describe(public_bathroom) :-
    write('You head to the local coffee store.'), nl,
    write('There is a huge lineup for the bathroom.'), nl,
    write('Do you wait in line? (wait_in_line)'), nl,
    write('Do you go pee in a bush? (people_walking_by)').

describe(wait_in_line) :-
    write('You decide to wait in line.'), nl,
    write('You are growing impatient.'), nl,
    write('Do you demand to go first? (demand_pee)'), nl,
    write('Do you go pee in a bush? (people_walking_by)').

describe(demand_pee) :-
    write('You demand to go first but the person glares at you.'), nl,
    write('Do you pee your pants in defiance? (peed_pants)').

describe(peed_pants) :-
    write('You peed your pants.'), nl.
    write('Quest: failed.').

describe(people_walking_by) :-
    write('You see people walking by you.'), nl,
    write('Do you pee anyway? (campus_security)'), nl,
    write('Do you wait for them to leave? (need_to_go)').

describe(campus_security) :-
    write('Before you can start,'), nl,
    write('campus security spots you and begins to chase after you.'), nl,
    write('Do you run home? (forgot_key)'), nl,
    write('Do you run back to school? (lost_in_school)').

describe(janitor_closet) :-
    write('You were misled and you end up in a janitor’s closet.'), nl,
    write('You look in the back and notice what appears to be a wormhole.'), nl,
    write('Do you leave the closet? (locked)'), nl,
    write('Do you approach the wormhole? (flying_toilets)').

describe(locked) :-
    write('The closet door is locked.'), nl,
    write('Do you cry in a corner? (peed_pants)'), nl,
    write('Do you enter the wormhole? (flying_toilets)').

describe(flying_toilets) :-
    write('In the wormhole,'), nl,
    write('you look around and see golden toilets flying past you.'), nl,
    write('Do you try grabbing onto one? (toilet_ride)'), nl,
    write('Do you watch them fly by? (exit_hole)').

describe(toilet_ride) :-
    write('You manage to grab onto one but notice the toilets are glued shut.'), nl,
    write('You are now traversing a wormhole on a golden toilet.'), nl,
    write('Weird stuff.'), nl,
    write('Do you try prying it open? (exit_hole)'), nl,
    write('Do you let go? (exit_hole)').

describe(exit_hole) :-
    write('You fall out of the hole and end up back in the building where you first started.'), nl,
    write('That was a strange experience.'), nl,
    write('It’s a wonder how your bladder still hasn’t exploded yet.'), nl,
    write('Do you ask a passerby for directions? (find_bathroom)'), nl,
    write('Do you run home? (friend)'), nl,
    write('Do you go pee in a bush? (people_walking_by)').

describe(find_bathroom) :-
    write('You can’t believe why you didn’t think of asking anyone earlier.'), nl,
    write('You make it to the bathroom and carry on with your hackathon.'), nl,
    write('Quest: completed.').

/* Pathways */

goto(start, lost_in_school).
goto(kicks_bladder, peed_pants).
goto(need_to_go, forgot_key).
end(peed_pants).
end(find_bathroom).

path(lost_in_school, wander, friend).
path(lost_in_school, bush, people_walking_by).
path(lost_in_school, directory, janitor_closet).

path(friend, listen, drones_on).
path(friend, avoid, kicks_bladder).

path(drones_on, say_go, need_to_go).
path(drones_on, cut_off, kicks_bladder).

path(forgot_key, find, public_bathroom).
path(forgot_key, call, peed_pants).

path(public_bathroom, wait, wait_in_line).
path(public_bathroom, bush, people_walking_by).

path(wait_in_line, demand, demand_pee).
path(wait_in_line, bush, people_walking_by).

path(demand_pee, defy, peed_pants).

path(people_walking_by, go_anyway, campus_security).
path(people_walking_by, wait, need_to_go).

path(campus_security, run_home, forgot_key).
path(campus_security, run_school, lost_in_school).

path(janitor_closet, leave, locked).
path(janitor_closet, approach, flying_toilets).

path(locked, cry, peed_pants).
path(locked, enter, flying_toilets).

path(flying_toilets, grab, toilet_ride).
path(flying_toilets, watch, exit_hole).

path(toilet_ride, pry, exit_hole).
path(toilet_ride, let_go, exit_hole).

path(exit_hole, ask, find_bathroom).
path(exit_hole, run_home, friend).
path(exit_hole, bush, people_walking_by).
