from recipe_scrapers import scrape_me
from PIL import Image
import io, requests

recipeLink = "x"

def main():
    global recipeLink
    while recipeLink != "":
        recipeLink = input("\nEnter recipe link: ")
        try:
            scraper = scrape_me(recipeLink)
            fetchRecipe(scraper)
        except:
            # Q: What if the recipe site I want to extract information from is not listed below?
            # A: You can give it a try with the wild_mode option! If there is Schema/Recipe available it will work just fine.
            tryWildMode = input("\nRecipe/Schema not found, do you want to try wild mode (Y/N)? ")
            if ((tryWildMode == 'Y') or (tryWildMode == 'y')):
                try:
                    scraper = scrape_me(recipeLink, wild_mode=True)
                    fetchRecipe(scraper)
                except:
                    newLink = input("\nThe website doesn't have a recipe/schema that the script can pull. Try another link/website (Y/N)? ")
                    if ((newLink == 'N') or (newLink == 'n')):
                        recipeLink = ""
            else:
                newLink = input("\nDo you want to pull another recipe (Y/N)? ")
                if ((newLink == 'N') or (newLink == 'n')):
                    recipeLink = ""

def fetchRecipe(scraperObj):
    global recipeLink
    f = open("recipe.txt", "w")
    # f.write("HOST\n--------------------\n")
    # f.write(scraperObj.host()+"\n\n")
    f.write("WEB LINK\n--------------------\n")
    f.write(recipeLink+"\n\n")
    f.write("TITLE\n--------------------\n")
    f.write(scraperObj.title()+"\n\n")
    f.write("TIME\n--------------------\n")
    f.write(str(scraperObj.total_time())+"\n\n")
    f.write("YIELD\n--------------------\n")
    f.write(scraperObj.yields()+"\n\n")
    f.write("NUTRIENTS\n--------------------\n")
    nutrientsDict = scraperObj.nutrients()
    if nutrientsDict:
        nutrients = ""
        for nutrient_key in nutrientsDict:
            if nutrient_key != "unsaturatedFatContent":
                nutrients = nutrients + nutrient_key.replace("Content", "").title() + ": " + nutrientsDict[nutrient_key] + "\n"
            else:
                nutrients = nutrients + "Unsaturated Fat" + ": " + nutrientsDict[nutrient_key] + "\n"
        f.write(nutrients+"\n")
    f.write("INGREDIENTS\n--------------------\n")
    ingredientList = scraperObj.ingredients()
    if ingredientList:
        ingredients = ""
        for ingredient in ingredientList:
            ingredients = ingredients + ingredient + "\n\n"
        f.write(ingredients+"\n")
    f.write("INGREDIENT GROUPS\n--------------------\n")
    ingredientGroups = scraperObj.ingredient_groups()
    if ingredientGroups:
        ingredientGroups = ""
        for ingredientGroup in ingredientGroups:
            ingredientGroups = ingredientGroups + ingredient + "\n"
        f.write(ingredientGroups+"\n")   
    f.write("INSTRUCTIONS\n--------------------\n")
    f.write(scraperObj.instructions()+"\n\n")
    f.write("INSTRUCTION LIST\n--------------------\n")
    instructionList = scraperObj.instructions_list()
    if instructionList:
        instructions = ""
        for instruction in instructionList:
            instructions = instructions + instruction + "\n\n"
        f.write(instructions+"\n")
    try:
        image = requests.get(scraperObj.image()).content
        imageByte = Image.open(io.BytesIO(image))
        imageByte.save("food.jpeg", "JPEG")
    except:
        print("\n! Can't pull any images !")

    f.close()
    print("\n--------------------\n        DONE\n--------------------\n")

if __name__ == "__main__":
    main()