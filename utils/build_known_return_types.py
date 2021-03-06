import json
print("Please tell me what does it return, press Enter if it does not return anything of it returns True or a Boolean")
prompt = """
method: {}
desciption:
    {}
->"""
basicTypes  = {
	'Integer': 'Int',
	'String': 'String',
	'Boolean': 'Bool',
	'Float number': 'Float',
	'True': 'Bool',
	'Float': 'Float'}

try:
	known_return_types = json.load(open('returns.json'))
except:
	known_return_types = []

known_telegram_types = [field['name'] for field in json.load(open('types.json'))]
def is_valid_response(response):
	if(response in known_telegram_types):
		return True
	elif(response.startswith('Array')):
		return True
	elif(response in basicTypes.keys()):
		return True
	elif(response == ""):
		return True
	else:
		return False

methods = json.loads(open('methods.json').read())
for method in methods:
	if(method["name"] not in [m["method_name"] for m in known_return_types]):
		try:
			response = input(prompt.format(method["name"], method["description"]))
		except KeyboardInterrupt:
			json.dump(known_return_types, open('returns.json', 'w'), indent=4)
			print("Saved {} methods return types".format(len(known_return_types)))
			exit()
		if(response and is_valid_response(response)):
			known_return_types.append({"method_name": method["name"], "method_return": response})
		elif(not response and is_valid_response(response)):
			known_return_types.append({"method_name": method["name"], "method_return": "Boolean"})
		elif(response and not is_valid_response(response) and "or" in response):
			known_return_types.append({"method_name": method["name"], "method_return": response})
		else:
			json.dump(known_return_types, open('returns.json', 'w'), indent=4)
			print("Invalid response [{}], was not found in known types".format(response))
			exit()

json.dump(known_return_types, open('returns.json', 'w'), indent=4)
