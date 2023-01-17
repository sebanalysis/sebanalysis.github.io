When using the python interactive shell, you may want to have syntax highlighting, clickable URLs, debuggers and understand command line arguments.

## Syntax Highlighting and Clickable URLs

You can run the following commands from powershell with a conda environment active in order to install alternative interactive interpreters. I just use mamba whenever the package is available from there as it is better with package management:

```
mamba install ipython
mamba install ptpython
```

With `bpython`, I got errors so avoid it.

Then you can enter the interactive interpreter by just writing `ipython` or `ptpython` with no arguments into powershell.

## Basic pdb debugger

To run a script in debug mode at the beginning of the script, where you would normally run `python script.py`, run:

```
python -m pdb script.py
```

To learn the commands, in the interactive mode, run:

```
h
```

To get a read out of all the options.  Most importantly, use `n` to progress by one line.

To enter the pdb debugger at a breakpoint, write `breakpoint()` into the script. Starting with version 3.7 of Python, there is a new built-in function called [breakpoint()](https://www.python.org/dev/peps/pep-0553/) that you can use to add breakpoints into the code.

Unfortunately, there is no syntax highlighting and clickable URLs in this debugger.

## ipdb Debugger


If you want to trigger the ipdb instead, you should write the following line into your script:

```bash
export PYTHONBREAKPOINT=ipdb.set_trace
```

or in Powershell:

```powershell
$env:PYTHONBREAKPOINT ='ipdb.set_trace'
```

I added this to my Powershell profile for use in the future.

to deactivate debugging write:

```powershell
$env:PYTHONBREAKPOINT = 0
```

[Cheatsheet](https://wangchuan.github.io/coding/2017/07/12/ipdb-cheat-sheet.html)

`c(ontinue)` - jump to next breakpoint.

In the script, to make a shorthand for the breakpoint: write:

```python
b = breakpoint
```

So that it can be called with:

```python
line
b()
line
```

If you are running the script in an IDE, make sure to turn off the breakpoints as it seems to conflict with the IDE debugger.

> Use `ctrl+d` to exit ipython and ipdb and `ctrl+z, enter` to exit python and pdb.

## Access command line arguments

When you call a python script from the command line, you can specify space separated arguments:

```
ipython script.py a b
```

If you are running the command from within an IDE such as VSCode, make sure to add a run configuration into the launch.json file list called `"configurations": [` like the following:

```
        {

            "name": "py + args",

            "type": "python",

            "request": "launch",

            "program": "${file}",

            "console": "integratedTerminal",

            "args": ["arg1", "arg2"],

            "justMyCode": true

        },
```

The base level python functionality to access these arguments from within the script is `sys`.

It can be called with:

```
args = sys.argv
```

`args` is a list of the command line variables

But a better way to make a command line tool is to use the `argparse` library from python's standard library.

Here is a script which gets the arguments, using the `argparse` library in a more user friendly way:


```python
import argparse

# Create an ArgumentParser object
parser = argparse.ArgumentParser()

# Add a positional argument
parser.add_argument("input_file", help="The input file to process")

# Add an optional argument
parser.add_argument("--output_file", help="The output file to write to")

# Parse the command line arguments
args = parser.parse_args()

# Now use the arguments however you like
a = args.input_file
```