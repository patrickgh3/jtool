Jump tool (for lack of a better name)
===

A tool for guy game players and creators to practice advanced techniques and design intricate platforming. For a long time, the community has used <a href="http://delicious-fruit.com/ratings/game_details.php?id=12455">RMJ</a> by TheNewGeezer, which is a great tool, but it lacks a few features and its UI is quirky in a few places. I had the motivation to make this tool and make it well, so here we are.

The guy game community is a small but passionate group fascinated with a very niche kind of game genre. Guy games are platformers with a particular set of physics, intricate platforming, a whole slew of tropes and sub-genres, and filled to the brim with charm. Most all guy games are made in GameMaker, so I made this tool in GameMaker to perfectly emulate the player physics.

![](http://i.imgur.com/nhoLqV1.png)

How to build
---
Get GameMaker:Studio from <a href="http://www.yoyogames.com/">YoYo Games</a>; the free version is just fine. This project was made in version 1.4.1657.

Download and import the <a href="http://gmc.yoyogames.com/index.php?showtopic=567528">GMFileSystem legacy extension</a>.

In the script mainInit, set the global variable editor_project to be the folder the project resides in. This allows GMFileSystem to work correctly when running the game from the editor (as opposed to exporting the game).

You should be good to go. Have fun tweaking stuff or poking around in the code. If you're having trouble, feel free to contact me; my info is in documentation_index.html.

//
http://www.mediafire.com/file/47z25w41pwy91wd/jtool.7z
Save states and frame advance added by DuckNumbers.