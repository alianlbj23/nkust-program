# Generated by Django 4.0.1 on 2022-04-06 20:45

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('robot', '0013_songlist_song_name'),
    ]

    operations = [
        migrations.CreateModel(
            name='NostalgiaGame_round',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('Session', models.CharField(max_length=500)),
                ('Total_poeple', models.IntegerField()),
                ('Correct_people', models.IntegerField()),
                ('Fail_people', models.IntegerField()),
            ],
        ),
        migrations.CreateModel(
            name='NostalgiaGame_player',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('Response_time', models.IntegerField()),
                ('Correct', models.BooleanField()),
                ('Connect_session', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='robot.nostalgiagame_round')),
            ],
        ),
    ]