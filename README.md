# aqours-booklet
**[Download the finished booklets here!](https://suyo.be/llsif/3rddv/)**

This is the source code for the booklets we printed and distributed at some of the German locations of the Delayed Viewings of Aqours' 3rd Live "WONDERFUL STORIES". It contains some general information, an intro to calling, and lyrics and callguides for the entire setlist of the live.

I am releasing this code to give others the chance to use this as a base to create their own booklets - of course not everyone has experience in Latex, but I believe I designed this project in a way that should allow you to easily add more songs or your own information pages.

## Compiling
Executing `make` (or `make all`) will compile three versions of the booklet, and save them to the `output` subfolder - the regular booklet for downloading, one with all backgrounds removed for saving ink when printing at home, and one with 3mm extra bleed area on all outer edges for professional printing. They can also be compiled seperately with `make download`, `make nobg` and `make print` respectively.
The changes between the versions are controlled by defining two variables called `\nobackground` and `\bleed` before parsing the sources. Testing these variables inside the .tex files will allow you to add further changes between versions.

## Notes
If you want to use this as base for your own booklet, here's some tips and pointers:

 - Songs are fairly simple to add. A good example to start off with is the file for MY Mai☆TONIGHT ([songs/mymaitonight.tex](songs/mymaitonight.tex)). Metadata for the song is defined at the top, the `multicols` environment contains the lyrics. All other lines do not need to be changed, they deal with the styling and also allow compiling the song file seperately for previewing. Calls can be marked with commands such as `\callline` or `\sing`, several of which are used in the example mentioned above. You can find all callguide commands starting at line 170 in [definitions.tex](definitions.tex).
 - Info pages work similarly - the page title is defined in a variable - but after that, you can just write or layout whatever you want to have on the page. (I apologize for the mess that is [infopages/callsandresponses.tex](infopages/callsandresponses.tex).)
 - In case you want to keep consistency with the other callguide pages: For most lyrics I used [Hepburn romanization](https://en.wikipedia.org/wiki/Hepburn_romanization) but didn't use macrons for long vowels. I removed ellipses and commas, and capitalized only after other punctuation or at the start of a line (everything else in lowercase). For English words, I wrote them in English if they were written in the Roman alphabet in the original lyrics booklet, or in the Japanese syllabary if they were written in Katakana.
 - Backgrounds can be both vector files (PDF) or rasterized images. In this booklet, the page backgrounds are vectorized, while the full page images are PNGs. When making your own booklet, replacing the background files should be easy and you shouldn't need to make any other changes. Whether you choose vectors or not, make sure to add the 3mm of bleed to the top, bottom and outer edge. They will be cut off when not compiling the print version. (Also, of course, make sure that rasterized images have a high enough resolution - 300dpi is recommended for print.)
 - [definitions.tex](definitions.tex) contains a whole bunch of general settings and options, here's some important ones:
-- Line 23: Adjust the bleed area
-- Line 94: PDF Metadata
-- Line 129: Pre-defined member image colors to use for `\memberbgnote` and other stuff
-- Line 186: Styling for all page titles
-- Line 203: Styling for the headers of song pages
 - The main file [booklet.tex](booklet.tex) is only meant for arranging the pages which are in their own seperate files. `\include` all info and song pages you want in your booklet, and used the `\fullimagepage` command to embed a cover image. The second argument is the replacement when compiling the version without backgrounds. However, there's a slight quirk I didn't fix: if you have two `\fullimagepage`s back to back, you need to add a `\newpage` command between them.
 
If you have any further questions, please don't hesitate to contact me or open an issue.

## License
All original work in this repository is licensed under a [Creative Commons Attribution-ShareAlike 4.0 International License](https://creativecommons.org/licenses/by-sa/4.0/).

This includes the writing in the intro and the first chapter "About The Live", the layout and graphics, and all the drawings ([images/scribbles](images/scribbles)). When reused, they should be attributed to their creators as seen on the last page of the booklet ([infopages/credits.tex](infopages/credits.tex)).

The license does not apply to the second chapter "Calls And Lyrics", all trademarks, member icons and lyrics used that are owned by Project Love Live! Sunshine!!, and the [feather](https://en.wikipedia.org/wiki/File:Beige_Feather.svg) and [tiger](https://pixabay.com/en/tiger-stripes-standing-animal-tail-48303/) graphics (licensed under CC0).
