Related to | command | purpose
-|-|-
environment|`conda activate <envname>` |
environment|`conda activate py35`|WINDOWS activate  
environment|`conda create --clone ... --name ...`|Make exact copy of an environment ...
environment | `conda create env --prefix C:\ProgramData\Anaconda3\envs\…`| Install an env at specific path
environment|`conda create --name ...`|
environment|+|Create a new environment named ... , install Python #.#
environment|`conda deactivate`|Deactivate the current environment
environment|`conda env list` |
environment|`conda env list`|Get a list of all my environments, active environment is shown with *
environment|`conda env remove --name <env>`|Delete an environment and everything in it:
environment|`conda install -n my_env python`| add python to this env
environment|`conda install --revision 2`|Restore environment to a previous revision
environment|`conda list`| List all packages and versions installed in active environment
environment|`conda list --explicit > ....txt`|Save environment to a text file
environment|`conda list --revisions`|List the history of each change to the current environment
environment|`conda source activate ...`|LINUX, macOS
environment|`conda source deactivate`|Deactivate the current environment macOS, LINUX: 
help |`conda ... --help`| Must be installed and have a deployable command,
help |`... --help` |Command line help
ide |`conda ... `| Launch an anaconda ide  from the ide, for example Spyder* . be in conda env
install |`conda install ... `
install | `conda install -c conda-forge ..` | `conda-forge` is an additional channel from which packages may be installed
install | `conda config --add channels conda-forge`<br>`conda config --set channel_priority strict` | always install from conda forge
install | `conda config --show channels` | show additional channels which can be used to install
install with pip |`pip install ... `
install with pip |`pip install ...==##.##.##`
packages|`conda list`|See list of all packages in Anaconda environment
packages|`conda search ...`| https://docs.anaconda.com/anaconda/packages/pkg-doc
pip |`conda install pip` |this package is necessary in new environments
pip |`pip uninstall <package>` | Uninstall a specific package:
requirements|`conda env create --file requirements.txt`|Create environment from a requirements text file
requirements | `conda install --force-reinstall -y -q --name … -c conda-forge --file requirements.txt` | install requirements to specific env
requirements | `conda install --yes --file requirements.txt` | conda install requirements to current environment
requirements | `pip install -r pip_requirements.txt` | Install pip requirements file
requirements | `conda list -e > conda_requirements.txt` | create conda requirements file
requirements | `pip freeze > pip_requirements.txt` | create pip requirements file
revert |`conda install ...=#.#.#` | revert a specific package
update | `conda update ...` |Update any installed program 
update conda | `conda update conda (must be run in base env)`|
update conda | `conda update -n base -c defaults conda`|
update python |`conda install python=<3.8.3.>`|
update python |`conda search python`|
update python |`conda update python `|
version |`conda info` | version
version |`conda search python`<br>`conda install python=#.#.#`| change python version eg 3.7.13 
setup | python setup.py install