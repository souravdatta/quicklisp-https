if [ -d ~/quicklisp ]; then
    echo "Quicklisp directory already in home directory"
else
    echo "Creating quicklisp directory inside home directory"
    mkdir -p ~/quicklisp
fi

CWD=`pwd`
cd ~/quicklisp
echo "Fetching additional files"

wget https://beta.quicklisp.org/client/quicklisp.sexp
wget https://beta.quicklisp.org/client/2021-02-13/quicklisp.tar
wget https://beta.quicklisp.org/client/2021-02-11/setup.lisp
wget https://beta.quicklisp.org/asdf/3.2.1/asdf.lisp
wget https://beta.quicklisp.org/dist/quicklisp.txt
wget https://beta.quicklisp.org/dist/quicklisp/2023-10-21/releases.txt
wget https://beta.quicklisp.org/dist/quicklisp/2023-10-21/systems.txt
tar xvf ./quicklisp.tar

# Patch the http.lisp with wget version
cd $CWD
echo $CWD
cp http.lisp ~/quicklisp/quicklisp

# Launch SBCL with setup.lisp
cd ~/quicklisp
sbcl --load setup.lisp
