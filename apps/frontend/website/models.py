#!/usr/bin/python
# -*- coding: utf-8 -*-

from django.db import models
from ordered_model.models import OrderedModel
from django.utils.translation import ugettext_lazy as _
from django.utils.translation import get_language
from django.core.exceptions import ObjectDoesNotExist
from geoposition.fields import GeopositionField
from filebrowser.fields import FileBrowseField


class Common(models.Model):

    is_active = models.CharField(
        max_length=10,
        choices=[('1', 'Active'), ('0', 'Inactive')],
        verbose_name='status'
    )

    class Meta:
        abstract = True


class Language(OrderedModel):
    image = FileBrowseField(
            "Image",
            max_length=200,
            directory="uploads/",
            extensions=[".png", ".jpg"],
            blank=True,
            null=True
    )

    language = models.CharField(max_length=100)
    code = models.CharField(max_length=10)
    is_default = models.BooleanField(default=False)
    is_active = models.BooleanField(default=False)

    def __str__(self):
        return self.language

    def save(self, *args, **kwargs):
        if self.is_default:
            try:
                temp = Language.objects.get(is_default=True)
                if self != temp:
                    temp.is_default = False
                    temp.save()
            except Language.DoesNotExist:
                pass
        super(Language, self).save(*args, **kwargs)

    class Meta:
        verbose_name_plural = '1. Languages'


class SliderBox(OrderedModel):

    image = FileBrowseField(
            "Image",
            max_length=200,
            directory="uploads/",
            extensions=[".png", ".jpg"],
            blank=True,
            null=True
    )

    text = models.CharField(max_length=200)

    def __str__(self):
        return self.text

    class Meta:
        verbose_name_plural = '2. Slider Text'


class ContentBlock(Common, OrderedModel):

    title = models.CharField(max_length=100)
    internal_link = models.CharField(max_length=100)
    content = models.TextField(blank=True)

    def __str__(self):
        return self.title

    class Meta:
        verbose_name_plural = '3. Content Blocks'


class Footer(Common, OrderedModel):

    text = models.TextField(blank=True)

    def __str__(self):
        return 'Footer'

    class Meta:
        verbose_name_plural = '4. Footer'


class Shops(models.Model):
    name = models.CharField(max_length=100)
    city = models.CharField(max_length=100)
    address = models.CharField(max_length=100)
    contacts = models.CharField(max_length=100)
    location = GeopositionField()

    country_code = models.CharField(
        max_length=10,
        choices=[('lt', 'lt'), ('lv', 'lv'), ('et', 'et')],
        verbose_name='Country code'
    )

    def __str__(self):
        return self.name

    class Meta:
        verbose_name_plural = 'Shops'


class City(OrderedModel):
    name = models.CharField(max_length=100)
    russian_name = models.CharField(max_length=100)
    location = GeopositionField()

    zoom = models.CharField(
        choices=[
            ('10', 10), ('11', '11'), ('12', '12'),
        ],
        max_length=2,
        blank=True,
        null=True,
    )

    country_code = models.CharField(
        max_length=10,
        choices=[('lt', 'lt'), ('lv', 'lv'), ('et', 'et')],
        verbose_name='Country code'
    )

    def __str__(self):
        return self.name

    class Meta:
        verbose_name_plural = 'Map Cities'


class Images(OrderedModel):

    code = models.CharField(max_length=50, blank=False)

    image = FileBrowseField(
            "Image",
            max_length=200,
            directory="uploads/",
            extensions=[".png", ".jpg"],
            blank=True,
            null=True
    )

    def __str__(self):
        name = self.code.replace("_", " ")
        return name.title()

    class Meta:
        verbose_name_plural = 'Images'


class Strings(OrderedModel):

    code = models.CharField(max_length=50, blank=False)

    string = models.TextField(blank=True)

    def __str__(self):
        name = self.code.replace("_", " ")
        return name.title()


    class Meta:
        verbose_name_plural = 'Text (and links)'


class MetaData(models.Model):

    title = models.CharField(max_length=50, blank=True),
    description = models.TextField(blank=True),
    keywords = models.TextField(
        blank=True,
        verbose_name='keywords (separated by commas)'
    )

    def __str__(self):
        return 'Meta data'

    class Meta:
        verbose_name_plural = 'Meta data'
