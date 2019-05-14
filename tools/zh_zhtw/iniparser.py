#!/usr/bin/env python
# -*- coding: UTF-8 -*-
"""
Author: Huang Jian
Date: 2019-04-22

Module IniParser implements an *.ini parser.
"""

DefaultSectionName = 'default'


class Node:
    def __init__(self, key, value):
        self.key = key
        self.value = value


class Section:
    def __init__(self, name=DefaultSectionName):
        self.name = name
        self.nodeslist = []

    def __getitem__(self, item):
        """
        Get value with item(key).
        """
        if type(item) != str:
            raise TypeError
        for node in self.nodeslist:
            if node.key == item:
                return node.value
        return ""

    def __setitem__(self, key, value):
        """
        If key already exists, update key=value.
        If key not exists, set new key=value.
        """
        if type(key) != str or type(value) != str:
            raise TypeError
        for node in self.nodeslist:
            if node.key == key:
                node.value = value
                break
        else:
            self.nodeslist.append(Node(key, value))

    def hasKey(self, key):
        """
        Check key whether is exists in this section.
        """
        for node in self.nodeslist:
            if node.key == key:
                return True
        return False

    def remove(self, key):
        """
        Remove key in this section.
        """
        for i, node in enumerate(self.nodeslist):
            if node.key == key:
                del self.nodeslist[i]
                return


class IniParser:
    """
    IniParser is an *.ini file parser.
    """

    def __init__(self, defaultIsVisibleWhenSave=False):
        self.defaultIsVisibleWhenSave = defaultIsVisibleWhenSave
        self.allsections = []

    def read(self, filename):
        """
        Wrapper for LoadFromFile.
        """
        return self.LoadFromFile(filename)

    def LoadFromFile(self, filename):
        """
        LoadFromFile load data from filename file.
        """
        f = open(filename, 'r')
        contents = f.read()
        self.LoadFromData(contents)
        f.close()

    def LoadFromData(self, data):
        """
        Load data from memory data.
        """
        curSectionName = DefaultSectionName
        self.addsection(curSectionName)
        for line in data.splitlines():
            line = line.strip()
            if len(line) == 0:
                continue
            if line.startswith('[') and line.endswith(']'):
                curSectionName = line[1:len(line) - 1]
                self.addsection(curSectionName)
            elif line.startswith('#'):
                continue
            else:
                linearray = line.split(sep='=', maxsplit=1)
                if len(linearray) != 2:
                    continue
                key = linearray[0].strip()
                value = linearray[1].strip()
                self.__setSectionKeyValue(curSectionName, key, value)

    def write(self, filename):
        """
        Wrapper for SaveToFile.
        """
        return self.SaveToFile(filename)

    def SaveToFile(self, filename):
        """
        Save data to filename file.
        """
        f = open(filename, 'w')
        for section in self.allsections:
            if self.defaultIsVisibleWhenSave:
                f.write("[" + section.name + "]\n")
            else:
                if section.name != DefaultSectionName:
                    f.write("[" + section.name + "]\n")
            for node in section.nodeslist:
                f.write(node.key + " = " + node.value + "\n")
            f.write('\n')
        f.close()

    def remove(self, sectionname, key=None):
        """
        remove sectionname section if key is None.
        remove section's key if key is not None.
        """
        if key is None:
            self.__removesection(sectionname)
        else:
            section = self.__getSection(sectionname)
            if section:
                section.remove(key)

    def sections(self):
        """
        return all section's name.
        """
        if self.defaultIsVisibleWhenSave:
            return [section.name for section in self.allsections]
        else:
            return [section.name for section in self.allsections if
                    section.name != DefaultSectionName]

    def hassection(self, sectionname):
        """
        hassection check whether sectionname is exists.
        """
        for section in self.allsections:
            if section.name == sectionname:
                return True
        return False

    def addsection(self, sectionname):
        """
        Add one section with sectionname.
        """
        if self.hassection(sectionname):
            return
        self.allsections.append(Section(sectionname))

    def items(self, sectionname):
        """
        return all items in sectionname.
        """
        for section in self.allsections:
            if section.name != sectionname:
                continue
            return [(node.key, node.value) for node in section.nodeslist]
        return []

    def keys(self, sectionname):
        """
        return all keys in sectionname section.
        """
        for section in self.allsections:
            if section.name != sectionname:
                continue
            return [node.key for node in section.nodeslist]
        return []

    def hasKey(self, sectionname, key):
        """
        judge whether key is in sectionname section.
        """
        section = self.__getSection(sectionname)
        if section is None:
            return False
        return section.hasKey(key)

    def getd(self, key, sectionname=DefaultSectionName):
        """
        Get value with key in sectionname with DefaultSectionName.
        """
        return self.get(sectionname, key)

    def setd(self, key, value, sectionname=DefaultSectionName):
        """
        Set key=value in sectionname section.
        """
        return self.set(sectionname, key, value)

    def get(self, sectionname, key):
        """
        Get value with key in sectionname section.
        """
        if type(key) != str or type(sectionname) != str:
            raise TypeError
        if len(key) == 0 or len(sectionname) == 0:
            return ""
        section = self.__getSection(sectionname)
        return section[key]

    def getint(self, sectionname, key):
        """
        Get int value with key in sectionname section.
        """
        return int(self.get(sectionname, key))

    def set(self, sectionname, key, value):
        """
        Set key=value in sectionname section.
        """
        if type(key) != str or type(sectionname) != str:
            raise TypeError
        if len(key) == 0 or len(sectionname) == 0:
            return ""
        self.__setSectionKeyValue(sectionname, key, value)

    def __removesection(self, sectionname):
        for i, section in enumerate(self.allsections):
            if section.name == sectionname:
                del self.allsections[i]
                return

    def __setSectionKeyValue(self, sectionname, key, value):
        section = self.__getSection(sectionname)
        if section is None:
            raise KeyError("invalid sectionname")
        section[key] = value

    def __getSection(self, sectionname):
        for section in self.allsections:
            if section.name == sectionname:
                return section
        return None

    def __str__(self):
        result = ""
        for section in self.allsections:
            if self.defaultIsVisibleWhenSave:
                result += "[" + section.name + "]\n"
            else:
                if section.name != DefaultSectionName:
                    result += "[" + section.name + "]\n"
            for node in section.nodeslist:
                result += node.key + " = " + node.value + "\n"
            result += "\n"
        return result

