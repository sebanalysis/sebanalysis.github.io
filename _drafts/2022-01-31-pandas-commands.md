### Methods

### Querying Single Index DF
Command | Returns |Meaning
-|-|-
`df[['…','…']]`<br>Equivalent to `df.loc[:,['…','…']]` |  DataFrame | with the column-names … and …
`df[#:#]` | DataFrame | of rows between the two numbers. Only works for ranges
`df['…']`| series  | of column-name …. Basically a shorthand for `.loc[:,…` , seems to be a view too tbh , todo dind out
`df['…']=='...'` |  Series |of column with rows containing True-False
`df.columns.rename(["…","…"], level=1)` | `indexes.base.Index` |rename the multi-index header names 
`df.groupby(['…','…'])`| `groupby.generic.DataFrameGroupBy` | Makes the selected columns index. needs to be operated on by a method
`df.groupby().sum()` `.count()` | this operation is made across all rows to the groupby object in question
`df.iloc[:,#:#]` | df | only columns  between # and #
`df.iloc[#:#]` | df | only columns  between # and #
`df.iloc[:,#]`|  Series |of column-number #
`df.iloc[#]`|  Series |of index-number #
`df.loc[:,('…','…')]` | `series`| view specific multiindex column for all columns
`df.loc[('…','…'),:]` | `series`| view specific multiindex row for all columns
`df.loc['…']`| series | of row with index name
`df.loc[:,'…']`  |  series | same but can be used to set values
`df.loc[[df['…']=='…']]` |  DataFrame |with all columns but limiting to rows where condition is true
`df.loc[[df['…']=='…'], ['…','…']] = '…'` |  "" |update the righand columns to the string if condition is true 
`df.loc[([df['…']== '…') \| (df['…']== '…' )]` |  ""| where either condition is true
`df.loc[df['…']== '…' & df['…']== '…' ]` | ""| where both conditions are true
`df.loc[df['…'].str.contains('…')` | ""|Conditional for column name contains a string
`df.loc[df['…'].str.contains('…', regex=True, flags=re.DOTALL)` | "" |with regex expression and a flag


### Querying Multiindex DF
Command | Returns |Meaning
-|-|-
Way 1 `idx = pd.IndexSlice`<br>`df.loc[idx[:,'…'],idx['…',:]]` | Different syntax for same effect as Slice(None)
Way 2 `s=slice(None)`<br>`df.loc[(s,'…'),s]`<br>`df.loc[s,('…','…')]` |  DataFrame | view multiindex rows for all columns or rows 
Way 3 `df.query('…'='…' and `|df | imitates SQL multiindex search for both columns and rows problwm is is column nanes have spaces
Way 4 - only for multiindex `df.xs('…','…')`<br>`df.xs('…')` | df | searches in the first 2 levels. specifically for multilevel index ROWS only. searches for string by default in the VALUES For the first level of index


## Manipulating DF
Command | Returns |Meaning
-|-|-
`df["…"].astype('…')` | change column dtype
`df.columns.to_series().groupby(s).cumcount()` | list | see the frequency of repeated columns
`df.concat([df,df2...], axis = <cobine 0 - below eachotehr, 1- next to eachother>, names = <[a, b, c - optional assign each df a key to appear in multindex>`| [combine dfs](https://pandas.pydata.org/docs/reference/api/pandas.concat.html)  
`df.drop(labels=<rows or columns # or labels> axis = <>)`| [drop rows or columns](https://pandas.pydata.org/docs/reference/api/pandas.DataFrame.drop.html)
`df.droplevel(level=<# or name>, axis= <0 or'index' or 1 or 'columns')`| [drop a level of a multiindex](https://pandas.pydata.org/docs/reference/api/pandas.DataFrame.droplevel.html)
`df.index.get_level_values('…')`| Index | List of the values in a given index column of a multiindex where …is the index name
`df.index.set_names('…', level='…')` | index  | Change the name of an index column in an index have to do `df.index = `
`df.iterrows()` |  generator |of (Index Name, Series of row)
`df.read_fwf(io.StringIO(string)`| [read fixed width column text string in fileIO format](https://pandas.pydata.org/docs/reference/api/pandas.read_fwf.html?highlight=read_fwf#pandas.read_fwf)
`df.read_table(io.StringIO(String)`|[read space or comma delimited text string in FileIO formart](https://pandas.pydata.org/pandas-docs/stable/reference/api/pandas.read_table.html?highlight=read_table#pandas.read_table)
`df.rename_index(axis=0 or 1)` | todo
`df.reorder_levels(order=['Date', 'Store', 'Category'` | df |re-order the indexes 
`df.reset_index(level=#)` |  DataFrame | [Move index columns to DF](https://pandas.pydata.org/docs/reference/api/pandas.DataFrame.reset_index.html)
`df.set_index(list(df.columns)[#:#], append=True)` | Dataframe | [Move columns numbers to index, append means dont overwrite](https://pandas.pydata.org/docs/reference/api/pandas.DataFrame.set_index.html)
`df.shape[0]` | int|get number of non-index columns
`df.shape[1]` | int |get number of non-header rows
`df.sort_index()` | [sort rows by index](https://pandas.pydata.org/docs/reference/api/pandas.)DataFrame.sort_index.html
`df.sort_values(['…','…'])` |DataFrame |Sort first by one, then by the other
`df.sort_values('…')` |  DataFrame |with all rows sorted by column … values: low to high
`df.sort_values(ascending=False)` | "" |high to low
`df.stack(level=#)` | df | move an index to the top of the dataframe
`df.sum()` | Series | Sum of each column
`df.sum(axis=1)` | Series | Sum of each row
`df.swaplevel('…','…')`| df | swap order of two indexes
`df.tranpose()`
`df.unstack(level=#)` |  
`pd.MultiIndex.from_tuples`| MultiIndex | [Convert column titles to MultiIndex](https://pandas.pydata.org/docs/reference/api/pandas.MultiIndex.from_tuples.html)
`pd.to_numeric(<column, index, column.names>, series)` | [converts entire 1D object to int or float if applicable](https://pandas.pydata.org/docs/reference/api/pandas.to_numeric.html)
`pd.__version__`|str | version
`pd.# MultiIndex.to_flat_index()` | `Index`|  [Flattens index](https://pandas.pydata.org/docs/reference/api/pandas.MultiIndex.to_flat_index.html))
`pd.read_pickle(r'filepath')` | df or dict | reads a pickle file



#### Attributes
Command | Returns |Meaning
-|-|-
`df.columns` |`.indexes.multi.MultiIndex`|  Like a list of column names
`df.columns.name` | hashable name | column-name a.k.a. 'header'
`df.columns.names` | `FrozenList object`| Called 'labels' in docs The header names
`df.columns.values` | `numpy.ndarray` | List of column titles
`df.index` | `indexes.range.RangeIndex` | List of the values in the index column from top to bottom. The row names are called 'labels' in docs 
`df.index.name` | None<br>int, str, float must be a must be a hashable type | index-name title of the index column
`df.index.names` | `indexes.frozen.FrozenList`|The index names 
`df.index.duplicated()`| | See duplicated index values
`df.index.nlevels` | | number of levels
`df.columns.nlevels` | | number of levels



https://zaxrosenberg.com/pandas-multiindex-tutorial/
```python
# A handy function to keep around for projects
def add_constant_index_level(df: pd.DataFrame, value: Any, level_name: str):
    """Add a new level to an existing index where every row has the same, given value.
    
    Args:
        df: Any existing pd.DataFrame.
        value: Value to be placed in every row of the new index level.
        level_name: Title of the new index level.
    
    Returns:
        df with an additional, prepended index level.
    """
    return pd.concat([df], keys=[value], names=[level_name])
e.g.
df = add_constant_index_level(df, "Booooze", "Department")
```

https://jakevdp.github.io/PythonDataScienceHandbook/03.05-hierarchical-indexing.html#Methods-of-MultiIndex-Creation

