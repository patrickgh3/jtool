Jtool
===

[Download newest version - v1.3.1](http://www.mediafire.com/file/cwfmfmogjs5zyuj/jtool%201.3.1.zip)
---

Here is a link to the old forum thread:
[http://iwannacommunity.com/forum/index.php?topic=1964.0]()

About
---

Jtool is a "jump tool" for IWBTG fangame players/creators to practice advanced
techniques and design platforming. It's inspired by
<a href="http://delicious-fruit.com/ratings/game_details.php?id=12455">RMJ</a>
by Thenewgeezer. To learn more about the IWBTG fangame community, visit
[fangam.es/intro](https://fangam.es/intro).

![](http://i.imgur.com/nhoLqV1.png)

For developers
===

I've lost interest in maintaining Jtool. But I'm going to let others make
their own improvements and new official versions, since Redire, Starz0r, and
DuckNumbers have wanted to. So Jtool will be open source, in the sense that
anyone can contribute, and I'll just approve pull requests.

To contribute, make your own fork of the repository. See the section below for
releasing new versions. You can contact me at Patrick no. 0303 on Discord.

How to build
---
Get GameMaker:Studio from
<a href="https://www.yoyogames.com/downloads/gm-studio/release-notes-studio.html">here</a>.
Recommended to use 1.4.1757 since some computers have trouble with exes
compiled on newer versions.

In the script misc/mainInit, set the global variable editor_project to be the
folder the project resides in. This allows GMFileSystem to work correctly when
running the game from the editor's green play button (as opposed to the
exported application).

How to release a new version
---
1. Make sure you've tested thoroughly, preferably with another set of eyes,
so that the new version doesn't cause problems with people.
2. Update changelog.txt.
3. Update mainInit script with the new version number.
4. Package a release zip. (see below)
5. Update README.md with the new download link and version number.
6. Update current-version.json. (Jtool reads this file from Github to check if
there's a new version)
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

