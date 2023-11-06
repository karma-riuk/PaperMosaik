Usages:
pm := PMJsonToPaperMosaik new.

pm readJsonFileAndPrintItDemo 'return true, as test'

path := '/Users/l/OneDrive - USI/master/3o-sem/Design 101/group project/MicheleLanza_db/MicheleLanza_author_db.json'. 'String containg the path to the JSON file'
result:= pm readJsonFileToListOfDictionaries: path. 'return collection of dictionaries as well as saving it the collection of dictionaries in field called dictionaries'
dicts:= pm dictionaries. 'return collection of dictionaries, using getter on the field dictionaries'
results equals: dicts. 'same collection of dictionaries'
path2:= pm path. 'return String containg the path to the JSON file, using getter on the field path'
path2 equals: path. 'same String containg the path to the JSON file'
