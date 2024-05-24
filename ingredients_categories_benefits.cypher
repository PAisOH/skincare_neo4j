// 0.创建 Ingredient 节点(手动处理了一条数据以‘/’结束的，NEO4J不支持)
LOAD CSV WITH HEADERS FROM "file:///Paula_embedding_SUMLIST_before_422.csv" AS row
CREATE (i:Ingredient {
  id: row.ingredient_name,
  rating: row.rating,
  functions: row.functions,
  benefits: row.benefits,
  categories: row.categories,
  glance: row.glance,
  description: row.description,
  references: row.references,
  link: row.link
});

// 1.1.手动创建 Benefit 节点
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

// 1.2.连接Ingredient和各个Benefits
LOAD CSV WITH HEADERS FROM "file:///binary_benefit.csv" AS row
MATCH (i:Ingredient {id: row.ingredient_name})
MATCH (b:AntiAcne) WHERE b.id = row.benefit
MERGE (i)-[:HAS_BENEFIT]->(b);

LOAD CSV WITH HEADERS FROM "file:///binary_benefit.csv" AS row  
MATCH (i:Ingredient {id: row.ingredient_name})
MATCH (b:AntiAging) WHERE b.id = row.benefit
MERGE (i)-[:HAS_BENEFIT]->(b);

LOAD CSV WITH HEADERS FROM "file:///binary_benefit.csv" AS row
MATCH (i:Ingredient {id: row.ingredient_name})
MATCH (b:BlackheadReducing) WHERE b.id = row.benefit
MERGE (i)-[:HAS_BENEFIT]->(b);

LOAD CSV WITH HEADERS FROM "file:///binary_benefit.csv" AS row
MATCH (i:Ingredient {id: row.ingredient_name})
MATCH (b:DarkSpotFading) WHERE b.id = row.benefit
MERGE (i)-[:HAS_BENEFIT]->(b);

LOAD CSV WITH HEADERS FROM "file:///binary_benefit.csv" AS row
MATCH (i:Ingredient {id: row.ingredient_name})
MATCH (b:EvensSkinTone) WHERE b.id = row.benefit
MERGE (i)-[:HAS_BENEFIT]->(b);

LOAD CSV WITH HEADERS FROM "file:///binary_benefit.csv" AS row
MATCH (i:Ingredient {id: row.ingredient_name})
MATCH (b:Hydration) WHERE b.id = row.benefit
MERGE (i)-[:HAS_BENEFIT]->(b);

LOAD CSV WITH HEADERS FROM "file:///binary_benefit.csv" AS row
MATCH (i:Ingredient {id: row.ingredient_name})
MATCH (b:OilControl) WHERE b.id = row.benefit
MERGE (i)-[:HAS_BENEFIT]->(b);

LOAD CSV WITH HEADERS FROM "file:///binary_benefit.csv" AS row
MATCH (i:Ingredient {id: row.ingredient_name})
MATCH (b:PoreMinimizer) WHERE b.id = row.benefit
MERGE (i)-[:HAS_BENEFIT]->(b);

LOAD CSV WITH HEADERS FROM "file:///binary_benefit.csv" AS row
MATCH (i:Ingredient {id: row.ingredient_name})
MATCH (b:SmoothsBumpySkin) WHERE b.id = row.benefit
MERGE (i)-[:HAS_BENEFIT]->(b);

LOAD CSV WITH HEADERS FROM "file:///binary_benefit.csv" AS row
MATCH (i:Ingredient {id: row.ingredient_name})
MATCH (b:Soothing) WHERE b.id = row.benefit
MERGE (i)-[:HAS_BENEFIT]->(b);


// 2.1.手动创建 Categories 节点
CREATE (:PlantExtracts {id: 'Plant Extracts'})
CREATE (:Irritant {id: 'Irritant'})
CREATE (:Emulsifier {id: 'Emulsifier'})
CREATE (:SuspendingDispersingAgent {id: 'Suspending/Dispersing Agent'})
CREATE (:Solvent {id: 'Solvent'})
CREATE (:TextureEnhancer {id: 'Texture Enhancer'})
CREATE (:Emollient {id: 'Emollient'})
CREATE (:Humectant {id: 'Humectant'})
CREATE (:OcclusiveOpacifyingAgent {id: 'Occlusive/Opacifying Agent'})
CREATE (:Preservative {id: 'Preservative'})
CREATE (:Antibacterial {id: 'Antibacterial'})
CREATE (:Antioxidant {id: 'Antioxidant'})
CREATE (:ChelatingAgent {id: 'Chelating Agent'})
CREATE (:FragranceSyntheticAndNatural {id: 'Fragrance: Synthetic and Natural'})
CREATE (:ColoringAgentPigment {id: 'Coloring Agent/Pigment'})
CREATE (:CleansingAgent {id: 'Cleansing Agent'})
CREATE (:Exfoliant {id: 'Exfoliant'})
CREATE (:UVFilters {id: 'UV Filters'})
CREATE (:pHAdjusterStabilizer {id: 'pH Adjuster/Stabilizer'})
CREATE (:FilmFormingAgent {id: 'Film-Forming Agent'})
CREATE (:Absorbent {id: 'Absorbent'})
CREATE (:Peptides {id: 'Peptides'})
CREATE (:Polymer {id: 'Polymer'})
CREATE (:Silicone {id: 'Silicone'})
CREATE (:Retinoids {id: 'Retinoids'})
CREATE (:PrebioticProbioticPostbiotic {id: 'Prebiotic/Probiotic/Postbiotic'})

// 2.2.连接Categories和Ingredients
LOAD CSV WITH HEADERS FROM "file:///binary_category.csv" AS row
MATCH (i:Ingredient {id: row.ingredient_name})
MATCH (c:PlantExtracts) WHERE c.id = row.category
MERGE (i)-[:BELONGS_TO]->(c);

LOAD CSV WITH HEADERS FROM "file:///binary_category.csv" AS row
MATCH (i:Ingredient {id: row.ingredient_name})
MATCH (c:Irritant) WHERE c.id = row.category
MERGE (i)-[:BELONGS_TO]->(c);

LOAD CSV WITH HEADERS FROM "file:///binary_category.csv" AS row
MATCH (i:Ingredient {id: row.ingredient_name})
MATCH (c:Emulsifier) WHERE c.id = row.category
MERGE (i)-[:BELONGS_TO]->(c);

LOAD CSV WITH HEADERS FROM "file:///binary_category.csv" AS row
MATCH (i:Ingredient {id: row.ingredient_name})
MATCH (c:SuspendingDispersingAgent) WHERE c.id = row.category
MERGE (i)-[:BELONGS_TO]->(c);

LOAD CSV WITH HEADERS FROM "file:///binary_category.csv" AS row
MATCH (i:Ingredient {id: row.ingredient_name})
MATCH (c:Solvent) WHERE c.id = row.category
MERGE (i)-[:BELONGS_TO]->(c);

LOAD CSV WITH HEADERS FROM "file:///binary_category.csv" AS row
MATCH (i:Ingredient {id: row.ingredient_name})
MATCH (c:TextureEnhancer) WHERE c.id = row.category
MERGE (i)-[:BELONGS_TO]->(c);

LOAD CSV WITH HEADERS FROM "file:///binary_category.csv" AS row
MATCH (i:Ingredient {id: row.ingredient_name})
MATCH (c:Emollient) WHERE c.id = row.category
MERGE (i)-[:BELONGS_TO]->(c);

LOAD CSV WITH HEADERS FROM "file:///binary_category.csv" AS row
MATCH (i:Ingredient {id: row.ingredient_name})
MATCH (c:Humectant) WHERE c.id = row.category
MERGE (i)-[:BELONGS_TO]->(c);

LOAD CSV WITH HEADERS FROM "file:///binary_category.csv" AS row
MATCH (i:Ingredient {id: row.ingredient_name})
MATCH (c:OcclusiveOpacifyingAgent) WHERE c.id = row.category
MERGE (i)-[:BELONGS_TO]->(c);

LOAD CSV WITH HEADERS FROM "file:///binary_category.csv" AS row
MATCH (i:Ingredient {id: row.ingredient_name})
MATCH (c:Preservative) WHERE c.id = row.category
MERGE (i)-[:BELONGS_TO]->(c);

LOAD CSV WITH HEADERS FROM "file:///binary_category.csv" AS row
MATCH (i:Ingredient {id: row.ingredient_name})
MATCH (c:Antibacterial) WHERE c.id = row.category
MERGE (i)-[:BELONGS_TO]->(c);

LOAD CSV WITH HEADERS FROM "file:///binary_category.csv" AS row
MATCH (i:Ingredient {id: row.ingredient_name})
MATCH (c:Antioxidant) WHERE c.id = row.category
MERGE (i)-[:BELONGS_TO]->(c);

LOAD CSV WITH HEADERS FROM "file:///binary_category.csv" AS row
MATCH (i:Ingredient {id: row.ingredient_name})
MATCH (c:ChelatingAgent) WHERE c.id = row.category
MERGE (i)-[:BELONGS_TO]->(c);

LOAD CSV WITH HEADERS FROM "file:///binary_category.csv" AS row
MATCH (i:Ingredient {id: row.ingredient_name})
MATCH (c:FragranceSyntheticAndNatural) WHERE c.id = row.category
MERGE (i)-[:BELONGS_TO]->(c);

LOAD CSV WITH HEADERS FROM "file:///binary_category.csv" AS row
MATCH (i:Ingredient {id: row.ingredient_name})
MATCH (c:ColoringAgentPigment) WHERE c.id = row.category
MERGE (i)-[:BELONGS_TO]->(c);

LOAD CSV WITH HEADERS FROM "file:///binary_category.csv" AS row
MATCH (i:Ingredient {id: row.ingredient_name})
MATCH (c:CleansingAgent) WHERE c.id = row.category
MERGE (i)-[:BELONGS_TO]->(c);

LOAD CSV WITH HEADERS FROM "file:///binary_category.csv" AS row
MATCH (i:Ingredient {id: row.ingredient_name})
MATCH (c:Exfoliant) WHERE c.id = row.category
MERGE (i)-[:BELONGS_TO]->(c);

LOAD CSV WITH HEADERS FROM "file:///binary_category.csv" AS row
MATCH (i:Ingredient {id: row.ingredient_name})
MATCH (c:UVFilters) WHERE c.id = row.category
MERGE (i)-[:BELONGS_TO]->(c);

LOAD CSV WITH HEADERS FROM "file:///binary_category.csv" AS row
MATCH (i:Ingredient {id: row.ingredient_name})
MATCH (c:pHAdjusterStabilizer) WHERE c.id = row.category
MERGE (i)-[:BELONGS_TO]->(c);

LOAD CSV WITH HEADERS FROM "file:///binary_category.csv" AS row
MATCH (i:Ingredient {id: row.ingredient_name})
MATCH (c:FilmFormingAgent) WHERE c.id = row.category
MERGE (i)-[:BELONGS_TO]->(c);

LOAD CSV WITH HEADERS FROM "file:///binary_category.csv" AS row
MATCH (i:Ingredient {id: row.ingredient_name})
MATCH (c:Absorbent) WHERE c.id = row.category
MERGE (i)-[:BELONGS_TO]->(c);

LOAD CSV WITH HEADERS FROM "file:///binary_category.csv" AS row
MATCH (i:Ingredient {id: row.ingredient_name})
MATCH (c:Peptides) WHERE c.id = row.category
MERGE (i)-[:BELONGS_TO]->(c);

LOAD CSV WITH HEADERS FROM "file:///binary_category.csv" AS row
MATCH (i:Ingredient {id: row.ingredient_name})
MATCH (c:Polymer) WHERE c.id = row.category
MERGE (i)-[:BELONGS_TO]->(c);

LOAD CSV WITH HEADERS FROM "file:///binary_category.csv" AS row
MATCH (i:Ingredient {id: row.ingredient_name})
MATCH (c:Silicone) WHERE c.id = row.category
MERGE (i)-[:BELONGS_TO]->(c);

LOAD CSV WITH HEADERS FROM "file:///binary_category.csv" AS row
MATCH (i:Ingredient {id: row.ingredient_name})
MATCH (c:Retinoids) WHERE c.id = row.category
MERGE (i)-[:BELONGS_TO]->(c);

LOAD CSV WITH HEADERS FROM "file:///binary_category.csv" AS row
MATCH (i:Ingredient {id: row.ingredient_name})
MATCH (c:PrebioticProbioticPostbiotic) WHERE c.id = row.category
MERGE (i)-[:BELONGS_TO]->(c);

// 检查
MATCH path=(i:Ingredient)-[r:HAS_BENEFIT]->(b)
RETURN path;

MATCH path=(i:Ingredient)-[r:BELONGS_TO]->(c)
RETURN path LIMIT 1000;