require 'csv'
guests = CSV.read('test.csv', headers:true)
tableNames = guests.to_a[0]

tableValues = guests.to_a[1][0]
# print(tableNames)
puts(tableValues.class)
