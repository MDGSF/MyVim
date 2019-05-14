#!/usr/bin/env python
# -*- coding: UTF-8 -*-
"""
use tool trans: https://github.com/soimort/translate-shell

trans \
  -from zh-CN \
  -to zh-TW \
  -i input.trans \
  -o output.trans \
  -no-theme \
  -no-ansi \
  -no-autocorrect \
  -no-bidi \
  -no-warn \
  -b
"""

import os


def convertInner(sourceLanguage, dstLanguage, sourceDir, dstDir, curDir):
    files = os.listdir(curDir)
    for f in files:
        if f[0] == '.':  # 隐藏文件
            continue

        fWithPath = os.path.join(curDir, f)
        if os.path.isdir(fWithPath):
            convertInner(sourceLanguage, dstLanguage, sourceDir, dstDir,
                         fWithPath)
        else:
            fDstPath = fWithPath.replace(sourceDir, dstDir)
            execstr = f"trans -from {sourceLanguage} -to {dstLanguage} \
            -i {fWithPath} -o {fDstPath} \
            -no-theme -no-ansi -no-autocorrect -no-bidi -no-warn -b"
            print(execstr)
            os.system(execstr)


def convert(sourceLanguage, dstLanguage, sourceDir, dstDir):
    """
    convert all file in directory sourceDir to directory dstDir.
    change file from language sourceLanguage to dstLanguage.
    """
    convertInner(sourceLanguage, dstLanguage, sourceDir, dstDir, sourceDir)


def main():
    ScriptPathWithName = os.path.abspath(__file__)
    ScriptPath = os.path.dirname(ScriptPathWithName)
    ProjectPath = os.path.dirname(ScriptPath)

    sourceLanguage = "zh-CN"
    dstLanguage = "zh-TW"
    sourceDir = os.path.join(ProjectPath, "doc", "zh")
    dstDir = os.path.join(ProjectPath, "doc", "zh-tw")
    convert(sourceLanguage, dstLanguage, sourceDir, dstDir)


if __name__ == "__main__":
    main()
