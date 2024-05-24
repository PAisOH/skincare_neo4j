// 新建Cosmetic
LOAD CSV WITH HEADERS FROM "file:///Sephora_all_423.csv" AS row
CREATE (:Cosmetic {
    id: row.cosmetic_name,
    cosmetic_link: row.cosmetic_link,
    brand_name: row.brand_name, 
    num_customer: toInteger(row.num_customer),
    price: toFloat(row.price),
    ingredients: row.ingredients,
    about: row.about,
    reviews: row.reviews,
    recommended: row.recommended,
    whatItIs: row['What it is'],
    skinType: row['Skin Type'],
    skincareConcerns: row['Skincare Concerns'],
    Formulation: row.Formulation,
    Benefits: row.Benefits,
    highlightedIngredients: row['Highlighted Ingredients'],
    ingredientCallouts: row['Ingredient Callouts'],
    whatElseYouNeedToKnow: row['What Else You Need to Know'],
    clinicalResults: row['Clinical Results'],
    clean_ingredients: row.clean_ingredients,
    new_ingredients: row.new_ingredients
})

// 新建Brand
LOAD CSV WITH HEADERS FROM "file:///Sephora_all_423.csv" AS row
WITH DISTINCT row.brand_name AS brand_name
CREATE (:Brand {id: brand_name})

// 连接Cosmetic和Brand
MATCH (c:Cosmetic)
MATCH (b:Brand {id: c.brand_name})
CREATE (b)-[:developed]->(c)

// 连接Cosmetic和Ingredient
LOAD CSV WITH HEADERS FROM 'file:///binary_cosmetic_ingredient.csv' AS row
MERGE (c:Cosmetic {id: row.cosmetic})
MERGE (i:Ingredient {id: row.ingredient})
WITH c, i, count(*) AS rel_id
MERGE (c)-[r:USE {id: rel_id}]->(i)
RETURN c, i, r

// 品牌分布。目标：做成树形 / 包埋感