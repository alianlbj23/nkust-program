# Generated by Django 4.0 on 2022-01-20 10:19

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('robot', '0010_orientation_memorytime'),
    ]

    operations = [
        migrations.AddField(
            model_name='sort_term_memory',
            name='memoryTime',
            field=models.IntegerField(default=1),
            preserve_default=False,
        ),
    ]