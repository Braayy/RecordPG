# RecordPG

A simple online RPG record sheet

## Usage

### Stat Modification
You can click on your name, avatar, current/max health and current/max sanity to modify it.

When modifying current/max health and current/max sanity you can use math expressions, so `10-7` is a valid value and it will be set as **3**.

### Dice Combos

Clicking the plus icon on the dice combos section will create a dice combo named **Edit Me**.

Right clicking any dice combo will make the dice combo editor appear. The first textbox is the name of the dice combo and the last textbox is the dice combo itself.

For dice combos you can simply use `d10+1` so when you roll the dice combo it will roll a **d10** then add **1**. You can put as many dice and modifiers as you want, so `d10+1+d8+d7+d6+90` is a valid dice combo.

You can use any die you want, the commons **d4**, **d6**, **d8**, **d10**, **d12**, **d20** and **d100**, but you can also create any die you want too, so the dice **d64**, **d70** and so on are valid too.

You roll a dice combo by **clicking in it's name**, when not in editor mode.

### Dice

If you only want to roll a common die, you can just click one of the dice below the stats.

## Annotations

You can type everything you want on the annotations area, so if you gained a special power or something like that you can type that in there.

## Installation

**RecordPG** uses [Mint](https://www.mint-lang.com/) as the language and framework, so you can
1. Install **Mint**
2. Clone this repository
3. Run `mint install` to install the dependencies
4. Run `mint start` to start a development server or `mint build` to build the app and serve it the way you want.
