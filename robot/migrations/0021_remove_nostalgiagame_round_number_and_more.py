# Generated by Django 4.0.1 on 2022-04-13 19:28

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('robot', '0020_nostalgiagame_player_mod'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='nostalgiagame_round',
            name='Number',
        ),
        migrations.RemoveField(
            model_name='nostalgiagame_round',
            name='Session',
        ),
        migrations.RemoveField(
            model_name='nostalgiagame_round',
            name='nostalgiaGame_time',
        ),
        migrations.DeleteModel(
            name='NostalgiaGame_time',
        ),
    ]