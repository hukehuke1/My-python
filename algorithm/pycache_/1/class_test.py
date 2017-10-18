'''
Created on 2017.3.16

@author: huke
'''

# class Student(object):
#   
#     def __init__(self, name, score):
#         self.__name = name
#         self.__score = score
#   
#     def print_score(self):
#         print('%s: %s' % (self.__name, self.__score))
#     def get_grade(self):
#         if self.__score >= 90:
#             return 'A';
#         elif self.__score >=60:
#             return 'B';
#         else:
#             return 'C';
#     def get_name(self):
#         return self.__name
#     def get_score(self):
#         return self.__score
#           
# if __name__ == '__main__':
#     bart = Student('Bart Simpson', 59)
#     lisa = Student('Lisa Simpson', 87)
#       
#     print(bart.print_score())
#     print(bart.get_grade())


class Animal(object):
    def run(self):
        print('Animal is running...')   
class Dog(Animal):
    def run(self):
        print('Dog is running...')

class Cat(Animal):
    def run(self):
        print('Cat is running...')

class Tortoise(Animal):
    def run(self):
        print('Tortoise is running slowly...')
        
def run_twice(Animal):
    Animal.run()
    Animal.run()
    
if __name__ == '__main__':
    run_twice(Tortoise())
    