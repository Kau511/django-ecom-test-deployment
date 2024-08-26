import os

from django.core.wsgi import get_wsgi_application

env = os.getenv('DJANGO_ENV', 'development')  # Default to 'development' if not set
os.environ.setdefault('DJANGO_SETTINGS_MODULE', f'djecommerce.settings.{env}')

application = get_wsgi_application()
