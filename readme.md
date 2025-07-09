# GW2 Addon Builder (Docker)

Docker image builder for C++ Guild Wars 2 addons built with conan + CMake workflow. Notable contents:
1. clang-19 and lld set up for windows compilation
2. windows SDK
3. conan windows profiles
4. cached conan recipes for commonly used arcdps and nexus dependencies

## 📦 Gettting Addon Builder

### Build locally:

```bash
docker build . --tag addon-builder
```

### Fetch prebuilt version:

```bash
docker pull ghcr.io/jsantorek/gw2-addon-builder:latest
```

## 🧰 Attach Your Shell to the Container

### Using local build:

```bash
docker run -it -v <addon-source-path>:/addon addon-builder:latest
```

### Using prebuilt version:

```bash
docker run -it -v <addon-source-path>:/addon ghcr.io/jsantorek/gw2-addon-builder:latest
```

## ⚙️ If Using Conan + CMake Workflow (inside container)

```bash
git config --global --add safe.directory /addon
cd /addon
conan install . --profile windows --build=missing
cmake --preset=conan-release
cmake --build --preset=conan-release
cmake --install build/Release --prefix=install
```
