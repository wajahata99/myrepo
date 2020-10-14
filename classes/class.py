class person:
    def __init__(self,name,age,home_town):
        self.age=age
        self.name=name
        self.town = home_town


class education(person):
    def __init__(self, name,age,home_town, school, years_of_education):
        self.school = school
        self.years_of_education = years_of_education
        person.__init__(self, name,age,home_town)
    
    def estimated_experience(self,a):
        self.a=a
        print("Welcome")
        print (self.age-self.years_of_education+a)