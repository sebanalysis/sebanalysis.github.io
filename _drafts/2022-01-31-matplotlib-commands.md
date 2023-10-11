## Commands

the main commands:
[plt.plot](https://matplotlib.org/stable/api/_as_gen/matplotlib.pyplot.plot.html)

related to | command |  purpose
-|-|-
additions | `ax.grid(color, alpha, liestyle, linewidth)` | add a grid 
annotations | `ax.text(x=#, y=#, s="...")` | where the # are the coordinates on the axes [text](https://matplotlib.org/stable/api/_as_gen/matplotlib.axes.Axes.text.html)
axis | `ax.set_ylim(bottom=-0.75, top=0.75)` | change axis limits
axis | `ax.set_yscale("log")` | change axis scale
axes | `ax = plt.subplot(aspect=1)`| change aspect ratio
axes | `inset_ax = fig.add_axes([0.2, 0.55, 0.35, 0.35]) # X, Y, width, height` | 'inset' a.k.a. superimpose an axis ontop of the figure.
axis | `ax.spines['bottom'].set_position(('data',0))` |set origin to zero -  y-axis origin is bottom
axis | `ax.spines['left'].set_position(('data',0))` |set origin to zero -  x-axis origin is left
axis | `ax.yaxis.set_ticks_position('left')` | choose side of axis to put the ticks
axis | `ax.yaxis.tick_left()`| only ticks on the left side, if using spines elsewhere.
axis | `ax.spines['..'].setcolor("…).set_linewidth(#)"` | add additional axis on `top or bottom or left or right` which protrude into the axes space/
axis | `ax2 = ax1.twinx()` | create a right side dual-axis plot. different to using subplots(sharedy=True). You then __have to__ plot to it using oo method, NOT df.plot(). df.plot() creates a separate axes. Note that the original axis is the only one which can have an xlabel
defaults | `matplotlib.rcParams.update({'font.size': 18, 'font.family': 'STIXGeneral', 'mathtext.fontset': 'stix'})`  | have to  import matplotlib
defaults | `matplotlib.rcParams.update({'font.size': 18, 'text.usetex': True})` | use latex `($...$)` in all plots
defaults | `matplotlib.rcParams['xtick.major.pad'] = 5` | set distance between major ticks on an axis
defaults | `plt.style.available`<br> `plt.style.use("...")` | choose plot style. common is ggplot. Note "default" is not shown as an option even though it is actually an option 
figure | `fig, ax = plt.subplots(.., sharex=True)` | make multiple axes which uses the same x-axis
figure | `fig, axes = plt.subplots()` | make a figure with 1 axes. alwyas use subplots as it gives both the figure and the axes[docs](https://matplotlib.org/stable/api/_as_gen/matplotlib.pyplot.subplots.html)
figure | `fig, axes = plt.subplots(nrows=#, ncols=#)` | make a figure with multiple axes
figure | `fig.subplots_adjust(left=0.15, right=.9, bottom=0.1, top=0.9);` | adjust the figsize after its creation
figure  |`plt.figure(dpi=###, ...)` |  configure dpi at creation of figure
formatter | `ax.xaxis.set_major_formatter(FuncFormatter(lambda x, pos: 'Days {:1.0f}K'.format(x*1e-3)))` | format the xlabels correctly
formatter  | `ax.yaxis.set_major_formatter(formatter)` | it must always be topped off by this
formatter | `formatter = ticker.ScalarFormatter(useMathText=True)`| ?
formatter |`formatter.set_powerlimits((-1,1))`|  append the $10^x$ to the graph
formatter |`formatter.set_scientific(True)`| use sci not
labels | `ax.legend(loc=#, frameon=False)` | position the legend in the axes. 0 = default 1 = top right, 2= upper left (i.e. anticlockwise), turn off the frame
labels | `ax.legend().set_visible(False)` | remove legend, important when plotting from pandas
labels | `ax.plot( ..., ... label="...")`<br>`ax.legend` | the right way to add a legend to a graph - with the plotting
labels | `ax.set(xlim=[], ylim=[], xlabel=…, ylabel=…, title=… )`| more efficient way of setting all (but not legend) the [labels](https://matplotlib.org/stable/api/_as_gen/matplotlib.axes.Axes.set.html)
labels | `ax.xaxis.labelpad = #` |  padding between labels and axis numbers
labels | `..., fontsize = ##` |  in any title, label etc.
lineplot| `plt.plot(x1, y1, x2, y2)` | plot 2 lines
lineplot | `plt.plot(x, y, fmt="▯▯▯")` | marker format: marker type, linetype, marker_colour. or you can use these as separate keyword
lineplot | `plt.plot(x, y, linewidth=#.#) or lw=`| fmt optino: line width
lineplot | `plt.plot(x, y , markerfacecolor=#▯▯▯▯▯▯,markeeedgecolor=#▯▯▯▯▯▯`| marker colours
lineplot | `plt.plot(x, y , markersize=#,  markeredgewidth=#`| marker sizes
lineplot | `plt.plot(x, y ,m colour=#▯▯▯▯▯▯`) | colour for the __LINE__ in hex use https://coolors.co/ to find good ones
plot from pandas | `df.plot(kind=...m y="colname", ax=ax)` | THE best way to plot data from a dataframe onto an axes
plotting options | `%matplotlib nbagg` or `inline` | first is for animations
Save | `fig.canvas.get_supported_filetypes()` | see save options. put one of these as the file ext in the name
save |  `fig.savefig('...', dpi=###)` | save figure
scatterplot| `plt.scatter(x, y)` | make a basic scatter plot
scatterplot | `plt.scatter(x,y, c=#▯▯▯▯▯▯, s=#.#)` | scatterplot with color and scale
TeX | `$x^2$` | include TeX formatting in axis labels
Heatmap | `ax.imshow(df)` | [plot](https://matplotlib.org/stable/api/_as_gen/matplotlib.axes.Axes.imshow.html)

marker, line, colour [fmt options](https://matplotlib.org/stable/api/_as_gen/matplotlib.pyplot.plot.html) then search for "fmt". only 4 line styles:  `-`, `--`, `-.`,  `:`

[cmap](https://matplotlib.org/stable/tutorials/colors/colormaps.html)
heatmap scale row width https://stackoverflow.com/questions/48459801/matplotlib-seaborn-control-line-row-height-of-heatmap

![[DL0iQ.jpg]]