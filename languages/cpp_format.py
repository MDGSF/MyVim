#!/bin/bash python3
# -*- coding: UTF-8 -*-


import os
import sys
import subprocess


ctx = {
  "clang_format_exe": "clang-format",
  "tasks": [
    {
      "source_dir": "",
    }
  ]
}


def is_cpp_file(file_name):
  file_name = file_name.lower()
  return file_name.endswith(".cpp") or \
      file_name.endswith(".h") or \
      file_name.endswith(".hpp") or \
      file_name.endswith(".inc") or \
      file_name.endswith(".cxx") or \
      file_name.endswith(".cxx") or \
      file_name.endswith(".cc")


def format_file(ctx, task, file_path):
  print("start formating file:", file_path)
  subprocess.run([ctx["clang_format_exe"],
    "-i",
    "--fallback-style=Google",
    file_path])


def walkdir(ctx, task, directory):
  files = os.listdir(directory)
  for file in sorted(files):
    if file[0] == '.':  # 隐藏文件
      continue
    file_path = os.path.join(directory, file)
    if os.path.isdir(file_path):
      walkdir(ctx, task, file_path)
    elif os.path.isfile(file_path) and is_cpp_file(file):
      format_file(ctx, task, file_path)
    else:
      pass


def main():
  for task in ctx["tasks"]:
    source_dir = task["source_dir"]
    if len(source_dir) == 0:
      source_dir = os.getcwd()
    print("start formating directory:", source_dir)
    walkdir(ctx, task, source_dir)


if __name__ == "__main__":
  main()
