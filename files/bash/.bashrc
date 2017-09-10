#   .bashrc for user shell

#   You may elect to house your additions in additional .bash files
#   in ~/.bash/.   For example, there exists:
#   ~/.bash/{aliases,path,env}.bash

#   Automatically load *.bash files in ~/.bash/
for filename in $(ls ~/.bash/*.bash 2>/dev/null)
do
    . $filename
done
