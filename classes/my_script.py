from helpers.persons_classes import person,education
from helper_2.cars_classes import car

myperson=person("wajahat",10,"Lahore")
myperson_education = education("wajahat",10,"Lahore","A&M",16)

mycar=car(10000,1100)

print(myperson.myname())
print(myperson_education.estimated_experience(16))
print(myperson_education.myname())