docker build . --tag addon-builder
docker run -it -v <addon-repo-path>:/addon addon-builder:latest
cd /addon
/root/.local/bin/conan install . --profile windows --build=all
cmake --preset=conan-release
cmake --build --preset=conan-release
