#!/usr/bin/env python3

import sys, logging, os, json
from tkinter import *

version = (3,7)
assert sys.version_info >= version, "This script requires at least Python {0}.{1}".format(version[0],version[1])

logging.basicConfig(format='[%(filename)s:%(lineno)d] %(message)s', level=logging.INFO)
logger = logging.getLogger(__name__)




# Game loop functions
def render(game,current,moves,points):
    ''' Displays the current room, moves, and points '''
    r = game['rooms']
    c = r[current]
    scale_w = 900/2700
    scale_h = 600/1800
    if c['name'] == "You are talking to Marie.":
        root = Tk()
        canvas = Canvas(root, width = 900, height = 600)
        canvas.pack()
        img = PhotoImage(file="Marie.png")
        canvas.create_image(20,20, anchor = NW, image=img)
        mainloop()
    elif c['name'] == "Marie":
        root = Tk()
        canvas = Canvas(root, width = 900, height = 600)
        canvas.pack()
        img = PhotoImage(file="Marie_Talking.png")
        canvas.create_image(20,20, anchor = NW, image=img)
        mainloop()
    elif c['name'] == "You are talking to Jim.":
        root = Tk()
        canvas = Canvas(root, width = 900, height = 600)
        canvas.pack()
        img = PhotoImage(file="Jim.png")
        canvas.create_image(20,20, anchor = NW, image=img)
        mainloop()
    elif c['name'] == "Jim":
        root = Tk()
        canvas = Canvas(root, width = 900, height = 600)
        canvas.pack()
        img = PhotoImage(file="Jim_Talking.png")
        canvas.create_image(20,20, anchor = NW, image=img)
        mainloop()
    elif c['name'] == "You are talking to Mort.":
        root = Tk()
        canvas = Canvas(root, width = 900, height = 600)
        canvas.pack()
        img = PhotoImage(file="Mort.png")
        canvas.create_image(20,20, anchor = NW, image=img)
        mainloop()
    elif c['name'] == "Mort":
        root = Tk()
        canvas = Canvas(root, width = 900, height = 600)
        canvas.pack()
        img = PhotoImage(file="Mort_Talking.png")
        canvas.create_image(20,20, anchor = NW, image=img)
        mainloop()
    elif c['name'] == "You are talking to Vickie.":
        root = Tk()
        canvas = Canvas(root, width = 900, height = 600)
        canvas.pack()
        img = PhotoImage(file="Vickie.png")
        canvas.create_image(20,20, anchor = NW, image=img)
        mainloop()
    elif c['name'] == "Vickie":
        root = Tk()
        canvas = Canvas(root, width = 900, height = 600)
        canvas.pack()
        img = PhotoImage(file="Vickie_Talking.png")
        canvas.create_image(20,20, anchor = NW, image=img)
        mainloop()
    elif c['name'] == "The outside world.":
        root = Tk()
        canvas = Canvas(root, width = 900, height = 600)
        canvas.pack()
        img = PhotoImage(file="End.png")
        canvas.create_image(20,20, anchor = NW, image=img)
        mainloop()
    else:
        root = Tk()
        canvas = Canvas(root, width = 900, height = 600)
        canvas.pack()
        img = PhotoImage(file="The_park.png")
        canvas.create_image(20,10, anchor = NW, image=img)
        mainloop()
    print('\n\nMoves: {moves}, Points: {points}'.format(moves=moves, points=points))
    print('\n {name}'.format(name=c['name']))
    print(c['desc'])
    printExits(game, current)
    if len(c['inventory']):
        print('You see the following items:')
        for i in c['inventory']:
            print('\t{i}'.format(i=i))

def getInput(game,current,verbs):
    ''' Asks the user for input and normalizes the inputted value. Returns a list of commands '''

    toReturn = input('\nWhat would you like to do? ').strip().upper().split()
    if (len(toReturn)):
        #assume the first word is the verb
        toReturn[0] = normalizeVerb(toReturn[0],verbs)
    return toReturn


def update(selection,game,current,inventory):
    ''' Process the input and update the state of the world '''
    s = list(selection)[0]  #We assume the verb is the first thing typed
    if s == "":
        print("\nSorry, I don't understand.")
        return current
    elif s == 'EXITS':
        printExits(game,current)
        return current
    else:
        for e in game['rooms'][current]['exits']:
            if s == e['verb'] and e['target'] != 'NoExit':
                return e['target']
    print("\nYou can't go that way!")
    return current


# Helper functions

def printExits(game,current):
    e = ", ".join(str(x['verb']) for x in game['rooms'][current]['exits'])
    print('\nYou can go the following directions: {directions}'.format(directions = e))

def normalizeVerb(selection,verbs):
    for v in verbs:
        if selection == v['v']:
            return v['map']
    return ""

def end_game(winning,points,moves):
    if winning:
        print('You have won! Congratulations')
    else:
        print('Thanks for playing! Please try again to find the Win!')





def main():
    gameFile = 'game.json'

    game = {}
    with open(gameFile) as json_file:
        game = json.load(json_file)

    current = 'START'
    win = ['WIN']
    lose = ['LOSE']
    moves = 0
    points = 0
    inventory = []

    while True:

        render(game,current,moves,points)

        selection = getInput(game,current,game['verbs'])

        if selection[0] == 'QUIT':
            end_game(False,points,moves)
            break

        current = update(selection,game,current,inventory)

        if current in win:
            end_game(True,points,moves)
            break
        if current in lose:
            end_game(False,points,moves)
            break

        moves += 1





if __name__ == '__main__':
	main()