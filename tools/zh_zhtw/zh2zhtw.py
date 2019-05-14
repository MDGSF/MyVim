#!/usr/bin/env python
# -*- coding: UTF-8 -*-

import os
from iniparser import *

zhDataMap = {}


def loaddata():
    global zhDataMap
    p = IniParser()
    p.LoadFromFile("zh_zhtw_data")
    for key in p.keys(DefaultSectionName):
        zhDataMap[key] = p.getd(key)


def covertOneFile(sourceFile, dstFile):
    data = open(sourceFile, encoding="utf-8").read()
    f = open(dstFile, 'w')
    f.write(''.join([zhDataMap[c] if c in zhDataMap else c for c in data]))
    f.close()


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
            covertOneFile(fWithPath, fDstPath)


def convert(sourceLanguage, dstLanguage, sourceDir, dstDir):
    """
    convert all file in directory sourceDir to directory dstDir.
    change file from language sourceLanguage to dstLanguage.
    """
    convertInner(sourceLanguage, dstLanguage, sourceDir, dstDir, sourceDir)


def main():
    loaddata()

    ScriptPathWithName = os.path.abspath(__file__)
    ScriptPath = os.path.dirname(ScriptPathWithName)
    ProjectPath = os.path.dirname(os.path.dirname(ScriptPath))

    sourceLanguage = "zh-CN"
    dstLanguage = "zh-TW"
    sourceDir = os.path.join(ProjectPath, "doc", "zh")
    dstDir = os.path.join(ProjectPath, "doc", "zh-tw")
    convert(sourceLanguage, dstLanguage, sourceDir, dstDir)


if __name__ == "__main__":
    main()
