Jtool
===

[Download newest version - v1.3.1](TODO)
---

Here is a link to the old forum thread: [http://iwannacommunity.com/forum/index.php?topic=1964.0]()

About
---

A tool for guy game players and creators to practice advanced techniques and design intricate platforming. For a long time, the community has used <a href="http://delicious-fruit.com/ratings/game_details.php?id=12455">RMJ</a> by TheNewGeezer, which is a great tool, but it lacks a few features and its UI is quirky in a few places. I had the motivation to make this tool and make it well, so here we are.

The guy game community is a small but passionate group fascinated with a very niche kind of game genre. Guy games are platformers with a particular set of physics, intricate platforming, a whole slew of tropes and sub-genres, and filled to the brim with charm. Most all guy games are made in GameMaker, so I made this tool in GameMaker to perfectly emulate the player physics.

![](http://i.imgur.com/nhoLqV1.png)

How to build
---
Get GameMaker:Studio from <a href="http://www.yoyogames.com/">YoYo Games</a>; the free version is just fine. This project was made in version 1.4.1657.

Download and import the <a href="http://gmc.yoyogames.com/index.php?showtopic=567528">GMFileSystem legacy extension</a>.

In the script mainInit, set the global variable editor_project to be the folder the project resides in. This allows GMFileSystem to work correctly when running the game from the editor (as opposed to exporting the game).

You should be good to go. Have fun tweaking stuff or poking around in the code. If you're having trouble, feel free to contact me; my info is in documentation_index.html.

Contributing
---
I don't have much interest in maintaining jtool anymore. Hopefully this process
will allow others to make new "official" jtool versions if they wish.

Make a Github fork of master, and work off of that. When you're ready to
release a new version, see below.

How to release a new version
---
1. Make sure you've tested thoroughly, preferably with another set of eyes,
so that the new version doesn't cause problems with people.
2. Update changelog.txt.
3. Update mainInit script with the new version number.
4. Package a release zip. (see below)
5. Update README.md with the new download link and version number.
6. Update current-version.json. (Jtool reads this file to see if it's
out-of-date)
7. Make a pull request, and message Patrick no. 0303 on Discord so I can
approve it.

How to package a relase zip
---
1. Compile the game as a zip (not executable or installer).
2. Unzip that zip into a temp folder.
3. Add the other files to the temp folder.
[See this image](https://i.imgur.com/2jeg6OW.png)
4. Zip the temp folder.
5. Upload to your favorite file hosting site.

---

Save states and frame advance added by DuckNumbers.

Controls: 

[F5-F12] = Load Save State
 
Enter + [F5-F12] = Create Save State

Space = Pause/Advance

F1 = Unpause

Hold when pressing Advance:

K = Shift Press

L = Shift Release

U = Nudge Left

I = Nudge Right

O = Left for Vines

P = Right for Vines
