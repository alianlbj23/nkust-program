# Generated by Django 3.0.1 on 2021-11-27 08:19

from django.db import migrations, models
import django.db.models.deletion
import django.utils.timezone


class Migration(migrations.Migration):

    dependencies = [
        ('robot', '0004_auto_20211125_1405'),
    ]

    operations = [
        migrations.CreateModel(
            name='Orientation',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('correct_rate', models.IntegerField()),
                ('add_time', models.DateTimeField(default=django.utils.timezone.now)),
                ('mod', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='robot.GameMod')),
            ],
            options={
                'ordering': ['-add_time'],
            },
        ),
    ]
