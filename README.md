# BrailleDetector
In this project, I am trying to detect Braille dot groups on a piece of paper and convert it back to original text. I use Template matching and lookup each letter using its template. I tried working with one template from a certain picture with specific conditions, but it didn’t work for the same paper with different conditions. That made me think that I should rather focus on finding dots on one picture for each template.

In this example, the program detects standard Braille alphabet only, but without abbreviations and shortcuts ( things like “ing”, “he/him”, “th”, “st”, etc). Here’s the result of the experiment:

I started with an initial table of letters and their number of occurrences (ignoring abbreviations, so if there’s an abbreviation for “st” it just counts it as “s” and “t”) as follows:

Without P, Q, Z because they weren’t available in the textbook I picked.
Initial

| Letter  | # of occurences |
| ------------- | ------------- |
| A  | 5 |
| (a)  | 23  |
| Aa  | 27  |
| B  | 9  |
| C  | 9  |
| D  | 6  |
| E  | 20  |
| F  | 8  |
| G  | 3  |
| H  | 4  |
| I  | 15  |
| J  | 1  |
| K  | 8  |
| L  | 9  |
| M  | 2  |
| N  | 16  |
| O  | 13  |
| P  | 0  |
| Q  | 0  |
| R  | 17  |
| S  | 1  |
| T  | 16  |
| U  | 7  |
| V  | 3  |
| W  | 1  |
| R  | 17  |
| X  | 3  |
| Y  | 3  |
| Z  | 0  |


Then I counted the number of occurrences after removing abbreviations. I used this website (https://www.brailletranslator.org/) that converts text to Braille and changes the text to the standard form, so it eliminates and abbreviations and leaves only regular letters

Initial (Without abbreviations)
| Letter  | # occurrences after w/o abbr |
| ------------- | ------------- |
| A  | 5 |
| (a)  | 12  |
| Aa  | 17  |
| B  | 9  |
| C  | 9  |
| D  | 4  |
| E  | 4  |
| F  | 8  |
| G  | 1  |
| H  | 0  |
| I  | 7  |
| J  | 1  |
| K  | 8  |
| L  | 9  |
| M  | 2  |
| N  | 4  |
| O  | 9  |
| P  | 0  |
| Q  | 0  |
| R  | 10  |
| S  | 10  |
| T  | 5  |
| U  | 3  |
| V  | 3  |
| W  | 0  |
| X  | 3  |
| Y  | 3  |
| Z  | 0  |

And these are the results

| Letter  | Correct detections |
| ------------- | ------------- |
| A  | 3/5 |
| (a)  | 6/12  |
| Aa  | 9/17  |
| B  | 9/9  |
| C  | 9/9, 3 wrong groups  |
| D  | 3/4, 4 wrong  |
| E  | 4/6, 4 wrong  |
| F  | 5/8, 1 wrong  |
| G  | 1/1  |
| H  | 0/0, 10 wrong  |
| I  | 4/7  |
| J  | 1/1  |
| K  | 3/8  |
| L  | 7/9, 2 wrong  |
| M  | 2/2  |
| N  | 2/4  |
| O  | 3/9  |
| P  | 0  |
| Q  | 0  |
| R  | 10/10, 10 wrong  |
| S  | 1/1, 1 wrong  |
| T  | 4/5, 6 wrong  |
| U  | 2/3, 1 wrong  |
| V  | 2/3, 9 wrong  |
| W  | 0  |
| X  | 2/3, 2 wrong  |
| Y  | 2/3, 5 wrong  |
| Z  | 0  |



Evaluation:

Number of correct detected letters: 94
Total number of letters: 139

Success rate of 67.6%

I am interested in working on a more robust version of the project to include abbreviations, shortcuts, and maybe a real-time version of it.
