class System < ApplicationRecord
  self.table_name
  self.columns

  def tableLength()
    names = System.columns
    return names.length - 1
  end

  def tableName()
    return System.table_name
  end

  def variableName(i)
    names = System.columns
    return names.at(i).name
  end

  def variableType(i)
    names = System.columns
    return names.at(i).type
  end

  def sqlType(i)
    names = System.columns
    return names.at(i).sql_type
  end

  def limit(i)
    names = System.columns
    if names.at(i).limit != nil then
      return names.at(i).limit
    else
      return "Null"
    end
  end

  def comment(i)
    names = System.columns
    if names.at(i).limit != nil then
      return names.at(i).comment
    else
      return "Null"
    end
  end



end
