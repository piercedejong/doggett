class Voter < ApplicationRecord
    belongs_to :user


    def self.import(file)
        spreadsheet = Roo::Spreadsheet.open(file.original_filename).sheet(0)
        header = spreadsheet.row(1)
        (2..spreadsheet.last_row).each do |i|
            row = Hash[[header, spreadsheet.row(i)].transpose]
            voter = find_by_id(row["id"]) || new
            voter.attributes = row.to_hash
            voter.update(user_id: User.first.id)
            voter.save!
        end
    end

    def format_phone
        return self.phone.sub(/(\d{3})(\d{3})(\d{4})/, "\\1-\\2-\\3")
    end

    def contact
        if self.created_at == self.updated_at
            return ""
        else
            return self.updated_at.to_formatted_s(:short)
        end
    end

    def full_address
        return self.address + " " + self.city + ", " + self.state + " " + self.zip5
    end

    def name
        return self.first_name + " " + self.last_name
    end
end
