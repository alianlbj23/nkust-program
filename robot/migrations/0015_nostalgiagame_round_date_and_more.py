# Generated by Django 4.0.1 on 2022-04-06 21:23

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('robot', '0014_nostalgiagame_round_nostalgiagame_player'),
    ]

    operations = [
        migrations.AddField(
            model_name='nostalgiagame_round',
            name='Date',
            field=models.CharField(default=1, max_length=500),
            preserve_default=False,
        ),
        migrations.AlterField(
            model_name='nostalgiagame_round',
            name='Session',
            field=models.IntegerField(),
        ),
    ]
