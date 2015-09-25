# Lists files in a GameMaker: Studio project that are no longer referenced by the project.
# Helpful for when you forgot to enable "Delete from resource tree deletes from disk" in Preferences.
# NOTE: THIS IS VERY INCOMPLETE AND BARELY TESTED.
# Made for Python 3.x

# Patrick Traynor (patrickjtraynor@gmail.com)
# 9-24-15

import tkinter as tk
from tkinter import filedialog
import os

# prompt for project file
root = tk.Tk()
root.withdraw()
project_path = filedialog.askopenfilename(filetypes=(('GMStudio Project File','*.gmx'),), title='Select Project file')

# build array of resources listed in project file
resourcetypes = ('sound','sprite','background','script','font','object','room')
resources = []
with open(project_path, 'r') as file:
    for line in file.readlines():
        for rt in resourcetypes:
            if '<%s>' % rt in line:
                name = line.split('\\')[-1].split('<')[0].split('.')[0]
                resources.append(name)

# print all files that aren't present in our array of resources.
num_unused = 0
folders = ('sound','sprites','background','scripts','fonts','objects','rooms')
for folder in folders:
    path = os.path.join(os.path.split(project_path)[0],folder)
    for filename in os.listdir(path):
        dotsplit = filename.split('.')
        if len(dotsplit) > 1:
            file = dotsplit[0]
            if file not in resources:
                print(file)
                num_unused += 1
print('number of unused resource files: ' + str(num_unused))