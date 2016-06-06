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

##Development Log: ##
Anthony 5/12/16:

-Started working on level editor

-Made the Tile class and added functionality

Anthony 5/14/16

-Found and resized the necessary sprites

-Made it so that sprites and map are displayable

Anthony 5/16/16

-Made a palette on the level editor to select different blocks

-After selecting the blocks you can change the type of individual tiles

Anthony 5/18/16

-Imported the sprites

-Created the walk function

Bug: walking is really laggy, especially when changing directions

Anthony 5/20/16

-Working on making the tiles destroyable and adding collisions


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

##Project plan/outline including our goals prioritized by importance and chronology (things to do + things already done): ##
(SUBJECT TO CHANGE)

1. Make level editor
- make a default map to test and for users to start with
2. Implement the mechanics of the game such as: the player, bombs, powerups, powerdowns, obstacles
3. Create AIs with different difficulty levels
4. Making different game modes such as: (will be added)
5. TRY to make 3D version


Link to Demo version:
