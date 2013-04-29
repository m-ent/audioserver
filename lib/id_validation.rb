# ID validation for Nagoya Municipal East Medical Center, Higashi Municipal Hosptial
# MAMIYA, Shinichiro / Department of Otolaryngology

def id_validation_enable?
  if defined? Audioserver
    return Audioserver::Application.config.id_validation
  else
    result = false
    File.open('../config/application.rb') do |f|
      while(l = f.gets) do
        if /config\.id_validation\s+=\s+(.+)/ =~ l
          if $1 == "true"
            result = true
          end
          break
        end
      end
    end
    return result
  end
end

def valid_id?(id_str)
  id  = id_str.delete("^0-9") # remove non-number
  if id == ""
    return false
  end
  if id.length > 10
    return false
  end
  if valid_checksum?(id)
    return  "0" * (10-id.length) + id  # return id as a 10-digit number
  else
    return false
  end
end

def valid_checksum?(id)
  if id_validation_enable?
    # hp_id の validation をする場合: config/application.rb に設定あり
    # Rule for Nagoya East Medical Center
    id1 = id.to_i / 10
    id2 = id.to_i % 10
    check_sum =  (id1 / 100000) % 10 * 7
    check_sum += (id1 / 10000) % 10 * 6
    check_sum += (id1 / 1000) % 10 * 5
    check_sum += (id1 / 100) % 10 * 4
    check_sum += (id1 / 10) % 10 * 3
    check_sum += (id1 % 10) * 2
    rem = check_sum % 11
    check_sum = 11 - rem
    if check_sum > 9
      check_sum = 0
    end
    if check_sum == id2
      true
    else
      false
    end
  else  # hp_id の validation をしない場合: config/application.rb に設定あり
    return true
  end
end
