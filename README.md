# Bomberman #
Making Bomberman for APCS Spring Final Project

##Team Name: Ziggs##

##Project Name/ Description: ##
Name: Operation BumberMan/ BombCraft

Description: We want to create a replica of the game Bomberman. The objective of the game
is to kill enemies using bombs. You can pick up powerups to gain an advantage/disadvantage 
over your opponent. You want to be the last player standing. There will be a level editor 
to allow players to create their own maps. We will also implement AI to create bots that players
can practice against. There will be three different AI difficulty levels: easy, normal, hard. 
Lastly, we will TRY to implement a 3-D version of the game. 

##How To Use/Play: ##
1) Click on Normal Game on the start up menu.
2) Player One then chooses a color he/she wants.
3) Player Two then chooses a color he/she wants.
4) Game will start, the player who lives, wins the game.

##Controls##
Player One :

w,a,s,d are movement for up,left,down,right respectively, x is to drop the bomb.

Player Two:

arrow keys are for the movement and '/' is to drop the bomb.

##Development Log: ##
Anthony 5/12/16:

- Started working on level editor

- Made the Tile class and added functionality

Anthony 5/14/16

- Found and resized the necessary sprites

- Made it so that sprites and map are displayable

Anthony 5/16/16

- Made a palette on the level editor to select different blocks

- After selecting the blocks you can change the type of individual tiles

Anthony 5/18/16

- Imported the sprites

- Created the walk function

- Bug: walking is really laggy, especially when changing directions

Anthony 5/20/16

- Working on making the tiles destroyable and adding collisions

Matthew 5/22/16

- fixing Ai with collision. Broke the game.

Anthony 5/22/16

- Revised entire code, took out all the maps and used grid

- It was easier to do it that way, using ArrayLists

- collisions perfect, working on making the Sprite die

Anthony 5/24/16

- Incorporated bomb range, made bombs have longer range

- Fixed dropping bomb mechanic 

- Commented my code, fixed the frames for explosion, making it slower and adding

- a delay time between the bomb and explosion

Matthew 5/24/16

- tried to make AI not have shadows follow bots. fixed. movements bugged again.

Anthony 5/25/16

- Fixed the wall breaking animation, stop generating the arms when reaches wall

- If there is no wall in the path, show arms of explosion too

- Still working on fixing the bounds between explosion and sprite

Matthew 5/25/16

- Single movement possible. Doesn't spazz.

Anthony 5/27/16

- Fixing all these bugs in my code, made helper functions 

- Took out a lot of useless code, and simplified the rest

- Found more bugs in the collision testing, bomb dropping, and explosion

Anthony 5/28/16

- Got tired of fixing these bugs, the bound checking was really confusing

- Started making PowerUps, adding them to the grid 

- Did some research on powerUp effects and found crappy images for them

- Took awhile to find images because Google doesn't many sprites for Bomberman

Anthony 5/29/16

- Added the timer (maybe I need it) to keep track of time for the powerUps

- Placed powerUps on the map, allowed Sprites to pick them up

- Sprites are affected by the powerUps, did only the basic few for now

- turns out I didn't use the timer, but instead I used built in millis();

Anthony 6/2/16

- Added some more powerUp effects, hoping to make the more complicated ones soon

- Fixed some bugs in the powerUp function, allows it to stack powerUps

- also sets a timer to reduce the effects of the powerUp after 10 seconds

Anthony 6/4/16

- Did a lot of code testing, found some bugs with Sprite die function

- Bug: the explosion doesn't hit the sprite, but still dies

- Added the gameStates (menu, inGame, and victory) 

- found the images for them (took forever)

Anthony 6/5/16

- Made victory screen and separated the level editor and actual game

- More graphics stuff, fixed the bomb image

- Found new bug: Moving bomb function doesn't work properly

Anthony 6/6/16

- Working on fixing the bug 

- Fixed the bomb collisions, added finishing touches to game

- Added a winner function to determine the winner based on score

- We do not have a functional AI yet, so features cannot be tested

- Created Restart button (should've done so awhile ago)

- NVM, made a functional multiplayer mode

- Added the tie game screen, fixed up code, sorry for the crappy makeshift multiplayer mode

Matthew 5/22/16

- fixing Ai with collision. Broke the game.

Matthew 5/24/16

- tried to make AI not have shadows follow bots. fixed. movements bugged again.

Matthew 5/25/16

- Single movement possible. Doesn't spazz.

Matthew 5/30/16

-Bots now drop bombs when surrounded by breakable walls and/ or playerse.

-bots move one tile at a time and moves to a safespot when a bomb is planted.

Matthew 6/1/16

-Added bomb detection and player detection for bots and using these for better decision making
-bots are a bit buggy using this 

Matthew 6/3/16

-Added detection of the nearest bomb so it's easier for bots to avoid these bombs. For ex, if there's 2 or more bombs within its radius, it'll take care of the nearest bomb first.

Matthew 6/5/16

-Added a method for bots to avoid it's own placed bombs and other explosions more effectively.
-Bug where it will not always make the best actions to avoid bombs. Sometimes run into other bombs and die.

Matthew 6/6/16

-Bots move in a weird way. probably conflicts with p2 on multiplayer mode.


Anthony:

##Project plan/outline including our goals prioritized by importance and chronology (things to do + things already done): ##
(SUBJECT TO CHANGE)

1. Make level editor
- make a default map to test and for users to start with
2. Implement the mechanics of the game such as: the player, bombs, powerups, powerdowns, obstacles
3. Create AIs with different difficulty levels
4. Making different game modes such as: (will be added)
5. TRY to make 3D version

Anthony: 

##Future Implementation/ Bug Fixes/ More Features?

1. Finish up the AI, make better AIs that don't crash
2. Add more powerUp effects, even though we have more than enough
3. Make mechanics smoother and graphics better
4. If we get AIs working, we could create different modes.
