import json

# changes = []

creates = []
deletes = []
no_ops = []

ignoreChanges = ['azurerm_network_security_group.example']


with open('terraform_plan.json') as data_file:
  data = json.load(data_file)

for i in data['resource_changes']:

  # Check the type of change
  if i['change']['actions'] == ['create']:
    # Create workflow
    print ('Found create statements')
    # check to see if the change should be ignored
    if i['address'] not in ignoreChanges:
      print ('Adding: ' + i['address'])
      creates.append(i)
    else:
      print("CHANGES => ignoring change as it matches ignore list: " + i['address'])
  # Check the type of delete
  if i['change']['actions'] == ['delete']:
    # Delete workflow
    print ('Found delete statements')
    # check to see if the change should be ignored
    if i['address'] not in ignoreChanges:
      print ('Adding: ' + i['address'])
      deletes.append(i)
    else:
      print("DELETES => ignoring change as it matches ignore list: " + i['address'])
  # Check the type of no-op
  if i['change']['actions'] == ['no-op']:
    # No-Op workflow
    print ('Found no-op statements')
    # check to see if the change should be ignored
    if i['address'] not in ignoreChanges:
      print ('Adding: ' + i['address'])
      no_ops.append(i)
    else:
      print("NO-OPS => ignoring change as it matches ignore list: " + i['address'])

print('results:')
# Creates
print(creates)
if (len(creates) >= 1):
  print('Setting the changes variable to true!')
  print ('##vso[task.setvariable variable=ActionCreate;isOutput=true]true')
else:
  print('Setting the changes variable to false!')
  print ('##vso[task.setvariable variable=ActionCreate;isOutput=true]false')

# Deletes  
print(deletes)
if (len(deletes) >= 1):
  print('Setting the deletes variable to true!')
  print ('##vso[task.setvariable variable=ActionDelete;isOutput=true]true')
else:
  print('Setting the deletes variable to false!')
  print ('##vso[task.setvariable variable=ActionDelete;isOutput=true]false')

# No-ops
print(no_ops)
if (len(no_ops) >= 1):
  print('Setting the no_op variable to true!')
  print ('##vso[task.setvariable variable=ActionNoOperations;isOutput=true]true')
else:
  print('Setting the no_op variable to false!')
  print ('##vso[task.setvariable variable=ActionNoOperations;isOutput=true]false')