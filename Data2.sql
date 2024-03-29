-- ======================================================
-- DML ==================================================
-- ======================================================

--
-- LOCATION NEW
--

-- Inserting data into the Location table
INSERT INTO Location (locName) VALUES
  ('Whiterun'),
  ('Solitude');

--
-- EFFECT NEW
--

-- Inserting data into the Effect table
INSERT INTO Effect (effectID, duration, radius, edesc) VALUES 
(1, 10.5, 20, 'Fire Damage'), 
(2, 15.0, 30, 'Frost Damage'),
(3, 60.0, 0, 'Healing'), 
(4, 120.0, 0, 'Armor Buff'),
(5, 30.0, 10, 'Calm'), 
(6, 30.0, 10, 'Fear'),
(7, 0, 0, 'Sword Damage'),
(8, 0, 0, 'Armor Protection'),
(9, 60.0, 0, 'Health Restoration'),
(10, 60.0, 0, 'Mana Restoration'),
(11, 0, 0, 'Ingredient Effect'),
(12, 0, 0, 'Book Knowledge'),
(13, 0, 0, 'Scroll Spell'),
(14, 0, 0, 'Food Nutrition'),
(15, 0, 0, 'Key Access');

-- Inserting data into the Offensive table
INSERT INTO Offensive (effectID, damage)
VALUES (1, 50),  -- Fire Damage
       (2, 75),  -- Frost Damage
       (7, 12);   -- Sword Damage

-- Inserting data into the Defensive table
INSERT INTO Defensive (effectID, healthIncrease, armourIncrease)
VALUES (3, 100, 0),  -- Healing
       (4, 0, 50),  -- Armor Buff
       (8, NULL, 25); -- Armor Protection (NULL for health increase)

--
-- SPELLS NEW
--
-- Inserting data into the Spell table
INSERT INTO Spell (spellID, locName, spellName, spellCost) VALUES 
(1, 'Whiterun', 'Flames', 100), 
(2, 'Solitude', 'Frostbite', 200),
(3, 'Whiterun', 'Healing', 150), 
(4, 'Solitude', 'Oakflesh', 50),
(5, 'Whiterun', 'Summon Familiar', 100), 
(6, 'Solitude', 'Summon Atronach', 200),
(7, 'Whiterun', 'Calm', 75), 
(8, 'Solitude', 'Fear', 75),
(9, 'Solitude', 'Turn Undead', 75);

-- Inserting data into the Alteration table
INSERT INTO Alteration (spellID, effectID, sTarget) VALUES (3, 3, 'Draugr'), (4, 4, 'Dragon');

-- Inserting data into the Illusion table
INSERT INTO Illusion (spellID, effectID, starget) VALUES (7, 5, 'Bandit'), (8, 6, 'Giant'), (8, 6, 'Draugr');

-- Inserting data into the Destruction table
INSERT INTO Destruction (spellID, damage, stype) VALUES (1, 50.0, 'Fire'), (2, 75.0, 'Frost');

-- Inserting data into the Conjuration table
INSERT INTO Conjuration (spellID, duration, entity) VALUES (5, 10.5, 'Familiar'), (6, 15.0, 'Atronach');

-- Inserting data into the Restoration table
INSERT INTO Restoration (spellID, healthRestored, armourIncrease) VALUES (3, 100.0, 50.0), (4, 150.0, 75.0);

--
-- ITEM NEW
--
-- Inserting data into the Item table
INSERT INTO Item (itemID, locName, iName, iWeight, iValue, iDesc) VALUES 
(1, 'Whiterun', 'Iron Sword', 10.0, 25, 'A standard Iron Sword'), 
(2, 'Solitude', 'Steel Sword', 12.0, 45, 'A sturdy Steel Sword'), 
(3, 'Whiterun', 'Apple', 0.1, 2, 'A fresh apple'), 
(4, 'Solitude', 'Cheese', 1.0, 5, 'A piece of cheese'),
(5, 'Whiterun', 'Iron Armour', 30.0, 100, 'A standard Iron Armour'),
(6, 'Solitude', 'Steel Armour', 35.0, 150, 'A sturdy Steel Armour'),
(7, 'Whiterun', 'Health Potion', 0.5, 50, 'A potion that restores health'),
(8, 'Solitude', 'Mana Potion', 0.5, 50, 'A potion that restores mana'),
(9, 'Whiterun', 'Fire Salts', 0.2, 20, 'A rare ingredient'),
(10, 'Solitude', 'Frost Salts', 0.2, 20, 'A rare ingredient'),
(11, 'Whiterun', 'Conjuration for Novices', 1.0, 30, 'A book on the basics of Conjuration'),
(12, 'Solitude', 'Destruction for Beginners', 1.0, 30, 'A book on the basics of Destruction'),
(13, 'Whiterun', 'Scroll of Fireball', 0.5, 100, 'A scroll that casts a powerful fireball'),
(14, 'Solitude', 'Scroll of Frostbite', 0.5, 100, 'A scroll that casts a powerful frostbite'),
(15, 'Whiterun', 'Key to Dragonsreach', 0.1, 0, 'A key to the Dragonsreach in Whiterun'),
(16, 'Solitude', 'Key to Blue Palace', 0.1, 0, 'A key to the Blue Palace in Solitude');

-- Inserting data into the Weapon table
INSERT INTO Weapon (itemID, damageValue, reach, wType, effectID) VALUES (1, 8, 1.0, 'One-Handed', 7), (2, 10, 1.0, 'One-Handed', 7);

-- Inserting data into the Armour table
INSERT INTO Armour (itemID, aType, aRating, effectID) VALUES (5, 'Light Armour', 25, 8), (6, 'Heavy Armour', 35, 8);

-- Inserting data into the Potion table
INSERT INTO Potion (itemID, effectID) VALUES (7, 9), (8, 10);

-- Inserting data into the Ingredients table
INSERT INTO Ingredients (itemID, pItemID) VALUES (9, 7), (10, 8);

-- Inserting data into the Book table
INSERT INTO Book (itemID, author, title) VALUES (11, 'Falion', 'Conjuration for Novices'), (12, 'Wuunferth the Unliving', 'Destruction for Beginners');

-- Inserting data into the Scroll table
INSERT INTO Scroll (itemID, effectID, spellID, scLevel) VALUES (13, 13, 1, 1), (14, 13, 2, 2);

-- Inserting data into the Food table
INSERT INTO Food (itemID, effectID) VALUES (3, 14), (4, 14);

-- Inserting data into the KeyItem table
INSERT INTO KeyItem (itemID, kDoor, kChest) VALUES (15, 'Dragonsreach', 'Chest1'), (16, 'Blue Palace', 'Chest2');
