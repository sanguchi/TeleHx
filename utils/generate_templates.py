from jinja2 import Environment, PackageLoader, select_autoescape
import json
import os

env = Environment(
    loader=PackageLoader('__main__', 'templates'),
    autoescape=select_autoescape(['html', 'xml']),
    trim_blocks=True,
    lstrip_blocks=True,
)

# Generate Types
types_template = env.get_template('TeleHxTypes.hx.jinja2')
telegram_types = json.load(open('types.json', 'r'))
generated_types_template = open('../src/telehx/TeleHxTypes.hx', 'w')
generated_types_template.write(types_template.render(telegram_types=telegram_types))
generated_types_template.close()
print("Generated haxe file for types on {}".format(os.path.realpath(generated_types_template.name)))

# Generate Methods
methods_template = env.get_template('TeleHxMethods.hx.jinja2')
telegram_methods = json.load(open('methods.json', 'r'))
generated_methods_template = open('../src/telehx/TeleHxMethods.hx', 'w')
generated_methods_template.write(methods_template.render(telegram_methods=telegram_methods))
generated_methods_template.close()
print("Generated haxe file for methods on {}".format(os.path.realpath(generated_methods_template.name)))
