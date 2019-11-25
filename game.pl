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
        write('you realize that your bladder is quite full.'), 
        nl.

/* end of game */

success :-
        nl,
        write('You can’t believe why you didn’t think of asking anyone earlier.'), nl,
        write('You make it to the bathroom and carry on with your conference.'), nl,
        write('Quest: completed.').
        write('Please enter the halt command.'),
        nl.

fail :-
        nl,
        write('You peed your pants.'), n1,
        write('Quest: failed.').
        write('Please enter the halt command.'),
        nl.

/* instructions */

instructions :-
        nl,
        write('Enter commands using standard Prolog syntax.'), nl,
        write('Available commands are:'), nl,
        write('start.                        -- to start the game.'), nl,
        write('1.  2.  3                    -- to choose the path.'), nl,
        write('instructions.                -- to see this message again.'), nl,
        write('halt.                          -- to end the game and quit.'), nl,
        nl.

/* describes a location */

describe(lost_in_school) :-
    write('However, you don’t know where the bathroom is.'), nl,
    write('Do you wander around? (1)'), nl,
    write('Do you go pee in a bush? (2)'), nl,
    write('Do you look at the building directory? (3)').

describe(friend) :-
    write('You bump into your friend from your haskell class.'), nl,
    write('She needs to tell you something.'), nl,
    write('Do you listen to her? (1)'), nl,
    write('Do you avoid conversation? (2)').

describe(drones_on) :-
    write('You friend begins to ramble on about algorithms and functional programming.'), nl,
    write('You can\'t hold on for much longer.'), nl,
    write('Do you say you need to go? (1)'), nl,
    write('Do you cut her off? (2)').

describe(kicks_bladder) :-
    write('Your friend throws a fit and kicks you in the bladder.').

describe(need_to_go) :-
    write('You really need to go.'), nl,
    write('You begin to hallucinate about waterfalls.'), nl,
    write('You run home.').

describe(forgot_key) :-
    write('You reach in your back pocket and find that you forgot your keys.'), nl,
    write('No one is home.'), nl,
    write('Do you find a public bathroom? (1)'), nl,
    write('Do you call your roomate a wait? (2)').

describe(public_bathroom) :-
    write('You head to the local coffee store.'), nl,
    write('There is a huge lineup for the bathroom.'), nl,
    write('Do you wait in line? (1)'), nl,
    write('Do you go pee in a bush? (2)').

describe(wait_in_line) :-
    write('You decide to wait in line.'), nl,
    write('You are growing impatient.'), nl,
    write('Do you demand to go first? (1)'), nl,
    write('Do you go pee in a bush? (2)').

describe(demand_pee) :-
    write('You demand to go first but the person glares at you.'), nl,
    write('Do you pee your pants in defiance? (1)').

describe(people_walking_by) :-
    write('You see people walking by you.'), nl,
    write('Do you pee anyway? (1)'), nl,
    write('Do you wait for them to leave? (2)').

describe(campus_security) :-
    write('Before you can start,'), nl,
    write('campus security spots you and begins to chase after you.'), nl,
    write('Do you run home? (1)'), nl,
    write('Do you run back to school? (2)').

describe(janitor_closet) :-
    write('You were misled and you end up in a janitor’s closet.'), nl,
    write('You look in the back and notice what appears to be a wormhole.'), nl,
    write('Do you leave the closet? (1)'), nl,
    write('Do you approach the wormhole? (2)').

describe(locked) :-
    write('The closet door is locked.'), nl,
    write('Do you cry in a corner? (1)'), nl,
    write('Do you enter the wormhole? (2)').

describe(flying_toilets) :-
    write('In the wormhole,'), nl,
    write('you look around and see golden toilets flying past you.'), nl,
    write('Do you try grabbing onto one? (1)'), nl,
    write('Do you watch them fly by? (2)').

describe(toilet_ride) :-
    write('You manage to grab onto one but notice the toilets are glued shut.'), nl,
    write('You are now traversing a wormhole on a golden toilet.'), nl,
    write('Weird stuff.'), nl,
    write('Do you try prying it open? (1)'), nl,
    write('Do you let go? (2)').

describe(exit_hole) :-
    write('You fall out of the hole and end up back in the building where you first started.'), nl,
    write('That was a strange experience.'), nl,
    write('It’s a wonder how your bladder still hasn’t exploded yet.'), nl,
    write('Do you ask a passerby for directions? (1)'), nl,
    write('Do you run home? (2)'), nl,
    write('Do you go pee in a bush? (3)').

/* ACTIONS */

/* move to another state according to user input */

move(Choice) :-
    current_state(OldState),
    path(OldState, Choice, NewState),
    describe(NewState), !.

/* end the game */

end(peed_pants) :-
    current_state(peed_pants),
    goto(peed_pants, fail), !.

end(find_bathroom) :-
    current_state(find_bathroom),
    goto(find_bathroom, fail), !.

/* jumping to another state without user input */

goto(OldState, NewState) :- 
    current_state(OldState),
    describe(NewState), !

/* PATHWAYS */

goto(start, lost_in_school).
goto(kicks_bladder, peed_pants).
goto(need_to_go, forgot_key).

goto(peed_pants, success).
goto(find_bathroom, fail).

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
