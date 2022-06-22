# tic_tac_toe

A two-player game of tic-tac-toe for the terminal. Made in Ruby.

## Requirements

Requires download of the tic_tac_toe.rb file and Ruby. Playable with
$ruby tic_tac_toe.rb command. Or, of course, in irb or another environment.

## Development

Initial version of this game used the board to track moves. Non-reusable spaces
meant that players would be able to tell visually who won.

Current version tracks the positions of plays against a nested array of
winning moves, as I initially intended.

Due to the simplicity of the program, the "game" and "player" classes are
stored in a module rather than separate files.

### Notes

Created as part of [The Odin Project](https://www.theodinproject.com).