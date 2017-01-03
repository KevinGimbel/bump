# bump.sh
#### Quickly create bump messages inside a `bump.txt` file in the current directory.

### Installation

Clone this repository to your local machine, make `bump.sh` executable and create a symlink to some place inside your `$PATH`.

In this example I clone the repository into `~/bin/source/`.

```sh
# go to the target directory
$ cd ~/bin/source
# clone the repository
$ git clone https://github.com/kevingimbel/bump.git
# navigate into the new directory
$ cd bump
# make it executable
$ chmod +x bump.sh
# link it to a variable inside your path, e.g. /usr/local/bin
$ (sudo) ln -s $(pwd)/bump.sh /usr/local/bin/bump
```

### Update

Go into the bump git directory, e.g. `~/bin/source/bump` when following the guide above, and run `git pull origin master`.

### Usage
```
sage: bump [options] Message
Write a bump text to bump.txt

Options:
    -u,--usage      Show usage message
    -h,--help       Show help
    -v,--version    Show version and author info
    -g, --git       add all changes to git and create commit message
```

### Example

```
$ bump "Your bump message"
```

The above command will create (or write to)  a `bump.txt` file in the current
directory with your bump message and the date in the format [MM/DD/YYYY]. That's
it.

### Advanced

You can set an environmental variable named `_bump_default_git` which is written in front of your git commit message when using the `-g` flag. Choose the way to set the variable that best suites your needs.

#### inline

```
$ export _bump_default_git="[WIP]" && bump -g "Testing things"
```

#### `.bashrc`, `.zshrc`, or any other runtime file used by your terminal

```
# inside ~/.zshrc
export _bump_default_git="[DEV]"
```
The default set inside the script is `[BUMP]`.
