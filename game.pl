/*
CPSC 312 Project 2 - Choose Your Own Adventure
Tiger Oakes
Meng Hsun "Daphne" Liu

Type `start.` to begin playing.
*/

/* current state of player */
:- dynamic current_state/1.
:- retractall(current_state(_)).

current_state(start).

/* What players type in order to move*/
a :- move(a).

b :- move(b).

c :- move(c).

/* beginning instructions */

start :-
    instructions,
    current_state(OldState),
    retract(current_state(OldState)),
    assert(current_state(start)),
    look,
    jump.

/* instructions */

instructions :-
    nl,
    write('Enter commands using standard Prolog syntax.'), nl,
    write('Available commands are:'), nl,
    write('start.         -- to start the game.'), nl,
    write('a.  b.  c      -- to choose a path.'), nl,
    write('instructions.  -- to see this message again.'), nl,
    write('halt.          -- to end the game and quit.'), nl,
    nl.

/* describes a location */

describe(start) :-
    write('You are at a prolog conference and have been logical for 7 hours straight.'), nl,
    write('Taking advantage of all of the free soda and coffee supplied at the event,'), nl,
    write('you realize that your bladder is quite full.'), nl,
    nl.

describe(lost_in_school) :-
    write('However, you don’t know where the bathroom is.'), nl,
    write('(a) Do you wander around?'), nl,
    write('(b) Do you go pee in a bush?'), nl,
    write('(c) Do you look at the building directory?').

describe(friend) :-
    write('You bump into your friend from your haskell class.'), nl,
    write('She needs to tell you something.'), nl,
    write('(a) Do you listen to her?'), nl,
    write('(b) Do you avoid conversation?'), nl.

describe(drones_on) :-
    write('You friend begins to ramble on about algorithms and functional programming.'), nl,
    write('You can\'t hold on for much longer.'), nl,
    write('(a) Do you say you need to go?'), nl,
    write('(b) Do you cut her off?'), nl.

describe(kicks_bladder) :-
    write('Your friend throws a fit and kicks you in the bladder.'), nl.

describe(need_to_go) :-
    write('You really need to go.'), nl,
    write('You begin to hallucinate about waterfalls.'), nl,
    write('You run home.'), nl.

describe(forgot_key) :-
    write('You reach in your back pocket and find that you forgot your keys.'), nl,
    write('No one is home.'), nl,
    write('(a) Do you find a public bathroom?'), nl,
    write('(b) Do you call your roomate and wait?').

describe(public_bathroom) :-
    write('You head to the local coffee store.'), nl,
    write('There is a huge lineup for the bathroom.'), nl,
    write('(a) Do you wait in line?'), nl,
    write('(b) Do you go pee in a bush?'), nl.

describe(wait_in_line) :-
    write('You decide to wait in line.'), nl,
    write('You are growing impatient.'), nl,
    write('(a) Do you demand to go first?'), nl,
    write('(b) Do you go pee in a bush?'), nl.

describe(demand_pee) :-
    write('You demand to go first but the person glares at you.'), nl,
    write('(a) Do you pee your pants in defiance?'), nl.

describe(people_walking_by) :-
    write('You see people walking by you.'), nl,
    write('(a) Do you pee anyway?'), nl,
    write('(b) Do you wait for them to leave?'), nl.

describe(campus_security) :-
    write('Before you can start,'), nl,
    write('campus security spots you and begins to chase after you.'), nl,
    write('(a) Do you run home?'), nl,
    write('(b) Do you run back to school?'), nl.

describe(janitor_closet) :-
    write('You were misled and you end up in a janitor’s closet.'), nl,
    write('You look in the back and notice what appears to be a wormhole.'), nl,
    write('(a) Do you leave the closet?'), nl,
    write('(b) Do you approach the wormhole?'), nl.

describe(locked) :-
    write('The closet door is locked.'), nl,
    write('(a) Do you cry in a corner?'), nl,
    write('(b) Do you enter the wormhole?'), nl.

describe(flying_toilets) :-
    write('In the wormhole,'), nl,
    write('you look around and see golden toilets flying past you.'), nl,
    write('(a) Do you try grabbing onto one?'), nl,
    write('(b) Do you watch them fly by?'), nl.

describe(toilet_ride) :-
    write('You manage to grab onto one but notice the toilets are glued shut.'), nl,
    write('You are now traversing a wormhole on a golden toilet.'), nl,
    write('Weird stuff.'), nl,
    write('(a) Do you try prying it open?'), nl,
    write('(b) Do you let go?'), nl.

describe(exit_hole) :-
    write('You fall out of the hole and end up back in the building where you first started.'), nl,
    write('That was a strange experience.'), nl,
    write('It’s a wonder how your bladder still hasn’t exploded yet.'), nl,
    write('(a) Do you ask a passerby for directions?'), nl,
    write('(b) Do you run home?'), nl,
    write('(c) Do you go pee in a bush?'), nl.

describe(find_bathroom) :-
    nl,
    write('You can’t believe why you didn’t think of asking anyone earlier.'), nl,
    write('You make it to the bathroom and carry on with your conference.'), nl,
    nl,
    write('Quest: completed.'), nl,
    write('Please enter the start or halt command.'),
    nl, !.

describe(peed_pants) :-
    nl,
    write('You peed your pants.'), nl,
    nl,
    write('Quest: failed.'), nl,
    write('Please enter the start or halt command.'),
    nl, !.

gameover(find_bathroom).
gameover(peed_pants).

/* ACTIONS */

/* describe the current location you are at */

look :-
    current_state(State),
    describe(State),
    nl.

/* move to another state according to user input */

move(_) :-
    current_state(State),
    gameover(State),
    write('Please enter the start or halt command.'), nl.

move(Choice) :-
    current_state(OldState),
    path(OldState, Choice, IntermediateState),
    goto(IntermediateState, NewState),
    retract(current_state(OldState)),
    assert(current_state(NewState)),
    describe(IntermediateState),
    !, look.

move(Choice) :-
    current_state(OldState),
    path(OldState, Choice, NewState),
    retract(current_state(OldState)),
    assert(current_state(NewState)),
    !, look.

move(_) :-
    write('You can\'t do that.'), nl.

/* jumping to another state without user input */

jump :-
    current_state(OldState),
    goto(OldState, NewState),
    retract(current_state(OldState)),
    assert(current_state(NewState)),
    !, look.

/* PATHWAYS */

goto(start, lost_in_school).
goto(kicks_bladder, peed_pants).
goto(need_to_go, forgot_key).

path(lost_in_school, a, friend).
path(lost_in_school, b, people_walking_by).
path(lost_in_school, c, janitor_closet).

path(friend, a, drones_on).
path(friend, b, kicks_bladder).

path(drones_on, a, need_to_go).
path(drones_on, b, kicks_bladder).

path(forgot_key, a, public_bathroom).
path(forgot_key, b, peed_pants).

path(public_bathroom, a, wait_in_line).
path(public_bathroom, b, people_walking_by).

path(wait_in_line, a, demand_pee).
path(wait_in_line, b, people_walking_by).

path(demand_pee, a, peed_pants).

path(people_walking_by, a, campus_security).
path(people_walking_by, b, need_to_go).

path(campus_security, a, forgot_key).
path(campus_security, b, lost_in_school).

path(janitor_closet, a, locked).
path(janitor_closet, b, flying_toilets).

path(locked, a, peed_pants).
path(locked, b, flying_toilets).

path(flying_toilets, a, toilet_ride).
path(flying_toilets, b, exit_hole).

path(toilet_ride, a, exit_hole).
path(toilet_ride, b, exit_hole).

path(exit_hole, a, find_bathroom).
path(exit_hole, b, friend).
path(exit_hole, c, people_walking_by).
