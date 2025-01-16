# Expandable List - iOS Project

Welcome to the **Expandable List** project! 🎉

This project demonstrates a simple and efficient implementation of expandable UITableView cells with **two modes**:
1. **Single Expand Mode**: Only one cell can be expanded at a time.
2. **Multi Expand Mode**: Multiple cells can be expanded simultaneously.

The code is designed to be **clean, reusable, and easy to understand** for developers at any level.

## Features
- **Two Expansion Modes**:
  - Toggle between single or multiple expansion with a button click.
- **Smooth Animations**:
  - Expand or collapse cells with a beautiful animation.
- **Reusable Components**:
  - Custom cell class and protocol for scalability.

## File Overview
- **ExpandableListVC.swift**:
  - Handles the logic for expansion modes and table view data.
- **ExpandableListTVCell.swift**:
  - Custom UITableViewCell with a delegate for expansion.
- **ExpandableItem.swift**:
  - Defines the data model for expandable items.

## How It Works
- Each cell includes a button to trigger its expansion.
- In **Single Expand Mode**, expanding a new cell collapses the previously expanded one.
- In **Multi Expand Mode**, you can expand or collapse any cell independently.

## Preview
| Single Expand Mode         | Multi Expand Mode          |
|----------------------------|----------------------------|
| ![Single Expand Mode](./assets/single_expand.mov) | ![Multi Expand Mode](./assets/multi_expand.MOV) |

## Usage
1. Clone the repository:  
   ```bash
   git clone https://github.com/HosamTalaat/ExpandableList.git
