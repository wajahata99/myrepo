# importing the function
from package1.demo1 import package_loc
package_loc()

# importing the file
from package1 import demo1 as d 
d.package_loc()

# importing the subpackage
from package1.subpackage import demo2 as d2
d2.package_loc2()

