# Wordle

[Wordle](https://www.nytimes.com/games/wordle/index.html) is a web-based word game created and developed by Welsh software engineer Josh Wardle,
and owned and published by The New York Times Company since 2022.
Players have six attempts to guess a five-letter word,
with feedback given for each guess in the form of colored tiles indicating when letters match
or occupy the correct position.
The mechanics are nearly identical to the 1955 pen-and-paper game Jotto and the television game show franchise Lingo.
Wordle has a single daily solution, with all players attempting to guess the same word.

## Hive Rush aka Team work

### V.1 Assistant Part 

We got this very first side project to work in team.
The task was to create an assistant for wordle game which using wordle database and sorting out the wrong words and listing only
what is still available and possibly the right one, for the user.

With my team mates we considered lot of possible way to start, but in the end we decided to go with ***C*** language, because that was what we knew the most.
Then I was playing a little bit with the ```awk``` command and figured out we could actually use that, so we can save tons of time to recreate basic functions
to solve this problem.
So after pitched the idea for my team mates we agreed to go with bash script and our strategy based on this ```awk``` command.
It worked out pretty well in the end, and we were able to solve task1 and task2.


<img width="662" alt="Screenshot 2022-03-15 at 9 29 23" src="https://user-images.githubusercontent.com/83179142/158327842-d9fd3a36-a414-41c7-9f77-d1f8ca913e8c.png">


### V.2 Player Part

On the Player part we had to make an AI/player who would play the game.
Here we used our script from the assistant part, but we added small modification which recommending the word which having the highest chance to be the correct one.
We also saving the ```unique``` words to a text file to record the player. Unique words are which don't have double letter in them.
So we filtering out a tons of informations in each attemp which leading to that user can already win on the 3rd attempt.


<img width="655" alt="Screenshot 2022-03-15 at 9 36 02" src="https://user-images.githubusercontent.com/83179142/158328788-5387d330-f77d-40da-96e7-c611a494380f.png">

## BUGS to Solve

Beacuse of the high effiency of the player.sh file where we searching only unique words, we didn't have time to develope to check words with double letter.

# Usage:

After you cloned the repo:

    bash assistant.sh
    
    bash player.sh
    
The rest will be shown on the terminal!

    
### Credit

Thank you for the collaboration for:

    jddavis23
    reviisori
