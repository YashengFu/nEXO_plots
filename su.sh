#!/bin/sh

git filter-branch --env-filter '

    OLD_EMAIL="fuyasheng@ihep.ac.cn"
    OLD_NAME="fuyasheng"
    CORRECT_NAME="YashengFu"
    CORRECT_EMAIL="fuyasheng@ihep.ac.cn"
    
    if [ "$GIT_COMMITTER_NAME" = "$OLD_NAME" ]
    then
        export GIT_COMMITTER_NAME="$CORRECT_NAME"
        export GIT_COMMITTER_EMAIL="$CORRECT_EMAIL"
    fi
    if [ "$GIT_AUTHOR_EMAIL" = "$OLD_EMAIL" ]
    then
        export GIT_AUTHOR_NAME="$CORRECT_NAME"
        export GIT_AUTHOR_EMAIL="$CORRECT_EMAIL"
    fi' -- --all

git filter-branch --env-filter '
if test "$GIT_AUTHOR_EMAIL" = "fuys@lxslc703.ihep.ac.cn"
then
    GIT_AUTHOR_NAME="YashengFu"
    GIT_AUTHOR_EMAIL="fuyasheng@ihep.ac.cn"
fi
export GIT_AUTHOR_NAME
export GIT_AUTHOR_EMAIL
'
