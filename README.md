Textmatch-Visuals
=================

A tool for creating visual representations of word matches between two texts.

This program is based on what are more commonly bioinfomatics concepts; the [Needleman–Wunsch](http://en.wikipedia.org/wiki/Needleman%E2%80%93Wunsch_algorithm) algorithm, 
[global alignment](http://en.wikipedia.org/wiki/Sequence_alignment#Global_and_local_alignments), and dot-matrix plots.  Many areas of literature have long histories of textual study 
and comparison, so this analysis is nothing new, but presents a means of visualizing the relations between words in 
two sections of text.  A work can be compared to itself or mapped to other works to find word, and potentially phrase, 
similarities and differences.  T-V is far from complete.  At the moment only one-to-one word matches are supported and 
the texts are hard coded.

Use
---
As an example, in create_textmatch_image.rb I've called make_image_of with the following text of the Aeneid supplied twice.   

    'I sing of arms and the man, he who, exiled by fate,  
    first came from the coast of Troy to Italy, and to  
    Lavinian shores hurled about endlessly by land and sea,  
    by the will of the gods, by cruel Juno’s remorseless anger,  
    long suffering also in war, until he founded a city  
    and brought his gods to Latium'

Comparing the text to itself in this manner produces the below image.
![blarg](http://i.imgur.com/dgsqS.png)


To-Do
-----
*  add support for command line input of text, either inputting strings directly or in file format  
*  add a stemmer or lemmatizer, I'll probably be making use of [Ruby-Stemmer](https://github.com/aurelian/ruby-stemmer)  
*  add Latin language grammar support

Installation
------------
Other than the Ruby standard library, T-V uses the [ImageMagick](http://www.imagemagick.org/script/index.php) library 
and the [RMagick gem](http://rmagick.rubyforge.org/). 
