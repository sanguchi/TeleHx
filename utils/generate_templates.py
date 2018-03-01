from jinja2 import Environment, PackageLoader, select_autoescape
import json
import os

env = Environment(
    loader=PackageLoader('__main__', 'templates'),
    autoescape=select_autoescape(['html', 'xml']),
    trim_blocks=True,
    lstrip_blocks=True,
)

template = env.get_template('TeleHxTypes.hx.jinja2')
telegram_types = json.load(open('types.json', 'r'))
generated_template = open('../src/telehx/TeleHxTypes.hx', 'w')
generated_template.write(template.render(telegram_types=telegram_types))
print("Generated haxe file on {}".format(os.path.realpath(generated_template.name)))
