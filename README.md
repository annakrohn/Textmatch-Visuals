TextMatch-Visuals
=================

A tool for creating visual representations of word matches between two texts.

This program is based on what are more commonly bioinfomatics concepts; the [Needleman–Wunsch](http://en.wikipedia.org/wiki/Needleman%E2%80%93Wunsch_algorithm) algorithm, 
[global alignment](http://en.wikipedia.org/wiki/Sequence_alignment#Global_and_local_alignments), and dot-matrix plots.  Many areas of literature have long histories of textual study 
and comparison, so this analysis is nothing new, but presents a means of visualizing the relations between words in two sections of text.  A work can be compared to itself or mapped to other works to find word, and potentially phrase, similarities and differences.  
TM-V is far from complete.  At the moment it will match one-to-one and via shared stems.  Some words, however, aren't shown as related by the lemmatizer. For example, sing and sung, while the same verb in different conjugations, are not marked as linked due to the difference in stems.  Lemmatizers aren't built to detect irregular or changing stems, so it is perhaps not the best tool for mapping morphological links. For now it is an improvement on the one-to-one word matching, but I will have to further investigate the best method for proceeding.

Use
---
In order generate a textmatch image with TM-V, run from the command line, 

	create_textmatch_image.rb -o [path] -t [path] -s [path]

	--help
	Usage: create_textmatch_image.rb [options], provide paths for text files and path 
	for where the output image should be saved, be sure to inlucde the proper file extension, 
	.jpg, .png, etc. If no save path is provided, the image will not save.
    
    -o, --text_one [path_to_file]    Input path for first text
    -t, --text_two [path_to_file]    Input path for second text
    -s, --save_to [path_to_save]     Input the save path


The -o and -t flags are for specifying the files of the texts to be compared.  If you want the image you create to be saved, provide a path with the -s flag.  If no -s is included, the textmatch image will only be displayed, not saved.  
As an example, I've provided two sample text files with the following exerpts of the Aeneid.   
	Text_1
    'I sing of arms and the man, he who, exiled by fate,
	first came from the coast of Troy to Italy, and to
	Lavinian shores – hurled about endlessly by land and sea,
	by the will of the gods, by cruel Juno’s remorseless anger,
	long suffering also in war, until he founded a city
	and brought his gods to Latium: from that the Latin people
	came, the lords of Alba Longa, the walls of noble Rome.
	Muse, tell me the cause: how was she offended in her divinity,'

	Text_2
	'There was an ancient city, Carthage (held by colonists from Tyre),
	opposite Italy, and the far-off mouths of the Tiber,
	rich in wealth, and very savage in pursuit of war.
	They say Juno loved this one land above all others,
	even neglecting Samos: here were her weapons
	and her chariot, even then the goddess worked at,
	and cherished, the idea that it should have supremacy
	over the nations, if only the fates allowed.'

Comparing text_1 to itself produces the below image.
![same](http://imgur.com/8ggWG.jpg)

And comparing the different texts produces this image.
![different](http://imgur.com/yM8Sk.jpg)

The black dots represent direct word matches while the red dots indicate a stem match. You can supply any other text in a .txt file and run them to compare the matching words.  It is best, however, that the files not be too large, since the process is O(n^2).

To-Do
----- 
*  add further grammar support (irregular verb conjugations) 
*  add a key of matched words and positions to make the image more legible 
*  add Latin language grammar support

Installation
------------
Other than the Ruby standard library, TM-V uses the [Ruby-Stemmer gem](https://github.com/aurelian/ruby-stemmer), [ImageMagick](http://www.imagemagick.org/script/index.php) library 
and the [RMagick gem](http://rmagick.rubyforge.org/). 
