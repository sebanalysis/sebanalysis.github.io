![[Pasted image 20220802174420.png]]
![[Pasted image 20220803114046.png]]

Resources:
two best:
https://nbviewer.org/github/jrjohansson/scientific-python-lectures/blob/master/Lecture-4-Matplotlib.ipynb
https://pbpython.com/effective-matplotlib.html

useful to skim for commands
https://github.com/rougier/matplotlib-tutorial#
kind of the same thing:
https://scipy-lectures.org/intro/matplotlib/index.html

https://www.reddit.com/r/learnpython/comments/c3ut7p/does_matplotlib_ever_actually_make_sense_or_do/
https://matplotlib.org/2.0.2/faq/usage_faq.html

also the old matplotlib faq is good:
https://matplotlib.org/2.0.2/faq/usage_faq.html


The key point with matplotlib is that you can use either:
- the 'MATLAB-like API' or;
- the object-oriented API

There is some confusion around the relationship between `matplotlib.pylab`, `matplotlib.pyplot` and `matplotlib`. It's simple: 

- `matplotlib` is the full library, it contains everything including pylab and pyplot.
- `matplotlib.pyplot` provides a number of tools to plot graphs, including the state-machine interface to the underlying object-oriented plotting library.
- `matplotlib.pylab` is a convenience module that imports `matplotlib.pyplot` and `NumPy` in a single name space. You will find many examples using `pylab`, but it is no longer recommended (because explicit imports are better than implicit ones)."


[Also we use:](https://matplotlib.org/stable/api/ticker_api.html)
`from matplotlib.ticker import FuncFormatter`

first lets create some dummy data and import 
```python
import matplotlib.pyplot as plt
import numpy as np
x = np.linspace(0,5,10)
y = x**2
```

## 'MATLAB-like API'  - wrong way

The original way of using matplotlib was is called the 'MATLAB-like API'. It is a state-based interface. Each call plots to the most recently generated figure.

```python 
plt.plot()
plt.xlabel("X-axis")
plt.ylabel("y-axis")
plt.title("title")
```
The first call to `plt.plot` will automatically create the necessary figure and axes to achieve the desired plot. Subsequent calls to `plt.plot` re-use the current axes and each add another line. Setting the title, legend, and axis labels also automatically use the current axes and set the title, create the legend, and label the axis respectively.
This is the bad and wrong way of using matplot lib. It just applies the function to the most recent figure.
New matplotlib users should learn and use the object oriented interface.

## Object oriented API -  the right way

This is the right way to do plotting. If you just want the answet, apparently, the right way to make a plot is. Basically no point in using plt.figure as the plt.subplots gives both fig and axes :
```python
# make the figures using the 'state-machine interface'
fig, ax = plt.subplots()
#plot to the axis using the pandas api
df.plot(ax=ax, kind='line')
ax.set(xlim=[], ylim=[], xlabel=…, ylabel=…, title=… )
```
Where '...' is the column names. If you want to plot an index, use `df.reset_index.plot(...)`

[df.plot docs](https://pandas.pydata.org/docs/reference/api/pandas.DataFrame.plot.html)


You can plot to the axis using the pandas api, but with pint, you need more control as it otherwise automatically puts ticks onto the axis.

[ax.plot()](https://matplotlib.org/stable/api/_as_gen/matplotlib.axes.Axes.plot.html)

```python
x = "OperationTime"
y = "PowerAxialOffset"
ax.plot(x,y,data=df_)
```

We create objects for each of the object layers.
The user explicitly creates and keeps track of the figure and axes objects. At this level, the user uses pyplot to create figures, and through those figures, one or more axes objects can be created. These axes objects are then used for most plotting actions.

Axes are the plots The `Axes` class and it’s member functions are the primary entry point to working with the OO interface. They should have been called 'plots'.


Axis are are the number-line-like objects

All of plotting functions expect `np.array` or `np.ma.masked_array` as input


You can even add another overlaid axis:
```python
ax2= fig.add_axes([0.3,0.3,0.1,0.1])
ax2.plot(x,y)
```

![[Pasted image 20220803113625.png]]

But if you want multiple plots on the same figure, it is best to place them on a grid structure using an __axis layout manager__. The most common being: `subplots`.

## Non-uniformly spaced x-axis values - xticks and xticklabels

If the x-data is not uniformly space, you have to enforce the x-ticking on the x-axis, or matplotlib will just evenly space every value visually.

This lets you set an xtick spacing.

```python
# Set the multiple of xticks  
ax.xaxis.set_major_locator(matplotlib.ticker.MultipleLocator(<spacing>))  
```


## Legends


## Stylesheets

Create a file in the current directory with any name, i.e. 'stylesheet.txt' and fill it with the following example text: 

```
figure.figsize: 6,2.5
figure.edgecolor: black
figure.facecolor: ffffff
axes.linewidth: 1  
axes.facecolor: ffffff  
axes.ymargin: 0.1  
axes.spines.bottom: True  
axes.spines.left: True  
axes.spines.right: False  
axes.spines.top: False  
font.family: Fira Sans Condensed  
axes.grid: True  
grid.color: black  
grid.linewidth: .1  
grid.alpha:     1.0  
xtick.bottom: True  
xtick.top: False  
xtick.direction: out  
xtick.major.size: 5  
xtick.major.width: 1  
xtick.minor.size: 3  
xtick.minor.width: .5  
xtick.minor.visible: True  
ytick.left: True  
ytick.right: False  
ytick.direction: out  
ytick.major.size: 5  
ytick.major.width: 1  
ytick.minor.size: 3  
ytick.minor.width: .5  
ytick.minor.visible: True  
lines.linewidth: 2  
lines.markersize: 5
```

Import it into the current file with:

```
plt.style.use("./stylesheet.txt")
```


The only things you can't set with stylesheets are:

- Minor grid lines: need to use `ax.minorticks_on()  ;  ax.grid(visible=True, which="minor", color="grey", linestyle="--")`

All the default options are at :
`C:\ProgramData\Miniconda3\envs\<envname>\Lib\site-packages\matplotlib\mpl-data\matplotlibrc`


You can overwrite any of the parameters later on with the syntax within the file for example:

`plt.rcParams["figure.figsize"] = 6,2.5`


## Fonts

This is something I couldn't find anywhere. If you want to use a different font, you can 

1. install the ttf files from google fonts.com. Just right click the files and they will install directly to windows.
2. Close all the python consoles
3. Delete the `~\.matplotlib\fontlist-v330.json` file. 
4. Run a new script, and it should refresh the font list.
5. Get the name of your font by looking it up in the json file above under `"name":"…''`
6. Use name at the `fontname="Fira Sans Condensed",` keyword argument in the text function, or set the file-wide default with `plt.rcParams['font.family']='Fira Sans Condensed'`. Or set it in the `stylesheet.txt` file and import it with `plt.style.use('stylesheet.txt')`

## Labels

Use the `$...$` notation to describe Latex equations.

Use the `ax.set(xlim=[], ylim=[], xlabel=…, ylabel=…, title=… )` function to add all the labels in one place.

## Grid lines

To add a major grid, run: `ax.grid(visible=True, which="major", color="grey", linestyle="--")`. This can be enable by default in the stylesheet with `axes.grid: True`

For this minor grid:

```python
# Minor gridlines cannot be set in the stylesheet  
ax.minorticks_on()  
ax.grid(visible=True, which="minor", color="grey", linestyle="--")
```


## subplots
You call `plt.subplots(...)` _rather than_ `plt.figure(...)`

also, as there are multiple _axes_ rather than one _axis_, create an object called axes.
- axes = all the axes
- ax = 1 axis

```python
fig, axes = plt.subplots(nrows=1, ncols=2, sharex=True, constrained_layout=True,gridspec_kw = {'wspace':0, 'hspace':0})

for ax in axes:
    ax.plot(x, y, 'r')
    ax.set_xlabel('x')
    ax.set_ylabel('y')
    ax.set_title('title')
```

![[Pasted image 20220803114746.png]]






## help()
The way you use help for methods is to write. Figure for example:
`help(plt.Figure.add_

## Interactive renderers

'Interactive mode' is powered by the 'backend.' You have to install the back-end separately in PyCharm.



Make sure to put the following at the top of the script:
**The use function must be called before importing pyplot.**
```python
import matplotlib  
matplotlib.use("tkagg")
import matplotlib.pyplot as plt
```

I had bad experiences with both so I instead just used TK, which even works in pycharm debug mode. You may need to install the following:

```python
mamba install tkinter
mamba install tk
```

Then when you do:
```python
plt.show()
```

You'll get an external window/

Show the current backend (currently tkagg)
```python
print(matplotlib.get_backend())
```

There are other options for renderers:
- 'Agg' (default) is raster
- 'cairo' is raster or vector
- the others are all vector
- 
pyqt is not compatible with qt so uninstall qt, a.k.a. pyside.

```powershell
mamba uninstall qt
mamba install pyqt
```


## Using pint_pandas
[the pint matplotlib docs](https://pint.readthedocs.io/en/0.10.1/plotting.html) are useless. 

To simplify things and make labels consistent, I'll de-quantify  all the columns prior to plotting with `df.pint.dequantify()` followed by reset_index() to make indicies plotable too. You cannot de-quantify indexes though.


```python
# move unit-containing indicies to columns
def reset_unit_indexes(df):
    # lst = [i for i in df.index.names]
    old_idxs = [i for i in df.index.names if "_" in i]
    df = df.reset_index(old_idxs)
    if old_idxs:
        new_idxs = [i.split("_", 1)[0] for i in old_idxs]
    return df

# convert columns to pint arrays
# first make indexes columns to make them quantifiable
df = reset_unit_indexes(df)
df.columns = df.columns.str.split('_', 1, expand=True)
pint_pandas.PintType.ureg.load_definitions('extra_units.txt')
df_ = df.pint.quantify(level=-1)

# remove multiindex
df_ = df.pint.dequantify().droplevel(level = -1, axis=1)
```
