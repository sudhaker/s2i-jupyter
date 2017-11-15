#! /bin/bash
 
if [ ! -f ~/.jupyter/jupyter_notebook_config.py ]; then
 
mkdir -p ~/.jupyter /opt/app-root/work
 
# see the notebook with samples
#git clone --depth=1 http://github.com/sudhaker/jupyter-examples.git /opt/app-root/work
#rm -fr !$/.git
 
# disable terminal
#echo y | pip uninstall -q terminado > /dev/null
 
cat > ~/.jupyter/jupyter_notebook_config.py << '__EOF__'
import os
# Set a password if PASSWORD is set
if 'PASSWORD' in os.environ:
    if os.environ['PASSWORD'] != '' :
        from IPython.lib import passwd
        c.NotebookApp.password = passwd(os.environ['PASSWORD'])
    del os.environ['PASSWORD']
    # Disnable 'token' based authentication
    c.NotebookApp.token = u''
# else default to the token based authentication
__EOF__
fi
 
cd /opt/app-root/work
 
exec jupyter notebook --no-browser --ip=0.0.0.0 --port=8080

