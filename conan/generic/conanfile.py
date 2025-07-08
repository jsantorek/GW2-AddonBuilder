from conan import ConanFile
from conan.tools.files import copy
from conan.tools.files import get
import os

class RaidcoreGG_Conan(ConanFile):
    no_copy_source = True

    def source(self):
        repo = self.name.replace("rcgg-", "RCGG-lib-")
        get(self, f"https://github.com/RaidcoreGG/{repo}/archive/{self.version}.zip", strip_root=True)

    def package(self):
        copy(self, "*.h", self.source_folder, os.path.join(self.package_folder, "include"))
        copy(self, "LICENSE", self.source_folder, os.path.join(self.package_folder, "licenses"))

    def package_info(self):
        self.cpp_info.bindirs = []
        self.cpp_info.libdirs = []