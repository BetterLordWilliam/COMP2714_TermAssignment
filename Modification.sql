-- ITEM AND SPELL AND EFFECT ID AUTO INCREMENT
ALTER TABLE item MODIFY itemID INTEGER NOT NULL Auto_Increment;
ALTER TABLE spell MODIFY spellID INTEGER NOT NULL Auto_Increment;
ALTER TABLE spell ADD CONSTRAINT nameUnique UNIQUE (spellName);
ALTER TABLE effect MODIFY effectID INTEGER NOT NULL Auto_Increment;

-- Little extra data
INSERT INTO Location VALUES ('Riften');

INSERT INTO Standing_Stone (stoneName, stoneLocation, effectID)
VALUES ('Shadow Stone', 'Riften', 0);
