from django.contrib import admin
from models import *

class SalaryAdmin(admin.ModelAdmin):
    list_display = ("id", "month", "salary")

admin.site.register(Salary, SalaryAdmin)
