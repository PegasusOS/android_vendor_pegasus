function __print_pegasus_functions_help() {
cat <<EOF
Additional PegasusOS functions:
- mka:             Builds using SCHED_BATCH on all processors.
EOF
}

function brunch()
{
    breakfast $*
    if [ $? -eq 0 ]; then
        mka bacon
    else
        echo "No such item in brunch menu. Try 'breakfast'"
        return 1
    fi
    return $?
}

function breakfast()
{
    target=$1
    local variant=$2

    if [ $# -eq 0 ]; then
        # No arguments, so let's have the full menu
        lunch
    else
        echo "$target" | grep -q "-"
        if [ $? -eq 0 ]; then
            # A buildtype was specified, assume a full device name
            lunch $target
        else
            # This is probably just the ArcaneOS model name
            if [ -z "$variant" ]; then
                variant="userdebug"
            fi

            lunch aosp_$target-$variant
        fi
    fi
    return $?
}

function mka() {
    m -j "$@"
}
