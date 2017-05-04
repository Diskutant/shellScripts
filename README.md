## Some useful shell Scripts by me


### unrar
The unrar tool by Alexander Roshal doesn't support extracting multiple .rar files (ie. `unrar x file1.rar file2.rar` or `unrar x file*.rar`)
This tiny script fixes that.

Usage: `unrar file*.rar`
This will unrar all files like file1.rar, file2.rar etc.
