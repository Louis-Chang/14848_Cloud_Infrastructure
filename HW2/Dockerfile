FROM mcr.microsoft.com/mmlspark/release:latest
RUN apt-get update && apt-get install -y git
RUN pip3 install notebook
CMD [ "jupyter", "notebook", "--ip=0.0.0.0", "--no-browser", "--NotebookApp.token=''", "--NotebookApp.password=''"]