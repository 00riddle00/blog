#!/usr/bin/python
# -*- coding: utf-8 -*-

from django.shortcuts import render
from django.http import HttpResponse
from django.http import HttpResponseNotFound
from .models import *
from django.core.mail import EmailMessage
from .forms import *
from django.core.exceptions import ObjectDoesNotExist
from django.utils.translation import activate


def index(request):


    main = {}

    try:
        slider = Images.objects.get(pk=1)
    except ObjectDoesNotExist:
        pass
    else:
        main['slider'] = slider
    try:
        sliderbox = SliderBox.objects.all().order_by('order')
    except ObjectDoesNotExist:
        pass
    else:
        main['sliderbox'] = sliderbox
    try:
        content_blocks = ContentBlock.objects.filter(is_active=1).all().order_by('order')
    except ObjectDoesNotExist:
        pass
    else:
        main['content_blocks'] = content_blocks
    try:
        battery = Images.objects.get(pk=2)
    except ObjectDoesNotExist:
        pass
    else:
        main['battery'] = battery
    try:
        footer = Footer.objects.get(pk=1)
    except ObjectDoesNotExist:
        pass
    else:
        main['footer'] = footer
    try:
        metadata = MetaData.objects.get(pk=1)
    except ObjectDoesNotExist:
        pass
    else:
        main['metadata'] = metadata

    languages = Language.objects.filter(is_active=True).order_by('order')
    main['languages'] = languages

    strings = Strings.objects.all()
    strings_dict = {}
    for s in strings:
        strings_dict[str(s.code)] = s
    main.update(strings_dict)


    lang = request.LANGUAGE_CODE
    domain = request.META['HTTP_HOST']

    if 'lt' in domain:
        shop_list = Shops.objects.filter(country_code='lt')
        city_list = City.objects.filter(country_code='lt').order_by('order')
        map_center = '54.7002886, 25.2828511'
        if lang == 'ru':
            city_top = 'Вильнюс'
        else:
            city_top = 'Vilnius'
    elif 'lv' in domain:
        shop_list = Shops.objects.filter(country_code='lv')
        city_list = City.objects.filter(country_code='lv').order_by('order')
        map_center = '56.9615833, 24.1090817'
        if lang == 'ru':
            city_top = 'Рига'
        else:
            city_top = 'Rīga'
    elif 'ee' in domain:
        shop_list = Shops.objects.filter(country_code='et')
        city_list = City.objects.filter(country_code='et').order_by('order')
        map_center = '59.4290275, 24.7682023'
        if lang == 'ru':
            city_top = 'Таллин'
        else:
            city_top = 'Tallinn'
    else:
        shop_list = Shops.objects.filter(country_code='lt')
        city_list = City.objects.filter(country_code='lt').order_by('order')
        map_center = '54.7002886, 25.2828511'
        city_top = 'Vilnius'


    main['shop_list'] = shop_list
    main['city_list'] = city_list
    main['map_center'] = map_center
    main['city_top'] = city_top
    host_by_lang = domain[-2:]
    main['host_by_lang'] = host_by_lang


    return render(request, 'index.html', main)
