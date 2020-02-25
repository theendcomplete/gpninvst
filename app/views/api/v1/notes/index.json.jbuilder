json.rows @notes do |note|
  json.extract! note, :id, :title, :text_short, :created_at, :updated_at
  json.investor do
    if note.investor.present?
      json.extract! note.investor, :id, :first_name, :last_name, :institution_title
    else
      json.nil!
    end
  end
end
json.extract! @notes, :total_count
