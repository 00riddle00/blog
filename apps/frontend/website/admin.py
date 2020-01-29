from django.contrib import admin
from ordered_model.admin import OrderedModelAdmin
from .models import *
from django.utils.translation import ugettext_lazy as _
from django.conf import settings


class LanguageAdmin(OrderedModelAdmin):

    list_display = [
        '__str__',
        'order',
        'move_up_down_links',
        'is_default',
        'is_active',
    ]

    list_editable = [
        'is_default',
    ]

    ordering = ('order',)

    def save_model(self, request, obj, form, change):
        obj.save()
        try:
            default_language = Language.objects.filter(is_default=True)[0]
        except IndexError:
            settings.LANGUAGE_CODE = 'en'
        else:
            settings.LANGUAGE_CODE = default_language.code

        Language_list = []
        for language in Language.objects.order_by('-order'):
            language_tuple = (language.code, language.language)
            Language_list.insert(0, language_tuple)

        settings.LANGUAGES = tuple(Language_list)


class SliderAdmin(OrderedModelAdmin):

    list_display = [
        '__str__',
        'order',
        'move_up_down_links',
    ]

    ordering = ('order',)

class ContentAdmin(OrderedModelAdmin):

    list_display = [
        '__str__',
        'order',
        'move_up_down_links',
        'is_active',
    ]

    list_editable = ['is_active']

    ordering = ('order',)

    def has_delete_permission(self, request, obj=None):
        return False

    class Media:
        js = ('/static/js/tiny_mce/tiny_mce.js',
              '/static/js/tiny_mce/textareas.js',)

class BasicAdmin(OrderedModelAdmin):

    list_display = [
        '__str__',
        'move_up_down_links',
    ]

    ordering = ('order',)

    def get_readonly_fields(self, request, obj=None):
        if obj:
            return ('code',)
        else:
            return ()


class ShopAdmin(admin.ModelAdmin):
    list_display = [
        '__str__',
        'country_code',
    ]

    list_editable = ['country_code']


class CityAdmin(OrderedModelAdmin):
    list_display = [
        '__str__',
        'order',
        'move_up_down_links',
        'country_code',
        'zoom'
    ]

    list_editable = ['country_code', 'zoom']

    ordering = ('order',)


class SimpleAdmin(OrderedModelAdmin):

    list_display = [
        '__str__',
    ]

    def has_add_permission(self, request):
        return False

    def has_delete_permission(self, request, obj=None):
        return False


admin.site.register(Language, LanguageAdmin)
admin.site.register(SliderBox, SliderAdmin)
admin.site.register(ContentBlock, ContentAdmin)
admin.site.register(Shops, ShopAdmin)
admin.site.register(City, CityAdmin)
admin.site.register(Strings, BasicAdmin)
admin.site.register(Images, BasicAdmin)
admin.site.register(Footer, SimpleAdmin)
admin.site.register(MetaData, SimpleAdmin)
