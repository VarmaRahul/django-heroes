
from django.test import TestCase
from .models import Avengers


class AvengersModelTests(TestCase):

    def test_create_avenger(self):
        hero = Avengers.objects.create(
            fname="Tony",
            lname="Stark"
        )

        self.assertEqual(hero.fname, "Tony")
        self.assertEqual(hero.lname, "Stark")

    def test_avenger_string_representation(self):
        hero = Avengers.objects.create(
            fname="Tony",
            lname="Stark"
        )

        self.assertEqual(str(hero), "Tony Stark")


class AvengersViewTests(TestCase):

    def test_layout_page_returns_200(self):
        response = self.client.get("/")

        self.assertEqual(response.status_code, 200)
        self.assertTemplateUsed(response, "avengers/layout.html")

    def test_heroes_page_returns_200(self):
        response = self.client.get("/avengers/")

        self.assertEqual(response.status_code, 200)
        self.assertTemplateUsed(response, "avengers/heroes.html")

    def test_heroes_page_displays_heroes_in_id_order(self):
        first = Avengers.objects.create(
            fname="Tony",
            lname="Stark"
        )
        second = Avengers.objects.create(
            fname="Steve",
            lname="Rogers"
        )

        response = self.client.get("/avengers/")

        self.assertEqual(response.status_code, 200)
        self.assertEqual(
            list(response.context["hero"]),
            [first, second]
        )
