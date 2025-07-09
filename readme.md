# GW2 Addon Builder (Docker)

## 🛠️ Build the Docker Image

```bash
docker build . --tag addon-builder
```

## 📦 Fetch Prebuilt Image

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
/root/.local/bin/conan install . --profile windows --build=missing
cmake --preset=conan-release
cmake --build --preset=conan-release
cmake --install /addon/build/Release --prefix=install
```
