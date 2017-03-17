# class String
#   def numeric?
#     return true if self =~ /\A\d+\Z/
#     true if Float(self) rescue false
#   end
# end
#
# class Version < ApplicationRecord
#   require 'csv'
#   belongs_to :system
#   has_many :table, dependent: :destroy
#   validates_presence_of :Version_Name
#   validates_uniqueness_of :Version_Name, :scope => :system_id, :message => "should happen once per year"
#
#   def add()
#     object = Table.new(:Table_Name => "Test", :Data_Type => "String")
#     object.save
#   end
#
#
#   def isFloat(number)
#     if number % 1 == 0
#       return false
#     else
#       return true
#     end
#   end
#
#   def getLen()
#     guests = CSV.read('test.csv', headers:true)
#     tableNames = guests.to_a[0] #Returns first line of file which is table names
#     return tableNames.length
#   end
#
#   def getColNames()
#     guests = CSV.read('test.csv', headers:true)
#     tableNames = guests.to_a[0] #Returns first line of file which is table names
#     return tableNames
#   end
#
#   def getTypes()
#     guests = CSV.read('test.csv', headers:true)
#     tableNames = guests.to_a[0] #Returns first line of file which is table names
#     numberOfVals =  guests.to_a.length - 1 #Returns the number of values in the csv file
#
#     typeList = Array.new
#     numberOfCols = guests.to_a[2].length
#     testData = guests.to_a[2]
#
#     for i in 0..numberOfCols-1
#       value = testData[i]
#       if value.numeric?
#         if isFloat(value.to_f) == true
#           type = "Float"
#         else
#           type = "Int"
#         end
#       else
#         type = "String"
#       end
#       #puts(type)
#         typeList.insert(i,type) #creates an array with all the types
#
#     end
#     return typeList
#   end
#
# end


class Version < ApplicationRecord
  belongs_to :system
  has_many :table, dependent: :destroy
  validates_presence_of :Version_Name
  validates_uniqueness_of :Version_Name, :scope => :system_id, :message => "already exists. Please choose a new version name. (Version names are not case sensitive).",:case_sensitive => false
end
