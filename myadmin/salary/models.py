from django.db import models

# Create your models here.

class Salary(models.Model):
    month = models.CharField(max_length=2, help_text="month")
    salary = models.FloatField(help_text="salary")

    def __unicode__(self):
        return "%s-%s" % (self.month, self.salary)
