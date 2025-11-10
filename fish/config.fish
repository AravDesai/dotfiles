if status is-interactive
    # Commands to run in interactive sessions can go here
end

function fish_greeting
    fastfetch
end

function cd
    # Call the original cd
    builtin cd $argv

    # Only run ls if cd succeeded
    if test $status -eq 0
        # Use colors, long listing, and human-readable sizes
        ls -ah --color=auto
    end
end

set -Ux ANDROID_NDK_HOME /opt/android-ndk

