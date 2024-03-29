-- List all items in the inventory
SELECT * FROM Item;

-- List all spells at a specific location
SELECT * FROM Spell WHERE locName = 'Whiterun'; 

-- List all spells at a specific location
SELECT * FROM Item WHERE locName = 'Whiterun'; 

-- List all alteration spells which effect bandits
SELECT * FROM Alteration WHERE sTarget = 'Bandit';

-- List all destruction spells with damage greater than 100
SELECT * 
FROM Destruction, Spell 
WHERE Destruction.spellID = Spell.spellID 
AND damage > 25;

-- List all restoration spells with restored health greater than 25
SELECT *
FROM Restoration, Spell
WHERE Restoration.spellID = Spell.spellID
AND healthRestored > 25;

-- List all weapons which do more 25 damage (or something like this)
SELECT *
FROM Weapon, Item
WHERE Weapon.itemID = Item.itemID
AND Weapon.damageValue > 25;

-- List all armour which provide more than X protection
SELECT *
FROM Armour, Item
WHERE Armour.itemID = Item.itemID
AND Armour.aRating > 10;

-- List the potions which hold a specific effect. 9 Is health restoration effect.
SELECT * FROM Potion, Item WHERE Potion.itemID = Item.itemID
AND Potion.effectID = 9;

-- List all the scrolls which have a certain level X. 5?
SELECT *
FROM Scroll, Item, Spell
WHERE Scroll.itemID = Item.itemID AND Scroll.spellID = Spell.spellID
AND Scroll.scLevel > 1;

-- Determine the wealth of the character
SELECT SUM(iValue) AS Total_Worth FROM Item;

-- Determine the entities which can be targeted by more than one spell
SELECT sTarget 
FROM (
  SELECT sTarget FROM Alteration UNION ALL 
  SELECT sTarget FROM Illusion) AS combined
GROUP BY sTarget 
HAVING COUNT(*) > 1;

-- Weapon with the longest reach
SELECT iName, reach 
FROM Item, Weapon
WHERE Item.itemID = Weapon.itemID
ORDER BY (reach) DESC LIMIT 1;

-- Most expensive items
SELECT locName, iName, iValue
FROM (
  SELECT locName, iName, iValue,
         ROW_NUMBER() OVER(PARTITION BY locName ORDER BY iValue DESC) as rn
  FROM Item
) t
WHERE rn <= 5;

-- Spells which deal the most damage. Descending list
SELECT * 
FROM Destruction, Spell 
WHERE Destruction.spellID = Spell.spellID
ORDER BY (damage, spellCost) DESC;

-- Book
(SELECT E1.effectID, radius, edesc FROM Effect E1, Defensive
WHERE Defensive.effectID = E1.effectID 
AND radius > 0)
UNION
(SELECT E2.effectID, radius, edesc  FROM Effect E2, Offensive
WHERE Offensive.effectID = E2.effectID
AND radius > 0)
ORDER BY (radius) DESC;
