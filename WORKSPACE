load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

# Update the SHA and VERSION to the lastest version available here:
# https://github.com/bazelbuild/rules_python/releases.

SHA = "84aec9e21cc56fbc7f1335035a71c850d1b9b5cc6ff497306f84cced9a769841"

VERSION = "0.23.1"

http_archive(
    name = "rules_python",
    sha256 = SHA,
    strip_prefix = "rules_python-{}".format(VERSION),
    url = "https://github.com/bazelbuild/rules_python/releases/download/{}/rules_python-{}.tar.gz".format(VERSION, VERSION),
)

load("@rules_python//python:repositories.bzl", "py_repositories")

py_repositories()

#http_archive(
#    name = "rules_cc",
#    strip_prefix = "rules_cc-2f8c04c04462ab83c545ab14c0da68c3b4c96191",
#    # The commit can be updated if the build passes. Last updated 6/23/22.
#    urls = ["https://github.com/bazelbuild/rules_cc/archive/2f8c04c04462ab83c545ab14c0da68c3b4c96191.zip"],
#)

http_archive(
    name = "com_google_absl_py",
    #    repo_mapping = {"@six_archive": "@six"},
    sha256 = "0be59b82d65dfa1f995365dcfea2cc57989297b065fda696ef13f30fcc6c8e5b",
    strip_prefix = "abseil-py-pypi-v0.15.0",
    urls = [
        "https://github.com/abseil/abseil-py/archive/refs/tags/pypi-v0.15.0.tar.gz",
    ],
)

# Six is a dependency of com_google_absl_py
http_archive(
    name = "six_archive",
    build_file = "@com_google_absl_py//third_party:six.BUILD",
    sha256 = "105f8d68616f8248e24bf0e9372ef04d3cc10104f1980f54d57b2ce73a5ad56a",
    strip_prefix = "six-1.10.0",
    urls = [
        "http://mirror.bazel.build/pypi.python.org/packages/source/s/six/six-1.10.0.tar.gz",
        "https://pypi.python.org/packages/source/s/six/six-1.10.0.tar.gz",
    ],
)

#http_archive(
#    name = "com_google_absl_py",
#    #    repo_mapping = {"@six_archive": "@six"},
#    sha256 = "0be59b82d65dfa1f995365dcfea2cc57989297b065fda696ef13f30fcc6c8e5b",
#    strip_prefix = "abseil-py-pypi-v0.15.0",
#    urls = [
#        "https://github.com/abseil/abseil-py/archive/refs/tags/pypi-v0.15.0.tar.gz",
#    ],
#)

#http_archive(
#    name = "six_archive",
#    urls = [
#        "http://mirror.bazel.build/pypi.python.org/packages/source/s/six/six-1.10.0.tar.gz",
#        "https://pypi.python.org/packages/source/s/six/six-1.10.0.tar.gz",
#    ],
#    sha256 = "105f8d68616f8248e24bf0e9372ef04d3cc10104f1980f54d57b2ce73a5ad56a",
#    strip_prefix = "six-1.10.0",
#    build_file = "@//third_party:six.BUILD",
#)
#http_archive(
#    name = "six_archive",
#    build_file = "//third_party:six.BUILD",
#    sha256 = "d16a0141ec1a18405cd4ce8b4613101da75da0e9a7aec5bdd4fa804d0e0eba73",
#    strip_prefix = "six-1.12.0",
#    urls = ["https://pypi.python.org/packages/source/s/six/six-1.12.0.tar.gz"],  # 2018-12-10
#)
