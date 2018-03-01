from lxml.html import fromstring
from requests import get
import json

html = get('https://core.telegram.org/bots/api').text

methods = list()
types = list()
parsed_html = fromstring(html)

for xpath_h4 in parsed_html.xpath('//*/h4'):
	
	h4_text = xpath_h4.text_content()
	
	# Handle as Telegram API type Object.
	if(h4_text[0].isupper() and ' ' not in h4_text):
		print('Parsing Type {}'.format(h4_text))
		fields = list()
		# get table element and select all rows from tbody, then drop the first row (header row)
		xpath_table = xpath_h4.getnext()
		while(xpath_table.tag != 'table'):
			if(xpath_table.tag == 'h4'):
				break
			xpath_table = xpath_table.getnext()
		xpath_fields = xpath_table.xpath('tbody/tr')[1:]
		for xpath_field in xpath_fields:
			
			# grab all three columns for the given row: variable name, variable type, and description.
			tds = xpath_field.xpath('td')
			print(' - found field: {}'.format(tds[0].text_content()))
			fields.append({
				'field': tds[0].text_content(),
				'field_type': tds[1].text_content(),
				'description': tds[2].text_content(),
			})
		types.append({
		'name': h4_text,
		'description': xpath_h4.getnext().text_content(),
		'fields': fields
		})
	# Handle as Telegram API method.
	elif(h4_text[0].islower() and ' ' not in h4_text):
		print('Parsing Method {}'.format(h4_text))
		fields = list()
		# get table element and select all rows from tbody, then drop the first row (header row)
		xpath_table = xpath_h4.getnext()
		while(xpath_table.tag != 'table'):
			if(xpath_table.tag == 'h4'):
				break
			xpath_table = xpath_table.getnext()
		xpath_fields = xpath_table.xpath('tbody/tr')[1:]
		for xpath_field in xpath_fields:
			
			# grab all three columns for the given row: variable name, variable type, and description.
			tds = xpath_field.xpath('td')
			print(' - found parameter: {}'.format(tds[0].text_content()))
			fields.append({
				'parameter': tds[0].text_content(),
				'field_type': tds[1].text_content(),
				'required': True if tds[2].text_content() == "Yes" else False,
				'description': tds[3].text_content(),
			})
		methods.append({
		'name': h4_text,
		'description': xpath_h4.getnext().text_content(),
		'fields': fields,
		})

json.dump(methods, open('methods.json', 'w'), indent=4)
json.dump(types, open('types.json', 'w'), indent=4)
print('Saved {} types and {} methods'.format(len(types), len(methods)))
