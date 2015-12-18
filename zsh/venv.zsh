# Automatically activate Git projects' virtual environments based on the
# directory name of the project. Virtual environment name can be overridden
# by placing a .venv file in the project root with a virtualenv name in it
workon_cwd() {
    # Check that this is a Git repo
    PROJECT_ROOT=`hg root 2> /dev/null`
    if [ $? = 0 ]; then
        # Find the repo root and check for virtualenv name override
        ENV_NAME=`basename "$PROJECT_ROOT"`
        if [ -f "$PROJECT_ROOT/.venv" ]; then
            ENV_NAME=`cat "$PROJECT_ROOT/.venv"`
        fi
        # Activate the environment only if it is not already active
        if [ "$VIRTUAL_ENV" != "$WORKON_HOME/$ENV_NAME" ]; then
            if [ -e "$WORKON_HOME/$ENV_NAME/bin/activate" ]; then
                if [ ! -z {$CD_VIRTUAL_ENV+x} ]; then
                    echo $CD_VIRTUAL_ENV
                    workon "$ENV_NAME" && export CD_VIRTUAL_ENV="$ENV_NAME" && echo "Activated python virtual env $ENV_NAME"
                fi
            elif [ $CD_VIRTUAL_ENV ]; then
                # We've just left the repo, deactivate the environment
                # Note: this only happens if the virtualenv was activated automatically
                deactivate && unset CD_VIRTUAL_ENV
            fi
        fi
    elif [ $CD_VIRTUAL_ENV ]; then
        # We've just left the repo, deactivate the environment
        # Note: this only happens if the virtualenv was activated automatically
        deactivate && unset CD_VIRTUAL_ENV
    fi
}

# New cd function that does the virtualenv magic
venv_cd() {
    cd "$@" && workon_cwd
}

alias cd="venv_cd"
