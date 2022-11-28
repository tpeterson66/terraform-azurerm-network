import json
import sys

with open('infracost.json') as data_file:
  data = json.load(data_file)

monthlyCost = data['totalMonthlyCost']
print('Monthly cost for selected resources is:')
print(monthlyCost)

print('Budget allocated is:')
print(sys.argv[2])

print('If monthly cost is within budget, print true, otherwise false!')
print (monthlyCost <= sys.argv[2])

if monthlyCost > sys.argv[2]:
  print ('You have exceeded the allocated budget.')
  sys.exit(1)