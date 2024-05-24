MATCH path=(i:Ingredient)-[r:HAS_BENEFIT]->(b)
RETURN path;

LOAD CSV WITH HEADERS FROM "file:///link.csv" AS row
MATCH (i:Ingredient {id: row.ingredient_name})
MATCH (b:Soothing) WHERE b.id = row.benefits
MERGE (i)-[:HAS_BENEFIT]->(b);

LOAD CSV WITH HEADERS FROM "file:///link.csv" AS row
MATCH (i:Ingredient {id: row.ingredient_name})
MATCH (b:SmoothsBumpySkin) WHERE b.id = row.benefits
MERGE (i)-[:HAS_BENEFIT]->(b);

LOAD CSV WITH HEADERS FROM "file:///link.csv" AS row
MATCH (i:Ingredient {id: row.ingredient_name})
MATCH (b:PoreMinimizer) WHERE b.id = row.benefits
MERGE (i)-[:HAS_BENEFIT]->(b);

LOAD CSV WITH HEADERS FROM "file:///link.csv" AS row
MATCH (i:Ingredient {id: row.ingredient_name})
MATCH (b:OilControl) WHERE b.id = row.benefits
MERGE (i)-[:HAS_BENEFIT]->(b);

LOAD CSV WITH HEADERS FROM "file:///link.csv" AS row
MATCH (i:Ingredient {id: row.ingredient_name})
MATCH (b:Hydration) WHERE b.id = row.benefits
MERGE (i)-[:HAS_BENEFIT]->(b);

LOAD CSV WITH HEADERS FROM "file:///link.csv" AS row
MATCH (i:Ingredient {id: row.ingredient_name})
MATCH (b:EvensSkinTone) WHERE b.id = row.benefits
MERGE (i)-[:HAS_BENEFIT]->(b);

LOAD CSV WITH HEADERS FROM "file:///link.csv" AS row
MATCH (i:Ingredient {id: row.ingredient_name})
MATCH (b:DarkSpotFading) WHERE b.id = row.benefits
MERGE (i)-[:HAS_BENEFIT]->(b);

LOAD CSV WITH HEADERS FROM "file:///link.csv" AS row
MATCH (i:Ingredient {id: row.ingredient_name})
MATCH (b:BlackheadReducing) WHERE b.id = row.benefits
MERGE (i)-[:HAS_BENEFIT]->(b);

LOAD CSV WITH HEADERS FROM "file:///link.csv" AS row  
MATCH (i:Ingredient {id: row.ingredient_name})
MATCH (b:AntiAging) WHERE b.id = row.benefits
MERGE (i)-[:HAS_BENEFIT]->(b);

LOAD CSV WITH HEADERS FROM "file:///link.csv" AS row
MATCH (i:Ingredient {id: row.ingredient_name})
MATCH (b:AntiAcne) WHERE b.id = row.benefits
MERGE (i)-[:HAS_BENEFIT]->(b);

// 手动创建 Benefit 节点
CREATE (:AntiAcne {id: 'Anti-Acne'})
CREATE (:AntiAging {id: 'Anti-Aging'})
CREATE (:BlackheadReducing {id: 'Blackhead Reducing'})
CREATE (:DarkSpotFading {id: 'Dark Spot Fading'})
CREATE (:EvensSkinTone {id: 'Evens Skin Tone'})
CREATE (:Hydration {id: 'Hydration'})
CREATE (:OilControl {id: 'Oil Control'})
CREATE (:PoreMinimizer {id: 'Pore Minimizer'})
CREATE (:SmoothsBumpySkin {id: 'Smooths Bumpy Skin'})
CREATE (:Soothing {id: 'Soothing'});

// 创建 Ingredient 节点
LOAD CSV WITH HEADERS FROM "file:///Paula_DETAIL_FINAL.csv" AS row
CREATE (i:Ingredient {
  id: row.ingredient_name,
  categories: row.categories,
  glance: row.glance,
  description: row.description,
  references: row.references
});
