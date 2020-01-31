# Python Environment

## Setup

All of the following scripts have variables which you can change to control the installation location and settings.

To install miniconda run:
```bash
./miniconda-setup.sh
```

To create the Jupyter conda environment run:
```bash
./jupyter-setup.sh
```

To create a new python environment with environment variables you can edit and run:
```bash
./conda-env-create.sh
```

## Jupyter Extensions

Below is a list of miscellaneous useful extensions.

Extensions for Jupyter Notebook:
https://github.com/markusschanta/awesome-jupyter

nbextensions:
```bash
conda install -c conda-forge jupyter_contrib_nbextensions
```


Extensions for Jupyter Lab:
https://github.com/search?o=desc&p=1&q=topic%3Ajupyterlab-extension&s=&type=Repositories
https://github.com/mauhai/awesome-jupyterlab

Widgets: https://github.com/jupyter-widgets/ipywidgets
```bash
conda install -c conda-forge ipywidgets
```

Matplotlib: https://github.com/matplotlib/jupyter-matplotlib
```bash
conda install -c conda-forge ipympl

# If using Jupyter Notebook
conda install -c conda-forge widgetsnbextension

# If using JupyterLab
conda install nodejs
jupyter labextension install @jupyter-widgets/jupyterlab-manager
jupyter labextension install jupyter-matplotlib
```

Bokeh: https://github.com/bokeh/jupyterlab_bokeh
```bash
jupyter labextension install jupyterlab_bokeh
```

Table of Contents:
https://github.com/jupyterlab/jupyterlab-toc
```bash
jupyter labextension install @jupyterlab/toc
```

Github: https://github.com/jupyterlab/jupyterlab-github
```bash

jupyter labextension install @jupyterlab/github
```

Drawio: https://github.com/QuantStack/jupyterlab-drawio
```bash
jupyter labextension install jupyterlab-drawio
```

Latex: https://github.com/jupyterlab/jupyterlab-latex
```bash
pip install jupyterlab_latex
jupyter labextension install @jupyterlab/latex
```

Variable Inspector: https://github.com/lckr/jupyterlab-variableInspector
