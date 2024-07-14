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


## Some useful commands:

### Find and Replace
```
`find . -name "*.h" | xargs sed -i 's|a/b/c|x/y/z|g'`
```
a/b/c will be replaced with x/y/z

*Note*
```
find . -name "*.cpp" | xargs sed -i 's/abc/xyz/g'`
```
it doesn't matter to sed what separator is used.

### Find any (or'ed) of multiple words
```
grep -r "one\|two\|three"
```

### split based on delimiter
```
grep -r ... | cut -d ':' -f 1 | uniq
```

### useful rev (and double rev) during find and cut
```
grep -r ... | rev | cut -d ':' -f 1 | rev | uniq
```


### Rebase with master
```
git checkout master
git pull --rebase
git checkout FEATURE
git rebase master
-
vim abc.cpp // if abc.cpp has conflicts
git add abc.cpp
git rebase --continue (or --abort if you want to discontinue)
-
// after rebase completed you have to force push.
git push -f origin FEATURE
-
*squash:*
git rebase -i HEAD~<N>
here, <N> is number of commits that you want to squash
# editor opens; replace 'pick' with 'squash' (except for 1st)
# save and close file, edit commit message and save
git push --force-with-lease origin [FEATURE]
-
git log --oneline
-
```

### Other
if, encountered problem must have been pointers,
```
git lfs uninstall ; git reset --hard ; git lfs install ; git lfs pull
-
git stash list
git stash apply
git diff COMMIT1..COMMIT2
```
