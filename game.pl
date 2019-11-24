/*
CPSC 312 Project 2 - Choose Your Own Adventure
Tiger Oakes 
Meng Hsun "Daphne" Liu

*/ 

/* current state of player */ 
current_state(start).

/* What players type in order to move*/
1 :- move(1).

2 :- move(2).

3 :- move(3).


/* beginning instructions */
start :-
    write('You are at a prolog conference and have been logical for 7 hours straight.'), nl,
    write('Taking advantage of all of the free soda and coffee supplied at the event,'), nl,
    write('you realize that your bladder is quite full.'), nl,
    write('GOTO (lost_in_school)').

/* end of game */

// find_bathroom
success :-
        nl,
        write('You can’t believe why you didn’t think of asking anyone earlier. You make it to the bathroom and carry on with your hackathon. Quest: completed. Please enter the halt command.'),
        nl.

// peed_pants
fail :-
        nl,
        write('You peed your pants. Quest: failed. Quest: failed. Please enter the halt command.'),
        nl.

/* instructions */

instructions :-
        nl,
        write('Enter commands using standard Prolog syntax.'), nl,
        write('Available commands are:'), nl,
        write('start.                        -- to start the game.'), nl,
        write('1.  2.  3                    -- to choose the path.'), nl,
        write('instructions.              -- to see this message again.'), nl,
        write('halt.                          -- to end the game and quit.'), nl,
        nl.

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

path(exit_hole, 1, find_bathroom) :-
    
    nl,
    success.


/* Pathways */
move(Choice) :-
    current_state(Old_State),
    path(Old_State, Choice, NewState),
    describe(NewState), !.

move(Choice) :-
    current_state(Old_State),
    path(Old_State, Choice, NewState),

move(Choice) :-
    current_state(Old_State),
    path(Old_State, Choice, NewState),

goto(Old_State, NewState) :- 
    current_state(Old_State),
    describe(NewState), !.



goto(start, lost_in_school).
goto(kicks_bladder, peed_pants).
goto(need_to_go, forgot_key).

end(peed_pants).
end(find_bathroom).

path(lost_in_school, 1, friend).
path(lost_in_school, 2, people_walking_by).
path(lost_in_school, 3, janitor_closet).

path(friend, 1, drones_on).
path(friend, 2, kicks_bladder).

path(drones_on, 1, need_to_go).
path(drones_on, 2, kicks_bladder).

path(forgot_key, 1, public_bathroom).
path(forgot_key, 2, peed_pants).

path(public_bathroom, 1, wait_in_line).
path(public_bathroom, 2, people_walking_by).

path(wait_in_line, 1, demand_pee).
path(wait_in_line, 2, people_walking_by).

path(demand_pee, 1, peed_pants).

path(people_walking_by, 1, campus_security).
path(people_walking_by, 2, need_to_go).

path(campus_security, 1, forgot_key).
path(campus_security, 2, lost_in_school).

path(janitor_closet, 1, locked).
path(janitor_closet, 2, flying_toilets).

path(locked, 1, peed_pants).
path(locked, 2, flying_toilets).

path(flying_toilets, 1, toilet_ride).
path(flying_toilets, 2, exit_hole).

path(toilet_ride, 1, exit_hole).
path(toilet_ride, 2, exit_hole).

path(exit_hole, 1, find_bathroom).
path(exit_hole, 2, friend).
path(exit_hole, 3, people_walking_by).
