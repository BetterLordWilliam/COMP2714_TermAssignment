-- ======================================================
-- DDL ==================================================
-- ======================================================

-- ======================================================
-- LOCATION TABLE
--
CREATE TABLE Location (
  locName varchar(100),
  PRIMARY KEY (locName)
);

-- ======================================================
-- EFFECT TABLE
--
CREATE TABLE Effect (
  effectID int,
  duration decimal,
  radius int,
  edesc varchar(100),
  PRIMARY KEY (effectID)
);

-- OFFENSIVE TABLE
--
CREATE TABLE Offensive(
  effectID int,
  damage decimal,
  PRIMARY KEY(effectID),
  FOREIGN KEY (effectID) REFERENCES Effect (effectID)
);

-- DEFENSIVE TABLE
--
CREATE TABLE Defensive(
  effectID int, 
  healthIncrease decimal,
  armourIncrease decimal,
  PRIMARY KEY (effectID),
  FOREIGN KEY (effectID) REFERENCES Effect (effectID)
);

-- XX

-- ======================================================
-- SPELL TABLE AND SUBTABLES
--

-- SPELL TABLE
--
CREATE TABLE Spell (
  spellID int,
  locName varchar(100),
  spellName varchar(100),
  spellCost int,
  PRIMARY KEY (spellID),
  FOREIGN KEY (locName) REFERENCES Location(locName)
);

-- ALTERATION TABLE
--
CREATE TABLE Alteration (
  spellID int,
  effectID int,
  sTarget varchar(100),
  PRIMARY KEY (spellID),
  FOREIGN KEY (spellID) REFERENCES Spell(spellID),
  FOREIGN KEY (effectID) REFERENCES Effect(effectID)
);

-- ILLUSION TABLE
--
CREATE TABLE Illusion (
  spellID int,
  effectID int,
  starget varchar(100),
  PRIMARY KEY (spellID),
  FOREIGN KEY (spellID) REFERENCES Spell (spellID),
  FOREIGN KEY (effectID) REFERENCES Effect (effectID)
);

-- DESTRUCTION TABLE
--
CREATE TABLE Destruction (
  spellID int,
  damage decimal,
  stype varchar(100),
  PRIMARY KEY (spellID),
  FOREIGN KEY (spellID) REFERENCES Spell (spellID)
);

-- CONJURATION TABLE
--
CREATE TABLE Conjuration (
  spellID int,
  duration decimal,
  entity varchar(100),
  PRIMARY KEY (spellID),
  FOREIGN KEY (spellID) REFERENCES Spell (spellID)
);

-- RESTORATION TABLE
--
CREATE TABLE Restoration(
  spellID int,
  healthRestored decimal,
  armourIncrease decimal,
  PRIMARY KEY (spellID),
  FOREIGN KEY (spellID) REFERENCES Spell (spellID)
);

-- =====================================================
-- ITEM TABLE AND SUBTABLES
--
CREATE TABLE Item (
  itemID int,
  locName varchar(100),
  iName varchar(100),
  iWeight float,
  iValue int,
  iDesc varchar(100),
  PRIMARY KEY (itemID),
  FOREIGN KEY (locName) REFERENCES Location (locName)
);

-- WEAPON TABLE
--
CREATE TABLE Weapon (
  itemID int,
  damageValue int,
  reach float,
  wType varchar(100),
  effectID int,
  PRIMARY KEY (itemID),
  FOREIGN KEY (itemID) REFERENCES Item (itemID),
  FOREIGN KEY (effectID) REFERENCES Effect (effectID)
);

-- ARMOUR TABLE
--
CREATE TABLE Armour (
  itemID int,
  aType varchar(100),
  aRating int,
  effectID int,
  PRIMARY KEY (itemID),
  FOREIGN KEY (itemID) REFERENCES Item (itemID),
  FOREIGN KEY (effectID) REFERENCES Effect (effectID)
);

-- POTION TABLE
--
CREATE TABLE Potion (
  itemID int,
  effectID int,
  PRIMARY KEY (itemID),
  FOREIGN KEY (itemID) REFERENCES Item (itemID),
  FOREIGN KEY (effectID) REFERENCES Effect (effectID)
);

-- INGREDIENT TABLE
--
CREATE TABLE Ingredients (
  itemID int,
  pItemID int,
  PRIMARY KEY (itemID, pItemID),
  FOREIGN KEY (itemID) REFERENCES Item (itemID),
  FOREIGN KEY (pItemID) REFERENCES Potion (itemID)
);

-- BOOK TABLE
-- 
CREATE TABLE Book (
  itemID int,
  author varchar(100),
  title varchar(100),
  PRIMARY KEY (itemID),
  FOREIGN KEY (itemID) REFERENCES Item (itemID)
);

-- SCROLL TABLE 
--
CREATE TABLE Scroll (
  itemID int,
  effectID int,
  spellID int,
  scLevel int,
  PRIMARY KEY (itemID),
  FOREIGN KEY (itemID) REFERENCES Item (itemID),
  FOREIGN KEY (effectID) REFERENCES Effect (effectID),
  FOREIGN KEY (spellID) REFERENCES Spell (spellID)
);

-- FOOD TABLE
--
CREATE TABLE Food (
  itemID int,
  effectID int,
  PRIMARY KEY (itemID),
  FOREIGN KEY (itemID) REFERENCES Item (itemID),
  FOREIGN KEY (effectID) REFERENCES Effect (effectID) 
);

-- KEY TABLE
--
CREATE TABLE KeyItem (
  itemID int,
  kDoor varchar(100),
  kChest varchar(100),
  PRIMARY KEY (itemID),
  FOREIGN KEY (itemID) REFERENCES Item (itemID)
);

