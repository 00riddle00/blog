from django.conf.urls import include, url
from django.conf.urls.i18n import i18n_patterns
from django.conf import settings
from django.conf.urls.static import static
from django.contrib import admin
from apps.frontend.website import views
from filebrowser.sites import site
from django.views.generic import TemplateView
from django.views.static import serve



urlpatterns = [
   url(r'^admin/filebrowser/', site.urls),
   url(r'^admin/', admin.site.urls),
   url(r'^tinymce/', include('tinymce.urls')),
   url(r'^robots\.txt$', TemplateView.as_view(template_name='robots.txt')),
]

urlpatterns += i18n_patterns(
   url(r'^$', views.index, name='index'),
)

if settings.DEBUG:
    urlpatterns += [
        url(r'^media/(?P<path>.*)$', serve, {
            'document_root': settings.MEDIA_ROOT,
        }),
        url(r'^static/(?P<path>.*)$', serve, {
            'document_root': settings.STATIC_ROOT,
        }),
]
