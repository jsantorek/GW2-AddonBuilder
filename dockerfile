FROM debian:bookworm-slim

ENV KEYRINGS /usr/local/share/keyrings

RUN set -eux; \
    mkdir -p $KEYRINGS; \
    apt-get update && apt-get install -y gpg curl; \
    # clang/lld/llvm
    curl --fail https://apt.llvm.org/llvm-snapshot.gpg.key | gpg --dearmor > $KEYRINGS/llvm.gpg;

RUN set -eux; \
    # Skipping all of the "recommended" cruft reduces total images size by ~300MiB
    apt-get update && apt-get install --no-install-recommends -y \
    clang-19 \
    # llvm-ar
    llvm-19 \
    lld-19 \
    # installing C++ build/dep tools
    pipx \
    cmake \
    make \
    # Unpack xwin
    tar; \
    # ensure that clang/clang++ are callable directly
    ln -s clang-19 /usr/bin/clang && ln -s clang /usr/bin/clang++ && ln -s lld-19 /usr/bin/ld.lld; \
    # We also need to setup symlinks ourselves for the MSVC shims because they aren't in the debian packages
    ln -s clang-19 /usr/bin/clang-cl && ln -s llvm-ar-19 /usr/bin/llvm-lib && ln -s lld-link-19 /usr/bin/lld-link && ln -s llvm-rc-19 /usr/bin/llvm-rc; \
    # Verify the symlinks are correct
    clang++ -v; \
    ld.lld -v; \
    # Doesn't have an actual -v/--version flag, but it still exits with 0
    llvm-lib -v; \
    clang-cl -v; \
    lld-link --version; \
    # Use clang instead of gcc when compiling and linking binaries targeting the host (eg proc macros, build files)
    update-alternatives --install /usr/bin/cc cc /usr/bin/clang 100; \
    update-alternatives --install /usr/bin/c++ c++ /usr/bin/clang++ 100; \
    update-alternatives --install /usr/bin/ld ld /usr/bin/lld-link 100; \
    apt-get remove -y --auto-remove; \
    rm -rf /var/lib/apt/lists/*;

RUN set -eux; \
    mkdir -p /xwin-temp; \
    xwin_version="0.6.6"; \
    xwin_prefix="xwin-$xwin_version-x86_64-unknown-linux-musl"; \
    curl --fail -L https://github.com/Jake-Shadle/xwin/releases/download/$xwin_version/$xwin_prefix.tar.gz | tar -xzv -C /xwin-temp --strip-components=1 $xwin_prefix/xwin; \
    # Splat the CRT and SDK files to /xwin/crt and /xwin/sdk respectively
    /xwin-temp/xwin --accept-license splat --output /xwin; \
    # Remove unneeded files to reduce image size
    rm -rf .xwin-cache /xwin-temp;


COPY conan/ /conan-temp/
RUN set -eux; \
    pipx install conan; \
    /root/.local/bin/conan profile detect --force; \
    mv /conan-temp/windows /root/.conan2/profiles/; \
    /root/.local/bin/conan export /conan-temp/imgui --version=1.80; \
    /root/.local/bin/conan export /conan-temp/generic --version=v1.2 --name=rcgg-arcdps-api; \
    /root/.local/bin/conan export /conan-temp/generic --version=latest --name=rcgg-mumble-api; \
    /root/.local/bin/conan export /conan-temp/generic --version=v6.1 --name=rcgg-nexus-api; \
    rm -rf /conan-temp;
