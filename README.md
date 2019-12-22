# pscripts

Collection of a few shell scripts that I need during my development.

* srcvim
* srcgrep
* regdir code dir
* gtdir code

- Clone pscripts in your '~' folder.
- Put following line in your ~/.bashrc file
`alias srcvim=~/pscripts/srcvim.sh`


`srcvim`: Opens all the source files under a directory and recursively found in its subdirectories in an editor `vim`.
Also generates the `cscope` and `ctags` files for them all.
After exiting the `vim` editor the script will delete the `csope` and `ctags` generated files.

`srcgrep`: Runs `greps` the source codes (having preset file extensions mentioned in `srcext.txt` file.


