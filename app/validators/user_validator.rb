class UserValidator <   ActiveModel::Validator
    def validate(record)
    if record.first_name.present? && record.first_name[0] != record.first_name[0].upcase
      record.errors.add(:first_name, "must start with a capital letter")
    end
  end
end