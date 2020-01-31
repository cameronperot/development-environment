# Configuration file for jupyter-notebook.
config_dir = '/etc/jupyter/'
c.NotebookApp.allow_remote_access = True
c.NotebookApp.base_url = '/jupyter/'
c.NotebookApp.default_url = '/lab'
c.NotebookApp.ip = '127.0.0.1'
c.NotebookApp.notebook_dir = '/home/user/'
c.NotebookApp.open_browser = False
c.NotebookApp.token = 'token_here'
c.NotebookApp.port = 8888
c.PDFExporter.latex_command = ['pdflatex', '{filename}']
c.NotebookApp.certfile = config_dir + 'jupyter.crt'
c.NotebookApp.keyfile = config_dir + 'jupyter.key'
