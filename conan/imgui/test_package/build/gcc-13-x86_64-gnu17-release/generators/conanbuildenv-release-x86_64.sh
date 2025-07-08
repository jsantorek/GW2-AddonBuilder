script_folder="/home/deck/Documents/mingw-hello-world/imgui/test_package/build/gcc-13-x86_64-gnu17-release/generators"
echo "echo Restoring environment" > "$script_folder/deactivate_conanbuildenv-release-x86_64.sh"
for v in PATH MINGW_HOME CC CXX CPP AR AS GDB LD NM OBJCOPY OBJDUMP RANLIB SIZE STRINGS STRIP GCOV RC DLLTOOL
do
    is_defined="true"
    value=$(printenv $v) || is_defined="" || true
    if [ -n "$value" ] || [ -n "$is_defined" ]
    then
        echo export "$v='$value'" >> "$script_folder/deactivate_conanbuildenv-release-x86_64.sh"
    else
        echo unset $v >> "$script_folder/deactivate_conanbuildenv-release-x86_64.sh"
    fi
done


export PATH="/home/deck/Documents/mingw-hello-world/.conan/p/mingwee42928a8f73f/p/bin:/home/deck/Documents/mingw-hello-world/.conan/p/mingwee42928a8f73f/p/bin:$PATH"
export MINGW_HOME="/home/deck/Documents/mingw-hello-world/.conan/p/mingwee42928a8f73f/p"
export CC="/home/deck/Documents/mingw-hello-world/.conan/p/mingwee42928a8f73f/p/bin/x86_64-w64-mingw32-gcc"
export CXX="/home/deck/Documents/mingw-hello-world/.conan/p/mingwee42928a8f73f/p/bin/x86_64-w64-mingw32-g++"
export CPP="/home/deck/Documents/mingw-hello-world/.conan/p/mingwee42928a8f73f/p/bin/x86_64-w64-mingw32-cpp"
export AR="/home/deck/Documents/mingw-hello-world/.conan/p/mingwee42928a8f73f/p/bin/x86_64-w64-mingw32-ar"
export AS="/home/deck/Documents/mingw-hello-world/.conan/p/mingwee42928a8f73f/p/bin/x86_64-w64-mingw32-as"
export GDB="/home/deck/Documents/mingw-hello-world/.conan/p/mingwee42928a8f73f/p/bin/x86_64-w64-mingw32-gdb"
export LD="/home/deck/Documents/mingw-hello-world/.conan/p/mingwee42928a8f73f/p/bin/x86_64-w64-mingw32-ld"
export NM="/home/deck/Documents/mingw-hello-world/.conan/p/mingwee42928a8f73f/p/bin/x86_64-w64-mingw32-nm"
export OBJCOPY="/home/deck/Documents/mingw-hello-world/.conan/p/mingwee42928a8f73f/p/bin/x86_64-w64-mingw32-objcopy"
export OBJDUMP="/home/deck/Documents/mingw-hello-world/.conan/p/mingwee42928a8f73f/p/bin/x86_64-w64-mingw32-objdump"
export RANLIB="/home/deck/Documents/mingw-hello-world/.conan/p/mingwee42928a8f73f/p/bin/x86_64-w64-mingw32-ranlib"
export SIZE="/home/deck/Documents/mingw-hello-world/.conan/p/mingwee42928a8f73f/p/bin/x86_64-w64-mingw32-size"
export STRINGS="/home/deck/Documents/mingw-hello-world/.conan/p/mingwee42928a8f73f/p/bin/x86_64-w64-mingw32-strings"
export STRIP="/home/deck/Documents/mingw-hello-world/.conan/p/mingwee42928a8f73f/p/bin/x86_64-w64-mingw32-strip"
export GCOV="/home/deck/Documents/mingw-hello-world/.conan/p/mingwee42928a8f73f/p/bin/x86_64-w64-mingw32-gcov"
export RC="/home/deck/Documents/mingw-hello-world/.conan/p/mingwee42928a8f73f/p/bin/x86_64-w64-mingw32-windres"
export DLLTOOL="/home/deck/Documents/mingw-hello-world/.conan/p/mingwee42928a8f73f/p/bin/x86_64-w64-mingw32-dlltool"