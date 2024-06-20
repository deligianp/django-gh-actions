from django.db import models


# Create your models here.
class Course(models.Model):
    name = models.CharField(max_length=255)


class CourseClass(models.Model):
    year = models.SmallIntegerField()
    course = models.ForeignKey(Course, on_delete=models.CASCADE)
